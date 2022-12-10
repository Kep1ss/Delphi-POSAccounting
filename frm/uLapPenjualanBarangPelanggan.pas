unit uLapPenjualanBarangPelanggan;

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
  cxGroupBox, RzButton, Vcl.ExtCtrls, sPanel, uctrlFrm, uEngine,
  frxExportBaseDialog, frxExportXLS;

type
  TFLapPenjualanBarangPelanggan = class(TForm)
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
    ECariBarangPelanggan: TcxTextEdit;
    LsCbBarangPelanggan: TCheckListBox;
    C9: TcxCheckBox;
    rbR1: TcxRadioButton;
    rbR2: TcxRadioButton;
    frxPreview3: TfrxPreview;
    frxlsxprt1: TfrxXLSExport;
    procedure btn13Click(Sender: TObject);
    procedure LsCbBarangPelangganClickCheck(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ECariBarangPelangganKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rzbtbtn1Click(Sender: TObject);
    procedure rzbtbtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLapPenjualanBarangPelanggan: TFLapPenjualanBarangPelanggan;
  str  : String;

implementation

{$R *.dfm}

uses uComCtrl, uDlaporan, udm;

procedure TFLapPenjualanBarangPelanggan.btn13Click(Sender: TObject);
begin

  with Dlaporan.Qlapbarangpelanggan do begin
    Close;
    SQL.Text :=' SELECT                                   '+
               '       p.fakturjual,                      '+
               '       p.tgljual,                         '+
               '       p.idpelanggan,                     '+
               '       pl.namapelanggan,                  '+
               '       dj.kodebarang,                     '+
               '       b.namabarang,                      '+
               '       dj.satuan,                         '+
               '       SUM(dj.jumlah) AS jumlah,          '+
               '       dj.harga,                          '+
               '       SUM(dj.subtotal) AS subtotal       '+
               '     FROM                                 '+
               '       penjualan p                        '+
               '       LEFT JOIN penjualandetil dj        '+
               '         ON dj.`fakturjual` = p.`fakturjual`  '+
               '       LEFT JOIN pelanggan pl                 '+
               '         ON p.`idpelanggan` = pl.`idpelanggan`'+
               '       LEFT JOIN barang b                     '+
               '         ON b.`kodebarang` = dj.`kodebarang` '+
               '   WHERE p.idjual >=1 ';
    if C6.Checked then
       SQL.Add(' AND p.tgljual>= "'+Tanggal(dtp11.DateTime)+'" '+
       ' and p.tgljual<="'+Tanggal(dtp12.DateTime)+'" ');
    if (str <> '') then
       SQL.Add(' AND b.namabarang in ('+str+') ');

    if rbR1.Checked then
       SQL.Add(' GROUP BY dj.kodebarang ORDER BY SUM(dj.jumlah) DESC  ')
    else
       SQL.Add(' GROUP BY dj.kodebarang ORDER BY SUM(dj.subtotal) DESC  ');
    Open;
  end;

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapBarangPelanggan.fr3');
  FMemo(Dlaporan.Fr1,'Ljudul').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dtp11.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dtp12.Date);

  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview3;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFLapPenjualanBarangPelanggan.ECariBarangPelangganKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.Q1,' SELECT kodebarcode,namabarang from barang ',True);
  lsCbBarangPelanggan.Items.Clear;

  while not dm.Q1.Eof do begin
    lsCbBarangPelanggan.Items.Add(dm.Q1.Fields[1].AsString);
    dm.Q1.Next;
  end;
end;

procedure TFLapPenjualanBarangPelanggan.FormShow(Sender: TObject);
begin
  dtp11.Date := now;
  dtp12.Date := now;
end;

procedure TFLapPenjualanBarangPelanggan.LsCbBarangPelangganClickCheck(Sender: TObject);

  var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to lsCbBarangPelanggan.Items.Count -1 do begin
    if lsCbBarangPelanggan.Checked[i] then begin
      x   := lsCbBarangPelanggan.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);

end;

procedure TFLapPenjualanBarangPelanggan.rzbtbtn1Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFLapPenjualanBarangPelanggan.rzbtbtn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.Export(frxlsxprt1);
end;

end.
