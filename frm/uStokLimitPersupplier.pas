unit uStokLimitPersupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.ComCtrls, dxCore, Math,
  cxDateUtils, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  cxButtons, cxDropDownEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox,
  uEngine, uComCtrl, uctrlFrm, uOvEdit, dxSkiniMaginary, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful,System.DateUtils, dxSkinMoneyTwins, cxLabel,
  tmsAdvGridExcel, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFStokLimtiPerSupplier = class(TForm)
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
    btnClose: TcxButton;
    btnPrint: TcxButton;
    G1: TcxGroupBox;
    cxLabel5: TcxLabel;
    sg2: TAdvStringGrid;
    Ex1: TAdvGridExcelIO;
    Label1: TLabel;
    ECariSupplier: TcxTextEdit;
    procedure btnTutupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure EsatuanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure sg2Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ECariSupplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    aList : TStringList;
    { Private declarations }
  public

    procedure CreateGrid;
    procedure loadSupplier(isCari:string);
    procedure GridSupplier;
   { Public declarations }
  end;




var
  FStokLimtiPerSupplier: TFStokLimtiPerSupplier;


implementation

{$R *.dfm}

uses udm, uMainMenu;



procedure TFStokLimtiPerSupplier.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFStokLimtiPerSupplier.btnPrintClick(Sender: TObject);
begin
  Ex1.XLSExport(ExtractFilePath(ParamStr(0))+'Stok Limit Supplier '+sg2.Cells[1,sg2.Row]+'.xls');
end;

procedure TFStokLimtiPerSupplier.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFStokLimtiPerSupplier.CheckBox1Click(Sender: TObject);
var
  isiBeli , hrg , ppn, Hargabeli: Real;

  idSupplier : string;
  i : integer;
begin
 
end;

procedure TFStokLimtiPerSupplier.CreateGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=0 to RowCount do
    Cells[c,r]:='';

    ColCount    := 7;
    RowCount    := 2 ;


    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'SATUAN';
    Cells[4,0]  := 'AVG PENJUALAN';
    Cells[5,0]  := 'SISA STOK';
    Cells[6,0]  := 'KEKURANGAN STOK';

    ColWidths[0]:= 30;
    ColWidths[1]:= 130;
    ColWidths[2]:= 200;
    ColWidths[3]:= 100;
    ColWidths[4]:= 100;
    ColWidths[5]:= 100;
    ColWidths[6]:= 100;

    Row          := RowCount -1;
    Col          := 1;
    FixedRightCols    := 0;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;
 end;

end;

procedure TFStokLimtiPerSupplier.ECariSupplierKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  loadSupplier(' WHERE namasupplier LIKE "%'+ECariSupplier.Text+'%"');
end;

procedure TFStokLimtiPerSupplier.EsatuanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY = VK_LEFT then
  begin
    sg1.Col := sg1.Col -1;
    sg1.SetFocus;
  end else
  if Key = VK_RIGHT then
  begin
    sg1.Col := sg1.Col +1;
    sg1.SetFocus;
  end else
  if (Key = VK_UP ) and (sg1.Row <> 1) then
  begin
    sg1.Col := sg1.Col;
    sg1.Row := sg1.Row -1;
    sg1.SetFocus;
  end
end;


procedure TFStokLimtiPerSupplier.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := True;
end;

procedure TFStokLimtiPerSupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFStokLimtiPerSupplier.FormCreate(Sender: TObject);
begin
  CreateGrid;
 
end;

procedure TFStokLimtiPerSupplier.FormShow(Sender: TObject);
begin

  aList := TStringLIst.Create;

  sg1.SetFocus;
  loadSupplier('');
  CreateGrid;


end;
procedure TFStokLimtiPerSupplier.GridSupplier;
begin
  with sg2 do begin
    ClearAll;

    ColCount := 3;
    RowCount := 2;

    Cells[0,0] := 'No';
    Cells[1,0] := 'Supplier';
    Cells[2,0] := 'id';

    ColWidths[0] := 50;
    ColWidths[1] := 250;
    ColWidths[2] := 0;

    ColumnSize.StretchColumn := 1;
    ColumnSize.Stretch       := True;

  end;
end;

procedure TFStokLimtiPerSupplier.loadSupplier(isCari:string);
begin
  GridSupplier;

  ExQry(dm.Q1,'SELECT idsupplier,namasupplier FROM m_supplier '+isCari+' ORDER BY idsupplier ASC',True);

  while not dm.Q1.Eof do begin
     sg2.Cells[0,sg2.RowCount -1] := IntToStr(dm.Q1.RecNo);
     sg2.Cells[1,sg2.RowCount -1] := GetVal(dm.Q1,'namasupplier');
     sg2.Cells[2,sg2.RowCount -1] := GetVal(dm.Q1,'idsupplier');
     sg2.RowCount := sg2.RowCount + 1;
     dm.Q1.Next;

  end;
end;

procedure TFStokLimtiPerSupplier.sg2Click(Sender: TObject);
var
  i , c: integer;
  idsupplier : String;
begin
  CreateGrid;
  idSupplier := sg2.Cells[2,sg2.Row];
       ExQry(dm.Q1,' SELECT                                              '+
                     '     b.kodebarang,                                   '+
                     '     b.kodebarcode,                                  '+
                     '     b.namabarang,                                   '+
                     '     b.ppn,                                   '+
                     '     b.hargabeli,                                   '+
                     '     b.satuanjual,                                   '+
                     '     b.stokmin,                                 '+
                     '     b.stok,                                     '+
                     '     fc_average_out(b.kodebarang) as avg_out '+
                     '   FROM                                              '+
                     '   barang b                              '+
                     '   WHERE b.`idsupplier` = "'+idSupplier+'"          '+
                     '   ORDER BY '+
                     '  b.namabarang ASC',True);
       if dm.Q1.IsEmpty = False then begin

           i := 1;
           sg1.RowCount := dm.Q1.RecordCount + 2;
          while not dm.Q1.Eof do begin
            sg1.Cells[0,i] := IntToStr(i);
            sg1.Cells[1,i] := GetVal(dm.Q1,'kodebarang');
            sg1.Cells[2,i] := GetVal(dm.Q1,'namabarang');
            sg1.Cells[3,i] := GetVal(dm.Q1,'satuanjual');
            sg1.Cells[4,i] := GetVal(dm.Q1,'stok');
            sg1.Cells[5,i] := GetVal(dm.Q1,'avg_out');
            sg1.Cells[6,i] := format('%.0n',[GetValF(dm.Q1,'avg_out') - GetValF(dm.Q1,'stok')]);
            inc(i);


            dm.Q1.Next;
          end;
       end;
end;



end.
