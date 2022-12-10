unit uPembayaranPiutangNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, cxGroupBox, cxTextEdit,
  Vcl.StdCtrls, dxBevel, uEngine, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, uOvEdit,
  cxCheckBox, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
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
  const
  UM_CHECK = WM_USER + 10000;
type
  TFbayarPiutangNew = class(TForm)
    cxGroupBox1: TcxGroupBox;
    G1: TcxGroupBox;
    G2: TcxGroupBox;
    Bv1: TdxBevel;
    lbl1: TLabel;
    ECari: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    lbl2: TLabel;
    Bv2: TdxBevel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    dt1: TcxDateEdit;
    ENObukti: TcxTextEdit;
    ESupplier: TcxTextEdit;
    EnoTransaksi: TcxTextEdit;
    ETotalHutang: TcxTextEdit;
    EJumlahRetur: TcxTextEdit;
    ESisaHutang: TcxTextEdit;
    EJumlahBayar: TcxTextEdit;
    EKeterangan: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2kodebarang: TcxGridDBColumn;
    cxGrid1DBTableView2namabarang: TcxGridDBColumn;
    cxGrid1DBTableView2satuan: TcxGridDBColumn;
    cxGrid1DBTableView2harga: TcxGridDBColumn;
    cxGrid1DBTableView2jumlah: TcxGridDBColumn;
    cxGrid1DBTableView2diskonpersen: TcxGridDBColumn;
    cxGrid1DBTableView2diskon2: TcxGridDBColumn;
    cxGrid1DBTableView2diskon3: TcxGridDBColumn;
    cxGrid1DBTableView2subtotal: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxgGrid1DBTableView1fakturjual: TcxGridDBColumn;
    cxgGrid1DBTableView1piutang: TcxGridDBColumn;
    cxgGrid1DBTableView1tgltempo: TcxGridDBColumn;
    cxgGrid1DBTableView1dibayar: TcxGridDBColumn;
    cxgGrid1DBTableView1kekurangan: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxGrid1DBTableView1tgl: TcxGridDBColumn;
    cxGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxGrid1DBTableView1total: TcxGridDBColumn;
    ColCheck: TcxGridDBColumn;
    cxgGrid1DBTableView1nomerso: TcxGridDBColumn;
    procedure ECariEnter(Sender: TObject);
    procedure ECariExit(Sender: TObject);
    procedure ECariKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure ColCheckPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    lst : TStringList;
    idsupplier : string;
    const
      SQLpiutang = ' SELECT                               '+
                  '     h.fakturjual,                     '+
                  '     p.nomerso,                     '+
                  '    h.tglinput,                        '+
                  '     h.piutang,                        '+
                  '     h.tgltempo,                       '+
                  '     h.dibayar,                        '+
                  '     h.kekurangan,                     '+
                  '     h.lunas,                          '+
                  '     s.namapelanggan,                  '+
                  '     s.idpelanggan                     '+
                  '   FROM                                '+
                  '     piutang h                         '+
                  '     LEFT JOIN penjualan p             '+
                  '     ON p.`fakturjual` = h.`fakturjual` '+
                  '     LEFT JOIN pelanggan s              '+
                  '     ON s.`idpelanggan` = p.`idpelanggan`';

      SQLREturJual = ' SELECT                                       '+
                     '       rb.nobukti,                            '+
                     '       rb.tgl,                                '+
                     '       rb.nobuktijual,                        '+
                     '       s.namapelanggan,                       '+
                     '       rb.total,                              '+
                     '       rb.keterangan                          '+
                     '     FROM                                     '+
                     '       returpenjualan rb                      '+
                     '       LEFT JOIN penjualan p                  '+
                     '         ON p.`fakturjual` = rb.`nobuktijual` '+
                     '       LEFT JOIN pelanggan s                  '+
                     '         ON s.`idpelanggan` = rb.`idpelanggan` ';


      procedure TampilanAwal;

      procedure Check(AGridView: TcxGridDBTableView);
      procedure UmCheck(var Message: TMessage); message UM_CHECK;
  public
    { Public declarations }
  end;

var
  FbayarPiutangNew: TFbayarPiutangNew;

implementation

{$R *.dfm}

uses uDtrx, udm, uComCtrl, uMainMenu;

procedure TFbayarPiutangNew.btnSimpanClick(Sender: TObject);
var
  i : integer;
  jumlahbayar,jumlahretur,jumlah,Sisabayar : real;
  HPP : Real;
begin
  if ENObukti.Text ='' then
  begin
    Peringatan('Nota bukti masih kosong');
    ENObukti.SetFocus;
  end else
  begin
    jumlahRetur := EJumlahRetur.AsFLoat;
    jumlah      := EJumlahBayar.AsFLoat;
    jumlahBayar := jumlahretur + jumlah;

    SisaBayar   := ETotalHutang.AsFLoat - JumlahBayar;

    addParam('nobukti',ENObukti.Text,lst,'str');
    addParam('tgl',frmTgl(dt1.Date),lst,'date');
    addParam('idpelanggan',idsupplier,lst,'str');
    addParam('iduser',Fmain.sbr1.Panels[1].Text,lst,'str');
    addParam('keterangan',EKeterangan.Text,lst,'str');
    addParam('nominal',FloatToStr(jumlahbayar),lst,'str');
    addParam('nobuktijual',EnoTransaksi.Text,lst,'str');

    exeDb(dm.Q1,'bayarpiutang',lst);
    HPP := 0;
    with cxGrid1DBTableView1.Controller do begin
      for I := 0 to SelectedRecordCount - 1 do BEGIN
      ExQry(dm.Q1,'Update returpenjualan set lunas=TRUE '+
        'where nobukti="'+cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1]+'"',False);
        ExQry(dm.Q4,'SELECT SUM(hpp) as hpp from detailreturjual WHere '+
        'nobukti="'+cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1]+'"',True);

          HPP := HPP + GetValF(dm.Q4,'hpp');
      END;
    end;


    PostingJurnal(dm.Q1,'104.001',ENObukti.Text,
                ' PEMBAYARAN PIUTANG NO BUKTI ['+ENObukti.Text+'] ',
                dt1.Date,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,'K');
    PostingJurnal(dm.Q1,'104.001',ENObukti.Text,
                ' PEMBAYARAN PIUTANG NO BUKTI ['+ENObukti.Text+']',
                dt1.Date,EJumlahRetur.AsFLoat,EJumlahRetur.AsFLoat,EJumlahRetur.AsFLoat,'K');
    PostingJurnal(dm.Q1,'101.001',ENObukti.Text,
                ' PEMBAYARAN PIUTANG NO BUKTI ['+ENObukti.Text+']',
                dt1.Date,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,'D');
    PostingJurnal(dm.Q1,'503.001',ENObukti.Text,
                ' PEMBAYARAN PIUTANG NO BUKTI ['+ENObukti.Text+']',
                dt1.Date,EJumlahRetur.AsFLoat,EJumlahRetur.AsFLoat,EJumlahRetur.AsFLoat,'D');
    PostingJurnal(dm.Q1,'103.001',ENObukti.Text,
                ' PEMBAYARAN PIUTANG NO BUKTI ['+ENObukti.Text+']',
                dt1.Date,HPP,HPP,HPP,'D');
    PostingJurnal(dm.Q1,'501.001',ENObukti.Text,
                ' PEMBAYARAN PIUTANG NO BUKTI ['+ENObukti.Text+']',
                dt1.Date,HPP,HPP,HPP,'K');

   MessageBox(Handle,'Data berhasil Disimpan','Informasi',MB_ICONINFORMATION);
   TampilanAwal;
  end;
end;

procedure TFbayarPiutangNew.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFbayarPiutangNew.Check(AGridView: TcxGridDBTableView);
var
  i: integer;
begin
  for i:= 0 to AGridView.DataController.RecordCount - 1 do BEGIN
    if AGridView.DataController.Values[i, ColCheck.Index] = true then
      AGridView.DataController.ChangeRowSelection(i, true)
    else
      AGridView.DataController.ChangeRowSelection(i, false);
  END;
end;


procedure TFbayarPiutangNew.ColCheckPropertiesEditValueChanged(
  Sender: TObject);

var
  ACheck: TcxCheckBox;
  AGridSite: TcxGridSite;
  AGridView: TcxGridDBTableView;
  I : INTEGER;
  s : Real;
  Hutang , Bayar : Real;
begin
  ACheck := Sender as TcxCheckBox;
  AGridSite := ACheck.Parent as TcxGridSite;
  AGridView := AGridSite.GridView as TcxGridDBTableView;
  Check(AGridView);
  s := 0;

  with cxGrid1DBTableView1.Controller do
    for I := 0 to SelectedRecordCount - 1 do
      s := s+ cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[4];

  EJumlahRetur.Text := GetRupiah(FloatToStr(s));
  Hutang            := ETotalHutang.AsFLoat;
  Bayar             := EJumlahBayar.AsFLoat;

  ESisaHutang.Text  := GetRupiah(FloatToStr(Hutang - Bayar - s));
end;

procedure TFbayarPiutangNew.cxgGrid1DBTableView1DblClick(Sender: TObject);
begin
    ExQry(dtrx.Qreturjual,SQLREturJual+' where s.namapelanggan="'+GetVal(Dtrx.Qpiutang,'namapelanggan')+'" and lunas=0',True);

    ExQry(dm.Q1,SQLpiutang+'  where '+
                ' h.fakturjual="'+GetVal(dtrx.Qpiutang,'fakturjual')+'"',True);
    if dm.Q1.IsEmpty = False then
    begin
        EnoTransaksi.Text := GetVal(dm.Q1,'fakturjual');
        ESupplier.Text    := GetVal(dm.Q1,'namapelanggan');
        ETotalHutang.Text := GetValR(dm.Q1,'kekurangan');
        ESisaHutang.Text  := GetValR(dm.Q1,'kekurangan');
        idsupplier        := GetVal(dm.Q1,'idpelanggan');
    end;
end;

procedure TFbayarPiutangNew.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);

var
  AView: TcxGridDBTableView;
begin
  AView := Sender as TcxGridDBTableView;
  PostMessage(Handle, UM_CHECK, Integer(AView), 0);

end;

procedure TFbayarPiutangNew.ECariEnter(Sender: TObject);
begin
  Ecari.Text := '';
  Ecari.Style.Font.Color := clBlack;
  Ecari.Style.Font.Style := Ecari.Style.Font.Style - [fsItalic];
end;

procedure TFbayarPiutangNew.ECariExit(Sender: TObject);
begin
  Ecari.Text := 'Ketikan nama pelanggan atau faktur penjualan kemudian tekan ENTER';
  Ecari.Style.Font.Color := clGray;
  Ecari.Style.Font.Style := Ecari.Style.Font.Style +[fsItalic];
end;

procedure TFbayarPiutangNew.ECariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    ExQry(Dtrx.Qpiutang,SQLpiutang+' where '+
                       '   (h.fakturjual="'+Ecari.Text+'" or '+
                       '   s.namapelanggan like"%'+Ecari.Text+'%" or p.nomerso LIKE "%'+ECari.Text+'%")'+
                       '   and h.lunas = FALSE',True);

    ExQry(Dtrx.QreturJual,SQLREturJual +
                          ' WHERE s.namapelanggan="'+GetVal(Dtrx.Qpiutang,'namapelanggan')+'" '+
                          ' AND lunas=0',True);
  end;
end;

procedure TFbayarPiutangNew.FormCreate(Sender: TObject);
begin
  EJumlahBayar.isRupiah := True;
end;

procedure TFbayarPiutangNew.FormShow(Sender: TObject);
begin
  dtrx.QreturJual.Active := False;
  dtrx.Qpiutang.Active    := False;
  lst := TStringList.Create;
  TampilanAwal;
end;

procedure TFbayarPiutangNew.TampilanAwal;
begin
  ClearText(Self);
  ENObukti.Text := GetCode(dm.Q1,'bayarhutang','nobukti','BP');
  setTanggal(Self);
  idsupplier := '';
end;

procedure TFbayarPiutangNew.UmCheck(var Message: TMessage);
begin
 Check(TcxGridDBTableView(Message.WParam));
end;

end.
