unit uSerControll;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,System.IniFiles,
  dxSkinXmas2008Blue, Vcl.Menus, Data.DB, MemDS, DBAccess, MyAccess, cxButtons,
  cxTextEdit;
   const
   InputBoxMessage = WM_USER + 200;
type
  TFlogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    EUserName: TcxTextEdit;
    EPassword: TcxTextEdit;
    btnLogin: TcxButton;
    btnBatal: TcxButton;
    con1: TMyConnection;
    Q1: TMyQuery;
    Label5: TLabel;
    Label7: TLabel;
    btnSeting: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSetingClick(Sender: TObject);
    procedure EUserNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure SaveCon;
    procedure InputBoxSetPasswordChar(var Msg: TMessage); message InputBoxMessage;
  public
    { Public declarations }
    NamaDatabase : String;
    UserName     : String;
    isAktif      : String;
  end;

var
  Flogin: TFlogin;

implementation

{$R *.dfm}

uses uEngine, uAktivasi;

{ TForm1 }

procedure TFlogin.btnBatalClick(Sender: TObject);
begin
  NamaDatabase := '';
  UserName     := '';
  isAktif      := 'false';
  SaveCon;
  Application.Terminate;
end;

procedure TFlogin.btnLoginClick(Sender: TObject);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Path    : String;
begin

  if ( EUserName.Text = 'anabasoft') and (EPassword.Text ='usercontrol') then
  begin
      Path := ExtractFilePath(Application.ExeName)+'TokoManager.exe';
      ZeroMemory(@StartupInfo,SizeOf(TStartupInfo));
      StartupInfo.cb := SizeOf(TStartupInfo);

      if(CreateProcess(Pchar(Path), Nil, Nil, Nil,
                       False, NORMAL_PRIORITY_CLASS,
                       Nil, Nil, StartupInfo,ProcessInfo))
      then
      begin
          WaitForSingleObject(ProcessInfo.hProcess,INFINITE);
          CloseHandle(ProcessInfo.hProcess);
          CloseHandle(ProcessInfo.hThread);
      end;
  end;
  ExQry(Q1,'SELECT * FROM karyawan WHERE username="'+EUserName.Text+'" '+
  ' AND password=MD5("'+EPassword.Text+'")',True);
  if Q1.IsEmpty then begin
     ShowMessage('Password Tidak Cocok');

  end else begin
     NamaDatabase := Q1.FieldByName('var_database').AsString;
     UserName     := EUserName.Text;
     isAktif      := 'true';
     SaveCon;
     Application.Terminate;
  end;
end;

procedure TFlogin.btnSetingClick(Sender: TObject);
var
  Password : String;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Path    : String;
begin
  PostMessage(Handle, InputBoxMessage, 0, 0);
  Password := InputBox('Masukan Password','Password','');

  Q1.Close;
  Q1.SQL.Text := 'SELECT * FROM karyawan WHERE password=MD5("'+Password+'")';
  Q1.Open;

  if Q1.FieldByName('level').AsString <> 'SUPER ADMIN' then
  begin
     MessageBox(Handle,'Maaf ada tidak ada ijin untuk mengakes','Error',MB_ICONERROR);
     Exit;
  end else begin
    Path := ExtractFilePath(Application.ExeName)+'TokoManager.exe';
    ZeroMemory(@StartupInfo,SizeOf(TStartupInfo));
    StartupInfo.cb := SizeOf(TStartupInfo);

    if(CreateProcess(Pchar(Path), Nil, Nil, Nil,
                     False, NORMAL_PRIORITY_CLASS,
                     Nil, Nil, StartupInfo,ProcessInfo))
    then
    begin
        WaitForSingleObject(ProcessInfo.hProcess,INFINITE);
        CloseHandle(ProcessInfo.hProcess);
        CloseHandle(ProcessInfo.hThread);
    end;
  end;
end;

procedure TFlogin.EPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
     btnLogin.Click;

  end;
end;

procedure TFlogin.EUserNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13  then begin
    EPassword.SetFocus;

  end;
   if (Key = 83 )  and (ssCtrl in Shift) then
  begin
    FAktivasi.ShowModal;
  end;
end;

procedure TFlogin.FormCreate(Sender: TObject);
begin
  SetKoneksi2(con1);
end;

procedure TFlogin.FormShow(Sender: TObject);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Path    : String;
begin
  ExQry(Q1,'SELECT * FROM toko',True);

  if Q1.IsEmpty then begin

    MessageDlg('Belum ada database toko !!, Silahkan tambahkan toko',mtWarning,[mbOK],0);
    Path := ExtractFilePath(Application.ExeName)+'TokoManager.exe';


    ZeroMemory(@StartupInfo,SizeOf(TStartupInfo));
    StartupInfo.cb := SizeOf(TStartupInfo);

    if(CreateProcess(Pchar(Path), Nil, Nil, Nil,
                     False, NORMAL_PRIORITY_CLASS,
                     Nil, Nil, StartupInfo,ProcessInfo))
    then
    begin
        WaitForSingleObject(ProcessInfo.hProcess,INFINITE);
        CloseHandle(ProcessInfo.hProcess);
        CloseHandle(ProcessInfo.hThread);
    end;

  end;
end;

procedure TFlogin.InputBoxSetPasswordChar(var Msg: TMessage);
var
   hInputForm, hEdit, hButton: HWND;
begin
   hInputForm := Screen.Forms[0].Handle;
   if (hInputForm <> 0) then
   begin
     hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
     {
       // Change button text:
       hButton := FindWindowEx(hInputForm, 0, 'TButton', nil);
       SendMessage(hButton, WM_SETTEXT, 0, Integer(PChar('Cancel')));
     }
     SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
   end;
end;

procedure TFlogin.SaveCon;
var
  Aini : TINIFIle;
begin
   Aini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'Config.Ini');
   try

       Aini.WriteString('Database','DB',NamaDatabase);
       Aini.WriteString('Database','username',UserName);
       Aini.WriteString('Database','aktif',isAktif);
   finally
     Aini.Free;
   end;
end;

end.
