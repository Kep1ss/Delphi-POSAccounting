unit uInputMasterEDC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, uEngine, uComCtrl, uOvEdit, uctrlFrm,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue;

type
  TFinputMasterEDC = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EMesin: TcxTextEdit;
    EKartuDebet: TcxTextEdit;
    ESucharge: TcxTextEdit;
    Label7: TLabel;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    procedure btnTutupClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    idEdc : String;
    procedure TampilanAwal;
    { Public declarations }
  end;

var
  FinputMasterEDC: TFinputMasterEDC;

implementation

{$R *.dfm}

uses udm, uMasterEDC;

procedure TFinputMasterEDC.btnSimpanClick(Sender: TObject);
var
  lst : TStringList;
begin
  if not CheckEdit(Self) then begin
    lst := TStringList.Create;

    try
      addParam('namamesin',EMesin.Text,lst,'str');
      addParam('kartudebet',EKartuDebet.Text,lst,'str');
      addParam('sucharge',KomaDatabase(ESucharge.Text),lst,'str');

      OpenTable(dm.Q1,['idedc'],'masteredc where idedc="'+idEdc+'"');
      if dm.Q1.IsEmpty then
         exeDb(dm.Q2,'masteredc',lst)
      else
         updatedb(dm.Q2,'masteredc',lst,'idedc',idEdc);

         TampilanAwal;
    finally
      lst.Free;
    end;
  end;


end;

procedure TFinputMasterEDC.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputMasterEDC.TampilanAwal;
begin
  ClearText(Self);

  if Assigned(FmasterEDC) then
     FmasterEDC.LoadData;
end;

end.
