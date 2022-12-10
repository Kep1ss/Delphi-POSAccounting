unit uImportSupplier;

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
  dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFimportSupplier = class(TForm)
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
  FimportSupplier: TFimportSupplier;

implementation

{$R *.dfm}

procedure TFimportSupplier.btn1Click(Sender: TObject);
begin
  if OD1.Execute then
  begin
    Efile.Text := OD1.FileName;
    Ex1.XLSImport(OD1.FileName);
  end;
end;

procedure TFimportSupplier.btn2Click(Sender: TObject);
begin
  Ex1.XLSExport(ExtractFilePath(Application.ExeName)+'Format Import Supplier.xls');
end;

procedure TFimportSupplier.btn3Click(Sender: TObject);
var
  i : Integer;
  ls : TStringList;
  idSupplier : String;
begin
  if sg1.Cells[0,1] = '' then begin
     Error('Belum ada data');
     Exit;
  end else begin
     ls := TStringList.Create;

     try

         for i := 1 to sg1.RowCount -1 do begin
           if sg1.Cells[0,1] <> '' then begin
              addParam('kodesupplier',GetCode(dm.Q2,'m_supplier','kodesupplier','SP'),ls,'str');
              addParam('namasupplier',sg1.Cells[0,i],ls,'str');
              addParam('namapemilik',sg1.Cells[1,i],ls,'str');
              addParam('alamat',sg1.Cells[2,i],ls,'str');
              addParam('kota',sg1.Cells[3,i],ls,'str');
              addParam('notelpon',sg1.Cells[4,i],ls,'str');
              addParam('norek',sg1.Cells[5,i],ls,'str');
              addParam('namabank',sg1.Cells[6,i],ls,'str');

              ExQry(dm.Q2,'SELECT idsupplier FROM m_supplier WHERE kodesupplier="'+GetCode(dm.Q2,'m_supplier','kodesupplier','SP')+'"',True);

              if dm.Q2.IsEmpty then
                  exeDb(dm.Q1,'m_supplier',ls)
              else
                  updatedb(dm.Q1,'m_supplier',ls,'idsupplier',GetVal(dm.Q2,'idsupplier'));

              ExQry(dm.Q3,'SELECT idsupplier FROM m_supplier order BY idsupplier DESC limit 1',True);

              if CellF(sg1.Cells[7,i]) <> 0 then begin
                  addParam('nobukti',GetCode(dm.Q1,'pembelian','nobukti','PB'+setIdKom),ls,'str');
                  addParam('idsupplier',GetVal(dm.Q3,'idsupplier'),ls,'str');
                  addParam('tgl',frmTgl(Now),ls,'date');
                  addParam('pembayaran','KREDIT',ls,'str');
                  addParam('total',StrToDecimal(sg1.Cells[7,i]),ls,'str');
                  addParam('grandtotal',StrToDecimal(sg1.Cells[7,i]),ls,'str');

                  exeDb(dm.Q1,'pembelian',ls);

                  ExQry(dm.Q3,'SELECT nobukti FROM pembelian order BY idpembelian DESC limit 1',True);

                  addParam('nobukti',GetVal(dm.Q3,'nobukti'),ls,'str');
                  addParam('tglinput',frmTgl(Now),ls,'date');
                  addParam('tgltempo',frmTgl(Now+30),ls,'date');
                  addParam('hutang',StrToDecimal(sg1.Cells[7,i]),ls,'str');
                  addParam('dibayar','0',ls,'str');
                  addParam('kekurangan',StrToDecimal(sg1.Cells[7,i]),ls,'str');

                  exeDb(dm.Q1,'hutang',ls);
              end;


//              PostingJurnal(dm.Q1,'201.001',FormatDateTime('yymmddhhmmss',Now),
//              'IMPORT DATA',Now,CellF(sg1.Cells[7,i]),'K');
//
//              PostingJurnal(dm.Q1,'301.001',FormatDateTime('yymmddhhmmss',Now),
//              'IMPORT DATA',Now,CellF(sg1.Cells[7,i]),'D');
           end;
           sg1.Row := i;

         end;
         Informasi('Import Data Supplier selesai');
     finally
       ls.Free;
     end;

  end;
end;

procedure TFimportSupplier.btn4Click(Sender: TObject);
begin
  Close;
end;

procedure TFimportSupplier.BuatGrid;
begin
  with sg1 do begin
    RowCount := 2;
    ColCount := 8;

    Cells[0,0] := 'Nama Supplier';
    Cells[1,0] := 'Nama Pemilik';
    Cells[2,0] := 'Alamat';
    Cells[3,0] := 'Kota';
    Cells[4,0] := 'No Telepon';
    Cells[5,0] := 'No Rek';
    Cells[6,0] := 'Nama Bank';
    Cells[7,0] := 'Hutang';

    ColWidths[0] := 120;
    ColWidths[1] := 120;
    ColWidths[2] := 250;
    ColWidths[3] := 100;
    ColWidths[4] := 100;
    ColWidths[5] := 100;
    ColWidths[6] := 100;
    ColWidths[7] := 100;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;
  end;
end;

procedure TFimportSupplier.FormShow(Sender: TObject);
begin
  BuatGrid;
end;

end.
