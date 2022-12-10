unit uPembayaranHutangNew;

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
  cxCheckBox, dxSkinMoneyTwins, dxSkinSharp, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;
  const
  UM_CHECK = WM_USER + 10000;
type
  TFpembayaranHutangNew = class(TForm)
    cxGroupBox1: TcxGroupBox;
    G1: TcxGroupBox;
    G2: TcxGroupBox;
    Bv1: TdxBevel;
    lbl1: TLabel;
    ECari: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgltempo: TcxGridDBColumn;
    cxgGrid1DBTableView1hutang: TcxGridDBColumn;
    cxgGrid1DBTableView1dibayar: TcxGridDBColumn;
    cxgGrid1DBTableView1kekurangan: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
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
    cxGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxGrid1DBTableView1tgl: TcxGridDBColumn;
    cxGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxGrid1DBTableView1total: TcxGridDBColumn;
    cxGrid1DBTableView1keterangan: TcxGridDBColumn;
    ColCheck: TcxGridDBColumn;
    Label1: TLabel;
    Label2: TLabel;
    cb1: TComboBox;
    Label3: TLabel;
    cb2: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ESaldo: TcxTextEdit;
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
    procedure cb1Change(Sender: TObject);
    procedure cb2Change(Sender: TObject);
  private
    { Private declarations }
    lst : TStringList;
    idsupplier : string;
    const
      SQLhutang = ' SELECT              '+
                       '     h.nobukti,       '+
                       '     h.tglinput,      '+
                       '     h.tgltempo,      '+
                       '     h.hutang,        '+
                       '     h.dibayar,       '+
                       '     h.kekurangan,    '+
                       '     h.lunas,         '+
                       '     p.idsupplier,    '+
                       '     s.namasupplier   '+
                       '   FROM               '+
                       '     hutang h         '+
                       '     LEFT JOIN pembelian p   '+
                       '     ON p.`nobukti` = h.`nobukti`  '+
                       '     LEFT JOIN m_supplier s        '+
                       '   ON s.`idsupplier` = p.`idsupplier` ';

      SQLREtur = ' SELECT                                '+
                          '      rb.nobukti,                      '+
                          '      rb.tgl,                          '+
                          '      rb.nobuktibeli,                  '+
                          '      s.namasupplier,                  '+
                          '      rb.total,                        '+
                          '      rb.keterangan,                   '+
                          '      rb.lunas                         '+
                          '    FROM                               '+
                          '      returpembelian rb                '+
                          '      LEFT JOIN pembelian p            '+
                          '        ON p.`nobukti` = rb.`nobuktibeli` '+
                          '      LEFT JOIN m_supplier s              '+
                          '        ON s.`idsupplier` = rb.`idsupplier` ';

      procedure TampilanAwal;

      procedure Check(AGridView: TcxGridDBTableView);
      procedure UmCheck(var Message: TMessage); message UM_CHECK;
  public
    { Public declarations }
  end;

var
  FpembayaranHutangNew: TFpembayaranHutangNew;

implementation

{$R *.dfm}

uses uDtrx, udm, uComCtrl, uMainMenu;

procedure TFpembayaranHutangNew.btnSimpanClick(Sender: TObject);
var
  i : integer;
  jumlahbayar,jumlahretur,jumlah,Sisabayar : real;
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

    if jumlahbayar > ESaldo.AsFLoat then begin

      Error('Saldo tidak mencukupi');
      Exit;
    end else begin
        SisaBayar   := ETotalHutang.AsFLoat - JumlahBayar;

        addParam('nobukti',ENObukti.Text,lst,'str');
        addParam('tgl',frmTgl(dt1.Date),lst,'date');
        addParam('idsupplier',idsupplier,lst,'str');
        addParam('iduser',Fmain.sbr1.Panels[1].Text,lst,'str');
        addParam('keterangan',EKeterangan.Text,lst,'str');
        addParam('nominal',FloatToStr(jumlahbayar),lst,'str');
        addParam('nobuktibeli',EnoTransaksi.Text,lst,'str');

        exeDb(dm.Q1,'bayarhutang',lst);
        with cxGrid1DBTableView1.Controller do begin
          for I := 0 to SelectedRecordCount - 1 do
          ExQry(dm.Q1,'Update returpembelian set lunas=TRUE '+
            'where nobukti="'+cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1]+'"',False);
        end;

       PostingJurnal(dm.Q1,'201.001',ENObukti.Text,
                    ' PEMBAYARAN HUTANG NO BUKTI ['+ENObukti.Text+'] ',
                    dt1.Date,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,'D');
       PostingJurnal(dm.Q1,'201.001',ENObukti.Text,
                    ' PEMBAYARAN HUTANG NO BUKTI ['+ENObukti.Text+']',
                    dt1.Date,EJumlahRetur.AsFLoat,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,'D');
       PostingJurnal(dm.Q1,Copy(cb2.Text,1,7),ENObukti.Text,
                    ' PEMBAYARAN HUTANG NO BUKTI ['+ENObukti.Text+']',
                    dt1.Date,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,'K');
       PostingJurnal(dm.Q1,'103.001',ENObukti.Text,
                    ' PEMBAYARAN HUTANG NO BUKTI ['+ENObukti.Text+']',
                    dt1.Date,EJumlahRetur.AsFLoat,EJumlahBayar.AsFLoat,EJumlahBayar.AsFLoat,'K');

       MessageBox(Handle,'Data berhasil Disimpan','Informasi',MB_ICONINFORMATION);
       TampilanAwal;
    end;
  end;
end;

procedure TFpembayaranHutangNew.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFpembayaranHutangNew.cb1Change(Sender: TObject);
var
  Idx : Integer;
  Ket : String;
begin
  with dm.Q1 do begin
    CLose;
    if cb1.ItemIndex = 0 then
    SQL.Text := 'SELECT * FROM m_akunperkiraan WHERE akunsubmaster="101"'
  else
    SQL.Text := 'SELECT * FROM m_akunperkiraan WHERE akunsubmaster="102"';
    Open;
      cb2.Items.Clear;
    while not Eof do begin
      Idx := FieldByName('idakunperkiraan').AsInteger;
      Ket := GetVal(dm.Q1,'kodeakunperkiraan')+' | '+GetVal(dm.Q1,'namaakunperkiraan');
      cb2.AddItem(Ket,TObject(Idx));
      Next;

    end;

  end;


end;

procedure TFpembayaranHutangNew.cb2Change(Sender: TObject);
begin
  ExQry(dm.Q1,'SELECT SUM(s_awal+debet-kredit) as saldo'+
  ' FROM saldoakun WHERE noakun="'+COPY(cb2.Text,1,7)+'"',True);

  ESaldo.Text := GetValR(dm.Q1,'saldo');
end;

procedure TFpembayaranHutangNew.Check(AGridView: TcxGridDBTableView);
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


procedure TFpembayaranHutangNew.ColCheckPropertiesEditValueChanged(
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

procedure TFpembayaranHutangNew.cxgGrid1DBTableView1DblClick(Sender: TObject);
begin
    ExQry(dtrx.Qreturbeli,SQLREtur+' where s.namasupplier="'+GetVal(Dtrx.QHutang,'namasupplier')+'" and lunas=0',True);

    ExQry(dm.Q1,SQLhutang+'  where '+
                ' h.nobukti="'+GetVal(dtrx.Qhutang,'nobukti')+'"',True);
    if dm.Q1.IsEmpty = False then
    begin
        EnoTransaksi.Text := GetVal(dm.Q1,'nobukti');
        ESupplier.Text    := GetVal(dm.Q1,'namasupplier');
        ETotalHutang.Text := GetValR(dm.Q1,'kekurangan');
        ESisaHutang.Text  := GetValR(dm.Q1,'kekurangan');
        idsupplier        := GetVal(dm.Q1,'idsupplier');
    end;
end;

procedure TFpembayaranHutangNew.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);

var
  AView: TcxGridDBTableView;
begin
  AView := Sender as TcxGridDBTableView;
  PostMessage(Handle, UM_CHECK, Integer(AView), 0);

end;

procedure TFpembayaranHutangNew.ECariEnter(Sender: TObject);
begin
  Ecari.Text := '';
  Ecari.Style.Font.Color := clBlack;
  Ecari.Style.Font.Style := Ecari.Style.Font.Style - [fsItalic];
end;

procedure TFpembayaranHutangNew.ECariExit(Sender: TObject);
begin
  Ecari.Text := 'Ketikan nama supplier atau faktur pembelian kemudian tekan ENTER';
  Ecari.Style.Font.Color := clGray;
  Ecari.Style.Font.Style := Ecari.Style.Font.Style +[fsItalic];
end;

procedure TFpembayaranHutangNew.ECariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    ExQry(Dtrx.QHutang,SQLhutang+' where '+
                       '   h.nobukti="'+Ecari.Text+'" or '+
                       '   s.namasupplier like"%'+Ecari.Text+'%" and h.lunas = FALSE',True);

    ExQry(Dtrx.Qreturbeli,SQLRETUR+
                          ' WHERE s.namasupplier="'+GetVal(Dtrx.Qhutang,'namasupplier')+'" '+
                          ' AND lunas=FALSE',True);
  end;
end;

procedure TFpembayaranHutangNew.FormCreate(Sender: TObject);
begin
  EJumlahBayar.isRupiah := True;
end;

procedure TFpembayaranHutangNew.FormShow(Sender: TObject);
begin
  dtrx.QReturBeli.Active := False;
  dtrx.Qhutang.Active    := False;
  lst := TStringList.Create;
  TampilanAwal;
  cb1.ItemIndex := 0;
end;

procedure TFpembayaranHutangNew.TampilanAwal;
begin
  ClearText(Self);
  ENObukti.Text := GetCode(dm.Q1,'bayarhutang','nobukti','BH');
  setTanggal(Self);
  idsupplier := '';
end;

procedure TFpembayaranHutangNew.UmCheck(var Message: TMessage);
begin
 Check(TcxGridDBTableView(Message.WParam));
end;

end.
