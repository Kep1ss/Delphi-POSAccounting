unit UcatakLabel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, RzButton, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh,uEngine, sComboBox, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.Grids;

type
  TFcetakLabel = class(TForm)
    DBGridEh1: TDBGridEh;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    Ecari: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    StringGrid1: TStringGrid;
    procedure EcariKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure CreateGrid;
  end;
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
                   '   b.bkp,    '+
                   '   h.hargabeli as hargabeliratarata     '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN hargabelirata h ON '+
                   '   h.kodebarang=b.kodebarang  '+
                   '   LEFT JOIN m_supplier s ON '+
                   '   s.idsupplier=b.idsupplier';

var
  FcetakLabel: TFcetakLabel;

implementation

{$R *.dfm}

uses  udm, uDlaporan;

procedure TFcetakLabel.btn1Click(Sender: TObject);
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
    StringGrid1.Cells[3,StringGrid1.RowCount -1] := GetVal(dm.QBarang,'hargaecer');
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    dm.QBarang.Next;
 end;
end;

procedure TFcetakLabel.btn2Click(Sender: TObject);
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

procedure TFcetakLabel.btn3Click(Sender: TObject);
begin
  CreateGrid;
end;

procedure TFcetakLabel.CreateGrid;
var
  c,r : integer;
begin
  with StringGrid1 do begin
    for c := 0 to ColCOunt -1 do
    for r := 0 to RowCount -1 do
       Cells[c,r] := '';


    ColCount := 4;
    RowCount := 2;
    Cells[0,0] := 'No';
    Cells[1,0] := 'Kode Barcode';
    Cells[2,0] := 'Nama Barang';
    Cells[3,0] := 'Harga';

    ColWidths[0] := 50;
    ColWidths[1] := 120;
    ColWidths[2] := 200;
    ColWidths[3] := 100;

  end;
end;

procedure TFcetakLabel.EcariKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.Qbarang,_SQLbarang+' where b.namabarang like"%'+Ecari.Text+'%"',True);
end;

procedure TFcetakLabel.FormShow(Sender: TObject);
begin
  CreateGrid;
end;

procedure TFcetakLabel.RzBitBtn1Click(Sender: TObject);
var
  i : Integer;
  st : String;
begin


  st :='';
 for I := 1 to StringGrid1.RowCount - 1 do
    begin

      st := st +'"'+ StringGrid1.Cells[1,i]+'",';
    end;
    Delete(st,Length(st),1);

 if st <> '' then

 ExQry(dm.QBarang,_SQLbarang+' WHERE b.kodebarcode in ('+st+')',True);
 Dlaporan.Fr1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\CetakLabel.Fr3');
 Dlaporan.Fr1.ShowReport();

 CreateGrid;

end;

procedure TFcetakLabel.RzBitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
