program UserControl;

uses
  Vcl.Forms,
  uSerControll in 'uSerControll.pas' {Flogin},
  uComCtrl in 'ctrl\uComCtrl.pas',
  uAktivasi in 'frm\uAktivasi.pas' {FAktivasi},
  uEngine in 'ctrls\uEngine.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFlogin, Flogin);
  Application.CreateForm(TFAktivasi, FAktivasi);
  Application.Run;
end.
