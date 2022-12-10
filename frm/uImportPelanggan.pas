unit uImportPelanggan;

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
  TFimportDataPelanggan = class(TForm)
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
  FimportDataPelanggan: TFimportDataPelanggan;

implementation

{$R *.dfm}

procedure TFimportDataPelanggan.btn1Click(Sender: TObject);
begin
  if OD1.Execute then
  begin
    Efile.Text := OD1.FileName;
    Ex1.XLSImport(OD1.FileName);
  end;
end;

procedure TFimportDataPelanggan.btn2Click(Sender: TObject);
begin
  Ex1.XLSExport(ExtractFilePath(Application.ExeName)+'Format Import Pelanggan.xls');
end;

procedure TFimportDataPelanggan.btn3Click(Sender: TObject);
var
  i : Integer;
  idkategori : String;
  ls : TStringList;
  idgudang : String;
  idSupplier : String;
  idjenispelanggan : String;
begin
  if sg1.Cells[0,1] = '' then begin
     Error('Belum ada data');
     Exit;
  end else begin
     ls := TStringList.Create;

     try

         for i := 1 to sg1.RowCount -1 do begin
           if sg1.Cells[0,1] <> '' then begin
              if sg1.Cells[5,i] = '1' then
                 idjenispelanggan := '4'
              else if sg1.Cells[5,i] = '2' then
                 idjenispelanggan := '5'
              else
                idjenispelanggan := '6';
              if sg1.Cells[0,i] = '' then
              addParam('kodepelanggan',GetCode(dm.Q2,'pelanggan','kodepelanggan',''),ls,'str')
           else
              addParam('kodepelanggan',sg1.Cells[0,i],ls,'str');
              addParam('namapelanggan',sg1.Cells[1,i],ls,'str');
              addParam('alamat',sg1.Cells[2,i],ls,'str');
              addParam('kota',sg1.Cells[3,i],ls,'str');
              addParam('notelpon',sg1.Cells[4,i],ls,'str');
              addParam('idjenispelanggan',idjenispelanggan,ls,'str');
              addParam('top',StrToDecimal(sg1.Cells[6,i]),ls,'str');
              addParam('maxpiutang',StrToDecimal(sg1.Cells[7,i]),ls,'str');

              if sg1.Cells[0,i] = '' then
              ExQry(dm.Q2,'SELECT idpelanggan FROM pelanggan WHERE kodepelanggan="'+GetCode(dm.Q2,'pelanggan','kodepelanggan','')+'"',True)
           else
              ExQry(dm.Q2,'SELECT idpelanggan FROM pelanggan WHERE kodepelanggan="'+sg1.Cells[0,i]+'"',True);

              if dm.Q2.IsEmpty then
                  exeDb(dm.Q1,'pelanggan',ls)
              else
                  updatedb(dm.Q1,'pelanggan',ls,'idpelanggan',GetVal(dm.Q2,'idpelanggan'));

              ExQry(dm.Q3,'SELECT idpelanggan FROM pelanggan order BY idpelanggan DESC limit 1',True);

              if CellF(sg1.Cells[8,i]) <> 0 then begin
                  addParam('fakturjual',GetCode(dm.Q1,'penjualan','fakturjual','PJ'+setIdKom),ls,'str');
                  addParam('idpelanggan',GetVal(dm.Q3,'idpelanggan'),ls,'str');
                  addParam('tgljual',frmTgl(Now),ls,'date');
                  addParam('pembayaran','1',ls,'str');
                  addParam('total',StrToDecimal(sg1.Cells[8,i]),ls,'str');
                  addParam('grandtotal',StrToDecimal(sg1.Cells[8,i]),ls,'str');

                  exeDb(dm.Q1,'penjualan',ls);

                  ExQry(dm.Q3,'SELECT fakturjual FROM penjualan order BY idjual DESC limit 1',True);

                  addParam('fakturjual',GetVal(dm.Q3,'fakturjual'),ls,'str');
                  addParam('tglinput',frmTgl(Now),ls,'date');
                  addParam('tgltempo',frmTgl(Now+30),ls,'date');
                  addParam('piutang',StrToDecimal(sg1.Cells[8,i]),ls,'str');
                  addParam('dibayar','0',ls,'str');
                  addParam('kekurangan',StrToDecimal(sg1.Cells[8,i]),ls,'str');

                  exeDb(dm.Q1,'piutang',ls);
              end;


              PostingJurnal(dm.Q1,'104.001',FormatDateTime('yymmddhhmmss',Now),
              'IMPORT DATA',Now,CellF(sg1.Cells[8,i]),CellF(sg1.Cells[8,i]),CellF(sg1.Cells[8,i]),'D');

              PostingJurnal(dm.Q1,'401.001',FormatDateTime('yymmddhhmmss',Now),
              'IMPORT DATA',Now,CellF(sg1.Cells[8,i]),CellF(sg1.Cells[8,i]),CellF(sg1.Cells[8,i]),'K');
           end;
           sg1.Row := i;

         end;
         Informasi('Import Data Pelanggan selesai');
     finally
       ls.Free;
     end;

  end;
end;

procedure TFimportDataPelanggan.btn4Click(Sender: TObject);
begin
  Close;
end;

procedure TFimportDataPelanggan.BuatGrid;
begin
  with sg1 do begin
    RowCount := 2;
    ColCount := 9;

    Cells[0,0] := 'Kode Pelanggan';
    Cells[1,0] := 'Nama Pelanggan';
    Cells[2,0] := 'Alamat';
    Cells[3,0] := 'kota';
    Cells[4,0] := 'No Telepon';
    Cells[5,0] := 'Jenis Pelanggan';
    Cells[6,0] := 'Top';
    Cells[7,0] := 'Max Piutang';
    Cells[8,0] := 'Piutang';

    ColWidths[0] := 120;
    ColWidths[1] := 120;
    ColWidths[2] := 250;
    ColWidths[3] := 100;
    ColWidths[4] := 100;
    ColWidths[5] := 100;
    ColWidths[6] := 100;
    ColWidths[7] := 100;
    ColWidths[8] := 100;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;
  end;
end;

procedure TFimportDataPelanggan.FormShow(Sender: TObject);
begin
  BuatGrid;
end;

end.
