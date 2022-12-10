unit uInputUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCheckBox;

type
  TFInputUser = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EuserName: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Label10: TLabel;
    Label12: TLabel;
    EnamaLengkap: TcxTextEdit;
    Epassword: TcxTextEdit;
    cbLevel: TcxComboBox;
    Label16: TLabel;
    Label18: TLabel;
    cbgudangbeli: TcxComboBox;
    cbgudangjual: TcxComboBox;
    Label3: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    cbKasPembelian: TcxComboBox;
    cbKasPenjualan: TcxComboBox;
    Label14: TLabel;
    Label15: TLabel;
    cUpdatePassword: TCheckBox;
    C3: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbLevelPropertiesChange(Sender: TObject);
  private
    procedure TampilanAwal;
    { Private declarations }
  public
    { Public declarations }
    idUser : String;
  end;

var
  FInputUser: TFInputUser;
  aList     : TStringList;

implementation
  uses
    udm,
  uDataUser, uMainMenu;

{$R *.dfm}

{ TFInputUser }

procedure TFInputUser.btnSimpanClick(Sender: TObject);
begin
  if not CheckEdit(Self) then begin
     addParam('username',EUsername.Text,aList,'str');
     addParam('namalengkap',EnamaLengkap.Text,aList,'str');
     addParam('level',cbLevel.Text,aList,'str');
     if cUpdatePassword.Checked then
     addParam('pwd',EPassword.Text,aList,'pwd');
     addParam('gudang_beli',GetIdcmb(cbgudangbeli),aList,'str');
     addParam('gudang_jual',GetIdcmb(cbgudangjual),aList,'str');
     addParam('kas_penjualan',cbKasPenjualan.Text,aList,'str');
     addParam('kas_pembelian',cbKasPembelian.Text,aList,'str');
     addParam('penjualan_only',BolStr(C3.Checked),aList,'str');

     OpenTable(dm.Q1,['username'],'m_user where iduser="'+idUser+'"');
    if dm.Q1.IsEmpty then begin
       addParam('pwd',EPassword.Text,aList,'pwd');
       exeDb(dm.Q1,'m_user',aList);
    end
    else
       updatedb(dm.Q1,'m_user',aList,'iduser','"'+idUser+'"');

    ExQry(dm.Quser,_SQLuser,True);
    TampilanAwal;

    if FDataUser.CanEdit  then
      Close;

  end;
end;

procedure TFInputUser.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFInputUser.cbLevelPropertiesChange(Sender: TObject);
begin
  C3.Enabled := cbLevel.Text ='KASIR';

end;

procedure TFInputUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
  aList.Free;
end;

procedure TFInputUser.FormCreate(Sender: TObject);
begin
  Epassword.isPassword := True;

end;

procedure TFInputUser.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;
  EUsername.SetFocus;
  cbLevel.Properties.Items.Clear;
  if Fmain.sbr1.Panels[4].Text <> 'SUPER ADMIN' then begin
     cbLevel.Properties.Items.Add('ADMIN');
     cbLevel.Properties.Items.Add('KASIR');
     cbLevel.Properties.Items.Add('SALES');
  end else
  begin
    cbLevel.Properties.Items.Add('SUPER ADMIN');
    cbLevel.Properties.Items.Add('KASIR');
    cbLevel.Properties.Items.Add('SALES');
    cbLevel.Properties.Items.Add('ADMIN');
  end;

end;

procedure TFInputUser.TampilanAwal;
begin
  ClearText(Self);
  EUsername.SetFocus;
  if Assigned(Fdatauser) then
  FDataUser.LoadData;
  idUser := '';
  C3.Checked           := False;
end;

end.
