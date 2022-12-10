unit uSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  dxGDIPlusClasses, Vcl.ExtCtrls, acProgressBar, AdvProgressBar, acPNG;

type
  TFsplash = class(TForm)
    img1: TImage;
    Lprogress: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pb1: TProgressBar;
    tmr1: TTimer;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OpenSplash;
    procedure ShowProgress(str:string;posisi:integer);
    procedure CloseSplash;
    { Public declarations }
  end;

var
  Fsplash: TFsplash;

implementation

{$R *.dfm}

uses udm;

procedure TFsplash.CloseSplash;
begin
  Destroy;
end;

procedure TFsplash.FormShow(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'Logo.jpg') then
    img1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Logo.jpg')
  else
    img1.Picture := nil;
end;

procedure TFsplash.OpenSplash;
begin
  Lprogress.Caption := 'Loading ....';
  Show;
  Update;
end;

procedure TFsplash.ShowProgress(str:string;posisi:integer);
begin
  Lprogress.Caption := str;
  Lprogress.Refresh;
  pb1.Position := posisi;
end;

end.
