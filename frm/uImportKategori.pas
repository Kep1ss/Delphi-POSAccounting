unit uImportKategori;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, cxButtons, tmsAdvGridExcel, uComCtrl,
  uEngine, udm, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue;

type
  TFimportKategori = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    Efile: TEdit;
    btn1: TcxButton;
    btn2: TcxButton;
    grp2: TGroupBox;
    grp3: TGroupBox;
    btn3: TcxButton;
    btn4: TcxButton;
    sg1: TAdvStringGrid;
    OD1: TOpenDialog;
    Ex1: TAdvGridExcelIO;
    procedure btn4Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BuatGrid;
  end;

var
  FimportKategori: TFimportKategori;

implementation

{$R *.dfm}

procedure TFimportKategori.btn1Click(Sender: TObject);
begin
  if OD1.Execute then
  begin
    Efile.Text := OD1.FileName;
    Ex1.XLSImport(OD1.FileName);
  end;
end;

procedure TFimportKategori.btn2Click(Sender: TObject);
begin
  Ex1.XLSExport(ExtractFilePath(Application.ExeName)+'Format Import Kategori.xls');
end;

procedure TFimportKategori.btn3Click(Sender: TObject);
var
  i : Integer;
  ls : TStringList;
begin
  if sg1.Cells[0,1] = '' then begin
     Error('Belum ada data');
     Exit;
  end else begin
     ls := TStringList.Create;

     try

         for i := 1 to sg1.RowCount -1 do begin
           if sg1.Cells[0,1] <> '' then begin
              addParam('namakategori',sg1.Cells[0,i],ls,'str');
              exeDb(dm.Q1,'kategori',ls);
           end;
           sg1.Row := i;

         end;
         Informasi('Import data Kategori selesai');
     finally
       ls.Free;
     end;

  end;
end;

procedure TFimportKategori.btn4Click(Sender: TObject);
begin
  Close;
end;

procedure TFimportKategori.BuatGrid;
begin
  with sg1 do begin
    RowCount := 2;
    ColCount := 1;

    Cells[0,0] := 'Kategori';

    ColWidths[0] := 120;
    ColumnSize.StretchColumn := 0;
    ColumnSize.Stretch       := True;
  end;
end;

procedure TFimportKategori.FormShow(Sender: TObject);
begin
  BuatGrid;
end;

end.
