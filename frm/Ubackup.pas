unit Ubackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sGroupBox, RzShellDialogs,
  RzButton, sEdit, sLabel,ShellApi,Registry, DADump, Vcl.Buttons,
  sBitBtn, Vcl.ComCtrls;

type
  TFbackupdatabase = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sEdit1: TsEdit;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    fd: TRzSelectFolderDialog;
    sBitBtn3: TsBitBtn;
    pb1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure RzBitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
  private
    function ReplaceDir(text:String):String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fbackupdatabase: TFbackupdatabase;

implementation

{$R *.dfm}

uses udm;

procedure TFbackupdatabase.FormShow(Sender: TObject);

begin
  dm.Qprofil.Active := False;
  dm.Qprofil.Active := True;
  sEdit1.Text := dm.Qprofil.FieldByName('dirbackup').AsString;
end;

function TFbackupdatabase.ReplaceDir(text: String): String;
begin
  Result := StringReplace(Text,'\','\\',[rfReplaceAll]);
end;

procedure TFbackupdatabase.RzBitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TFbackupdatabase.sBitBtn1Click(Sender: TObject);
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
begin

 // MySQLC:=extractfilepath(application.exename)+'mysqldump.exe';
{  OutFile:=sEdit1.Text+'\'+FormatDateTime('mmyy',Now)+'_casheyv5db.sql';

  if DirectoryExists(sEdit1.Text) = False then
     ForceDirectories(sEdit1.Text);


  host:=dm.con1.Server;
  user:=dm.con1.Username;
  pass:=dm.con1.Password;
  port:=IntToStr(dm.con1.Port);
  database:=dm.con1.Database;
  CommandString := Format('--host=%s --routines --user=%s --pass=%s  --port=%s --opt %s > "%s"',
  [Host, User,pass, Port, Database, OutFile]);
  ShellExecute(Handle, 'open', PChar(SysDir+'\cmd.exe'), PChar('/c mysqldump '+CommandString), nil, 0);

  showmessage('Backup file '+outfile +' selesai..');  }

  dm.MyDump1.BackupToFile('D:\backup_casheyPOSv5'+FormatDateTime('dd-mm-yy',Now));


end;
procedure TFbackupdatabase.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFbackupdatabase.sBitBtn3Click(Sender: TObject);
begin
  if FD.Execute  then
  begin
    sEdit1.Text:=fd.SelectedPathName;
    dm.Qprofil.Edit;
    dm.Qprofil.FieldByName('dirbackup').AsString := ReplaceDir(sEdit1.Text);
    dm.Qprofil.Post;
  end;
end;

end.
