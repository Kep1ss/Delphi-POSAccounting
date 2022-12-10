unit uDataOrderPembelian;

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
  uEngine, uOvEdit, cxCalc, cxCurrencyEdit, dxSkiniMaginary,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFdataOrderPembelian = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnPrint: TcxButton;
    btnTutup: TcxButton;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgrd1DBTableView2: TcxGridDBTableView;
    cxgrd1DBTableView2namapelanggan: TcxGridDBColumn;
    cxgrd1DBTableView2namabarang: TcxGridDBColumn;
    cxgrd1DBTableView2jumlahorder: TcxGridDBColumn;
    cxgrd1DBTableView2masuk: TcxGridDBColumn;
    cxgrd1DBTableView2kirim: TcxGridDBColumn;
    cxgrd1DBTableView2sisa: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1namalengkap: TcxGridDBColumn;
    cxgrd1DBTableView1kodebarcode: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    btnHapus: TcxButton;
    cxgGrid1DBTableView1terima: TcxGridDBColumn;
    cxgrd1DBTableView1masuk: TcxGridDBColumn;
    c1: TCheckBox;
    cxgrd1DBTableView1hargabeli: TcxGridDBColumn;
    cxgrd1DBTableView1ppn: TcxGridDBColumn;
    cxgrd1DBTableView1disk1: TcxGridDBColumn;
    cxgrd1DBTableView1disk2: TcxGridDBColumn;
    cxgrd1DBTableView1disk3: TcxGridDBColumn;
    cxgrd1DBTableView1subtotal: TcxGridDBColumn;
    cxgGrid1DBTableView1diskon: TcxGridDBColumn;
    cxgGrid1DBTableView1ppn: TcxGridDBColumn;
    cxgGrid1DBTableView1grandtotal: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
    btnUbah: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure btnHapusClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintClick(Sender: TObject);
    procedure c1Click(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLPOeli = ' SELECT                                '+
                 '       p.idpobeli,                     '+
                 '       p.nobukti,                      '+
                 '       p.tgl,                          '+
                 '       p.idsupplier,                   '+
                 '       p.pembayaran,                   '+
                 '       s.namasupplier,                 '+
                 '       s.kodesupplier,                 '+
                 '       s.alamat,                       '+
                 '       s.kota,                         '+
                 '       s.notelpon,                     '+
                 '       u.namalengkap,                  '+
                 '       p.total,                        '+
                 '       p.diskon,                       '+
                 '       p.ppn,                          '+
                 '       p.grandtotal,                   '+
                 '       p.terima                        '+
                 '     FROM                              '+
                 '       pobeli p                        '+
                 '       LEFT JOIN m_supplier s          '+
                 '         ON s.`idsupplier` = p.`idsupplier`   '+
                 '       LEFT JOIN m_user u                    '+
                 '         ON u.`iduser` = p.`createby`   ';

      _SQLDetailPoBeli = ' SELECT                              '+
                     '     d.idpobelidetail,                   '+
                     '     d.nobukti,                          '+
                     '     d.kodebarang,                       '+
                     '     b.kodebarcode,                      '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.hargabeli,                        '+
                     '     d.sisastok,                        '+
                     '     d.jumlah,                           '+
                     '     d.disk1,                            '+
                     '     d.disk2,                            '+
                     '     d.disk3,                            '+
                     '     d.ppn,                              '+
                     '     d.subtotal,                         '+
                     '     d.isi                               '+
                     '   FROM                                  '+
                     '     pobelidetail d                        '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang`';


    

    { Public declarations }
  end;

var
  FdataOrderPembelian: TFdataOrderPembelian;

implementation

{$R *.dfm}

uses uDtrx, udm, uDlaporan, UPOPembelian, uPoPembelianBarangBaru;

procedure TFdataOrderPembelian.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FpoPembelianBarang) then
  Application.CreateForm(TFpoPembelianBarang, FpoPembelianBarang);
  FpoPembelianBarang.Show;
  FpoPembelianBarang.TampilAwal;
end;

procedure TFdataOrderPembelian.btnHapusClick(Sender: TObject);
begin
 if MessageDlg('Apakah yakin data akan dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
    ExQry(dm.Q1,'SELECT nobuktiorder FROM penerimaanbarang WHERE nobuktiorder="'+GetVal(dtrx.Qpobeli,'nobukti')+'"',True);

    if dm.Q1.IsEmpty = False then begin
       Error('Barang sudah dilakukan penerimaan !!, Tidak dapat dihapus. '+#13+'Silahkan Lakukan Retur Pembelian');
       Exit;
    end else begin
      ExQry(dm.Q1,'DELETE FROM pobelidetail WHERE nobukti="'+GetVal(dtrx.Qpobeli,'nobukti')+'"',False);
      ExQry(dm.Q1,'DELETE FROM pobeli WHERE nobukti="'+GetVal(dtrx.Qpobeli,'nobukti')+'"',False);
      ExQry(dm.Q1,'DELETE FROM pembelian WHERE nopo="'+GetVal(dtrx.Qpobeli,'nobukti')+'"',False);
      ExQry(dm.Q1,'delete from saldoakun where nobukti="'+GetVal(dtrx.Qpobeli,'nobukti')+'"',False);
    end;
 end;

 dt1Change(Sender);

end;

procedure TFdataOrderPembelian.btnPrintClick(Sender: TObject);
begin
  ExQry(Dlaporan.QPoBeli,SQLPOeli+' WHERE p.nobukti="'+getVal(dtrx.Qpobeli,'nobukti')+'" ',True);
  ExQry(Dlaporan.QdetailPObeli, ' SELECT                         '+
                            '      d.nobukti,                '+
                            '      d.kodebarang,             '+
                            '      b.kodebarcode,            '+
                            '      b.namabarang,             '+
                            '      d.satuan,                 '+
                            '      d.hargabeli,              '+
                            '      d.ppn,                    '+
                            '      d.disk1,                  '+
                            '      d.disk2,                  '+
                            '      d.disk3,                  '+
                            '      d.jumlah,                 '+
                            '      d.masuk,                  '+
                            '      d.subtotal,               '+
                            '      d.isi                     '+
                            '    FROM                        '+
                            '      pobelidetail d            '+
                            '      LEFT JOIN barang b        '+
                            '        ON d.`kodebarang` = b.`kodebarang`  '+
                            ' WHERE d.nobukti="'+GetVal(dtrx.Qpobeli,'nobukti')+'"',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\cetakPO.fr3');
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.ShowReport();
end;

procedure TFdataOrderPembelian.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFdataOrderPembelian.btnUbahClick(Sender: TObject);
var
  i : integer;
  KodeSupplier : String;
  hrg , hargaBeli: Real;
  isiBeli  : Real;
  ppn: real;
begin
  ExQry(dm.Q1,'SELECT nopo FROM pembelian WHERE nopo="'+GetVal(dtrx.Qpobeli,'nobukti')+'"',True );

  if dm.Q1.IsEmpty = False then
  begin
    Error('PO pembelian sudah ditransaksikan, silahkan batalkan pembelian terlebih dahulu');
    Exit;
  end else begin
      if not Assigned(FpoPembelianBarang) then
      Application.CreateForm(TFpoPembelianBarang, FpoPembelianBarang);
          with FpoPembelianBarang do
          begin
            ClearText(Self);
            KosongKanGrid;
            ExQry(dm.Q1,SQLPOeli+' where nobukti="'+GetVal(dtrx.Qpobeli,'nobukti')+'"',True);

            Enobukti.Text       := GetVal(dm.Q1,'nobukti');
            DtBukti.Date        := dm.Q1.FieldByName('tgl').AsDateTime;
            KodeSupplier        := dm.Q1.FieldByName('kodesupplier').AsString;
            ESupplier.Text      := GetVal(dm.Q1,'namasupplier');
            EKodeSupplier.Text  := KodeSupplier;
        
            ETotal.Text         := GetRupiah(GetVal(dm.Q1,'total'));
            if GetValF(dm.Q1,'ppn')>0 then
               Eppnper.Text     := '10';
            Eppnrup.Text        := GetRupiah(GetVal(dm.Q1,'ppn'));


            ExQry(dm.Q2,_SQLDetailPoBeli+' where '+
            ' nobukti="'+GetVal(dm.Q1,'nobukti')+'"',True);

            sg1.RowCount        := dm.Q2.RecordCount +2;
            i                   := 0;
            while dm.Q2.Eof = False do
            begin

              sg1.Cells[0,i+1] := IntToStr(dm.Q2.RecNo);
              sg1.Cells[1,i+1] := GetVal(dm.Q2,'kodebarcode');
              sg1.Cells[2,i+1] := GetVal(dm.Q2,'namabarang');
              isiBeli          := CariIsi(GetVal(dm.Q2,'kodebarcode'),GetVal(dm.Q2,'satuan'));
              hrg              := GetValF(dm.Q2,'hargabeli') ;

              sg1.Cells[3,i+1] := GetVal(dm.Q2,'satuan');
              sg1.Cells[4,i+1] := GetVal(dm.Q2,'sisastok');
              sg1.Cells[5,i+1] := GetVal(dm.Q2,'jumlah');
              sg1.Cells[6,i+1] := GetVal(dm.Q2,'hargabeli');


              sg1.Cells[7,i+1] := GetVal(dm.Q2,'ppn');

              if GetValF(dm.Q2,'ppn') > 0 then
              ppn              :=  GetValF(dm.Q2,'hargabeli') * GetValF(dm.Q2,'ppn') / 100;
              sg1.Cells[8,i+1] := Format('%.0n',[getValf(dm.Q2,'hargabeli') + ppn]);
              hargaBeli  := hrg / isiBeli;

              sg1.Cells[9,i+1] := GetVal(dm.Q2,'disk1');
              sg1.Cells[10,i+1] := GetVal(dm.Q2,'disk2');
              sg1.Cells[11,i+1] := GetVal(dm.Q2,'disk3');
              sg1.Cells[12,i+1] := GetVal(dm.Q2,'subtotal');
              sg1.Cells[13,i+1] := GetVal(dm.Q2,'isi');
              sg1.Cells[14,i+1] := GetVal(dm.Q2,'kodebarang');
              inc(i);
              dm.Q2.Next;
            end;

             Show;
             HitungTotal;

          end;
  end;

end;


procedure TFdataOrderPembelian.c1Click(Sender: TObject);
begin
  if c1.Checked then begin
     ExQry(dtrx.QPoBeli,SQLPOeli+' WHERE p.nobukti not in (SELECT nopo FROM pembelian)',True);
  end else
  ExQry(dtrx.QPoBeli,SQLPOeli+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataOrderPembelian.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  dtrx.QdetailPObeli.Active :=False;
  dtrx.QdetailPObeli.Active :=True;
end;

procedure TFdataOrderPembelian.dt1Change(Sender: TObject);
begin
  ExQry(dtrx.QPoBeli,SQLPOeli+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataOrderPembelian.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dtrx.QPoBeli,SQLPOeli+' WHERE s.namasupplier like"%'+Epencarian.Text+'" OR '+
  'p.nobukti like"%'+Epencarian.Text+'%"',True);
end;

procedure TFdataOrderPembelian.FormActivate(Sender: TObject);
begin
  dt1Change(Sender);
end;

procedure TFdataOrderPembelian.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

procedure TFdataOrderPembelian.FormShow(Sender: TObject);
begin
  dt1.Date := Now;
  dt2.Date :=now;
  dt1Change(Sender);
end;

end.
