unit uPrintSetoranKasir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls;

type
  TFPrintSetoranKasir = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dt1: TDateTimePicker;
    Label3: TLabel;
    dt2: TDateTimePicker;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrintSetoranKasir: TFPrintSetoranKasir;

implementation

{$R *.dfm}

uses uSetoranKasir, uEngine, uComCtrl;

procedure TFPrintSetoranKasir.cxButton1Click(Sender: TObject);
begin
  ExQry(FSetoranKasir.QSetoranKasir,'SELECT                                            '+
                      '    s.iduser,                                     '+
                      '    pg.namalengkap,                               '+
                      '    s.tgl,                                        '+
                      '    SUM(s.total_penjualan) as total_penjualan,                            '+
                      '    SUM(s.pembulatan) as pembulatan,                                 '+
                      '    SUM(s.diskon) as diskon,                                     '+
                      '    SUM(s.non_tunai) as non_tunai,                                  '+
                      '    SUM(s.pembayaran_poin) as pembayaran_poin,                            '+
                      '    SUM(s.tunai) as tunai,                                      '+
                      '    SUM(s.penjualan_bersih) as penjualan_bersih,                           '+
                      '    SUM(s.setoran) as setoran,                                    '+
                      '    SUM(s.selisih) as selisih,                                    '+
                      '    SUM(fc_item_count(s.iduser,s.tgl)) as item_counter '+
                      '  FROM                                            '+
                      '    setoran_kasir s                               '+
                      '    LEFT JOIN m_user pg                          '+
                      '      ON s.`iduser` = pg.`iduser`  '+
                      '  WHERE s.tgl>="'+Tanggal(dt1.Date)+'" '+
                      ' AND s.tgl<="'+Tanggal(dt1.Date)+'" GROUP BY s.`iduser`',True);
  FSetoranKasir.frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\lapSetoranKasir.fr3');
  FSetoranKasir.frxReport1.ShowReport();

  Close;
end;

procedure TFPrintSetoranKasir.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFPrintSetoranKasir.FormShow(Sender: TObject);
begin
  dt1.Date := now;
  dt2.Date := now;
end;

end.
