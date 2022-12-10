unit uSetingHargaPelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Light, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, cxGroupBox, Vcl.ImgList, uMainMenu, uEngine,
  dxSkinMcSkin, dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful,uComCtrl, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxCheckBox, tmsAdvGridExcel, cxTextEdit;

type
  TFSetingHargaPelanggan = class(TForm)
    il1: TImageList;
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    L1: TLabel;
    L2: TLabel;
    G2: TcxGroupBox;
    sg1: TAdvStringGrid;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    OD1: TOpenDialog;
    Ex1: TAdvGridExcelIO;
    Label5: TLabel;
    EPencarian: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure btnLoadFileClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    aList : TStringList;
    Procedure CreateGrid;
    procedure loadHargaPelanggan(Str: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSetingHargaPelanggan: TFSetingHargaPelanggan;
  idUser      : string;

implementation

{$R *.dfm}

uses udm;

function TitleText(s : string):String;
var
  awal  : String;
  akhir : String;
begin
  awal  := Copy(s,1,1);
  awal  := UpperCase(awal);
  akhir := Copy(s,2,Length(s));
  Result := awal + akhir;


end;

procedure TFSetingHargaPelanggan.btn2Click(Sender: TObject);
begin
  Ex1.XLSExport(ExtractFilePath(Application.ExeName)+'Format Import Seting Harga Pelanggan.xls');
end;

procedure TFSetingHargaPelanggan.btnLoadFileClick(Sender: TObject);
begin
    if OD1.Execute then
  begin
    Ex1.XLSImport(OD1.FileName);
  end;
end;

procedure TFSetingHargaPelanggan.btnSimpanClick(Sender: TObject);
var
  i           : integer;

begin
  aList := TStringList.Create;

  try

      for i := 1 to sg1.RowCount -1 do begin
          ExQry(dm.Q1,'DELETE FROM hargaperpelanggan WHERE kodebarang="'+L1.Caption+'" '+
            ' AND kodepelanggan="'+sg1.Cells[1,i]+'" AND satuan="'+sg1.Cells[3,i]+'" ',False);

          if (StrToFloatDef(nilai(sg1.Cells[5,i]),0) > 0)  then
          begin

            addParam('kodebarang',    l1.Caption, aList,'str');
            addParam('kodepelanggan', sg1.Cells[1,i], aList,'str');
            addParam('satuan',        sg1.Cells[3,i], aList,'str');
            addParam('isi',           StrToDecimal(sg1.Cells[4,i]), aList,'str');
            addParam('harga',         StrToDecimal(sg1.Cells[5,i]), aList,'str');
            exeDb(dm.Q1,'hargaperpelanggan',aList);
          end;

          ExQry(dm.Q1,'DELETE FROM hargaperpelanggan WHERE kodebarang="'+L1.Caption+'" '+
            ' AND kodepelanggan="'+sg1.Cells[1,i]+'" AND satuan="'+sg1.Cells[6,i]+'" ',False);


          if (StrToFloatDef(nilai(sg1.Cells[8,i]),0) > 0)  then
          begin
            addParam('kodebarang',    l1.Caption, aList,'str');
            addParam('kodepelanggan', sg1.Cells[1,i], aList,'str');
            addParam('satuan',        sg1.Cells[6,i], aList,'str');
            addParam('isi',           StrToDecimal(sg1.Cells[7,i]), aList,'str');
            addParam('harga',         StrToDecimal(sg1.Cells[8,i]), aList,'str');
            exeDb(dm.Q1,'hargaperpelanggan',aList);
          end;

          ExQry(dm.Q1,'DELETE FROM hargaperpelanggan WHERE kodebarang="'+L1.Caption+'" '+
            ' AND kodepelanggan="'+sg1.Cells[1,i]+'" AND satuan="'+sg1.Cells[9,i]+'" ',False);

          if (StrToFloatDef(nilai(sg1.Cells[11,i]),0) > 0)  then
          begin
            addParam('kodebarang',    l1.Caption, aList,'str');
            addParam('kodepelanggan', sg1.Cells[1,i], aList,'str');
            addParam('satuan',        sg1.Cells[9,i], aList,'str');
            addParam('isi',           StrToDecimal(sg1.Cells[10,i]), aList,'str');
            addParam('harga',         StrToDecimal(sg1.Cells[11,i]), aList,'str');
            exeDb(dm.Q1,'hargaperpelanggan',aList);
          end;

          ExQry(dm.Q1,'DELETE FROM hargaperpelanggan WHERE kodebarang="'+L1.Caption+'" '+
            ' AND kodepelanggan="'+sg1.Cells[1,i]+'" AND satuan="'+sg1.Cells[12,i]+'" ',False);

          if (StrToFloatDef(nilai(sg1.Cells[14,i]),0) > 0)  then
          begin
            addParam('kodebarang',    l1.Caption, aList,'str');
            addParam('kodepelanggan', sg1.Cells[1,i], aList,'str');
            addParam('satuan',        sg1.Cells[12,i], aList,'str');
            addParam('isi',           StrToDecimal(sg1.Cells[13,i]), aList,'str');
            addParam('harga',         StrToDecimal(sg1.Cells[14,i]), aList,'str');
            exeDb(dm.Q1,'hargaperpelanggan',aList);
          end;

          ExQry(dm.Q1,'DELETE FROM hargaperpelanggan WHERE kodebarang="'+L1.Caption+'" '+
            ' AND kodepelanggan="'+sg1.Cells[1,i]+'" AND satuan="'+sg1.Cells[15,i]+'" ',False);

          if (StrToFloatDef(nilai(sg1.Cells[17,i]),0) > 0)  then
          begin
            addParam('kodebarang',    l1.Caption, aList,'str');
            addParam('kodepelanggan', sg1.Cells[1,i], aList,'str');
            addParam('satuan',        sg1.Cells[15,i], aList,'str');
            addParam('isi',           StrToDecimal(sg1.Cells[16,i]), aList,'str');
            addParam('harga',         StrToDecimal(sg1.Cells[17,i]), aList,'str');
            exeDb(dm.Q1,'hargaperpelanggan',aList);
          end;
      end;
      Informasi('Seting berhasil disimpan');
  finally
    aList.Free;
  end;
end;

procedure TFSetingHargaPelanggan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFSetingHargaPelanggan.C2Click(Sender: TObject);
var
  i : integer;
begin

end;

procedure TFSetingHargaPelanggan.CreateGrid;
begin
  with sg1 do begin
    ColCount := 3;
    Cells[0,0] :='IdPelanggan';
    Cells[1,0] :='Nama Pelanggan';
    Cells[2,0] :='Nama Pelanggan';

    ColWidths[0] := 0;
    ColWidths[1] := 150;
    ColWidths[2] := 200;
    RowCOunt     := 2;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;
  end;
end;

procedure TFSetingHargaPelanggan.EPencarianKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then begin

    loadHargaPelanggan(EPencarian.Text);
  end;
end;

procedure TFSetingHargaPelanggan.FormCreate(Sender: TObject);

begin
  CreateGrid;
end;

procedure TFSetingHargaPelanggan.FormShow(Sender: TObject);
begin
   loadHargaPelanggan('');
end;

procedure TFSetingHargaPelanggan.loadHargaPelanggan(Str: string);
var
  i  , c , j : Integer;
begin
  i:=1;
  CreateGrid;
  ExQry(dm.Q1,'SELECT idpelanggan,kodepelanggan,namapelanggan FROM pelanggan WHERE namapelanggan LIKE "%'+str+'%"',True);
  sg1.RowCount := dm.Q1.RecordCount + 1;
  while not dm.Q1.Eof do begin
     sg1.Cells[0,i]  :=  GetVal(dm.Q1,'idpelanggan');
     sg1.Cells[1,i]  :=  GetVal(dm.Q1,'kodepelanggan');
     sg1.Cells[2,i]  :=  GetVal(dm.Q1,'namapelanggan');
     ExQry(dm.Q2,'SELECT satuan,isi,harga FROM hargaperpelanggan WHERE kodebarang="'+L1.Caption+'" '+
     ' AND kodepelanggan="'+GetVal(dm.Q1,'kodepelanggan')+'"',True);

     if dm.Q2.IsEmpty = False then begin
         j := 0;
         c := dm.Q2.FieldCount;
         sg1.ColCount := (c * dm.Q2.RecordCount) + 3;
         while dm.Q2.Eof = False  do begin


             sg1.Cells[(j * c) + 3,0]     := 'Satuan '+IntToStr(j+1);
             sg1.Cells[(j * c) + 4,0]     := 'Isi '+IntToStr(j+1);
             sg1.Cells[(j * c) + 5,0]     := 'Harga '+IntToStr(j+1);

             sg1.Cells[(j * c) + 3,i]     := GetVal(dm.Q2,'satuan');
             sg1.Cells[(j * c) + 4,i]     := GetVal(dm.Q2,'isi');
             sg1.Cells[(j * c) + 5,i]     := GetValR(dm.Q2,'harga');


             Inc(j);
             dm.Q2.Next;

         end;
         Inc(i);
         dm.Q1.Next;

     end else begin

         ExQry(dm.Q2,'SELECT satuan,isi,harga FROM multisatuan WHERE kodebarang="'+L1.Caption+'"',True);
         j := 0;
         c := dm.Q2.FieldCount;
         sg1.ColCount := (c * dm.Q2.RecordCount) + 3;
         while dm.Q2.Eof = False  do begin


             sg1.Cells[(j * c) + 3,0]     := 'Satuan '+IntToStr(j+1);
             sg1.Cells[(j * c) + 4,0]     := 'Isi '+IntToStr(j+1);
             sg1.Cells[(j * c) + 5,0]     := 'Harga '+IntToStr(j+1);

             sg1.Cells[(j * c) + 3,i]     := GetVal(dm.Q2,'satuan');
             sg1.Cells[(j * c) + 4,i]     := GetVal(dm.Q2,'isi');
             sg1.Cells[(j * c) + 5,i]     := GetValR(dm.Q2,'harga');


             Inc(j);
             dm.Q2.Next;

         end;
         Inc(i);
         dm.Q1.Next;
     end;

  end;

end;

procedure TFSetingHargaPelanggan.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if  Pos('Harga',sg1.Cells[ACol,0]) > 0 then begin
     IsFloat      := True;
     FloatFormat  := '%.2n';
  end else IsFloat := False;

end;

procedure TFSetingHargaPelanggan.sg1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if Pos('Harga',sg1.Cells[ACol,0]) > 0 then
     sg1.Options := sg1.Options + [goEditing] else
     sg1.Options := sg1.Options - [goEditing];

end;

end.
