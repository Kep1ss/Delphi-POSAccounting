unit uReturPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, dxBevel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, Vcl.StdCtrls, cxGroupBox, uComCtrl, uctrlFrm, uEngine,
  uOvEdit, cxCalc, cxCurrencyEdit, Vcl.Menus, cxButtons, dxSkiniMaginary,
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
  TFreturPenjualan = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ENobukti: TcxTextEdit;
    cxDateEdit1: TcxDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Enobuktijual: TcxTextEdit;
    Epelanggan: TcxTextEdit;
    Label9: TLabel;
    Eketerangan: TcxTextEdit;
    Label10: TLabel;
    G2: TcxGroupBox;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    dxBevel1: TdxBevel;
    cxgGrid1Level11: TcxGridLevel;
    cxgrd2: TcxGrid;
    G3: TcxGroupBox;
    cxgrd2TableView1: TcxGridTableView;
    CkodeBarcode: TcxGridColumn;
    cNamaBarang: TcxGridColumn;
    CSatuan: TcxGridColumn;
    cHarga: TcxGridColumn;
    cDiskonpersen: TcxGridColumn;
    cDiskonRupiah: TcxGridColumn;
    cJumlah: TcxGridColumn;
    cSubtotal: TcxGridColumn;
    cIsi: TcxGridColumn;
    Label11: TLabel;
    cxDateEdit2: TcxDateEdit;
    Label12: TLabel;
    EPencarian: TcxTextEdit;
    CJumlahRetur: TcxGridColumn;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    cIdgudang: TcxGridColumn;
    cxgGrid1DBTableView1fakturjual: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxgrd2TableView1Editing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxgrd2TableView1EditKeyUp(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure btnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure cxDateEdit2PropertiesChange(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure TampilAwal;
    procedure BuatGrid;
    function SumCxGrid:String;
    { Public declarations }
  end;

      const
      SQLpenjualan = ' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     pl.namapelanggan,                             '+
                     '     p.pembayaran,                                 '+
                     '     p.total,                                      '+
                     '     p.diskon,                                     '+
                     '     p.grandtotal,                                 '+
                     '     pg.namalengkap,                               '+
                     '     p.bayar,                                      '+
                     '     p.kembali                                     '+
                     '   FROM                                            '+
                     '     penjualan p                                   '+
                     '     LEFT JOIN pelanggan pl                        '+
                     '       ON pl.`idpelanggan` = p.`idpelanggan`       '+
                     '     LEFT JOIN m_user pg                           '+
                     '      ON pg.iduser=p.`iduser`';

    _SQLDetailJual = ' SELECT                                  '+
                     '     d.iddetil,                          '+
                     '     d.fakturjual,                       '+
                     '     d.kodebarang,                       '+
                     '     b.kodebarcode,                      '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,'+
                     '     d.hpp,                              '+
                     '     d.jumlah,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskonrupiah,                     '+
                     '     d.subtotal,                         '+
                     '     d.isi,                              '+
                     '     d.idgudang,                         '+
                     '     l.namalokasi                        '+
                     '   FROM                                  '+
                     '     penjualandetil d                    '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang`'+
                     '     LEFT JOIN lokasi l                  '+
                     '       ON l.`idlokasi` = d.`idgudang` ';

var
  FreturPenjualan: TFreturPenjualan;
  aList : TStringList;

implementation

{$R *.dfm}

uses uDtrx, udm;

{ TFreturpenjualan }

procedure TFreturPenjualan.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFreturPenjualan.btnSimpanClick(Sender: TObject);
var
  i : Integer;
  KodeBarang:String;
begin
  if NOT CheckEdit(Self) then
  begin
    addParam('nobukti',ENobukti.Text,aList,'str');
    addParam('tgl',frmTgl(cxDateEdit1.Date),aList,'date');
    addParam('nobuktijual',Enobuktijual.Text,aList,'str');
    addParam('total',SumCxGrid,aList,'str');
    addParam('keterangan',Eketerangan.Text,aList,'str');

    exeDb(dm.Q1,'returpenjualan',aList);
    with cxgrd2TableView1.DataController do begin
      for I := 0 to RecordCount -1 do   begin
        if (VarToStr(Values[i,7]) <> '') then begin
          KodeBarang := getData(dm.Q2,'barang where kodebarcode="'+VarTOstr(Values[i,0])+'"','kodebarang');
          addParam('nobukti',ENobukti.Text,aList,'str');
          addParam('kodebarang',KodeBarang,aList,'str');
          addParam('satuan',VarToStr(Values[i,2]),aList,'str');
          addParam('harga',VarToStr(Values[i,3]),aList,'str');
          addParam('diskonpersen',VarToStr(Values[i,4]),aList,'str');
          addParam('diskonrupiah',VarToStr(Values[i,5]),aList,'str');
          addParam('jumlah',VarToStr(Values[i,7]),aList,'str');
          addParam('isi',VarToStr(Values[i,9]),aList,'str');
          addParam('subtotal',VarToStr(Values[i,8]),aList,'str');
          addParam('idgudang',VarToStr(Values[i,10]),aList,'str');

          exeDb(dm.Q1,'detailreturjual',aList);
        end;
      end;
    end;


    TampilAwal;
  end;

end;

procedure TFreturPenjualan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFreturPenjualan.BuatGrid;
var
  i,x : integer;

begin


 with cxgrd2TableView1.DataController do
  begin

      for i := 0 to RecordCount -1 do
      for x := 0 to GetItemCount -1 do
        Values[i,x] := '';

      RecordCount := 1;

  end;
end;

procedure TFreturPenjualan.cxDateEdit2PropertiesChange(Sender: TObject);
begin
  ExQry(dtrx.Qpenjualan,SQLpenjualan+' WHERE p.tgljual="'+Tanggal(cxDateEdit2.Date)+'"',True);
end;

procedure TFreturPenjualan.cxgGrid1DBTableView1DblClick(Sender: TObject);
var
  i : integer;
begin
   ExQry(dm.Q1,SQLpenjualan+' WHERE fakturjual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',True);

   Enobuktijual.Text     := GetVal(dm.Q1,'fakturjual');
   Epelanggan.Text       := GetVal(dm.Q1,'namapelanggan');
   i:=0;
   BuatGrid;
   ExQry(dm.Q2,_SQLDetailJual+' WHERE fakturjual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',True);
   while dm.Q2.Eof = False do begin
     with cxgrd2TableView1.DataController do begin
       Values[i,0] := GetVal(dm.Q2,'kodebarcode');
       Values[i,1] := GetVal(dm.Q2,'namabarang');
       Values[i,2] := GetVal(dm.Q2,'satuan');
       Values[i,3] := GetVal(dm.Q2,'harga');
       Values[i,4] := GetVal(dm.Q2,'diskonpersen');
       Values[i,5] := GetVal(dm.Q2,'diskonrupiah');
       Values[i,6] := GetVal(dm.Q2,'jumlah');
       Values[i,7] := '';
       Values[i,8] := GetVal(dm.Q2,'subtotal');
       Values[i,9] := GetVal(dm.Q2,'isi');
       Values[i,10] := GetVal(dm.Q2,'idgudang');

       RecordCount := RecordCount + 1;
     end;
    Inc(i);
    dm.Q2.Next;
   end;
  cxgrd2.SetFocus;
  cxgrd2TableView1.Controller.FocusedRecordIndex := 0;
  cxgrd2TableView1.Controller.FocusedColumnIndex :=6;
  
end;

procedure TFreturPenjualan.cxgrd2TableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
   AAllow := (Sender.Controller.FocusedItem.Index = 7);
   
end;

procedure TFreturPenjualan.cxgrd2TableView1EditKeyUp(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  with  cxgrd2TableView1.DataController do
  if AEdit.EditingValue > Values[EditingRecordIndex,6] then
  begin
    Error('Jumlah Retur terlalu banyak');
    AEdit.EditValue := 0;
  end;
end;

procedure TFreturPenjualan.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dtrx.Qpenjualan,SQLpenjualan+' WHERE '+
  ' pl.namapelanggan like"%'+Epencarian.Text+'%" OR p.fakturjual like"%'+Epencarian.Text+'%"',True);
end;

procedure TFreturPenjualan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFreturPenjualan.FormCreate(Sender: TObject);
begin
  FreturPenjualan := Self;
  setTanggal(Self);
end;

procedure TFreturPenjualan.FormShow(Sender: TObject);
begin
  alist := TStringList.Create;
end;

function TFreturPenjualan.SumCxGrid: String;
var
  i : integer;
  Total : Real;
begin
  Total := 0;
  with cxgrd2TableView1.DataController do begin
  for i := 0 to RecordCount -1 do
    begin
     if VarToStr(Values[i,8]) <> '' then
     
      total := Total + StrToFloatDef(VarToStr(Values[i,8]),0);
    end;
  end;
  Result := FloatToStr(TOtal);

end;

procedure TFreturPenjualan.TampilAwal;
begin
  ClearText(Self);
  ENobukti.Text := GetCode(dm.Q1,'returpenjualan','nobukti','RJ'+setIdKom);
  BuatGrid
end;

end.

