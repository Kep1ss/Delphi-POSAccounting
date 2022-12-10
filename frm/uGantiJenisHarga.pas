unit uGantiJenisHarga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxGroupBox, uEngine, uComCtrl, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  TFGantiJenisHarga = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    cxGroupBox2: TcxGroupBox;
    Label2: TLabel;
    cb1: TcxComboBox;
    Label3: TLabel;
    cb2: TcxComboBox;
    AdvStringGrid1: TAdvStringGrid;
    AdvStringGrid2: TAdvStringGrid;
    cxGroupBox3: TcxGroupBox;
    btn1: TcxButton;
    btn2: TcxButton;
    btn3: TcxButton;
    btn4: TcxButton;
    cxGroupBox4: TcxGroupBox;
    btn5: TcxButton;
    btn6: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cb1PropertiesCloseUp(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
    procedure BuatGrid1;
    procedure buatGrid2;
  public
    { Public declarations }
  end;

var
  FGantiJenisHarga: TFGantiJenisHarga;

implementation

{$R *.dfm}

uses udm;

procedure TFGantiJenisHarga.btn1Click(Sender: TObject);
begin
   if cb2.Text ='' then begin

     Error('Silahkan pilih Harga Tujuan');
     Exit;
   end else
   begin
     with AdvStringGrid2 do begin
        Cells[0,RowCount -1] := AdvStringGrid1.Cells[0,AdvStringGrid1.Row];
        Cells[1,RowCount -1] := AdvStringGrid1.Cells[1,AdvStringGrid1.Row];
        Cells[2,RowCount -1] := AdvStringGrid1.Cells[2,AdvStringGrid1.Row];
        RowCount := RowCount + 1;
     end;
   end;
end;

procedure TFGantiJenisHarga.btn2Click(Sender: TObject);
var
  i : integer;
begin
  if cb2.Text ='' then begin

     Error('Silahkan pilih Harga Tujuan');
     Exit;
   end else
   begin
     with AdvStringGrid1 do begin
      AdvStringGrid2.RowCount := RowCount;
      for i := 1 to RowCount -1 do  begin

        AdvStringGrid2.Cells[0,i] := Cells[0,i];
        AdvStringGrid2.Cells[1,i] := Cells[1,i];
        AdvStringGrid2.Cells[2,i] := Cells[2,i];
      end;
     end;
   end;
end;

procedure TFGantiJenisHarga.btn3Click(Sender: TObject);
var
  i : Integer;
begin
  with AdvStringGrid2 do begin

    for i := 1 to RowCount -1 do begin
      Cells[0,i] := '';
      Cells[1,i] := '';
      Cells[2,i] := '';
    end;
  end;
end;

procedure TFGantiJenisHarga.btn4Click(Sender: TObject);
var
  i : Integer;
begin
  with AdvStringGrid2 do begin
    Cells[0,Row] := '';
    Cells[1,Row] := '';
    Cells[2,Row] := '';

    for i := Row to RowCount -1 do begin
      Cells[0,i] := Cells[0,i+1];
      Cells[1,i] := Cells[1,i+1];
      Cells[2,i] := Cells[2,i+1];
    end;
  end;
end;

procedure TFGantiJenisHarga.btn5Click(Sender: TObject);
var
  i : integer;
  idjenispelanggan : string;
begin
  if cb2.Text = 'HARGA 1' then
        idjenispelanggan := '4'
    else if cb2.Text = 'HARGA 2' then
        idjenispelanggan := '5'
    else
      idjenispelanggan := '6';
  for i := 1 to AdvStringGrid2.RowCount -1 do begin
    if AdvStringGrid2.Cells[1,i] <> '' then

    ExQry(dm.Q1,'UPDATE pelanggan SET idjenispelanggan="'+idjenispelanggan+'" '+
    ' WHERE idpelanggan="'+AdvStringGrid2.Cells[2,i]+'"',False);

  end;

  Warning('Proses berhasil');

  AdvStringGrid2.ClearAll;
  buatGrid2;
end;

procedure TFGantiJenisHarga.btn6Click(Sender: TObject);
begin
  Close;
end;

procedure TFGantiJenisHarga.BuatGrid1;
begin
  with AdvStringGrid1 do begin
    RowCount := 2;
    ColCount := 3;

    Cells[0,0] := 'KODE PELANGGAN';
    Cells[1,0] := 'NAMA PELANGGAN';
    Cells[2,0] := 'idpelanggan';

    ColWidths[0] := 100;
    ColWidths[1] := 250;
    ColWidths[2] := 0;
  end;
end;

procedure TFGantiJenisHarga.buatGrid2;
begin
  with AdvStringGrid2 do begin
    RowCount := 2;
    ColCount := 3;

    Cells[0,0] := 'KODE PELANGGAN';
    Cells[1,0] := 'NAMA NAMA PELANGGAN';
    Cells[2,0] := 'idpelanggan';

    ColWidths[0] := 100;
    ColWidths[1] := 250;
    ColWidths[2] := 0;
  end;
end;

procedure TFGantiJenisHarga.cb1PropertiesCloseUp(Sender: TObject);
var
  i : integer;
  idjenispelanggan : string;
begin
  with dm.Q1 do begin

    if cb1.Text = 'HARGA 1' then
        idjenispelanggan := '4'
    else if cb1.Text = 'HARGA 2' then
        idjenispelanggan := '5'
    else
      idjenispelanggan := '6';
    Close;
    SQL.Text := 'SELECT idpelanggan,kodepelanggan,namapelanggan,idsales '+
    ' FROM pelanggan WHERE idjenispelanggan="'+idjenispelanggan+'"';
    Open;

    AdvStringGrid1.RowCount := RecordCount + 1;
    i := 1;
    while not dm.Q1.Eof do begin

      with AdvStringGrid1 do begin
        Cells[0,i] := GetVal(dm.Q1,'kodepelanggan');
        Cells[1,i] := GetVal(dm.Q1,'namapelanggan');
        Cells[2,i] := GetVal(dm.Q1,'idpelanggan');
        dm.Q1.Next;
        Inc(i);
      end;
    end;
  end;
end;

procedure TFGantiJenisHarga.FormShow(Sender: TObject);
begin

  BuatGrid1;
  buatGrid2;
end;

end.
