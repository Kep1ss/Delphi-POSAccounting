unit uLapJurnalTransaksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2007Blue,
  dxSkinOffice2010Blue, dxSkinTheAsphaltWorld, Vcl.Menus, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, dxRibbonSkins, dxSkinsdxRibbonPainter, cxClasses,
  dxRibbon, dxBar, dxRibbonMiniToolbar, frxClass, frxExportXLS, frxPreview,
  cxPC, Vcl.StdCtrls, cxButtons, cxCheckListBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxGroupBox, RzButton, Vcl.ExtCtrls, sPanel,
  Vcl.CheckLst, Vcl.ComCtrls, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinMcSkin, uComCtrl, uctrlFrm,
  dxSkiniMaginary, uEngine, dxBarBuiltInMenu, dxSkinOffice2016Colorful,
  dxSkinSharp,System.DateUtils, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, frxExportBaseDialog;

type
  TFlapJurnalTransaksi = class(TForm)
    pg1: TcxPageControl;
    tbPenjualan: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    lbl1: TLabel;
    btn1: TcxButton;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    frv1: TfrxPreview;
    Pn1: TsPanel;
    btn: TRzBitBtn;
    btn2: TRzBitBtn;
    frxXLSExport1: TfrxXLSExport;
    frxXLSExport2: TfrxXLSExport;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    const
      SQLJurnal = ' SELECT                                          '+
                  '        jr.noakun,                               '+
                  '        ma.namaakunperkiraan,                    '+
                  '        jr.keterangan,                           '+
                  '        jr.nobukti,                              '+
                  '        jr.tgl,                                  '+
                  '        SUM(jr.s_awal) as s_awal,                               '+
                  '        SUM(jr.debet) as debet,                                '+
                  '        SUM(jr.kredit) as kredit,                               '+
                  '        jr.s_akhir                               '+
                  '      FROM                                       '+
                  '        saldoakun jr                             '+
                  '        LEFT JOIN m_akunperkiraan ma             '+
                  '          ON ma.`kodeakunperkiraan` = jr.`noakun` ';
  public
    { Public declarations }
  end;

var
  FlapJurnalTransaksi: TFlapJurnalTransaksi;
  stk1,stk2 : string;
  str : string;

implementation

{$R *.dfm}

uses UDlaporan, udm, uMainMenu;

procedure TFlapJurnalTransaksi.btn1Click(Sender: TObject);
begin
  ExQry(Dlaporan.QjurnalTransaksi,SQLJurnal+' WHERE '+
        'jr.tgl >="'+Tanggal(dt1.Date)+'" AND '+
        'jr.tgl <="'+Tanggal(dt2.Date)+'" AND jr.noakun<>"302.001" '+
        'GROUP BY jr.nobukti,jr.noakun ORDER BY jr.idsaldo ASC',True);
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frnewjurnal.fr3');
  FMemo(Dlaporan.Fr1,'Ltanggal').Text := 'Periode '+FormatDateTime('dd mmmm yyyy',dt1.Date)+' - '+FormatDateTime('dd mmmm yyyy',dt2.Date);
  Dlaporan.Fr1.Preview := Frv1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapJurnalTransaksi.btn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapJurnalTransaksi.FormShow(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
    if Components[i] is TDateTimePicker then
       TDateTimePicker(Components[i]).Date := now;
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
end;

end.
