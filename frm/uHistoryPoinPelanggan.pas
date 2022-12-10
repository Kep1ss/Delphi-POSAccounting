unit uHistoryPoinPelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, Vcl.StdCtrls, cxButtons, cxTextEdit, cxGroupBox, dxSkinsCore,
  Vcl.Menus, dxSkinsdxStatusBarPainter, cxStyles, ShellAPi,cxGridExportLink,
  dxSkinscxPCPainter, cxCustomData, Vcl.ImgList, udm, uEngine,IniFiles, uctrlFrm,
  dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,DateUtils,
  dxSkinMoneyTwins, Vcl.ComCtrls, cxCurrencyEdit, DBAccess, MyAccess, MemDS,
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
  dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageList;

type
  TFHistoryPoin = class(TForm)
    G1: TcxGroupBox;
    G3: TcxGroupBox;
    btnTutup: TcxButton;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    T1: TMenuItem;
    U1: TMenuItem;
    H1: TMenuItem;
    N1: TMenuItem;
    C1: TMenuItem;
    T2: TMenuItem;
    F1: TMenuItem;
    img1: TcxImageList;
    F2: TMenuItem;
    F3: TMenuItem;
    N2: TMenuItem;
    G5: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    R1: TMenuItem;
    Label2: TLabel;
    dt1: TDateTimePicker;
    Label3: TLabel;
    dt2: TDateTimePicker;
    QHistoryPoinPelanggan: TMyQuery;
    DPoinPelanggan: TMyDataSource;
    cxGrid1DBTableView1Tanggal: TcxGridDBColumn;
    cxGrid1DBTableView1NamaPelanggan: TcxGridDBColumn;
    cxGrid1DBTableView1GrandTotal: TcxGridDBColumn;
    cxGrid1DBTableView1Poin: TcxGridDBColumn;
    btn9: TcxButton;
    Label4: TLabel;
    LnamaPelanggan: TLabel;
    procedure btnTutupClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

    procedure LoadData;
    { Public declarations }
  end;
  const
    _SQL = ' SELECT                                         '+
                   '     p.tgljual AS "Tanggal",                    '+
                   '     pl.namapelanggan AS "Nama Pelanggan",      '+
                   '     p.grandtotal AS "Grand Total",             '+
                   '     (CASE                                      '+
                   '        WHEN pl.idpelanggan=4 then p.grandtotal '+
                   '        div (select minpoinecer FROM profile WHERE idprofil=1) '+
                   '        WHEN pl.idpelanggan=5 then p.grandtotal '+
                   '        div (SELECT minpoingrosir FROM profile WHERE idprofil=1) '+
                   '        WHEN pl.idpelanggan=6 then p.grandtotal '+
                   '        div (SELECT minpoinpartai FROM profile WHERE idprofil=1) '+
                   '      END ) as "Poin"                           '+
                   '   FROM                                         '+
                   '     penjualan p                                '+
                   '     LEFT JOIN pelanggan pl                     '+
                   '       ON pl.idpelanggan = p.idpelanggan        ';
var
  FHistoryPoin: TFHistoryPoin;

implementation

{$R *.dfm}

uses  uDlaporan, uComCtrl;

procedure TFHistoryPoin.btn9Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\HistoryPoin_'+Lnamapelanggan.Caption+'_'+Tanggal(dt1.Date)+'_'+Tanggal(dt2.Date)+'.xls',
  cxgrid1,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\HistoryPoin_'+Lnamapelanggan.Caption+'_'+Tanggal(dt1.Date)+'_'+Tanggal(dt2.Date)+'.xls'),nil,nil, SW_NORMAL);

end;

procedure TFHistoryPoin.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFHistoryPoin.dt1Change(Sender: TObject);
begin
  LoadData;
end;

procedure TFHistoryPoin.FormShow(Sender: TObject);
begin
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := Now;
  LoadData;
end;

procedure TFHistoryPoin.LoadData;
var
  kodepelanggan : string;
begin
  kodepelanggan := Copy(LnamaPelanggan.Caption,Pos('|',LnamaPelanggan.Caption)+2,Length(LnamaPelanggan.Caption));
  ExQry(QHistoryPoinPelanggan,_SQL+' WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" '+
  ' AND p.tgljual<="'+Tanggal(dt2.Date)+'" '+
  ' AND pl.kodepelanggan="'+kodepelanggan+'"  GROUP by p.idpelanggan,p.tgljual,p.fakturjual',True);
end;

end.
