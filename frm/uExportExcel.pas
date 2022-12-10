unit uExportExcel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.Menus, Vcl.ComCtrls,
  Vcl.StdCtrls, cxButtons, cxGroupBox, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  uEngine, uComCtrl, tmsAdvGridExcel, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFexportExcel = class(TForm)
    adv: TAdvStringGrid;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    dtp1: TDateTimePicker;
    Label2: TLabel;
    dtp2: TDateTimePicker;
    oi: TAdvGridExcelIO;
    cxButton3: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    procedure bersihGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FexportExcel: TFexportExcel;

implementation

{$R *.dfm}

uses udm,uProgress;

procedure TFexportExcel.bersihGrid;
var
  x ,y : integer;
begin
  for x := 0 to adv.ColCount -1 do
  for y := 0 to adv.RowCount -1 do
    adv.Cells[x,y] := '';

end;

procedure TFexportExcel.cxButton1Click(Sender: TObject);
begin
  oi.XLSExport(ExtractFilePath(Application.ExeName)+'exportpenjualan.xls','Export Penjualan Periode '+FormatDateTime('dd-mm-yy',dtp1.Date)+' s/d '+FormatDateTime('dd-mm-yy',dtp2.Date));
end;

procedure TFexportExcel.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFexportExcel.cxButton3Click(Sender: TObject);
var
  a , b ,c ,d , e,x: integer;
begin
 // bersihGrid;

  ExQry(dm.Q1,'SELECT * FROM v_penjualan WHERE '+
  'tgljual>="'+Tanggal(dtp1.Date)+'" AND '+
  'tgljual<="'+Tanggal(dtp2.Date)+'"',True);

  a := dm.Q1.FieldCount;
  c := 1;
  FLoading.Show;
  FLoading.pb1.Max :=dm.Q1.RecordCount;
  FLoading.Lprogres.Caption := 'MENYIAPKAN DATA PENJUALAN ';
  FLoading.pb1.Position := 0;
  while not dm.Q1.Eof do begin
    adv.Cells[0,c] := IntToStr(c);
    for b := 0 to a -1 do
      adv.Cells[b + 1, c] := dm.Q1.Fields[b].AsString;

    adv.RowCount := adv.RowCount + 1;
    dm.Q1.Next;
    Inc(c);
   //     Application.ProcessMessages;
    FLoading.pb1.Position := c ;

    FLoading.Lprogres.Caption := FloatToStr(Round((c / dm.Q1.RecordCount) * 100)) +' % ';
  end;
  FLoading.pb1.Position :=0;



  ExQry(dm.Q2,'SELECT * FROM v_returjual WHERE '+
  'tgl>="'+Tanggal(dtp1.Date)+'" AND '+
  'tgl<="'+Tanggal(dtp2.Date)+'"',True);
   FLoading.pb1.Max :=dm.Q2.RecordCount;
  FLoading.Lprogres.Caption := 'MENYIAPKAN DATA RETUR PENJUALAN ';
  FLoading.pb1.Position := 0;
        x := 1;
        while not dm.Q2.Eof do begin
          for e := a to a + dm.Q2.FieldCount -1 do
          adv.Cells[e+1,x] := dm.Q2.Fields[e-a].AsString ;
          Inc(x);
          dm.Q2.Next;
    //          Application.ProcessMessages;
          FLoading.pb1.Position := x ;
    FLoading.Lprogres.Caption := FloatToStr(Round((x / dm.Q2.RecordCount) * 100)) +' % ';
        end;

          FLoading.Close;

end;

procedure TFexportExcel.FormShow(Sender: TObject);
var
  i , x : Integer;
begin

  bersihGrid;
  ExQry(dm.Q1,'DESC v_penjualan',True);

  adv.RowCount := 2;
  adv.ColCount := dm.Q1.RecordCount + 1;
  i := 1;
  adv.Cells[0,0] := 'NO';
  while dm.Q1.Eof = False do begin
    adv.Cells[i,0] := UpperCase(dm.Q1.Fields[0].AsString);
    dm.Q1.Next;
    Inc(i);
  end;
  x := i;
  ExQry(dm.Q1,'DESC v_returjual',True);

  adv.ColCount := adv.ColCount + dm.Q1.RecordCount;

  while dm.Q1.Eof = False do begin
    adv.Cells[x,0] := UpperCase(dm.Q1.Fields[0].AsString);
    dm.Q1.Next;
    Inc(x);
  end;
end;

end.
