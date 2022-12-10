program TokoManager;

uses
  Vcl.Forms,
  uTokoManager in 'uTokoManager.pas' {FTokoManager},
  uComCtrl in 'ctrl\uComCtrl.pas',
  uSettingAkes in 'uSettingAkes.pas' {FsetingAkses},
  WbemScripting_TLB in 'ctrl\WbemScripting_TLB.pas',
  uEngine in 'ctrls\uEngine.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFTokoManager, FTokoManager);
  Application.CreateForm(TFsetingAkses, FsetingAkses);
  Application.Run;
end.
