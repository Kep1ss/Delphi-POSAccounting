unit uLapProfitHarian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uEngine, uComCtrl,System.DateUtils,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, frxClass, frxExportBaseDialog, frxExportXLS,
  frxDBSet, Data.DB, MemDS, DBAccess, MyAccess, frxPreview, Vcl.StdCtrls,
  Vcl.ComCtrls, cxButtons, cxGroupBox, RzButton, Vcl.ExtCtrls, sPanel, uctrlFrm,
  dxSkinTheBezier;

type
  TFLapProfitHarian = class(TForm)
    spnl1: TsPanel;
    rzbtbtn1: TRzBitBtn;
    rzbtbtn2: TRzBitBtn;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    btn1: TcxButton;
    dtTahun: TDateTimePicker;
    frFrv1: TfrxPreview;
    QOmset: TMyQuery;
    frxReport1: TfrxReport;
    frOmset: TfrxDBDataset;
    frxXLSExport4: TfrxXLSExport;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rzbtbtn1Click(Sender: TObject);
    procedure rzbtbtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLapProfitHarian: TFLapProfitHarian;

implementation

{$R *.dfm}

procedure TFLapProfitHarian.btn1Click(Sender: TObject);
const
  rekap = ' SELECT                                                            '+
          '        p.tgljual,                                                 '+
          '       IFNULL(SUM(                                                             '+
          '         (d.subtotal/d.jumlah) * (d.jumlah - d.jumlahretur)        '+
          '       ),0) AS totalomset,                                                 '+
          '       IFNULL(SUM(d.hpp * ( (d.isi / d.jumlah) * (d.jumlah -d.jumlahretur))),0) AS totalhpp,             '+
          '       IFNULL(SUM(                                                             '+
          '         (d.subtotal - (d.harga * d.jumlahretur)) - (d.hpp * ( d.isi / d.jumlah) * (d.jumlah-d.jumlahretur))  '+
          '       ),0) AS totalprofit,                                                     '+
          '        fc_margin (                                                '+
          '          IFNULL(SUM(                                                             '+
          '         (d.subtotal - (d.harga * d.jumlahretur)) - (d.hpp * ( d.isi / d.jumlah) * (d.jumlah-d.jumlahretur))  '+
          '       ),0),                                                       '+
          '          IFNULL(SUM(d.hpp * ( (d.isi / d.jumlah) * (d.jumlah -d.jumlahretur))),0)                  '+
          '        ) AS margin , fc_counter(p.tgljual) as struk                                               '+
          '      FROM                                                         '+
          '        penjualan p                                                '+
          '        LEFT JOIN penjualandetil d                                 '+
          '          ON p.`fakturjual` = d.`fakturjual`                       ';

begin

  ExQry(QOmset,rekap+
  ' WHERE p.tgljual="'+Tanggal(dtTahun.Date)+'" '+
  ' GROUP BY p.`tgljual` HAVING totalomset > 0',True);

  frxReport1.LoadFromFile(aPathRpt+'\frOmsetBulan.fr3');
  FMemo(frxReport1,'Ljudul').Text := 'Tanggal : '+FormatDateTime('dd/mm/yyyy',dtTahun.Date);
  frxReport1.Preview := frFrv1;
  frxReport1.ShowReport();
end;


procedure TFLapProfitHarian.FormShow(Sender: TObject);
begin
  dtTahun.Date := now;
end;

procedure TFLapProfitHarian.rzbtbtn1Click(Sender: TObject);
begin
  frxReport1.PrepareReport(True);
  frxReport1.PrintOptions.ShowDialog := True;
  frxReport1.Print;
end;

procedure TFLapProfitHarian.rzbtbtn2Click(Sender: TObject);
begin
  frxReport1.PrepareReport(True);
  frxReport1.Export(frxXLSExport4);
end;

end.
