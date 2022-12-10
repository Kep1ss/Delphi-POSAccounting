unit uLaporanBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMcSkin, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC,uComCtrl, uctrlFrm, uEngine, uOvEdit, cxContainer,
  cxEdit, Vcl.StdCtrls, Vcl.CheckLst, cxCheckBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGroupBox, frxClass, frxPreview, Vcl.Menus, cxButtons,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.ComCtrls, dxSkiniMaginary, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins,System.DateUtils, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
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
  TFlaporanBarang = class(TForm)
    pg1: TcxPageControl;
    tb1: TcxTabSheet;
    tb2: TcxTabSheet;
    tb3: TcxTabSheet;
    tb4: TcxTabSheet;
    tb5: TcxTabSheet;
    G1: TcxGroupBox;
    cbKategori: TcxComboBox;
    CKategori: TcxCheckBox;
    Frv1: TfrxPreview;
    btnPrivew: TcxButton;
    G2: TcxGroupBox;
    btnNextPage: TcxButton;
    btnPrevPage: TcxButton;
    btnPrint: TcxButton;
    btnExport: TcxButton;
    G4: TcxGroupBox;
    Frv2: TfrxPreview;
    ECariBarang: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxg1: TcxGrid;
    cxgGrid1DBTableView1namabarang: TcxGridDBColumn;
    G3: TcxGroupBox;
    btn1: TcxButton;
    btn2: TcxButton;
    btn3: TcxButton;
    btn4: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxGroupBox2: TcxGroupBox;
    Frv3: TfrxPreview;
    C2: TcxCheckBox;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    Label1: TLabel;
    C3: TcxCheckBox;
    cbKategori2: TcxComboBox;
    btn5: TcxButton;
    G5: TcxGroupBox;
    btn6: TcxButton;
    btn7: TcxButton;
    btn8: TcxButton;
    btn9: TcxButton;
    Frv4: TfrxPreview;
    G7: TcxGroupBox;
    E1: TcxTextEdit;
    cxg4: TcxGrid;
    cxg2: TcxGridDBTableView;
    cxgc1: TcxGridDBColumn;
    cxg3: TcxGridLevel;
    Label3: TLabel;
    dt3: TDateTimePicker;
    Label2: TLabel;
    dt4: TDateTimePicker;
    Label4: TLabel;
    cbGUdang: TcxComboBox;
    cxGroupBox3: TcxGroupBox;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxGroupBox4: TcxGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dtstok1: TDateTimePicker;
    dtstok2: TDateTimePicker;
    cbgudangstok: TcxComboBox;
    Frv5: TfrxPreview;
    btn10: TcxButton;
    cbkategori3: TcxComboBox;
    Label8: TLabel;
    Label9: TLabel;
    dt5: TDateTimePicker;
    Label10: TLabel;
    dt6: TDateTimePicker;
    procedure CKategoriClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
    procedure btnPrivewClick(Sender: TObject);
    procedure btnPrevPageClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure ECariBarangKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxg2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
  private
    { Private declarations }

  public
    str  : string;
    stk1 : string;
    stk2 : string;
    { Public declarations }
  end;
  const
   _LapBaran = ' SELECT                                   '+
               '   b.kodebarang,                          '+
               '   b.kodebarcode,                         '+
               '   b.namabarang,                          '+
               '   k.namakategori,                        '+
               '   s.namasupplier,                        '+
               '   SUM(                                   '+
               '     ks.saldoawal + ks.masuk - ks.keluar  '+
               '   ) AS saldoakhir,                       '+
               '   lk.namalokasi                          '+
               ' FROM                                     '+
               '   barang b                               '+
               '   LEFT JOIN kartustok ks                 '+
               '     ON ks.`kodebarang` = b.`kodebarang`  '+
               '   LEFT JOIN kategori k                   '+
               '     ON k.`idkategori` = b.`idkategori`   '+
               '   LEFT JOIN lokasi lk                    '+
               '     ON lk.`idlokasi` = ks.`idgudang`     '+
               '   LEFT JOIN m_supplier s                 '+
               '     ON b.`idsupplier` = s.`idsupplier`    ';

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
                   '   b.bkp,                '+
                   '   b.stok as STOK,       '+
                   '   h.hargabeli as hargarata                '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN multisatuan m '+
                   '    ON m.kodebarang=b.kodebarang '+
                   '   LEFT JOIN hargabelirata h ON h.kodebarang=b.kodebarang';

      _stokOpname = ' SELECT                                     '+
                   '       so.nobukti,                          '+
                   '       so.tanggal,                          '+
                   '       so.kodebarang,                       '+
                   '       b.kodebarcode,                       '+
                   '       b.namabarang,                        '+
                   '       so.stokkomp,                         '+
                   '       so.stoknyata,                        '+
                   '       so.selisih,                          '+
                   '       so.keterangan                        '+
                   '     FROM                                   '+
                   '       stokopname so                        '+
                   '       LEFT JOIN barang b                   '+
                   '         ON so.`kodebarang` = b.`kodebarang` '+
                   '     LEFT JOIN kategori k '+
                   '         on k.idkategori=b.idkategori       ';


var
  FlaporanBarang: TFlaporanBarang;

implementation

{$R *.dfm}

uses udm, uDlaporan, uDtrx;

procedure TFlaporanBarang.btn10Click(Sender: TObject);
begin
  with dtrx.Qdatastokopname do begin
    CLose;
    SQL.Text := _stokOpname+' WHERE idstok > 0';
    SQL.Add(' AND tanggal>="'+Tanggal(dtstok1.Date)+'" AND tanggal<="'+Tanggal(dtstok2.Date)+'"');
    if cbgudangstok.ItemIndex <> -1 then

    SQL.Add(' AND idgudang="'+GetIdcmb(cbgudangstok)+'" ');
    if cbkategori3.ItemIndex <> -1 then
    SQL.Add(' AND k.idkategori="'+GetIdcmb(cbkategori3)+'"');
    Open;
  end;

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapStokOpname.fr3');
  Dlaporan.Fr1.Preview := Frv5;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlaporanBarang.btn1Click(Sender: TObject);
begin
    Frv2.Next;
end;

procedure TFlaporanBarang.btn2Click(Sender: TObject);
begin
  Frv2.Print;
end;

procedure TFlaporanBarang.btn3Click(Sender: TObject);
begin
    Frv2.Prior;
end;

procedure TFlaporanBarang.btn4Click(Sender: TObject);
begin
  Frv2.Report.PrepareReport(True);
  Frv2.Report.Export(Dlaporan.frxls1);
end;

procedure TFlaporanBarang.btn5Click(Sender: TObject);
Const
  _ASQL = ' SELECT                                    '+
          '    b.kodebarcode,                         '+
          '    b.namabarang,                          '+
          '    k.namakategori,                        '+
          '    (SUM(dj.isi)) AS terjual               '+
          '  FROM                                     '+
          '    barang b                               '+
          '    LEFT JOIN penjualandetil dj            '+
          '      ON b.`kodebarang` = dj.`kodebarang`  '+
          '    LEFT JOIN penjualan p                  '+
          '      ON dj.`fakturjual` = p.`fakturjual`  '+
          '    LEFT JOIN kategori k                   '+
          '      ON k.`idkategori` = b.`idkategori`   ';
begin
   with Dlaporan.QFastMoving do begin
    Close;
    SQL.Text :=_ASQL+' WHERE b.idbarang >0 ';

    if C3.Checked then
    SQL.Add(' AND b.idkategori="'+GetIdcmb(cbKategori2)+'" ');
    if c2.Checked then
    SQL.Add(' AND p.tgljual>="'+Tanggal(dt1.Date)+'" AND p.tgljual<="'+Tanggal(dt2.date)+'"');

    SQL.Add(' GROUP BY b.kodebarang ORDER BY terjual DESC');
    Open;
   end;
   Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapFastMoving.fr3');
   Dlaporan.Fr1.Preview := Frv3;
   Dlaporan.Fr1.ShowReport();
end;

procedure TFlaporanBarang.btnExportClick(Sender: TObject);
begin
  Frv1.Report.PrepareReport(True);
  Frv1.Report.Export(Dlaporan.frxls1);
end;

procedure TFlaporanBarang.btnNextPageClick(Sender: TObject);
begin
  Frv1.Next;
end;

procedure TFlaporanBarang.btnPrevPageClick(Sender: TObject);
begin
  Frv1.Print;
end;

procedure TFlaporanBarang.btnPrintClick(Sender: TObject);
begin
  Frv1.Prior;
end;

procedure TFlaporanBarang.btnPrivewClick(Sender: TObject);
var
  tgl1,tgl2 : TDateTime;

begin
  tgl1 := dt5.Date;
  tgl2 := dt6.Date;

  with Dlaporan.QLapBarang do begin
    Close;


    if cbKategori.ItemIndex <> -1 then
    SQL.Text := 'Call sp_stokbarang("'+Tanggal(tgl1)+'","'+Tanggal(tgl2)+'",'+QuotedStr(' AND k.namakategori="'+cbKategori.Text+'" ')+'," ")' else
    SQL.Text := 'Call sp_stokbarang("'+Tanggal(tgl1)+'","'+Tanggal(tgl2)+'",""," ")';

    Open;
  end;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapBarang.fr3');
  Dlaporan.Fr1.Preview := Frv1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlaporanBarang.C3Click(Sender: TObject);
begin
    isiCmb(dm.Q1,'kategori',['idkategori','namakategori'],cbKategori2);
end;

procedure TFlaporanBarang.CKategoriClick(Sender: TObject);
begin
  isiCmb(dm.Q1,'kategori',['idkategori','namakategori'],cbKategori);
end;

procedure TFlaporanBarang.cxButton1Click(Sender: TObject);
begin
  Frv3.Next;
end;

procedure TFlaporanBarang.cxButton2Click(Sender: TObject);
begin
  Frv3.Print;
end;

procedure TFlaporanBarang.cxButton3Click(Sender: TObject);
begin
  Frv1.Prior;
end;

procedure TFlaporanBarang.cxButton4Click(Sender: TObject);
begin
  Frv3.Report.PrepareReport(True);
  Frv3.Report.Export(Dlaporan.frxls1);
end;

procedure TFlaporanBarang.cxButton6Click(Sender: TObject);
begin
  Frv5.Print;
end;

procedure TFlaporanBarang.cxButton8Click(Sender: TObject);
begin
  Frv5.Report.PrepareReport(true);
  frv5.Report.Export(Dlaporan.frxls1);
end;

procedure TFlaporanBarang.cxg2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
  Const
    SkartuStok = ' SELECT                                           '+
                 ' k.tgl AS TANGGAL,                                '+
                 ' b.kodebarang AS "KODE BARANG",                      '+
                 ' b.namabarang AS "NAMA BARANG",                      '+
                 ' k.saldoawal AS "SALDO AWAL",                  '+
                 ' k.masuk AS "MASUK",                           '+
                 ' k.keluar AS "KELUAR",                         '+
                 ' k.saldoakhir AS "SALDO AKHIR",                                '+
                 ' lk.namalokasi AS "GUDANG ",                         '+
                 ' k.keterangan AS "KETERANGAN"                         '+
                 ' FROM                                             '+
                 ' kartustok k                                         '+
                 ' LEFT JOIN barang b                            '+
                 ' ON b.`kodebarang` = k.`kodebarang`               '+
                 ' LEFT JOIN lokasi lk ON                           '+
                 ' k.`idgudang`=lk.`idlokasi` ';
begin
  exqry(Dlaporan.QKartuStok,SkartuStok+
  ' WHERE tgl >="'+Tanggal(dt3.Date)+'" AND tgl<="'+Tanggal(dt4.Date)+'" '+
  ' AND idgudang="'+GetIdcmb(cbGUdang)+'" '+
  ' AND namabarang="'+GetVal(dm.Qbarang,'namabarang')+'" ',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frKartuStok.fr3');
//  FMemo(Dlaporan.Fr1,'LPeriode').Text := Tanggal(dt3.Date)+' s/d '+Tanggal(dt4.Date);
//  FMemo(Dlaporan.Fr1,'Lgudang').Text  := cbGUdang.Text;
  Dlaporan.Fr1.Preview := Frv4;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlaporanBarang.cxgGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  ExQry(Dlaporan.QLapHistoryHarga,'select b.kodebarang,b.kodebarcode,b.namabarang,'+
  ' h.tgl,h.hargabeli,h.hargaecer,h.hargagrosir,h.hargapartai from '+
  ' barang b left join historyhargabarang h on h.kodebarang=b.kodebarang '+
  ' WHERE b.namabarang="'+GetVal(dm.QBarang,'namabarang')+'"',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapHistoryHarga.fr3');
  Dlaporan.Fr1.Preview := Frv2;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlaporanBarang.ECariBarangKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.QBarang,_SQLCaribarang+' WHERE b.namabarang like"%'+ECariBarang.Text+'%"',TRue);
end;

procedure TFlaporanBarang.FormShow(Sender: TObject);
begin
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  dt3.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt4.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  dt5.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt6.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  dtstok1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dtstok2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGUdang);
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbgudangstok);
  isiCmb(dm.Q1,'kategori',['idkategori','namakategori'],cbkategori3);

end;

end.
