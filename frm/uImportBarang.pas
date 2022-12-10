unit uImportBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, cxButtons, tmsAdvGridExcel, uComCtrl,
  uEngine, udm, dxSkinFoggy, dxSkinGlassOceans, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
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
  TFimportBarang = class(TForm)
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
    Label2: TLabel;
    btnKosongbarang: TcxButton;
    procedure btn4Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btnKosongbarangClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BuatGrid;
  end;

var
  FimportBarang: TFimportBarang;

implementation

{$R *.dfm}

procedure TFimportBarang.btn1Click(Sender: TObject);
begin
  if OD1.Execute then
  begin
    Efile.Text := OD1.FileName;
    Ex1.XLSImport(OD1.FileName);
  end;
end;

procedure TFimportBarang.btn2Click(Sender: TObject);
begin
  Ex1.XLSExport(ExtractFilePath(Application.ExeName)+'Format Import Barang.xls');
end;

procedure TFimportBarang.btn3Click(Sender: TObject);
var
  i : Integer;
  idkategori : String;
  idSupplier : String;
  ls : TStringList;
  idgudang : String;
begin
  if sg1.Cells[0,1] = '' then begin
     Error('Belum ada data');
     Exit;
  end else begin
     ls := TStringList.Create;

     try
        idgudang := getData(dm.Q1,'profile WHERE idprofil=1','gudangjual');

         for i := 1 to sg1.RowCount -1 do begin
           if sg1.Cells[0,1] <> '' then begin
              addParam('kodebarang',sg1.Cells[0,i],ls,'str');
              addParam('kodebarcode',sg1.Cells[1,i],ls,'str');
              addParam('namabarang',sg1.Cells[2,i],ls,'str');
              idkategori := getData(dm.Q1,'kategori WHERE namakategori="'+sg1.Cells[3,i]+'"','idkategori');
              if idkategori = '' then begin
                 ExQry(dm.Q1,'INSERT INTO kategori (namakategori) values ("'+sg1.Cells[3,i]+'")',False);
                 idkategori := getData(dm.Q1,'kategori WHERE namakategori="'+sg1.Cells[3,i]+'"','idkategori');
              end;
              idSupplier := getData(dm.Q1,'m_supplier WHERE namasupplier="'+sg1.Cells[30,i]+'"','idsupplier');
              if idSupplier = '' then begin
                 ExQry(dm.Q1,'INSERT INTO m_supplier (kodesupplier,namasupplier) values ("'+'SP.'+FormatDateTime('ddmmyy',now + i)+'",'+
                 ' "'+sg1.Cells[30,i]+'")',False);
                 idSupplier := getData(dm.Q1,'m_supplier WHERE namasupplier="'+sg1.Cells[30,i]+'"','idsupplier');
              end ;
              addParam('idkategori',idkategori,ls,'str');
              addParam('idsupplier',idSupplier,ls,'str');
              addParam('satuanbeli',sg1.Cells[4,i],ls,'str');
              addParam('satuanjual',sg1.Cells[5,i],ls,'str');
              addParam('isi',sg1.Cells[6,i],ls,'str');
              addParam('hargabeli',StrToDecimal(sg1.Cells[7,i]),ls,'str');
              addParam('hargaecer',StrToDecimal(sg1.Cells[8,i]),ls,'str');
              addParam('hargagrosir',StrToDecimal(sg1.Cells[9,i]),ls,'str');
              addParam('hargapartai',StrToDecimal(sg1.Cells[10,i]),ls,'str');

              ExQry(dm.Q2,'SELECT idbarang FROM barang WHERE (kodebarang="'+sg1.Cells[0,i]+'" OR kodebarcode="'+sg1.Cells[1,i]+'")',True);

              if dm.Q2.IsEmpty then
                  exeDb(dm.Q1,'barang',ls)
              else
                  updatedb(dm.Q1,'barang',ls,'idbarang',GetVal(dm.Q2,'idbarang'));

              ExQry(dm.Q1,'DELETE FROM multisatuan WHERE kodebarang="'+sg1.Cells[0,i]+'" '+
              ' AND satuan="'+sg1.Cells[5,i]+'" ',False);

              addParam('kodebarang',sg1.Cells[0,i],ls,'str');
              addParam('kodebarcode',sg1.Cells[1,i],ls,'str');
              addParam('satuan',sg1.Cells[5,i],ls,'str');
              addParam('isi','1',ls,'str');
              addParam('harga',StrToDecimal(sg1.Cells[8,i]),ls,'str');
              addParam('hargagrosir',StrToDecimal(sg1.Cells[9,i]),ls,'str');
              addParam('hargapartai',StrToDecimal(sg1.Cells[10,i]),ls,'str');
              exeDb(dm.Q1,'multisatuan',ls);
              ExQry(dm.Q1,'DELETE FROM multisatuan WHERE kodebarang="'+sg1.Cells[0,i]+'" '+
                  ' AND satuan="'+sg1.Cells[13,i]+'" ',False);
              if sg1.Cells[13,i] <> '' then begin




                  addParam('kodebarang',sg1.Cells[0,i],ls,'str');
                  addParam('kodebarcode',sg1.Cells[12,i],ls,'str');
                  addParam('satuan',sg1.Cells[13,i],ls,'str');
                  addParam('isi',nilai(sg1.Cells[14,i]),ls,'str');
                  addParam('harga',StrToDecimal(sg1.Cells[15,i]),ls,'str');
                  addParam('hargagrosir',StrToDecimal(sg1.Cells[16,i]),ls,'str');
                  addParam('hargapartai',StrToDecimal(sg1.Cells[17,i]),ls,'str');
                  exeDb(dm.Q1,'multisatuan',ls);
              end;
               ExQry(dm.Q1,'DELETE FROM multisatuan WHERE kodebarang="'+sg1.Cells[0,i]+'" '+
              ' AND satuan="'+sg1.Cells[19,i]+'" ',False);
              if sg1.Cells[19,i] <> '' then begin

                  addParam('kodebarang',sg1.Cells[0,i],ls,'str');
                  addParam('kodebarcode',sg1.Cells[18,i],ls,'str');
                  addParam('satuan',sg1.Cells[19,i],ls,'str');
                  addParam('isi',nilai(sg1.Cells[20,i]),ls,'str');
                  addParam('harga',StrToDecimal(sg1.Cells[21,i]),ls,'str');
                  addParam('hargagrosir',StrToDecimal(sg1.Cells[22,i]),ls,'str');
                  addParam('hargapartai',StrToDecimal(sg1.Cells[23,i]),ls,'str');
                  exeDb(dm.Q1,'multisatuan',ls);

              end;
              ExQry(dm.Q1,'DELETE FROM multisatuan WHERE kodebarang="'+sg1.Cells[0,i]+'" '+
              ' AND satuan="'+sg1.Cells[25,i]+'" ',False);

              if sg1.Cells[25,i] <> '' then begin
              addParam('kodebarang',sg1.Cells[0,i],ls,'str');
              addParam('kodebarcode',sg1.Cells[24,i],ls,'str');
              addParam('satuan',sg1.Cells[25,i],ls,'str');
              addParam('isi',nilai(sg1.Cells[26,i]),ls,'str');
              addParam('harga',StrToDecimal(sg1.Cells[27,i]),ls,'str');
              addParam('hargagrosir',StrToDecimal(sg1.Cells[28,i]),ls,'str');
              addParam('hargapartai',StrToDecimal(sg1.Cells[29,i]),ls,'str');
              exeDb(dm.Q1,'multisatuan',ls);
              end;

              addParam('kodebarang',sg1.Cells[0,i],ls,'str');
              addParam('hargabeli',StrToDecimal(sg1.Cells[7,i]),ls,'str');
              exeDb(dm.Q1,'hargabelirata',ls);



              ExQry(dm.Q1,'DELETE FROM kartustok WHERE kodebarang="'+sg1.Cells[0,i]+'" '+
              ' and nobukti="'+FormatDateTime('yymmddhhmmss',Now)+'" ',False);
              PostingKartuStok(dm.Q1,FormatDateTime('yymmddhhmmss',Now),
              now,sg1.Cells[0,i],idgudang,sg1.Cells[5,i],CellF(sg1.Cells[7,i]),
              'MASUK',StrToFloatDef(sg1.Cells[11,i],0),'IMPORT DATA');

         //     PostingJurnal(dm.Q1,'103.001',FormatDateTime('yymmddhhmmss',Now),
         //     'IMPORT DATA',Now,StrToFloatDef(sg1.Cells[7,i],0)* StrToFloatDef(sg1.Cells[11,i],0),'D');

        //      PostingJurnal(dm.Q1,'301.001',FormatDateTime('yymmddhhmmss',Now),
        //      'IMPORT DATA',Now,StrToFloatDef(sg1.Cells[7,i],0)* StrToFloatDef(sg1.Cells[11,i],0),'K');
           end;
           sg1.Row := i;

         end;
         Informasi('Import data barang selesai');
     finally
       ls.Free;
     end;

  end;
end;

procedure TFimportBarang.btn4Click(Sender: TObject);
begin
  Close;
end;

procedure TFimportBarang.btnKosongbarangClick(Sender: TObject);
begin
  ExQry(dm.Q1,'TRUNCATE table barang',false);
  BuatGrid;
end;

procedure TFimportBarang.BuatGrid;
begin
  with sg1 do begin
    RowCount := 2;
    ColCount := 31;

    Cells[0,0] := 'Kode Barang';
    Cells[1,0] := 'Kode Barcode';
    Cells[2,0] := 'Nama Barang';
    Cells[3,0] := 'Kategori';
    Cells[4,0] := 'Satuan Beli';
    Cells[5,0] := 'Satuan Jual';
    Cells[6,0] := 'Isi';
    Cells[7,0] := 'Harga Beli';
    Cells[8,0] := 'Harga Ecer';
    Cells[9,0] := 'Harga Grosir';
    Cells[10,0] := 'Harga Partai';
    Cells[11,0] := 'Stok';
    Cells[12,0] := 'Barocde 1';
    Cells[13,0] := 'Satuan 1';
    Cells[14,0] := 'Isi 1';
    Cells[15,0] := 'Harga 1';
    Cells[16,0] := 'Harga 2';
    Cells[17,0] := 'Harga 3';
    Cells[18,0] := 'Barocde 2';
    Cells[19,0] := 'Satuan 2';
    Cells[20,0] := 'Isi 2';
    Cells[21,0] := 'Harga 1';
    Cells[22,0] := 'Harga 2';
    Cells[23,0] := 'Harga 3';
    Cells[24,0] := 'Barocde 3';
    Cells[25,0] := 'Satuan 3';
    Cells[26,0] := 'Isi 3';
    Cells[27,0] := 'Harga 1';
    Cells[28,0] := 'Harga 2';
    Cells[29,0] := 'Harga 3';
    Cells[30,0] := 'Supplier';

    ColWidths[0] := 100;
    ColWidths[1] := 100;
    ColWidths[2] := 100;
    ColWidths[3] := 150;
    ColWidths[4] := 80;
    ColWidths[5] := 80;
    ColWidths[6] := 50;
    ColWidths[7] := 80;
    ColWidths[8] := 80;
    ColWidths[9] := 80;
    ColWidths[10] := 80;
    ColWidths[11] := 80;
    ColWidths[12] := 80;
    ColWidths[13] := 100;
    ColWidths[14] := 80;
    ColWidths[15] := 80;
    ColWidths[16] := 80;
    ColWidths[17] := 80;
    ColWidths[18] := 80;
    ColWidths[19] := 80;
    ColWidths[20] := 80;
    ColWidths[21] := 80;
    ColWidths[22] := 80;
    ColWidths[23] := 80;
    ColWidths[24] := 80;
    ColWidths[25] := 80;
    ColWidths[26] := 80;
    ColWidths[27] := 80;
    ColWidths[28] := 80;
    ColWidths[29] := 80;
    ColWidths[30] := 80;

  end;
end;

procedure TFimportBarang.FormShow(Sender: TObject);
begin
  BuatGrid;
end;

end.
