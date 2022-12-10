unit uHistoryPenukaranPoin;

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
  dxSkinXmas2008Blue;

type
  TFhistoryPenukaranPoin = class(TForm)
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
    btn9: TcxButton;
    Label4: TLabel;
    LnamaPelanggan: TLabel;
    cxGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxGrid1DBTableView1tgl: TcxGridDBColumn;
    cxGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxGrid1DBTableView1jmlpoin: TcxGridDBColumn;
    cxGrid1DBTableView1jmltukar: TcxGridDBColumn;
    cxGrid1DBTableView1sisapoin: TcxGridDBColumn;
    cxGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxGrid1DBTableView1namalengkap: TcxGridDBColumn;
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
    _SQL = ' SELECT                                       '+
           '     r.nobukti,                               '+
           '     r.tgl,                                   '+
           '     pl.namapelanggan,                        '+
           '     r.jmlpoin,                               '+
           '     r.jmltukar,                              '+
           '     r.jmlpoin - r.jmltukar AS sisapoin,      '+
           '     r.keterangan,                            '+
           '     u.namalengkap                            '+
           '   FROM                                       '+
           '     redempoin r                              '+
           '     LEFT JOIN pelanggan pl                   '+
           '       ON r.id_pelanggan = pl.idpelanggan     '+
           '     LEFT JOIN m_user u                       '+
           '       ON u.iduser = r.iduser    ';
var
  FhistoryPenukaranPoin: TFhistoryPenukaranPoin;

implementation

{$R *.dfm}

uses  uDlaporan, uComCtrl;

procedure TFhistoryPenukaranPoin.btn9Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\HistoryPenukaranPoin_'+Lnamapelanggan.Caption+'_'+Tanggal(dt1.Date)+'_'+Tanggal(dt2.Date)+'.xls',
  cxgrid1,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\HistoryPenukaranPoin_'+Lnamapelanggan.Caption+'_'+Tanggal(dt1.Date)+'_'+Tanggal(dt2.Date)+'.xls'),nil,nil, SW_NORMAL);

end;

procedure TFhistoryPenukaranPoin.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFhistoryPenukaranPoin.dt1Change(Sender: TObject);
begin
  LoadData;
end;

procedure TFhistoryPenukaranPoin.FormShow(Sender: TObject);
begin
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := Now;
  LoadData;
end;

procedure TFhistoryPenukaranPoin.LoadData;
var
  kodepelanggan : string;
begin
  kodepelanggan := Copy(LnamaPelanggan.Caption,Pos('|',LnamaPelanggan.Caption)+2,Length(LnamaPelanggan.Caption));
  ExQry(QHistoryPoinPelanggan,_SQL+' WHERE r.tgl>="'+Tanggal(dt1.Date)+'" '+
  ' AND r.tgl<="'+Tanggal(dt2.Date)+'" '+
  ' AND pl.kodepelanggan="'+kodepelanggan+'" ',True);
end;

end.
