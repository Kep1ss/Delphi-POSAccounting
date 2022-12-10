unit uProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, AdvProgr;

type
  TFLoading = class(TForm)
    Label1: TLabel;
    Lprogres: TLabel;
    pb1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLoading: TFLoading;

implementation

{$R *.dfm}

end.
