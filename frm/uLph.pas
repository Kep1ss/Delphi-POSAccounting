unit uLph;

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
  TFLPH = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    dtp1: TDateTimePicker;
    Label2: TLabel;
    oi: TAdvGridExcelIO;
    cxButton3: TcxButton;
    adv: TAdvStringGrid;
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure bersihGrid;
    procedure LoadData;
  end;

var
  FLPH: TFLPH;

implementation

{$R *.dfm}

uses udm,uProgress;

procedure TFLPH.bersihGrid;
var
  x ,y : integer;
begin
  with adv do begin
      for x := 0 to ColCount -1 do
      for y := 0 to RowCount -1 do
        Cells[x,y] := '';

        ColCount := 11;
        RowCount := 4;

        Cells[0,0] := 'NO';
        Cells[1,0] := 'KETERANGAN';
        Cells[2,0] := 'PENJUALAN';
        Cells[2,1] := 'CASH';
        Cells[3,1] := 'KREDIT';
        Cells[4,1] := 'TOTAL';
        Cells[5,0] := 'PIUTANG';
        Cells[5,1] := 'DEBET';
        Cells[6,1] := 'KREDIT';
        Cells[7,1] := 'SALDO';
        Cells[8,0] := 'KAS PENJUALAN';
        Cells[8,1] := 'DEBET';
        Cells[9,1] := 'KREDIT';
        Cells[10,1] := 'SALDO';


        ColWidths[0] := 50;
        ColWidths[1] := 200;
        ColWidths[2] := 80;
        ColWidths[3] := 80;
        ColWidths[4] := 80;
        ColWidths[5] := 80;
        ColWidths[6] := 80;
        ColWidths[7] := 80;
        ColWidths[8] := 80;
        ColWidths[9] := 80;
        ColWidths[10] := 80;

        MergeCells(2,0,3,1);
        MergeCells(5,0,3,1);
        MergeCells(8,0,3,1);

        FixedRows := 2;
        ColumnSize.StretchColumn := 1;
        ColumnSize.Stretch       := True;
        FloatingFooter.Visible   := True;
  end;

end;

procedure TFLPH.cxButton1Click(Sender: TObject);
begin
  oi.XLSExport(ExtractFilePath(Application.ExeName)+'LPH.xls','Laporan Pendapatan Harian '+FormatDateTime('dd-mm-yy',dtp1.Date));
end;

procedure TFLPH.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFLPH.cxButton3Click(Sender: TObject);
begin

  LoadData;
end;

procedure TFLPH.FormCreate(Sender: TObject);
begin
  FLPH := Self;
end;

procedure TFLPH.FormShow(Sender: TObject);

begin
   dtp1.Date := now;
   bersihGrid;

end;

procedure TFLPH.LoadData;
var
  I,c : integer;
  saldoAwal : Real;
  saldoAakhir : Real;
begin

  ExQry(dm.Q1,'SELECT SUM(Case WHEN pembayaran=0 THEN grandtotal else 0 END) as totalcash, '+
              'SUM(Case WHEN pembayaran=1 THEN grandtotal else 0 END) totalkredit '+
              'FROM penjualan WHERE tgljual="'+Tanggal(dtp1.Date)+'"  ',True);

  if dm.Q1.IsEmpty = False then begin

      adv.Cells[0,2] := IntToStr(1);
      adv.Cells[1,2] := 'LPH TGL. '+FormatDateTime('dd mmmm yyyy',dtp1.Date);
      adv.Cells[2,2] := GetValR(dm.Q1,'totalcash');
      adv.Cells[3,2] := GetValR(dm.Q1,'totalkredit');
      adv.Cells[4,2] := Format('%.0n',[GetValF(dm.Q1,'totalkredit')+GetValF(dm.Q1,'totalcash')]);
      adv.Cells[5,2] := GetValR(dm.Q1,'totalkredit');
      adv.Cells[6,2] := '-';
      adv.Cells[7,2] := Format('%.0n',[GetValF(dm.Q1,'totalkredit')]);
      adv.Cells[8,2] := GetValR(dm.Q1,'totalcash');
      adv.Cells[9,2] := '-';
      adv.Cells[10,2] := Format('%.0n',[GetValF(dm.Q1,'totalcash')]);

      adv.RowCount := adv.RowCount + 1;
      saldoAwal    := GetValF(dm.Q1,'totalcash');

      ExQry(dm.Q1,'SELECT s.keterangan,s.kredit FROM saldoakun s '+
      ' WHERE s.tgl="'+Tanggal(dtp1.Date)+'" '+
      ' AND noakun="101.003" AND s.kredit<>0',True);
      i := 3;
      while not dm.Q1.Eof do begin
        adv.Cells[1,i] := GetVal(dm.Q1,'keterangan');
        adv.Cells[9,i] := GetValR(dm.Q1,'kredit');
        saldoAwal      := saldoAwal - GetValF(dm.Q1,'kredit');
        saldoAakhir    :=  saldoAwal;
        adv.Cells[10,i] := Format('%.0n',[saldoAakhir]);
        Inc(i);
        dm.Q1.Next;
        adv.RowCount := adv.RowCount + 1;
      end;
      for c := 0 to adv.ColCount -2 do  begin
         if (not (c in [0,1])) AND (adv.RowCount >= 2) then begin
           adv.FloatingFooter.Visible := True;
           adv.FloatingFooter.ColumnCalc[c] := acSUM;
           adv.FloatFormat                  := '%.0n';
         end else begin
           adv.FloatingFooter.Visible := False;
           adv.Cells[0,adv.RowCount - 1] := 'Total';
           adv.Cells[1,adv.RowCount - 1] := ':';
         end;
      end;
  end else
   bersihGrid;

end;

end.
