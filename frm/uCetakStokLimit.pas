unit uCetakStokLimit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,cxGridExportLink,Winapi.ShellAPI, uctrlFrm,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxGroupBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  uEngine,System.DateUtils, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFcetakStokLimit = class(TForm)
    cxg3: TcxGrid;
    cxgGrid1DBTableView12: TcxGridDBTableView;
    cxgGrid1DBTableView12kodebarang: TcxGridDBColumn;
    cxgGrid1DBTableView12namabarang: TcxGridDBColumn;
    cxgGrid1DBTableView12namakategori: TcxGridDBColumn;
    cxgGrid1DBTableView12stokmin: TcxGridDBColumn;
    cxgGrid1DBTableView12stok: TcxGridDBColumn;
    cxgGrid1DBTableView12PERINGATAN: TcxGridDBColumn;
    cxgGrid1Level12: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    btnPrint: TcxButton;
    btnClose: TcxButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FcetakStokLimit: TFcetakStokLimit;

implementation

{$R *.dfm}

uses uDlaporan;

procedure TFcetakStokLimit.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFcetakStokLimit.btnPrintClick(Sender: TObject);
begin
     ExportGridToExcel(apathExe+'template\LapStokLimit.xls',
     cxg3,true,True,True);
     ShellExecute(handle,'open',PChar(apathExe+'template\LapStokLimit.xls'),nil,nil, SW_NORMAL);
end;

procedure TFcetakStokLimit.FormShow(Sender: TObject);
begin
  ExQry(Dlaporan.Qstoklimit,' SELECT                                            '+
                              '      b.kodebarang,b.namabarang,k.namakategori,    '+
                              '      b.stokmin,b.warningiflimit as "PERINGATAN",   '+
                              '      c.kodebarang,c.stok                          '+
                              '    FROM                                           '+
                              '      barang b left join kategori                  '+
                              '      k on k.idkategori=b.idkategori               '+
                              '      LEFT JOIN (SELECT kodebarang,              '+
                              '     SUM(saldoawal + masuk - keluar) as stok FROM kartustok '+
                              '     WHERE MONTH(tgl)='+intToStr(MonthOf(now))+' '+
                              '     AND YEAR(tgl)='+IntToStr(YearOf(Now))+' GROUP by kodebarang) c '+
                              '     ON c.kodebarang=b.kodebarang                    '+
                              '        WHERE b.warningiflimit=True                  '+
                              '     AND c.stok <= b.stokmin  ',True);
end;

end.
