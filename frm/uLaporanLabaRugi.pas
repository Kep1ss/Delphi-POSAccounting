unit uLaporanLabaRugi;

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
  dxSkinSharp,dateUtils, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFlapLabaRugi = class(TForm)
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
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnClick(Sender: TObject);
  private
    { Private declarations }
    const
      SQLlabaRUgi =  ' SELECT                                                       '+
                   '     ak.kodeakunperkiraan,                                    '+
                   '   ak.namaakunperkiraan,                                      '+
                   '     ms.akunsubmaster,                                        '+
                   '     ms.namasubmaster,                                        '+
                   '     bb.nomasterakun,                                         '+
                   '     bb.namamasterakun,                                       '+
                   '     (                                                        '+
                   '       CASE                                                   '+
                   '         WHEN bb.jenisakun = "A"                              '+
                   '         THEN IFNULL(SUM(s.s_awal) + SUM(s.debet) - SUM(s.kredit),0)    '+
                   '         ELSE IFNULL(SUM(s.s_awal) + SUM(s.kredit) - SUM(s.debet),0)    '+
                   '       END                                                    '+
                   '     ) AS saldoakhir,                                         '+
                   ' (CASE WHEN bb.jenisakun = "A" THEN IFNULL(SUM(s.s_awal) +    '+
                   ' SUM(s.debet) - SUM(s.kredit),0) END) AS "Biaya",             '+
                   ' (CASE WHEN bb.jenisakun = "P" THEN IFNULL(SUM(s.s_awal) +    '+
                   ' SUM(s.kredit) - SUM(s.debet),0) END) AS "Pendapatan"         '+
                   '   FROM                                                       '+
                   '     m_akunperkiraan ak                                       '+
                   '     LEFT JOIN saldoakun s                                    '+
                   '       ON s.`noakun` = ak.`kodeakunperkiraan`                 '+
                   '       LEFT JOIN m_subbukubesar ms ON ms.akunsubmaster=ak.`akunsubmaster` '+
                   '       LEFT JOIN m_bukubesar bb ON bb.`nomasterakun`=ms.`nomasterakun`   ';

  public
    { Public declarations }
  end;

var
  FlapLabaRugi: TFlapLabaRugi;
  stk1,stk2 : string;
  str : string;

implementation

{$R *.dfm}

uses UDlaporan, udm, uMainMenu;

procedure TFlapLabaRugi.btn1Click(Sender: TObject);
begin
//  ExQry(dm.Q1,'CALL sp_sync_jasa('+IntToStr(MonthOf(dt1.Date))+','+IntToStr(YearOf(dt1.Date))+')',False);
  ExQry(Dlaporan.QPendapatan,'CALL sp_pendapatan('+QuotedStr(Tanggal(dt1.Date))+','+QuotedStr(Tanggal(dt2.Date))+')',True);
  ExQry(Dlaporan.Qbiaya,'CALL sp_biaya('+QuotedStr(Tanggal(dt1.Date))+','+QuotedStr(Tanggal(dt2.Date))+')',True);
  ExQry(Dlaporan.Qhpp,'CALL sp_hpp('+QuotedStr(Tanggal(dt1.Date))+','+QuotedStr(Tanggal(dt2.Date))+')',True);
  ExQry(Dlaporan.QSP_returJual,'CALL sp_returjual('+QuotedStr(Tanggal(dt1.Date))+','+QuotedStr(Tanggal(dt2.Date))+')',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\labarugi2.fr3');
  FMemo(Dlaporan.Fr1,'Ltanggal').Text := 'Periode '+FormatDateTime('dd mmmm yyyy',dt1.Date)+' - '+FormatDateTime('dd mmmm yyyy',dt2.Date);
  Dlaporan.Fr1.Preview := Frv1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapLabaRugi.btn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapLabaRugi.btnClick(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.fr1.Print;
end;

procedure TFlapLabaRugi.FormShow(Sender: TObject);
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
