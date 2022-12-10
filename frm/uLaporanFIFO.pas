unit uLaporanFIFO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, uComCtrl,
  uEngine, uOvEdit, cxCalc, cxCurrencyEdit, dxSkinSharp, dxBevel, cxLabel,System.DateUtils,
  dxSkinGlassOceans, dxSkinLiquidSky, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkiniMaginary, dxSkinMoneyTwins, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinLilian, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFLaporanFIFO = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnPrint: TcxButton;
    btnTutup: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1kodebarang: TcxGridDBColumn;
    cxGrid1DBTableView1namabarang: TcxGridDBColumn;
    Epencarian: TcxTextEdit;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxLabel1: TcxLabel;
    dxBevel1: TdxBevel;
    pm2: TPopupMenu;
    mniF2: TMenuItem;
    mniF3: TMenuItem;
    sg1: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure Dt1PropertiesChange(Sender: TObject);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EpencarianEnter(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cbGudangPropertiesCloseUp(Sender: TObject);
    procedure mniF2Click(Sender: TObject);
    procedure mniF3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
    procedure AutoSizeGrid(Grid: TAdvStringGrid);
  public
    Procedure LoadStok(tgl1:TDateTime;tgl2:TDateTime;isCari:String);
    procedure CreateGrid;
    procedure SaldoAkhir(var HargaBeli, Stok : Real);

    { Public declarations }
  end;



    

var
  FLaporanFIFO: TFLaporanFIFO;

implementation

{$R *.dfm}

uses uDtrx, udm, uDLaporan;

procedure TFLaporanFIFO.AutoSizeGrid(Grid: TAdvStringGrid);
const
  ColWidthMin = 10;
var
  C, R, W, ColWidthMax: integer;
begin
  for C := 0 to Grid.ColCount - 1 do begin
    ColWidthMax := ColWidthMin;
    for R := 0 to (Grid.RowCount - 1) do begin
      W := Grid.Canvas.TextWidth(Grid.Cells[C, R]);
      if W > ColWidthMax then
        ColWidthMax := W;
    end;
    Grid.ColWidths[C] := ColWidthMax + 20;
  end;
end;

procedure TFLaporanFIFO.btn1Click(Sender: TObject);
var
  i    : Integer;

begin
  for i := 2 to sg1.RowCount -1 do begin


  end;

end;

procedure TFLaporanFIFO.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFLaporanFIFO.cbGudangPropertiesCloseUp(Sender: TObject);
begin
  dm.QBarang.RecNo := 1;
  LoadStok(Dt1.Date,dt2.Date,'AND ks.kodebarang='+QuotedStr(GetVal(dm.QBarang,'kodebarang'))+'');
end;

procedure TFLaporanFIFO.CreateGrid;
var
  i , c: integer;
begin
  with sg1 do begin
     for i := 0 to ColCount - 1 do
     for c := 0 to RowCount - 1 do
       Cells[i,c] := '';

     ColCount  := 9;
     FixedRows := 2;
     RowCount  := 3;

     Cells[0,0] := 'No';
     Cells[1,0] := 'Tgl';
     Cells[2,0] := 'Keterangan';
     Cells[3,0] := 'In / Masuk';
     Cells[3,1] := 'Unit';
     Cells[4,1] := 'Total';

     Cells[5,0] := 'Out / Keluar';
     Cells[5,1] := 'Unit';
     Cells[6,1] := 'Total';

     Cells[7,0] := 'Saldo';
     Cells[7,1] := 'Unit';
     Cells[8,1] := 'Total';

     MergeCells(3,0,2,1);
     MergeCells(5,0,2,1);
     MergeCells(7,0,2,1);

     ColWidths[0] := 40;
     ColWidths[1] := 80;
     ColWidths[2] := 150;
     ColWidths[3] := 80;
     ColWidths[4] := 80;
     ColWidths[5] := 80;
     ColWidths[6] := 80;
     ColWidths[7] := 80;
     ColWidths[8] := 80;

     ColumnSize.StretchColumn := 2;
     ColumnSize.Stretch := True;
  end;
end;

procedure TFLaporanFIFO.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  LoadStok(Dt1.Date,dt2.Date,GetVal(dm.QBarang,'kodebarang'));
end;

procedure TFLaporanFIFO.Dt1PropertiesChange(Sender: TObject);
begin
 // str := 'Call sp_stokbarang('+tg1+','+tg2+')';
//  LoadStok(Dt1.Date,dt2.Date);
end;

procedure TFLaporanFIFO.Dt1PropertiesCloseUp(Sender: TObject);
begin
  dm.QBarang.RecNo := 1;
  LoadStok(Dt1.Date,dt2.Date,GetVal(dm.QBarang,'kodebarang'));
end;

procedure TFLaporanFIFO.EpencarianEnter(Sender: TObject);
begin
  Epencarian.Text := '';
  Epencarian.Style.FOnt.Style := Epencarian.Style.FOnt.Style - [fsitalic];
end;

procedure TFLaporanFIFO.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
     dm.QBarang.FilterSQL := ' b.kodebarang="'+Epencarian.Text+'" OR b.namabarang LIKE "%'+Epencarian.Text+'%"';
     dm.QBarang.Filtered  := True;
  end;

end;

procedure TFLaporanFIFO.FormCreate(Sender: TObject);

begin
  SetTanggal(Self);

end;

procedure TFLaporanFIFO.FormShow(Sender: TObject);
begin

  CreateGrid;
  dm.QBarang.Active := True;
  dm.QBarang.RecNo  := 1;
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
end;

procedure TFLaporanFIFO.LoadStok(tgl1, tgl2: TDateTime;isCari:string);
var
  i,R,x,j : integer;
  tg1,tg2,str : String;
  totalStok,TotalMasuk,TotalKeluar : Real;
  SaldoAwal,HargaSaldoAwal,TotalSaldoAwal : Real;
  SaldoAkhir , TotalSaldoAkhir : Real;
  tglAwal : TDate;
begin

  CreateGrid;

  if DayOf(tgl1) =  1 then begin
     ExQry(dm.Q1,'SELECT hargabeli,SUM(saldoawal) '+
     ' as saldoawal FROM kartustok WHERE tgl="'+Tanggal(tgl1)+'" '+
     ' AND kodebarang="'+isCari+'" GROUP BY kodebarang',True);
     SaldoAwal      := GetValF(dm.Q1,'saldoawal');
     HargaSaldoAwal := GetValF(dm.Q1,'hargabeli');
     TotalSaldoAwal := SaldoAwal * HargaSaldoAwal;

  end else begin
     tglAwal := StartOfTheMonth(tgl1);
     ExQry(dm.Q1,'SELECT hargabeli,'+
     ' SUM(saldoawal + masuk - keluar) as saldoawal '+
     ' FROM kartustok WHERE tgl>="'+Tanggal(tglAwal)+'" AND tgl<="'+Tanggal(tgl1)+'" '+
     ' AND kodebarang="'+isCari+'" GROUP BY kodebarang',True);

     SaldoAwal      := GetValF(dm.Q1,'saldoawal');
     HargaSaldoAwal := GetValF(dm.Q1,'hargabeli');
     TotalSaldoAwal := SaldoAwal * HargaSaldoAwal;

  end;


  ExQry(dm.Q1,'SELECT                                                      '+
              '        k.tgl,                                              '+
              '        CASE                                                '+
              '          WHEN k.keterangan LIKE "PEMBELIAN%"               '+
              '          THEN "PEMBELIAN"                                  '+
              '          WHEN k.keterangan LIKE "RETUR PEMBELIAN%"         '+
              '          THEN "RETUR PEMBELIAN"                            '+
              '          WHEN k.keterangan LIKE "PENJUALAN%"               '+
              '          THEN "PENJUALAN"                                  '+
              '          WHEN k.keterangan LIKE "RETUR PENJUALAN%"         '+
              '          THEN "RETUR PENJUALAN"                            '+
              '        END AS varKeterangan,                               '+
              '        SUM(                                                '+
              '          CASE                                              '+
              '            WHEN (                                          '+
              '              k.keterangan LIKE "PEMBELIAN%"                '+
              '              OR k.keterangan LIKE "RETUR PENJUALAN%"       '+
              '            )                                               '+
              '            THEN k.masuk                                    '+
              '            ELSE 0                                          '+
              '          END                                               '+
              '        ) AS masuk,                                         '+
              '        SUM(                                                '+
              '          CASE                                              '+
              '            WHEN (                                          '+
              '              k.keterangan LIKE "PENJUALAN%"                '+
              '              OR k.keterangan LIKE "RETUR PEMBELIAN%"       '+
              '            )                                               '+
              '            THEN k.keluar                                   '+
              '            ELSE 0                                          '+
              '          END                                               '+
              '        ) AS keluar,                                        '+
              '        k.hargabeli,                                        '+
              '        SUM(                                                '+
              '          CASE                                              '+
              '            WHEN k.keterangan LIKE "PEMBELIAN%"             '+
              '            THEN k.masuk                                    '+
              '            ELSE 0                                          '+
              '          END                                               '+
              '        ) * k.hargabeli AS totalbeli                        '+
              '      FROM                                                  '+
              '        kartustok k                                         '+
              '      WHERE (                                               '+
              '          k.keterangan LIKE "PEMBELIAN%"                    '+
              '          OR k.keterangan LIKE "PENJUALAN%"                 '+
              '          OR k.keterangan LIKE "RETUR PENJUALAN%"           '+
              '          OR k.keterangan LIKE "RETUR PEMBELIAN%"           '+
              '        ) AND k.tgl>="'+Tanggal(tgl1)+'"                      '+
              '        AND k.tgl<="'+Tanggal(tgl2)+'" AND k.kodebarang="'+isCari+'"  '+
              '      GROUP BY k.kodebarang,                                      '+
              '        k.tgl,                                                    '+
              '        k.hargabeli   ORDER BY tgl asc',True);

  i := 3;
  SaldoAkhir      := SaldoAwal;
  TotalSaldoAkhir := TotalSaldoAwal;
  with sg1 do begin
    Cells[0,2] := '1';
    Cells[1,2] := FormatDateTime('dd/mm/yyyy',tgl1);
    Cells[2,2] := 'Saldo Awal';
    Cells[7,2] := Format('%.0n',[SaldoAwal]);
    Cells[8,2] := Format('%.2n',[TotalSaldoAwal]);
    while not dm.Q1.Eof do begin
      if (GetVal(dm.Q1,'varKeterangan') = 'PEMBELIAN') OR (GetVal(dm.Q1,'varKeterangan') ='RETUR PENJUALAN') then begin
         Cells[0,i] := IntToStr(i -1);
         Cells[1,i] := GetVal(dm.Q1,'tgl');
         Cells[2,i] := GetVal(dm.Q1,'varKeterangan');
         Cells[3,i] := GetVal(dm.Q1,'masuk');
         Cells[4,i] := Format('%.2n',[GetValF(dm.Q1,'hargabeli') * getValF(dm.Q1,'masuk')]);

      end;
      if (GetVal(dm.Q1,'varKeterangan') = 'PENJUALAN') OR (GetVal(dm.Q1,'varKeterangan') ='RETUR PEMBELIAN') then begin
         Cells[0,i] := IntToStr(i -1);
         Cells[1,i] := GetVal(dm.Q1,'tgl');
         Cells[2,i] := GetVal(dm.Q1,'varKeterangan');
         Cells[5,i] := GetVal(dm.Q1,'keluar');
         Cells[6,i] := Format('%.2n',[GetValF(dm.Q1,'hargabeli') * getValF(dm.Q1,'keluar')]);

      end;
      SaldoAkhir      := SaldoAkhir + (GetValF(dm.Q1,'masuk') - GetValF(dm.Q1,'keluar'));
      TotalMasuk      := GetValF(dm.Q1,'hargabeli') * getValF(dm.Q1,'masuk');
      TotalKeluar     := GetValF(dm.Q1,'hargabeli') * getValF(dm.Q1,'keluar');
      TotalSaldoAkhir := TotalSaldoAkhir + (TotalMasuk- TotalKeluar);
      Cells[7,i]      := Format('%.0n',[SaldoAkhir]);
      Cells[8,i]      := Format('%.2n',[TotalSaldoAkhir]);

      RowCount := RowCount + 1;
      Inc(i);
      dm.Q1.Next;
    end;

  end;


end;

procedure TFLaporanFIFO.mniF2Click(Sender: TObject);
Const
    SkartuStok = ' SELECT                                        '+
                 ' k.tgl AS TANGGAL,                             '+
                 ' b.kodebarang AS "KODE BARANG",                '+
                 ' b.namabarang AS "NAMA BARANG",                '+
                 ' k.saldoawal AS "SALDO AWAL",                  '+
                 ' k.masuk AS "MASUK",                           '+
                 ' k.keluar AS "KELUAR",                         '+
                 ' k.saldoakhir AS "SALDO AKHIR",                '+
                 ' lk.namalokasi AS "GUDANG ",                   '+
                 ' k.keterangan AS "KETERANGAN"                  '+
                 ' FROM                                          '+
                 ' kartustok k                                   '+
                 ' LEFT JOIN barang b                            '+
                 ' ON b.`kodebarang` = k.`kodebarang`            '+
                 ' LEFT JOIN lokasi lk ON                        '+
                 ' k.`idgudang`=lk.`idlokasi` ';

var
  aPathRpt : String;
begin
  aPathRpt := ExtractFilePath( ParamStr(0))+'rpt';
  
end;

procedure TFLaporanFIFO.mniF3Click(Sender: TObject);
Const
    SkartuStok = ' SELECT                                        '+
                 ' k.tgl AS TANGGAL,                             '+
                 ' b.kodebarang AS "KODE BARANG",                '+
                 ' b.namabarang AS "NAMA BARANG",                '+
                 ' k.saldoawal AS "SALDO AWAL",                  '+
                 ' k.masuk AS "MASUK",                           '+
                 ' k.keluar AS "KELUAR",                         '+
                 ' k.saldoakhir AS "SALDO AKHIR",                '+
                 ' lk.namalokasi AS "GUDANG ",                   '+
                 ' k.keterangan AS "KETERANGAN"                  '+
                 ' FROM                                          '+
                 ' kartustok k                                   '+
                 ' LEFT JOIN barang b                            '+
                 ' ON b.`kodebarang` = k.`kodebarang`            '+
                 ' LEFT JOIN lokasi lk ON                        '+
                 ' k.`idgudang`=lk.`idlokasi` ';
var
  aPathRpt : String;
begin
  aPathRpt := ExtractFilePath( ParamStr(0))+'rpt';


end;

procedure TFLaporanFIFO.SaldoAkhir(var HargaBeli, Stok: Real);
var
  i : Integer;
  CurrentSaldo : Real;
begin
  for i := 2 to sg1.RowCount -1 do begin
     if StrToFloatDef(sg1.Cells[9,i],0) > 0  then begin
        CurrentSaldo := StrToFloatDef(sg1.Cells[9,i],0);
     end;


  end;

end;

end.
