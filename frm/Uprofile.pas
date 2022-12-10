unit Uprofile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,System.Win.Registry,
  dxSkinVisualStudio2013Light, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMemo,
  cxTextEdit, dxBevel, uComCtrl, uctrlFrm, uEngine, uOvEdit, FolderDialog,
  dxSkinSharp, cxMaskEdit, cxDropDownEdit, dxSkiniMaginary,Printers,System.IniFiles,
  cxCheckBox, dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFprofile = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ENama: TcxTextEdit;
    Ekota: TcxTextEdit;
    Ealamat: TcxMemo;
    ETelepon: TcxTextEdit;
    EFax: TcxTextEdit;
    ENpwp: TcxTextEdit;
    Label14: TLabel;
    Label15: TLabel;
    EDirBackup: TcxTextEdit;
    btnBrowse: TcxButton;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    op1: TFolderDialog;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    cbGudang: TcxComboBox;
    cbgudang3: TcxComboBox;
    Label22: TLabel;
    Label23: TLabel;
    cbprinterStruk: TcxComboBox;
    Label24: TLabel;
    Label25: TLabel;
    cbPrinterInvoice: TcxComboBox;
    Label26: TLabel;
    Label27: TLabel;
    cbKasir: TcxComboBox;
    CDirect: TcxCheckBox;
    Label28: TLabel;
    Label29: TLabel;
    EminPoinEcer: TcxTextEdit;
    Cauto: TcxCheckBox;
    Label30: TLabel;
    Label31: TLabel;
    E1: TcxTextEdit;
    Label32: TLabel;
    Label33: TLabel;
    E2: TcxTextEdit;
    Label34: TLabel;
    Label35: TLabel;
    E3: TcxTextEdit;
    Label36: TLabel;
    Label37: TLabel;
    rbInvoice: TRadioButton;
    rbStruk: TRadioButton;
    Label17: TLabel;
    Label20: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    cbKasPembelian: TcxComboBox;
    cbKasPenjualan: TcxComboBox;
    CStokMinus: TcxCheckBox;
    btnSetting: TcxButton;
    pm1: TPopupMenu;
    S1: TMenuItem;
    I1: TMenuItem;
    CSaveHarga: TcxCheckBox;
    btnAktivasi: TcxButton;
    Lstatus: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    EMinPoinGrosir: TcxTextEdit;
    Label42: TLabel;
    cbSize: TcxComboBox;
    Label43: TLabel;
    Label44: TLabel;
    EMinPoinPartai: TcxTextEdit;
    procedure btnTutupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure btnAktivasiClick(Sender: TObject);
  private
    alist: TStringList;
    procedure SaveKasir;

    function Active:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fprofile: TFprofile;

implementation

{$R *.dfm}

uses udm, uDlaporan, uMainMenu, uAktivasi;


function setSerial(s: String): String;

var
  K:Array [0..11] of Char;
  mKey:String;

  i:byte;
begin
  mKey:='';
  strPCopy(K,pChar(UpperCase(S)));
  for i := 0 to (Length(S)-1) do
  begin
    Mkey:= mKey + chr(WORD(K[i]))+inttostr(i+9);
  end;
  Result:=mKey;

end;
function bacareg(regkey, fieldtesk: string): string;
var
   reg:TRegistry;
begin
  try
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
    if reg.OpenKey(regkey,true)then
      begin
        if reg.ValueExists(fieldtesk)then
          result:=reg.ReadString(fieldtesk);
        end;
  finally
    reg.Free;
  end;
end;

Function ekripsi(Const S:String):String;

var
  i:byte;
  t:String;
begin
  for i := 1 to length(s) do
  begin
    t:=t+chr(ord(s[i])+64);
  end;
  Result:=t;
end;

Function deskripsi(Const S:String):String;
var
  i:byte;
  t:String;
begin
  for i := 1 to length(s) do
  begin
    t:=t+chr(ord(s[i])-64);
  end;
  Result:=t;
end;


function TFprofile.Active: Boolean;
var
  FileReg : TStringList;
begin
  if FileExists(ExtractFilePath(ParamStr(0))+'cfn.sav') then begin
     FileReg := TStringList.Create;

     try
       FileReg.LoadFromFile(ExtractFilePath(ParamStr(0))+'cfn.sav');
       FileReg.NameValueSeparator := ':';

       if ekripsi(FileReg.Values['Serial'])  = bacareg('SOFTWARE\Anaba Software\active','Sn') then
          Result := True
       else begin
         Result := False;

       end;
     finally
       FileReg.Free;
     end;
  end else begin
    Result := False;
  end;

end;

procedure TFprofile.btnAktivasiClick(Sender: TObject);
begin
    if Lstatus.Caption = 'Trial' then
     FAktivasi.ShowModal else
     Informasi('Program Sudah Aktif');
end;

procedure TFprofile.btnBrowseClick(Sender: TObject);
begin
  if op1.Execute then
     EDirBackup.Text    := op1.Directory;
end;

procedure TFprofile.btnSimpanClick(Sender: TObject);
begin
  if not CheckEdit(Self) then
  begin
    addParam('nama',ENama.Text,alist,'str');
    addParam('alamat',Ealamat.Text,alist,'str');
    addParam('kota',Ekota.Text,alist,'str');
    addParam('notelepon',ETelepon.Text,alist,'str');
    addParam('fax',EFax.Text,alist,'str');
    addParam('npwp',ENpwp.Text,alist,'str');
    addParam('dirbackup',StringReplace(EDirBackup.Text,'\','\\',[rfReplaceAll]),alist,'str');
    addParam('gudangbeli',GetIdcmb(cbGudang),alist,'str');
    addParam('gudangjual',GetIdcmb(cbGudang3),alist,'str');
    addParam('default_kas_penjualan',cbKasPenjualan.Text,alist,'str');
    addParam('default_kas_pembelian',cbKasPembelian.Text,alist,'str');
    addParam('footernota',E1.Text,alist,'str');
    addParam('footernota2',E2.Text,alist,'str');
    addParam('footernota3',E3.Text,alist,'str');
    addParam('printerstruk',cbprinterStruk.Text,alist,'str');
    addParam('printerinvoice',cbPrinterInvoice.Text,alist,'str');
    addParam('minpoinecer',EminPoinEcer.isAngka,alist,'str');
    addParam('minpoingrosir',EMinPoinGrosir.isAngka,alist,'str');
    addParam('minpoinpartai',EMinPoinPartai.isAngka,alist,'str');
    addParam('stokmin',BolStr(CStokMinus.Checked),alist,'str');

    OpenTable(dm.Q1,['idprofil'],'profile where idprofil=1');
    if dm.Q1.IsEmpty then
      exeDb(dm.Q1,'profile',alist)
    else
      updatedb(dm.Q1,'profile',alist,'idprofil','1');
    SaveKasir;
    MessageDlg('Data berhasil disimpan',mtInformation,[mbYes],0);
  end;
end;

procedure TFprofile.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFprofile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  alist.Free;
end;

procedure TFprofile.FormCreate(Sender: TObject);
begin

  EminPoinEcer.isRupiah      := True;
  EminPoinGrosir.isRupiah := True;
  EMinPoinPartai.isRupiah := True;
end;

procedure TFprofile.FormShow(Sender: TObject);
var
  Aini : TIniFile;
begin
  alist := TStringList.Create;

  Aini := TIniFile.Create(apathExe+'SetKasir.ini');
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang3);
  isiCmb(dm.Q1,'komputer',['komputerid','namakomputer'],cbKasir);

  ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
  ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);
  cbKasPembelian.Properties.Items.Clear;
  cbKasPenjualan.Properties.Items.Clear;
  while not dm.Q2.Eof do begin
    cbKasPembelian.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    cbKasPenjualan.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    dm.Q2.Next;
  end;

  OpenTable(dm.Q1,['*'],'profile');

  ENama.Text      := GetVal(dm.Q1,'nama');
  Ealamat.Text    := GetVal(dm.Q1,'alamat');
  Ekota.Text      := GetVal(dm.Q1,'kota');
  ETelepon.Text   := GetVal(dm.Q1,'notelepon');
  EFax.Text       := GetVal(dm.Q1,'fax');
  ENpwp.Text      := GetVal(dm.Q1,'npwp');
  EDirBackup.Text := GetVal(dm.Q1,'dirbackup');
  EMinPoinEcer.Text   := GetValR(dm.Q1,'minpoinecer');
  EMinPoinGrosir.Text   := GetValR(dm.Q1,'minpoingrosir');
  EMinPoinPartai.Text   := GetValR(dm.Q1,'minpoinpartai');
  E1.Text         := GetVal(dm.Q1,'footernota');
  E2.Text         := GetVal(dm.Q1,'footernota2');
  E3.Text         := GetVal(dm.Q1,'footernota3');

  cbGudang.ItemIndex := idxCmb(cbGudang,GetValInt(dm.Q1,'gudangbeli'));
  cbGudang3.ItemIndex := idxCmb(cbGudang3,GetValInt(dm.Q1,'gudangjual'));
  cbKasPembelian.ItemIndex := cbKasPembelian.Properties.Items.IndexOf(
                              GetVal(dm.Q1,'default_kas_pembelian'));
  cbKasPenjualan.ItemIndex := cbKasPenjualan.Properties.Items.IndexOf(
                              GetVal(dm.Q1,'default_kas_penjualan'));


  cbprinterStruk.Properties.Items.Assign(printer.Printers);
  cbPrinterInvoice.Properties.Items.Assign(printer.Printers);
  CStokMinus.Checked := dm.Q1.FieldByName('stokmin').AsBoolean = True;

  try
    cbprinterStruk.Text := Aini.ReadString('KOMPUTER','printerstruk','DEFAULT PRINTER');
    cbPrinterInvoice.Text := Aini.ReadString('KOMPUTER','printerinvoice','DEFAULT PRINTER');
    cbKasir.ItemIndex   := idxCmb(cbKasir,StrToInt(setIdKom));
    CDirect.Checked     := StrToBool(Aini.ReadString('KOMPUTER','PrintDirect','0')) ;
    Cauto.Checked       := StrToBool(Aini.ReadString('KOMPUTER','AutoPrint','0')) ;
    rbInvoice.Checked   := Aini.ReadString('KOMPUTER','TipeStruk','') = 'INVOICE';
    rbStruk.Checked     := Aini.ReadString('KOMPUTER','TipeStruk','') = 'STRUK';
    CSaveHarga.Checked  := StrToBool(Aini.ReadString('KOMPUTER','SaveHarga','0')) ;
    if Aini.ReadString('KOMPUTER','Size','') = '80 mm' then

    cbSize.ItemIndex    := 1 else cbSize.ItemIndex := 0;
  finally
    Aini.Free;
  end;

  if Active then
     Lstatus.Caption := 'Active' else
     Lstatus.Caption := 'Trial';
end;

procedure TFprofile.I1Click(Sender: TObject);
begin
  Dlaporan.fr1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\invoice3.fr3');
  DLaporan.fr1.DesignReport();
end;

procedure TFprofile.S1Click(Sender: TObject);
begin

    Dlaporan.fr1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\nota 78.fr3');
    DLaporan.fr1.DesignReport();

end;

procedure TFprofile.SaveKasir;
var
  Aini : TINIFIle;
  str  : String;
begin
   Aini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'SetKasir.Ini');
   try
       if rbInvoice.Checked then
          str := 'INVOICE' else
          str := 'STRUK';
       Aini.WriteString('KOMPUTER','komputerid',GetIdcmb(cbKasir));
       Aini.WriteString('KOMPUTER','printerstruk',cbprinterStruk.Text);
       Aini.WriteString('KOMPUTER','printerinvoice',cbPrinterInvoice.Text);
       Aini.WriteString('KOMPUTER','PrintDirect',BolStr(CDirect.Checked));
       Aini.WriteString('KOMPUTER','AutoPrint',BolStr(Cauto.Checked));
       Aini.WriteString('KOMPUTER','TipeStruk',str);
       Aini.WriteString('KOMPUTER','Size',Trim(cbSize.Text));
       Aini.WriteString('KOMPUTER','SaveHarga',BolStr(CSaveHarga.Checked));

   finally
     Aini.Free;
   end;
end;

end.
