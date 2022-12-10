unit uKartuStok;

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
  AdvObj, BaseGrid, AdvGrid, dxSkinFoggy, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinLilian, dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, AdvUtil;

type
  TFkartuStok = class(TForm)
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
    Label3: TLabel;
    cbGudang: TcxComboBox;
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
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
    procedure AutoSizeGrid(Grid: TAdvStringGrid);
  public
    Procedure LoadStok(tgl1:TDateTime;tgl2:TDateTime;isCari:String);

    { Public declarations }
  end;
  Const


    _SQLCaribarang =' SELECT                '+
                   '   b.idbarang,          '+
                   '   b.kodebarang,        '+
                   '   b.kodebarcode,       '+
                   '   b.namabarang,        '+
                   '   k.idkategori,        '+
                   '   k.namakategori,      '+
                   '   m.satuan,            '+
                   '   m.harga,            '+
                   '   b.satuanjual,        '+
                   '   b.satuanbeli,        '+
                   '   b.minimalorder,        '+
                   '   b.isi,               '+
                   '   b.stokmin,           '+
                   '   b.stokmax,           '+
                   '   b.hargabeli,         '+
                   '   b.margin,            '+
                   '   b.hargaecer,             '+
                   '   m.hargagrosir,       '+
                   '   m.hargapartai,       '+
                   '   m.hargapartai4,       '+
                   '   m.hargapartai5,       '+
                   '   b.diskonpersen,      '+
                   '   b.diskonrupiah,      '+
                   '   b.hargapromo,      '+
                   '   b.tglawal,      '+
                   '   b.tglakhir,      '+
                   '   b.hargapromo2,      '+
                   '   b.tglawal2,      '+
                   '   b.tglakhir2,      '+
                   '   b.hargapromo3,      '+
                   '   b.tglawal3,      '+
                   '   b.tglakhir3,      '+
                   '   b.ppn,                '+
                   '   b.stok as STOK,       '+
                   '   h.hargabeli as hargarata                '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN multisatuan m '+
                   '    ON m.kodebarang=b.kodebarang '+
                   '   LEFT JOIN hargabelirata h ON h.kodebarang=b.kodebarang';

var
  FkartuStok: TFkartuStok;

implementation

{$R *.dfm}

uses uDtrx, udm, uDLaporan;

procedure TFkartuStok.AutoSizeGrid(Grid: TAdvStringGrid);
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

procedure TFkartuStok.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFkartuStok.cbGudangPropertiesCloseUp(Sender: TObject);
begin
  dm.QBarang.RecNo := 1;
  LoadStok(Dt1.Date,dt2.Date,'AND ks.kodebarang='+QuotedStr(GetVal(dm.QBarang,'kodebarang'))+'');
end;

procedure TFkartuStok.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  LoadStok(Dt1.Date,dt2.Date,GetVal(dm.QBarang,'kodebarang'));
end;

procedure TFkartuStok.Dt1PropertiesChange(Sender: TObject);
begin
 // str := 'Call sp_stokbarang('+tg1+','+tg2+')';
//  LoadStok(Dt1.Date,dt2.Date);
end;

procedure TFkartuStok.Dt1PropertiesCloseUp(Sender: TObject);
begin
  dm.QBarang.RecNo := 1;
  LoadStok(Dt1.Date,dt2.Date,GetVal(dm.QBarang,'kodebarang'));
end;

procedure TFkartuStok.EpencarianEnter(Sender: TObject);
begin
  Epencarian.Text := '';
  Epencarian.Style.FOnt.Style := Epencarian.Style.FOnt.Style - [fsitalic];
end;

procedure TFkartuStok.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.namabarang like"%'+Epencarian.Text+'%" OR '+
    'b.kodebarang LIKE "%'+Epencarian.Text+'%" OR b.kodebarcode LIKE "%'+Epencarian.Text+'%" GROUP BY b.kodebarang',True);
  end;

end;

procedure TFkartuStok.FormCreate(Sender: TObject);

begin
  SetTanggal(Self);

end;

procedure TFkartuStok.FormShow(Sender: TObject);
begin
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  cbGudang.ItemIndex := 0;
  dm.QBarang.Active := True;
  dm.QBarang.RecNo  := 1;
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
end;

procedure TFkartuStok.LoadStok(tgl1, tgl2: TDateTime;isCari:string);
var
  i,R,x,j : integer;
  tg1,tg2,str : String;
  totalStok,TotalMasuk,TotalKeluar : Real;
begin
  tg1 := Tanggal(tgl1);
  tg2 := Tanggal(tgl2);


  exqry(dm.Q1,'Call sp_kartustok("'+Tanggal(tgl1)+'","'+Tanggal(tgl2)+'","'+isCari+'","'+GetIdcmb(cbGUdang)+'")',True);
  for i := 0 to sg1.ColCount -1 do
  for r := 0 to sg1.RowCount -1 do
      sg1.Cells[i,r] := '';
  sg1.RowCount := 1;

  sg1.ColCount := dm.Q1.Fields.Count + 1;
  for I := 0 to dm.Q1.Fields.Count -1 do begin
        sg1.Cells[i,0] := dm.Q1.Fields[i].FieldName;

  end;

      R := 1;

      sg1.RowCount := dm.Q1.RecordCount + 3;
      while dm.Q1.Eof = False do begin

          for x := 0 to dm.Q1.FieldCount -1 do begin
            sg1.Cells[x,r]   := dm.Q1.Fields[x].AsString;
            if r > 1 then
               sg1.Cells[3,r] := '';
          end;

        Inc(r);
        dm.Q1.Next;
      end;

  sg1.FixedRows :=  1;
  AutoSizeGrid(sg1);


end;

procedure TFkartuStok.mniF2Click(Sender: TObject);
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
  if cbGUdang.ItemIndex < 0 then Error('Silahkan pilih gudang') else
  begin

    exqry(Dlaporan.QKartuStok,
    'Call sp_kartustok("'+Tanggal(Dt1.Date)+'","'+Tanggal(Dt2.Date)+'","'+GetVal(dm.QBarang,'kodebarang')+'","'+GetIdcmb(cbGUdang)+'")',True);


    Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frKartuStok.fr3');
    Dlaporan.Fr1.ShowReport();
  end;
end;

procedure TFkartuStok.mniF3Click(Sender: TObject);
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

  if cbGUdang.ItemIndex < 0 then Error('Silahkan pilih gudang') else
  begin
    exqry(Dlaporan.QKartuStok,SkartuStok+
    ' WHERE tgl >="'+Tanggal(dt1.Date)+'" AND tgl<="'+Tanggal(dt2.Date)+'" '+
    ' AND idgudang="'+GetIdcmb(cbGUdang)+'" '+
    ' AND namabarang="'+GetVal(dm.Qbarang,'namabarang')+'" ORDER BY k.idkartustok asc',True);

    Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frKartuStok.fr3');
    Dlaporan.Fr1.PrepareReport();
    Dlaporan.Fr1.Export(Dlaporan.frxls1);

  end;
end;

end.
