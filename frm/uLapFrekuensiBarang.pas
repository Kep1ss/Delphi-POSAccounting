unit uLapFrekuensiBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, frxClass, frxPreview, Vcl.StdCtrls,
  cxRadioGroup, Vcl.CheckLst, cxTextEdit, Vcl.ComCtrls, cxButtons, cxCheckBox,
  cxGroupBox, RzButton, Vcl.ExtCtrls, sPanel, uctrlFrm, uEngine, cxMaskEdit,
  cxDropDownEdit, frxDBSet, Data.DB, MemDS, DBAccess, MyAccess,
  frxExportBaseDialog, frxExportXLS;

type
  TFLapFrekuensiBarang = class(TForm)
    spnl1: TsPanel;
    rzbtbtn1: TRzBitBtn;
    rzbtbtn2: TRzBitBtn;
    cxGroupBox8: TcxGroupBox;
    Label7: TLabel;
    C6: TcxCheckBox;
    btn12: TcxButton;
    dtp11: TDateTimePicker;
    dtp12: TDateTimePicker;
    btn13: TcxButton;
    frxPreview3: TfrxPreview;
    CKategori: TcxCheckBox;
    cbKategori: TcxComboBox;
    cSupplier: TcxCheckBox;
    cbSupplier: TcxComboBox;
    QLapFrekuensiBelanja: TMyQuery;
    frFrekuensiBarang: TfrxDBDataset;
    frxrprt1: TfrxReport;
    frxlsxprt1: TfrxXLSExport;
    procedure btn13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rzbtbtn1Click(Sender: TObject);
    procedure rzbtbtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLapFrekuensiBarang: TFLapFrekuensiBarang;
  str  : String;

implementation

{$R *.dfm}

uses uComCtrl, uDlaporan, udm;

procedure TFLapFrekuensiBarang.btn13Click(Sender: TObject);
begin

  with QLapFrekuensiBelanja do begin
    Close;
    SQL.Text :=' SELECT                                     '+
               '     p.tgljual,                             '+
               '     pl.namapelanggan,                      '+
               '    d.kodebarang,                          '+
               '     b.kodebarcode,                         '+
               '     b.namabarang,                          '+
               '     k.namakategori,                            '+
               '     COUNT(d.kodebarang) AS frekuensi      '+
               '   FROM                                     '+
               '     penjualan p                            '+
               '     LEFT JOIN penjualandetil d            '+
               '       ON p.`fakturjual` = d.`fakturjual`  '+
               '     LEFT JOIN barang b                     '+
               '       ON b.`kodebarang` = d.`kodebarang`  '+
               '     LEFT JOIN m_supplier s                   '+
               '       ON s.idsupplier = b.idsupplier       '+
               '     LEFT JOIN pelanggan pl                 '+
               '       ON p.idpelanggan = pl.idpelanggan    '+
               '     LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
               '   WHERE p.idjual >=1 ';
    if C6.Checked then
       SQL.Add(' AND p.tgljual>= "'+Tanggal(dtp11.DateTime)+'" '+
       ' and p.tgljual<="'+Tanggal(dtp12.DateTime)+'" ');
    if CKategori.Checked then
       SQL.Add(' AND b.idkategori="'+GetIdcmb(cbKategori)+'" ');
    if cSupplier.Checked then
       SQL.Add(' AND b.idsupplier="'+GetIdcmb(cbSupplier)+'" ');

       SQL.Add('     GROUP BY d.kodebarang,                                  '+
               '       p.idpelanggan                                         '+
               '     ORDER BY pl.namapelanggan  ');
    
    Open;
  end;

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\lapfrekuensi.fr3');
  FMemo(Dlaporan.Fr1,'Lperiode').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dtp11.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dtp12.Date);

  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview3;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFLapFrekuensiBarang.FormShow(Sender: TObject);
begin
  dtp11.Date := now;
  dtp12.Date := now;

  isiCmb(dm.Q1,'m_supplier',['idsupplier','namasupplier'],cbSupplier);
  isiCmb(dm.Q1,'kategori',['idkategori','namakategori'],cbKategori);
end;

procedure TFLapFrekuensiBarang.rzbtbtn1Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFLapFrekuensiBarang.rzbtbtn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.Export(frxlsxprt1);
end;

end.
