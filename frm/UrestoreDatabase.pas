unit UrestoreDatabase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.StdCtrls,
  sEdit, sLabel, sGroupBox,ShellApi, RzShellDialogs;

type
  TFRestoreDatabase = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sEdit1: TsEdit;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    Folder: TRzOpenDialog;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRestoreDatabase: TFRestoreDatabase;

implementation
  uses udm;

{$R *.dfm}



procedure TFRestoreDatabase.RzBitBtn1Click(Sender: TObject);
begin
  if Folder.Execute  then
  begin
    sEdit1.Text:=Folder.FileName;
  end;

end;

procedure TFRestoreDatabase.RzBitBtn2Click(Sender: TObject);
function SysDir: String;
var
  p: PChar;
begin
  GetMem(p, 1024);
  GetSystemDirectory(p, 1023);
  Result := string(p);
  FreeMem(p, 1024);
  result := ExcludeTrailingPathDelimiter(Result);
end;

var
  MySQLC,
  Host,
  User,
  Pass,
  Database: String;
  Port: String;
  CommandString,
  OutFile: String;
  path : string;
begin

  path := ExtractFilePath(Application.ExeName)+'mysql';

  host:=dm.con1.Server;
  user:=dm.con1.Username;
  pass:=dm.con1.Password;
  port:=IntToStr(dm.con1.Port);
  database:=dm.con1.Database;

  CommandString := Format('--host=%s --user=%s --pass=%s --port=%s  -e "drop database if exists %s; '+
      'create database %s ; use %s; \. %s"',[host,User,pass, Port, Database, Database,Database,sEdit1.Text]);

  MessageBox(handle,' Pastikan Data sudah dibackup,'+#13+' Karena Data akan ganti','Information',MB_ICONINFORMATION);
  if MessageDlg('Apakah Yakin restore Database',MTConfirmation,[MByes,Mbno],0)=mrYes then

  ShellExecute(Handle, PChar('open'),PChar('"'+path+'"'), PChar(commandString), nil,SW_HIDE);

  showmessage('Restore '+Database+' selesai..');

end;


procedure TFRestoreDatabase.RzBitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
