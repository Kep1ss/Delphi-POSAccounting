unit uPrintBrosurBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2007Blue,
  dxSkinOffice2010Blue, dxSkinTheAsphaltWorld, Vcl.Menus, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, dxRibbonSkins, dxSkinsdxRibbonPainter, cxClasses,
  dxRibbon, dxBar, dxRibbonMiniToolbar, frxClass, frxExportXLS, frxPreview,
  cxPC, Vcl.StdCtrls, cxButtons, cxCheckListBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxGroupBox, RzButton, Vcl.ExtCtrls, sPanel,
  Vcl.CheckLst, dxSkinMcSkin, uctrlFrm, dxSkiniMaginary, dxSkinMoneyTwins,
  dxSkinOffice2016Colorful, uEngine, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, frxExportBaseDialog, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, uOvEdit;

type
  TFDesignBrosurBarang = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btn1: TcxButton;
    frxPreview1: TfrxPreview;
    frxXLSExport1: TfrxXLSExport;
    Pn1: TsPanel;
    btn: TRzBitBtn;
    Label1: TLabel;
    ECariBarang: TEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1namabarang: TcxGridDBColumn;
    cxGrid1DBTableView1hargaecer: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxg1: TcxGrid;
    GhargaPromo: TcxGridTableView;
    GhargaPromoColumn1: TcxGridColumn;
    GhargaPromoColumn2: TcxGridColumn;
    GhargaPromoColumn3: TcxGridColumn;
    cxgL: TcxGridLevel;
    RzBitBtn1: TRzBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    EHargaNormal: TcxTextEdit;
    EHargapromo: TcxTextEdit;
    procedure btnClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ECariBarangKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDesignBrosurBarang: TFDesignBrosurBarang;
  stk1,stk2 : string;
  str : string;

implementation

{$R *.dfm}

uses UDlaporan, udm, uComCtrl;

procedure TFDesignBrosurBarang.btn1Click(Sender: TObject);
const
  _SQLbarang = ' SELECT                 '+
                   '   b.idbarang,          '+
                   '   b.kodebarang,        '+
                   '   b.kodebarcode,       '+
                   '   b.namabarang,        '+
                   '   b.namabarcode,       '+
                   '   b.hargasebelum,      '+
                   '   k.idkategori,        '+
                   '   k.namakategori,      '+
                   '   b.satuanbeli,        '+
                   '   b.idsupplier,        '+
                   '   s.namasupplier,        '+
                   '   b.minimalorder,      '+
                   '   b.satuanjual,        '+
                   '   b.isi,               '+
                   '   b.stokmin,           '+
                   '   b.stokmax,           '+
                   '   b.hargabeli,         '+
                   '   b.margin,            '+
                   '  (b.hargabeli + (b.hargabeli * b.ppn / 100)) as HargaPPN, ' +
                   '   b.hargaecer,         '+
                   '   b.hargagrosir,       '+
                   '   b.hargapartai,       '+
                   '   b.hargapartai4,       '+
                   '   b.hargapartai5,       '+
                   '   b.diskonpersen,      '+
                   '   b.diskonrupiah,      '+
                   '   b.diskonrupiah,      '+
                   '   b.margingrosir,      '+
                   '   b.hargagrosir,       '+
                   '   b.marginpartai,      '+
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
                   '   b.stok,                '+
                   '   b.warningiflimit,    '+
                   '   h.hargabeli as hargabeliratarata     '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN hargabelirata h ON '+
                   '   h.kodebarang=b.kodebarang  '+
                   '   LEFT JOIN m_supplier s ON '+
                   '   s.idsupplier=b.idsupplier';
begin
  EHargapromo.Text        := StringReplace(EHargapromo.Text,',00','',[rfReplaceAll]);
  ExQry(dm.QBarang,_SQLbarang +' WHERE b.kodebarang="'+GetVal(dm.QBarang,'kodebarang')+'"',True);
  Dlaporan.fr1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\frPromo.fr3');
  FMemo(Dlaporan.fr1,'Lhargasebelum').Text := EhargaNormal.Text;
  FMemo(Dlaporan.fr1,'Lhargapromo').Text   := Ehargapromo.Text;
  Dlaporan.Fr1.Preview := frxPreview1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFDesignBrosurBarang.btn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(TRue);
  Dlaporan.Fr1.Export(frxXLSExport1);
end;

procedure TFDesignBrosurBarang.btnClick(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(TRue);
  frxPreview1.Print;
end;

procedure TFDesignBrosurBarang.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  EhargaNormal.Text := GetValR(dm.Qbarang,'hargaecer');
  if GetValF(dm.QBarang,'hargapromo') > 0 then
  Ehargapromo.Text := GetValR(dm.Qbarang,'hargapromo');
  with GhargaPromo.DataController do begin
        RecordCount := 0;
        RecordCount := 3;
        if GetValF(dm.QBarang,'hargapromo') > 0 then begin

          Values[0,0] := GetValR(dm.Qbarang,'hargapromo');
          Values[0,1] := GetVal(dm.Qbarang,'tglawal');
          Values[0,2] := GetVal(dm.Qbarang,'tglakhir');
        end;
        if GetValF(dm.QBarang,'hargapromo2') > 0 then begin
          Values[1,0] := GetValR(dm.Qbarang,'hargapromo2');
          Values[1,1] := GetVal(dm.Qbarang,'tglawal2');
          Values[1,2] := GetVal(dm.Qbarang,'tglakhir2');
        end;
        if GetValF(dm.QBarang,'hargapromo3') > 0 then begin
          Values[2,0] := GetValR(dm.Qbarang,'hargapromo3');
          Values[2,1] := GetVal(dm.Qbarang,'tglawal3');
          Values[2,2] := GetVal(dm.Qbarang,'tglakhir3');
        end;
     end;
end;

procedure TFDesignBrosurBarang.ECariBarangKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  const
  _SQLbarang = ' SELECT                 '+
                   '   b.idbarang,          '+
                   '   b.kodebarang,        '+
                   '   b.kodebarcode,       '+
                   '   b.namabarang,        '+
                   '   b.namabarcode,       '+
                   '   b.hargasebelum,      '+
                   '   k.idkategori,        '+
                   '   k.namakategori,      '+
                   '   b.satuanbeli,        '+
                   '   b.idsupplier,        '+
                   '   s.namasupplier,        '+
                   '   b.minimalorder,      '+
                   '   b.satuanjual,        '+
                   '   b.isi,               '+
                   '   b.stokmin,           '+
                   '   b.stokmax,           '+
                   '   b.hargabeli,         '+
                   '   b.margin,            '+
                   '  (b.hargabeli + (b.hargabeli * b.ppn / 100)) as HargaPPN, ' +
                   '   b.hargaecer,         '+
                   '   b.hargagrosir,       '+
                   '   b.hargapartai,       '+
                   '   b.hargapartai4,       '+
                   '   b.hargapartai5,       '+
                   '   b.diskonpersen,      '+
                   '   b.diskonrupiah,      '+
                   '   b.diskonrupiah,      '+
                   '   b.margingrosir,      '+
                   '   b.hargagrosir,       '+
                   '   b.marginpartai,      '+
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
                   '   b.stok,                '+
                   '   b.warningiflimit,    '+
                   '   h.hargabeli as hargabeliratarata     '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN hargabelirata h ON '+
                   '   h.kodebarang=b.kodebarang  '+
                   '   LEFT JOIN m_supplier s ON '+
                   '   s.idsupplier=b.idsupplier';

begin
  ExQry(dm.QBarang,_SQLbarang+' WHERE b.namabarang LIKE "%'+ECariBarang.Text+'%"',True);
end;

procedure TFDesignBrosurBarang.FormCreate(Sender: TObject);
begin
  EHargaNormal.isRupiah := True;
  EHargapromo.isRupiah  := True;
end;

procedure TFDesignBrosurBarang.RzBitBtn1Click(Sender: TObject);
begin
  Dlaporan.fr1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\frPromo.fr3');
  DLaporan.fr1.DesignReport();
end;

end.
