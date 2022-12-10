unit uSetingLimitasi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uEngine, uComCtrl, uctrlFrm,
  uOvEdit, dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
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
  TFsetingLImitasi = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Etgl1: TcxTextEdit;
    Etgl2: TcxTextEdit;
    Etgl3: TcxTextEdit;
    Etgl4: TcxTextEdit;
    Etgl5: TcxTextEdit;
    Etgl6: TcxTextEdit;
    Etgl7: TcxTextEdit;
    Etgl8: TcxTextEdit;
    Etgl9: TcxTextEdit;
    Etgl10: TcxTextEdit;
    Etgl11: TcxTextEdit;
    Etgl12: TcxTextEdit;
    Etgl13: TcxTextEdit;
    Etgl14: TcxTextEdit;
    Etgl15: TcxTextEdit;
    Etgl16: TcxTextEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Etgl17: TcxTextEdit;
    Etgl18: TcxTextEdit;
    Etgl19: TcxTextEdit;
    Etgl20: TcxTextEdit;
    Etgl21: TcxTextEdit;
    Etgl22: TcxTextEdit;
    Etgl23: TcxTextEdit;
    Etgl24: TcxTextEdit;
    Etgl25: TcxTextEdit;
    Etgl26: TcxTextEdit;
    Etgl27: TcxTextEdit;
    Etgl28: TcxTextEdit;
    Etgl29: TcxTextEdit;
    Etgl30: TcxTextEdit;
    Etgl31: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    procedure btnTutupClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FsetingLImitasi: TFsetingLImitasi;

implementation

{$R *.dfm}

uses udm;

procedure TFsetingLImitasi.btnSimpanClick(Sender: TObject);
var
  i : integer;
  tglDate : TDateTime;

begin

  ExQry(dm.Q1,'TRUNCATE Table setingomset',False);
  tglDate := EncodeDate(2018,1,1);
  for i := 1 to 31 do begin
    ExQry(dm.Q1,'insert into setingomset (tgl,omset) '+
    ' VALUES ("'+Tanggal(tglDate + i-1)+'","'+TcxTextEdit(FindComponent('Etgl'+IntToStr(i))).isAngka+'")',False);

  end;
end;

procedure TFsetingLImitasi.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFsetingLImitasi.FormCreate(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to 31 do
    TcxTextEdit(FindComponent('Etgl'+inttostr(i))).isRupiah := True;

end;

procedure TFsetingLImitasi.FormShow(Sender: TObject);
var
  i : Integer;
begin
  for i := 1 to 31 do begin
    ExQry(dm.Q1,'SELECT * FROM setingomset WHERE DAY(tgl)="'+intTostr(i)+'"',True);
    if not dm.Q1.IsEmpty then
      TcxTextEdit(FindComponent('Etgl'+inttostr(i))).Text := GetValR(dm.Q1,'omset');

  end;
end;

end.
