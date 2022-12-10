unit uHistoryHargaBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinGlassOceans,
  dxSkinLiquidSky, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls,
  cxGroupBox, cxCurrencyEdit, uComCtrl, dxSkiniMaginary, dxSkinMoneyTwins,
  DBAccess, MyAccess, MemDS,System.DateUtils, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinLilian, dxSkinLondonLiquidSky, dxSkinMcSkin,
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
  TFhistoryHargaBarang = class(TForm)
    cxG1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1kodebarang: TcxGridDBColumn;
    cxGrid1DBTableView1namabarang: TcxGridDBColumn;
    cxGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxGrid1DBTableView1tgl: TcxGridDBColumn;
    cxGrid1DBTableView1harga: TcxGridDBColumn;
    cxGrid1DBTableView1jumlah: TcxGridDBColumn;
    QHistoryHarga: TMyQuery;
    DHistoryHarga: TMyDataSource;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    cxGrid1DBTableView1hargaecer: TcxGridDBColumn;
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dt1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FhistoryHargaBarang: TFhistoryHargaBarang;

implementation

{$R *.dfm}

uses uDtrx;

procedure TFhistoryHargaBarang.dt1Change(Sender: TObject);
begin
  With QHistoryHarga do begin
    Active    := False;
    FilterSQL := ' p.tgl >= "'+Tanggal(Dt1.Date)+'" AND p.tgl <="'+Tanggal(dt2.Date)+'"  ORDER BY p.tgl ASC ';
    Filtered  := True;
    Active    := True;
  end;
end;

procedure TFhistoryHargaBarang.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

    With QHistoryHarga do begin
    Active    := False;
    FilterSQL := ' b.namabarang LIKE "%'+EPencarian.Text+'%" '+
                 ' OR d.kodebarang LIKE "%'+EPencarian.Text+'%"  ORDER BY p.tgl ASC ';
    Filtered  := True;
    Active    := True;
    end;
  end;
end;

procedure TFhistoryHargaBarang.FormShow(Sender: TObject);
begin
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
end;

end.
