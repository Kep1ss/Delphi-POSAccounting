unit uLapPenjualanBarangPerSupplier;

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
  cxDropDownEdit, frxDBSet, frxExportBaseDialog, frxExportXLS, Data.DB, MemDS,
  DBAccess, MyAccess, dxSkinTheBezier;

type
  TFLapPenjualanBarangPerSupplier = class(TForm)
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
    ls: TCheckListBox;
    C9: TcxCheckBox;
    rbR1: TcxRadioButton;
    rbR2: TcxRadioButton;
    frxPreview3: TfrxPreview;
    CSupplier: TcxCheckBox;
    QLapPenjualanPerSupplier: TMyQuery;
    frxrprt1: TfrxReport;
    frxlsxprt1: TfrxXLSExport;
    frLapPenjualanSupplier: TfrxDBDataset;
    cSupplierPajak: TcxCheckBox;
    procedure btn13Click(Sender: TObject);
    procedure lsClickCheck(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rzbtbtn1Click(Sender: TObject);
    procedure rzbtbtn2Click(Sender: TObject);
    procedure CSupplierClick(Sender: TObject);
    procedure C9Click(Sender: TObject);
    procedure cSupplierPajakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLapPenjualanBarangPerSupplier: TFLapPenjualanBarangPerSupplier;
  str  : String;

implementation

{$R *.dfm}

uses uComCtrl, uDlaporan, udm;

procedure TFLapPenjualanBarangPerSupplier.btn13Click(Sender: TObject);
begin

  with QLapPenjualanPerSupplier do begin
    Close;
    SQL.Text :=' SELECT                                    '+
               '     d.kodebarang,                         '+
               '     b.namabarang,                         '+
               '     k.namakategori,                       '+
               '     b.satuanjual,                         '+
               '     SUM(d.isi) AS qty,                    '+
               '     SUM(d.subtotal / d.isi) AS harga,     '+
               '     SUM(d.subtotal) AS total,             '+
               '     s.namasupplier                        '+
               '   FROM                                    '+
               '     penjualandetil d                      '+
               '     LEFT JOIN penjualan p                 '+
               '       ON p.`fakturjual` = d.`fakturjual`  '+
               '     LEFT JOIN barang b                    '+
               '       ON b.`kodebarang` = d.`kodebarang`  '+
               '     LEFT JOIN kategori k                  '+
               '       ON k.`idkategori` = b.`idkategori`  '+
               '     LEFT JOIN m_supplier s                '+
               '       ON s.`idsupplier` = b.`idsupplier` '+
               '   WHERE p.idjual >=1 ';

    if str <> '' then
       SQL.Add(' AND s.namasupplier IN ('+str+') ');
    if C6.Checked then
       SQL.Add(' AND p.tgljual>= "'+Tanggal(dtp11.DateTime)+'" '+
       ' and p.tgljual<="'+Tanggal(dtp12.DateTime)+'" ');

    if rbR1.Checked then
       SQL.Add(' GROUP BY d.kodebarang ORDER BY s.namasupplier ASC ')
    else
       SQL.Add(' GROUP BY d.kodebarang ORDER BY s.namasupplier ASC ');
    Open;
  end;

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapPenjualanBarangSupplier.fr3');
  FMemo(Dlaporan.Fr1,'Lperiode').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dtp11.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dtp12.Date);

  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview3;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFLapPenjualanBarangPerSupplier.C9Click(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to ls.Items.Count -1 do begin
    ls.Checked[i] := C9.Checked;
    if ls.Checked[i] then begin
      x   := ls.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);
end;

procedure TFLapPenjualanBarangPerSupplier.CSupplierClick(Sender: TObject);
begin
  with dm.Q1 do begin
    CLose;
    SQL.Text :=' SELECT idsupplier,namasupplier from m_supplier order by namasupplier asc ';
    Open;
    ls.Items.Clear;

    while not Eof do begin
      ls.Items.Add(Fields[1].AsString);
      Next;
    end;
  end;
end;

procedure TFLapPenjualanBarangPerSupplier.cSupplierPajakClick(Sender: TObject);
begin


      with dm.Q1 do begin
    CLose;
    if cSupplierPajak.Checked then
    SQL.Text :=' SELECT idsupplier,namasupplier from m_supplier WHERE ispajak=true order by namasupplier asc ' else
    SQL.Text :=' SELECT idsupplier,namasupplier from m_supplier order by namasupplier asc';
    Open;
    ls.Items.Clear;

    while not Eof do begin
      ls.Items.Add(Fields[1].AsString);
      Next;
    end;

  end;
end;

procedure TFLapPenjualanBarangPerSupplier.FormShow(Sender: TObject);
begin
  dtp11.Date := now;
  dtp12.Date := now;

end;

procedure TFLapPenjualanBarangPerSupplier.lsClickCheck(Sender: TObject);

var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to ls.Items.Count -1 do begin
    if ls.Checked[i] then begin
      x   := ls.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);

end;

procedure TFLapPenjualanBarangPerSupplier.rzbtbtn1Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFLapPenjualanBarangPerSupplier.rzbtbtn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.Export(frxlsxprt1);
end;

end.
