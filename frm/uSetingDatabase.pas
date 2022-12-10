unit uSetingDatabase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uOvEdit,System.IniFiles, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uEngine, dxSkiniMaginary,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFsettingDatabase = class(TForm)
    L1: TLabel;
    L2: TLabel;
    Eserver: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Euser: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    EPassword: TcxTextEdit;
    Label5: TLabel;
    Label6: TLabel;
    EPort: TcxTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    EDatabase: TcxTextEdit;
    btnTest: TcxButton;
    btnTutup: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    procedure SaveCon;
    function isConnect : Boolean;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FsettingDatabase: TFsettingDatabase;

implementation

{$R *.dfm}

uses udm;


procedure TFsettingDatabase.btnSimpanClick(Sender: TObject);
begin
  SaveCon;
end;



procedure TFsettingDatabase.btnTestClick(Sender: TObject);
begin
   SaveCon;
   isConnect;
end;

procedure TFsettingDatabase.btnTutupClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFsettingDatabase.FormShow(Sender: TObject);
 var
  Aini : TINIFIle;
begin
   Aini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'Config.Ini');
   try
      EServer.Text    := Aini.ReadString('Database','Host','');
      Eport.Text      := Aini.ReadString('Database','Port','0');
      EDatabase.Text  := Aini.ReadString('Database','DB','');
      EUser.Text      := aini.ReadString('Database','User','');
      EPassword.Text  := Aini.ReadString('Database','Pass','');
   finally
     Aini.Free;
   end;
end;

function TFsettingDatabase.isConnect: Boolean;
begin
  //SaveCon;
  //SetKoneksi(dm.con1);

  try
    dm.con1.Connect;

    if dm.con1.Connected then begin
       Result      := True;
       MessageDlg('Koneksi sukses, Tutup dan buka kembali program',mtInformation,[mbYes],0);
    end;
  except
    on E:Exception do
    begin
       Result := False;
       MessageDlg('Koneksi gagal !! '+#13+ ' Pesan error : '+E.Message,mtInformation,[mbYes],0);

    end;
  end;
end;


procedure TFsettingDatabase.SaveCon;
var
  Aini : TINIFIle;
begin
   Aini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'Config.Ini');
   try
       Aini.WriteString('Database','Host',EServer.Text);
       Aini.WriteString('Database','Port',Eport.Text );
       Aini.WriteString('Database','DB',EDatabase.Text);
       aini.WriteString('Database','User',EUser.Text);
       Aini.WriteString('Database','Pass', EPassword.Text);
   finally
     Aini.Free;
   end;
end;

end.
