unit UcetakBarcode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, RzButton, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, sComboBox, sLabel, sCheckBox, uComCtrl, uctrlFrm,
  uEngine, uOvEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, dxSkiniMaginary, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinLiquidSky, dxSkinGlassOceans, dxSkinMoneyTwins,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinLilian,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Grids;

type
  TFcetakBarcode = class(TForm)
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    Ecari: TEdit;
    lbl1: TsLabel;
    cbKategori: TcxComboBox;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    StringGrid1: TStringGrid;
    DBGridEh1: TDBGridEh;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure EcariKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbKategoriChange(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbKategoriPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure CreateGrid;
  public
    { Public declarations }
  end;

var
  FcetakBarcode: TFcetakBarcode;

implementation

{$R *.dfm}

uses UDlaporan,udm, uDataBarang;

procedure TFcetakBarcode.btn1Click(Sender: TObject);
var
  i : Integer;
  st : String;
begin


  st :='';
 for I := 0 to DBGridEh1.SelectedRows.Count -1  do
    begin
      dm.QBarang.Bookmark := DBGridEh1.SelectedRows[i];
      st := st +'"'+ DBGridEh1.DataSource.DataSet.FieldByName('kodebarcode').AsString+'",';
    end;
    Delete(st,Length(st),1);

 if st <> '' then

 ExQry(dm.QBarang,_SQLbarang+' WHERE b.kodebarcode in ('+st+')',True);


 while not dm.QBarang.Eof do begin

    StringGrid1.Cells[0,StringGrid1.RowCount -1] := IntToStr(StringGrid1.RowCount-1);
    StringGrid1.Cells[1,StringGrid1.RowCount -1] := GetVal(dm.QBarang,'kodebarcode');
    StringGrid1.Cells[2,StringGrid1.RowCount -1] := GetVal(dm.QBarang,'namabarang');
    if GetVal(dm.QBarang,'namabarcode') = '' then
    StringGrid1.Cells[3,StringGrid1.RowCount -1] := GetVal(dm.QBarang,'namabarang') else
    StringGrid1.Cells[3,StringGrid1.RowCount -1] := GetVal(dm.QBarang,'namabarcode');
    StringGrid1.Cells[4,StringGrid1.RowCount -1] := GetValR(dm.QBarang,'hargaecer');
    StringGrid1.Cells[5,StringGrid1.RowCount -1] := GetVal(dm.QBarang,'stok');
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    dm.QBarang.Next;
 end;
end;

procedure TFcetakBarcode.btn2Click(Sender: TObject);
  var
  i:integer;
begin
  StringGrid1.Cells[0,StringGrid1.Row] := '';
  StringGrid1.Cells[1,StringGrid1.Row] := '';
  StringGrid1.Cells[2,StringGrid1.Row] := '';
  StringGrid1.Cells[3,StringGrid1.Row] := '';

  for i := StringGrid1.row to StringGrid1.RowCount -1 do
  begin
    StringGrid1.Cells[0,i]:= Inttostr(i);
    StringGrid1.Cells[1,i]:= StringGrid1.Cells[1,i+1];
    StringGrid1.Cells[2,i]:= StringGrid1.Cells[2,i+1];
    StringGrid1.Cells[3,i]:= StringGrid1.Cells[3,i+1];

  end;
  StringGrid1.RowCount := StringGrid1.RowCount -1;
end;


procedure TFcetakBarcode.btn3Click(Sender: TObject);
begin
  CreateGrid;
end;

procedure TFcetakBarcode.cbKategoriChange(Sender: TObject);
begin
  if cbKategori.ItemIndex > 0 then
  ExQry(dm.QBarang,_Sqlbarang+' where kategori="'+cbKategori.Text+'"',True)
  else
  ExQry(dm.QBarang,_Sqlbarang+' WHERE stok > 0 ',true);
end;

procedure TFcetakBarcode.cbKategoriPropertiesChange(Sender: TObject);
begin
   ExQry(dm.QBarang,_SQLbarang+' WHERE namakategori="'+cbKategori.Text+'" AND stok > 0',True);
end;

procedure TFcetakBarcode.CreateGrid;
var
  c,r : integer;
begin
  with StringGrid1 do begin
    for c := 0 to ColCOunt -1 do
    for r := 0 to RowCount -1 do
       Cells[c,r] := '';


    ColCount := 6;
    RowCount := 2;
    Cells[0,0] := 'No';
    Cells[1,0] := 'Kode Barcode';
    Cells[2,0] := 'Nama Barang';
    Cells[3,0] := 'Nama Barcode';
    Cells[4,0] := 'Harga';
    Cells[5,0] := 'Jml';

    ColWidths[0] := 50;
    ColWidths[1] := 120;
    ColWidths[2] := 200;
    ColWidths[3] := 100;
    ColWidths[4] := 100;
    ColWidths[5] := 100;

  end;
end;

procedure TFcetakBarcode.EcariKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then begin

  ExQry(dm.QBarang,_SQLbarang+' where '+
  '(namabarang like"%'+Ecari.Text+'%" or kodebarcode="'+Ecari.Text+'") '+
  ' AND stok > 0',True);
  end;
end;

procedure TFcetakBarcode.FormShow(Sender: TObject);
begin
  isiCmb(dm.Q1,'kategori',['idkategori','namakategori'],cbKategori);
  CreateGrid;
end;

procedure TFcetakBarcode.RzBitBtn1Click(Sender: TObject);
var
  i ,  j : integer;
begin

  ExQry(dm.Q1,'TRUNCATE TABLE print_barcode',False);
  for i := 1 to StringGrid1.RowCount -1 do begin
    if StrToIntDef(nilai(StringGrid1.Cells[5,i]),0) <> 0 then begin
       for j := 1 to StrToIntDef(StringGrid1.Cells[5,i],0) do begin

         ExQry(dm.Q2,'INSERT INTO print_barcode(kodebarcode,namabarcode,harga) '+
         ' VALUES ("'+StringGrid1.Cells[1,i]+'","'+StringGrid1.Cells[3,i]+'",'+
         ' "'+StrToDecimal(StringGrid1.Cells[4,i])+'")',False);
       end;
       ExQry(dm.Q1,'UPDATE BARANG SET namabarcode="'+StringGrid1.Cells[3,i]+'" '+
       ' WHERE kodebarcode="'+StringGrid1.Cells[1,i]+'"',False);

    end;
  end;
  ExQry(dm.QprinteBarcode,'SELECT * FROM print_barcode',True);
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\newPrintBarcode.fr3');
  Dlaporan.Fr1.ShowReport();

end;

procedure TFcetakBarcode.RzBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFcetakBarcode.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if StringGrid1.Col in [3,4] then begin
     StringGrid1.Options := StringGrid1.Options + [goEditing];
  end else
     StringGrid1.Options := StringGrid1.Options - [goEditing];

end;

end.
