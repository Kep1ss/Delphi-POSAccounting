unit uLapPenjualanKasir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, cxButtons,
  cxCheckBox, cxGroupBox, frxClass, frxPreview, RzButton, Vcl.ExtCtrls, sPanel,
  uComCtrl, uctrlFrm, dxSkinTheBezier;

type
  TFLapPenjualanKasir = class(TForm)
    spnl1: TsPanel;
    rzbtbtn1: TRzBitBtn;
    rzbtbtn2: TRzBitBtn;
    frxPreview4: TfrxPreview;
    cxGroupBox3: TcxGroupBox;
    Label2: TLabel;
    C7: TcxCheckBox;
    btn4: TcxButton;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btn5: TcxButton;
    C12: TcxCheckBox;
    cbPembayaran: TComboBox;
    procedure btn5Click(Sender: TObject);
    procedure rzbtbtn1Click(Sender: TObject);
    procedure rzbtbtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLapPenjualanKasir: TFLapPenjualanKasir;

implementation

{$R *.dfm}

uses uDlaporan;

procedure TFLapPenjualanKasir.btn5Click(Sender: TObject);
begin
    with Dlaporan.Qrekapkasi2 do begin
      Close;
      SQL.Text :='CALL sp_rekapitulasikasir("'+Tanggal(dtp1.Date)+'","'+Tanggal(dtp2.Date)+'")';
      open;
  end;


  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\rekapitulasikasir.fr3');
  FMemo(Dlaporan.Fr1,'Lbulan').Text := FormatDateTime('dd/mm/yyyy',dtp1.Date);
  Dlaporan.Fr1.PrepareReport(False);
  Dlaporan.Fr1.Preview := frxPreview4;
  Dlaporan.Fr1.ShowReport;
end;

procedure TFLapPenjualanKasir.FormShow(Sender: TObject);
begin
  dtp1.Date := now;
  dtp2.Date := now;
end;

procedure TFLapPenjualanKasir.rzbtbtn1Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(true);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  frxPreview4.Print;
end;

procedure TFLapPenjualanKasir.rzbtbtn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(true);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  frxPreview4.Export(Dlaporan.frxls1);
end;

end.
