unit uDataStokOpname;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, uComCtrl, uctrlFrm,
  uEngine, uOvEdit, cxCalc;

type
  TFdataStokOpname = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnUbah: TcxButton;
    btnHapus: TcxButton;
    btnPrint: TcxButton;
    btnTutup: TcxButton;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1pembayaran: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1namalengkap: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgrd1DBTableView1kodebarang: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1harga: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    cxgrd1DBTableView1diskonpersen: TcxGridDBColumn;
    cxgrd1DBTableView1diskonrupiah: TcxGridDBColumn;
    cxgrd1DBTableView1ppn: TcxGridDBColumn;
    cxgrd1DBTableView1subtotal: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLPembelian = ' SELECT                                     '+
                     '     p.idpembelian,                         '+
                     '     p.nobukti,                             '+
                     '     p.tgl,                                 '+
                     '     p.pembayaran,                          '+
                     '     p.idsupplier,                          '+
                     '     s.namasupplier,                        '+
                     '     p.iduser,                              '+
                     '     u.namalengkap,                         '+
                     '     p.total                                '+
                     '   FROM                                     '+
                     '     pembelian p                            '+
                     '     LEFT JOIN m_supplier s                 '+
                     '       ON s.`idsupplier` = p.`idsupplier`   '+
                     '     LEFT JOIN m_user u                     '+
                     '       ON u.`iduser` = p.`iduser`           ';

    _SQLDetailBeli = ' SELECT                                  '+
                     '     d.iddetilbeli,                      '+
                     '     d.nobukti,                          '+
                     '     d.kodebarang,                       '+
                     '     b.kodebarcode,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,                            '+
                     '     d.jumlah,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskonrupiah,                     '+
                     '     d.ppn,                              '+
                     '     d.subtotal,                         '+
                     '     d.isi,                              '+
                     '     d.idgudang,                         '+
                     '     l.namalokasi                        '+
                     '   FROM                                  '+
                     '     detailbeli d                        '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang`'+
                     '     LEFT JOIN lokasi l                  '+
                     '       ON l.`idlokasi` = d.`idgudang`';

    { Public declarations }
  end;

var
  FdataStokOpname: TFdataStokOpname;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm;

procedure TFdataStokOpname.btnHapusClick(Sender: TObject);
begin
  DelDb(dm.Q1,'pembelian',GetVal(dtrx.QPembelian,'namasupplier'),
  'idpembelian',GetVal(dtrx.QPembelian,'idpembelian'));

  Dt1.Properties.OnCloseUp(Sender);

end;

procedure TFdataStokOpname.btnUbahClick(Sender: TObject);
var
  i : integer;
  KodeSupplier : String;
begin
  with FpembelianBarang do
  begin
    CreateGrid;

    ExQry(dm.Q1,SQLPembelian+' where nobukti="'+GetVal(dtrx.Qpembelian,'nobukti')+'"',True);

    Enobukti.Text       := GetVal(dm.Q1,'nobukti');
    DtBukti.Date        := dm.Q1.FieldByName('tgl').AsDateTime;
    KodeSupplier        := getData(dm.Q3,'m_supplier WHERE idsupplier="'+GetVal(dm.Q1,'idsupplier')+'"','kodesupplier');
    ESupplier.Text      := GetVal(dm.Q1,'namasupplier');
    EKodeSupplier.Text  := KodeSupplier;
    if GetVal(dm.Q1,'pembayaran') = 'CASH' then cbPembayaran.ItemIndex := 1
    else cbPembayaran.ItemIndex := 0;
    ETotal.Text         := GetRupiah(GetVal(dm.Q1,'total'));

    ExQry(dm.Q2,_SQLDetailBeli+' where '+
    ' nobukti="'+GetVal(dm.Q1,'nobukti')+'"',True);
    CbGudang.ItemIndex  := idxCmb(cbGudang,GetValInt(dm.Q2,'idgudang'));
    sg1.RowCount        := dm.Q2.RecordCount +2;
    i                   := 0;
    while dm.Q2.Eof = False do
    begin
      sg1.Cells[0,i+1] := IntToStr(dm.Q2.RecNo);
      sg1.Cells[1,i+1] := GetVal(dm.Q2,'kodebarcode');
      sg1.Cells[2,i+1] := GetVal(dm.Q2,'namabarang');

     // isiBeli := StrToFloatDef(GetVal(dm.Q1,'isi'),0);
    //  hrg := StrToFloatDef(GetVal(dm.Q1,'hargabeli'),0) * isiBeli;
      sg1.Cells[3,i+1] := GetRupiah(GetVal(dm.Q2,'harga'));
      sg1.Cells[4,i+1] := GetVal(dm.Q2,'ppn');
      sg1.Cells[5,i+1] := GetRupiah(GetVal(dm.Q2,'diskonrupiah'));
      sg1.Cells[6,i+1] := Koma(GetVal(dm.Q2,'diskonpersen'));
      sg1.Cells[7,i+1] := GetVal(dm.Q2,'satuan');

      sg1.Cells[8,i+1] := GetRupiah(GetVal(dm.Q2,'jumlah'));
      sg1.Cells[9,i+1] := GetRupiah(GetVal(dm.Q2,'subtotal'));
      sg1.Cells[10,i+1] := GetVal(dm.Q2,'isi');
      inc(i);
      dm.Q2.Next;
    end;

     Show;
     AturGrid(sg1,9);
  end;
end;

procedure TFdataStokOpname.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  dtrx.Qdetailbeli.Active := False;
  dtrx.Qdetailbeli.Active := True;
end;

procedure TFdataStokOpname.Dt1PropertiesCloseUp(Sender: TObject);
begin
  ExQry(dtrx.QPembelian,SQLPembelian+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataStokOpname.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

end.
