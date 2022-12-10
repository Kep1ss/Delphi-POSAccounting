unit uReturPenjualannew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  cxButtons, cxDropDownEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox,
  uEngine, uComCtrl, uctrlFrm, uOvEdit, dxSkiniMaginary, cxCheckBox,IniFIles,
  strUtils, uTerbilang, ujosprint,Winapi.ShellAPI,System.DateUtils, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier;

type
  TFreturJualNew = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Enobukti: TcxTextEdit;
    DtBukti: TcxDateEdit;
    ENamaCust: TcxTextEdit;
    btnCariSupplier: TcxButton;
    Label11: TLabel;
    Label12: TLabel;
    cbGudang: TcxComboBox;
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
    ETotal: TcxTextEdit;
    EkodeCust: TcxTextEdit;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnCariPelanggan: TcxButton;
    btnCariBarang: TcxButton;
    btnHapus: TcxButton;
    btnFocus: TcxButton;
    stat1: TStatusBar;
    jPrint1: TJPRINTER;
    Label15: TLabel;
    Label19: TLabel;
    Esubtotal: TcxTextEdit;
    Eket: TcxTextEdit;
    lbl1: TLabel;
    Label7: TLabel;
    EFakturPenjualan: TcxTextEdit;
    btnCari: TcxButton;
    Label21: TLabel;
    Label9: TLabel;
    cbAkun: TcxComboBox;
    cbPembayaran: TcxComboBox;
    cxlbl1: TcxLabel;
    btnTutup: TcxButton;
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure FormCreate(Sender: TObject);
    procedure btnCariPelangganClick(Sender: TObject);
    procedure btnCariBarangClick(Sender: TObject);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1KeyPress(Sender: TObject; var Key: Char);
    procedure sg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnHapusClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure sg1GetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormResize(Sender: TObject);
    procedure btnBukaPendingClick(Sender: TObject);
    procedure btnFocusClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCopyNotaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CInvoiceKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCariClick(Sender: TObject);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    function sumBKP : Real;
  public
    function CariIsi(barcode:string;Satuan:string):Extended;
    procedure TampilAwal;
    procedure CreateGrid;
    procedure bersihCell;
    procedure ReplaceData;
    procedure Focus;
    procedure Simpan;
    procedure HitungTotal;
    procedure HitungSubtotal(Arow:Integer);
    procedure PrintStruck(Nota : String);
    function ToFloat(ACol:Integer;ARow:integer):Extended;
    function Posisi(kodebarcode:String):integer;
    function PrinterStruk : String;
    function PrinterInvoice : String;
    function CheckDirect : Boolean;
    function CheckAuto : Boolean;
    procedure bersihkanGrid;
    procedure printdirect(Nofaktur:string;CP : Boolean);
    function RataKanan(pjg : Integer;txt:string): string;
    function Header(txt : string):string;
    function Sparator(txt : string):string;
    function vItems(Hrg:string;qty:string;stn:string;subt:string):String;
    function vTotal(lbl:string;vValue:string):string;
    procedure BukaLaci;
    procedure Kosongkangrid;
    function GetHargaBeli(kodebarang: string; HargaBaru       : Real;   JumlahBaru      : Real): Real;
    { Public declarations }
  end;
 
var
  FreturJualNew: TFreturJualNew;
  aList : TStringList;
  sNota       : String;
implementation

{$R *.dfm}

uses udm, uCaripelanggan, uCariBarang, uMainMenu, uBayar, uDlaporan,
  uPendingTransaksi, uCopyNota, uPilihSatuan, uDtrx, uSalesOrder,
  uPasswordAdmin, uCariSales, uCariPenjualan;

procedure TFreturJualNew.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFreturJualNew.bersihkanGrid;
var
  i : integer;
  x : integer;
begin
  for i := 1 to sg1.RowCount -1 do
  for x := 0 to sg1.ColCount -1 do
    sg1.Cells[x,i] := '';
  sg1.RowCount := 2;

end;

procedure TFreturJualNew.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFreturJualNew.btnBukaPendingClick(Sender: TObject);
begin
  FpendingTransaksi.Show;
end;

procedure TFreturJualNew.btnCariBarangClick(Sender: TObject);
begin
  ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+'  GROUP BY b.kodebarang',True);
   FcariBarang.Show;
  FcariBarang.isFormTransaksi := 6;
end;

procedure TFreturJualNew.btnCariClick(Sender: TObject);
begin
   ExQry(dtrx.Qpenjualan,FcariPenjualan.SQLpenjualan + ' LEFT JOIN penjualandetil dt '+
                     ' ON dt.`fakturjual`=p.`fakturjual` WHERE dt.isi > dt.`jumlahretur` '+
                     ' AND MONTH(p.tgljual) >="'+IntToStr(MOnthOf(Now)-2)+'" AND '+
                     ' YEAR(p.tgljual)="'+IntToStr(YearOf(now))+'"'+
                     ' GROUP BY p.`fakturjual`',True);
   FcariPenjualan.Show;
end;

procedure TFreturJualNew.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[6,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
    begin
      try
        Bersihcell;
        ReplaceData;
        if (sg1.Row <> sg1.RowCount -1) and (sg1.Cells[1,sg1.RowCount -1] = '') then
        sg1.RowCount :=  sg1.RowCount -1;
        HitungTotal;
        Focus;
      except
        Peringatan('Tidak ada data transaksi');
      end;
    end else
    Peringatan('Data yang dipilih kosong');
  end;
  end else
  exit;
end;

procedure TFreturJualNew.btnSimpanClick(Sender: TObject);
begin
  if sg1.Cells[1,1] = '' then begin
    Error('Belum ada transaksi');
  end else if NOT CheckEdit(Self) then begin
    Simpan;
  end;
end;

procedure TFreturJualNew.btnCariPelangganClick(Sender: TObject);
begin
  Fcaripelanggan.Show;
  Fcaripelanggan.isFormPelanggan := 3;
end;

procedure TFreturJualNew.btnCopyNotaClick(Sender: TObject);
begin
  FCopyNota.Show;
end;

procedure TFreturJualNew.btnFocusClick(Sender: TObject);
begin
  Focus;
end;

procedure TFreturJualNew.btnTutupClick(Sender: TObject);
begin
   Close;

end;

procedure TFreturJualNew.BukaLaci;

var
  Path : String;
begin
  Path := ExtractFilePath(Application.ExeName)+'buka.exe';

  ShellExecute(handle,'Open',
    pChar(Path),
    nil,nil,SW_hide);


end;

function TFreturJualNew.CariIsi(barcode, Satuan: string): Extended;
begin
  ExQry(dm.Q1,'select mt.isi from multisatuan mt LEFT JOIN '+
  ' barang b ON b.kodebarang=mt.kodebarang '+
  ' WHERE mt.satuan="'+satuan+'" AND b.kodebarcode="'+barcode+'"',True);

  if dm.Q1.IsEmpty then
     Result :=   1
  else
  begin
    Result := dm.Q1.Fields[0].AsFloat;
  end;
end;



function TFreturJualNew.CheckAuto: Boolean;

  var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(apathExe+'SetKasir.ini');
  try
     Result := StrToBool(aIni.ReadString('KOMPUTER','AutoPrint','0'));
  finally
    aIni.Free;
  end;
end;

function TFreturJualNew.CheckDirect: Boolean;
var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(apathExe+'SetKasir.ini');
  try
     Result := StrToBool(aIni.ReadString('KOMPUTER','PrintDirect','0'));
  finally
    aIni.Free;
  end;
end;


procedure TFreturJualNew.CInvoiceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    Focus;
end;

procedure TFreturJualNew.CreateGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=0 to RowCount do
    Cells[c,r]:='';

    ColCount    := 15;
    RowCount    := 2 ;



    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'HARGA';
    Cells[4,0]  := 'DISC(%)';
    Cells[5,0]  := 'DISC(Rp)';
    Cells[6,0]  := 'SATUAN';
    Cells[7,0]  := 'QTY';
    Cells[8,0]  := 'JML RETUR';
    Cells[9,0]  := 'SUBTOTAL ';
    Cells[10,0]  := 'REFUND ';
    Cells[11,0]  := 'Isi ';
    Cells[12,0]  := 'hpp ';
    Cells[13,0]  := 'Harga Jual ';
    Cells[14,0]  := 'bkp';


    ColWidths[0]:= 50;
    ColWidths[1]:= 150;
    ColWidths[2]:= 250;
    ColWidths[3]:= 60;
    ColWidths[4]:= 60;
    ColWidths[5]:= 60;
    ColWidths[6]:= 60;
    ColWidths[7]:= 70;
    ColWidths[8]:= 100;
    ColWidths[9]:= 120;
    ColWidths[10]:= 0;
    ColWidths[11]:= 0;
    ColWidths[12]:= 0;
    ColWidths[13]:= 0;
    ColWidths[14]:= 0;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;
 end;

end;

procedure TFreturJualNew.Focus;
begin
  sg1.SetFocus;
  sg1.Options := sg1.Options + [goEditing];
  sg1.Options := sg1.Options - [goRowSelect];
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=1;
  bersihCell;
end;

procedure TFreturJualNew.FormActivate(Sender: TObject);
begin
  Focus;
end;

procedure TFreturJualNew.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := True;
end;

procedure TFreturJualNew.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if MessageDlg('Yakin menutup program?',
       mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
    CanClose := True;
    aList.Free;
 end ELSE
 CanClose := False;
end;

procedure TFreturJualNew.FormCreate(Sender: TObject);
begin
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  sg1.ControlLook.DropDownAlwaysVisible := True;
  FreturJualNew := Self;

end;

procedure TFreturJualNew.FormResize(Sender: TObject);
begin
  if sg1.Cells[0,0] ='' then begin
     CreateGrid;

  end;
end;

procedure TFreturJualNew.FormShow(Sender: TObject);
begin
  aList := TStringLIst.Create;
  if stat1.Panels[5].Text ='KASIR' then
     TampilAwal;


  
  Focus;
end;



function TFreturJualNew.GetHargaBeli(kodebarang: string; HargaBaru,
  JumlahBaru: Real): Real;
var
  HargaLama       : Real;
  StokLama        : Real;
  HargaRata_rata  : Real;
begin
  ExQry(dm.Q4,'   SELECT hargabeli from hargabelirata WHERE kodebarang="'+kodeBarang+'" LIMIT 1 ',True);

  HargaLama := GetValF(dm.Q4,'hargabeli');

  ExQry(dm.Q4,  ' SELECT  SUM(ks.saldoawal + ks.masuk - ks.keluar) as stok '+
                ' FROM kartustok ks WHERE ks.kodebarang="'+kodeBarang+'" '+
                '  AND MONTH(tgl)="'+intTOStr(MonthOf(now))+'" '+
                ' AND YEAR(tgl)="'+intToStr(YearOf(now))+'"',True);

  StokLama  := GetValF(dm.Q4,'stok');
  if ( StokLama + JumlahBaru > 0)  then

  HargaRata_rata := ((HargaLama * StokLama) + (HargaBaru * JumlahBaru)) / ( StokLama + JumlahBaru ) else
  HargaRata_rata := HargaBaru;

  Result         := HargaRata_rata;


end;

function TFreturJualNew.Header(txt: string): string;
var
  i : integer;
  jmltext : Integer;
  Lebar   : Integer;
  Sisa    : Integer;
  Hasil   : String;
begin
  Lebar   := 40;
  jmltext := Length(txt);


  Sisa := Lebar - jmltext;
  Sisa := Sisa div 2;


  Hasil := '';
  for i:= 1 to Sisa do begin
    Hasil := Hasil +' ';
  end;
  Result := Hasil + txt + Hasil;

end;

procedure TFreturJualNew.HitungSubtotal(AROW:Integer);
var
  Harga , Jumlah ,SubTotal : Real;
  isiJual,SelisihDiskon : Real;
  HargaNormal : Real;
begin
  with sg1 do begin
     Jumlah       := CellF(Cells[8,Row]);
     Harga        := CellF(Cells[13,Row]);
     HargaNormal  := CellF(Cells[3,Row]);



        if Harga < HargaNormal then begin

           SelisihDiskon := (HargaNormal - Harga);
           SelisihDiskon := SelisihDiskon / HargaNormal;
           Cells[4,aRow] :=  Format('%.2n',[SelisihDIskon]);
           Cells[5,Arow] := Format('%.0n',[HargaNormal - Harga]);
        end else begin

           Cells[4,Arow] := '0';
           Cells[5,Arow] := '0';
        end;





        isiJual      := CariIsi(Cells[1,aRow],Cells[6,aRow]) * Jumlah;
        SubTotal     := HargaNormal * Jumlah;

        Cells[9,aRow] := GetRupiah(FloatToStr(Subtotal));
        Cells[11,aRow] := GetRupiah(FloatToStr(isiJual));
  end;
end;

procedure TFreturJualNew.HitungTotal;
begin
  Esubtotal.Text    := GetRupiah(SumGrid(sg1,9));
  ETotal.Text      := Esubtotal.Text ;
end;

procedure TFreturJualNew.Kosongkangrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=1 to RowCount do
    Cells[c,r]:='';

    ColCount    := 15;
    RowCount    := 2 ;
  end;
end;


function TFreturJualNew.Posisi(kodebarcode: String): integer;
var
  i:integer;
  hasil : integer;
begin
  for i := 1 to sg1.RowCount-1  do begin
    if sg1.Cells[1,i] = kodebarcode then begin
      hasil  := i;

      Break;
    end else
      hasil  := 0;
  end;
  Result := hasil;
end;

procedure TFreturJualNew.printdirect(Nofaktur: string;CP : Boolean);
var
  i           : integer;
  total       : string;
  diskon      : string;
  grandtotal  : string;
  nontunai    : string;
  Bayar       : String;
  Kembali     : String;

const  Enter = #13+#10;
  SQLNota = ' SELECT                                          '+
            '      p.fakturjual,                              '+
            '      p.tgljual,                                 '+
            '      p.idpelanggan,                             '+
            '      pl.idjenispelanggan,                       '+
            '      pl.namapelanggan,                          '+
            '      pl.alamat,                                 '+
            '      pl.kota,                                   '+
            '      pl.notelpon,                               '+
            '      p.pembayaran,                              '+
            '      p.total,                                   '+
            '      p.diskon,                                  '+
            '      p.grandtotal,                              '+
            '      pg.namalengkap,                            '+
            '      p.nontunai,                                '+
            '      p.bayar,                                   '+
            '      p.kembali                                  '+
            '    FROM                                         '+
            '      penjualan p                                '+
            '      LEFT JOIN pelanggan pl                     '+
            '        ON pl.`idpelanggan` = p.`idpelanggan`    '+
            '      LEFT JOIN m_user pg                        '+
            '       ON pg.iduser=p.`iduser`                   ';
  _SQLDetailJual = ' SELECT                                  '+
                     '     d.iddetil,                          '+
                     '     d.fakturjual,                       '+
                     '     d.kodebarang,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,'+
                     '     d.hpp,                              '+
                     '     d.jumlah,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskon2,                     '+
                     '     d.diskon3,                     '+
                     '     d.diskonrupiah,                     '+
                     '     d.subtotal,                         '+
                     '     d.isi,                              '+
                     '     d.idgudang,                         '+
                     '     l.namalokasi                        '+
                     '   FROM                                  '+
                     '     penjualandetil d                    '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang`'+
                     '     LEFT JOIN lokasi l                  '+
                     '       ON l.`idlokasi` = d.`idgudang` ';
begin
     try
       BukaLaci;
     except
     end;
     jprint1.Bismillah;
     ExQry(dm.Q1,'select nama,alamat,kota,notelepon '+
     'from profile where idprofil=1',True);

     jprint1.WriteLn(Header(dm.Q1.Fields[0].AsString));
     jprint1.WriteLn(Header(dm.Q1.Fields[1].AsString+ ' ' +dm.Q1.Fields[2].AsString));
     jprint1.WriteLn(Header(dm.Q1.Fields[3].AsString));
     ExQry(dm.Q2,SQLnota+' WHERE fakturjual="'+Nofaktur+'"',True);

     if CP = TRue then
     jPrint1.WriteLn('COPY STRUK');

     jprint1.WriteLn(' No.   : '+dm.Q2.FieldByName('fakturjual').AsString+' '+RataKanan(5,' Tgl :')+''+RataKanan(10,FormatDateTime('dd/mm/yyyy',now)));
     jprint1.WriteLn(' Kasir : '+dm.Q2.FieldByName('namalengkap').AsString+' '+RataKanan(15,' Jam :')+''+RataKanan(5,FormatDateTime('hh:nn:ss',now)));
     jprint1.WriteLn(' Cust  : '+ Enamacust.Text);

     jprint1.WriteLn(Sparator('='));
     ExQry(dm.Q3,_SQLDetailJual+' where fakturjual="'+Nofaktur+'"',True);
      for i := 0 to dm.Q3.RecordCount -1 do
      begin
         jprint1.WriteLn(' '+IntToStr(dm.Q3.RecNo)+'. '+dm.Q3.FieldByName('namabarang').AsString);
         jprint1.WriteLn('  '+vItems(GetRupiah(dm.Q3.FieldByName('harga').AsString),
                                           dm.Q3.FieldByName('jumlah').AsString,
                                           dm.Q3.FieldByName('satuan').AsString,
                                           GetRupiah(dm.Q3.FieldByName('subtotal').AsString)));
         dm.Q3.Next;
      end;
      jprint1.WriteLn(Sparator('='));
      total       := '  TOTAL         ';
      diskon      := '  DISKON        ';
      grandtotal  := '  GRANDTOTAL    ';
      Bayar       := '  TUNAI         ';
      nontunai    := '  NON TUNAI     ';
      Kembali     := '  KEMBALI       ';
      jprint1.WriteLn(vTotal(total,GetRupiah(dm.Q2.FieldByName('total').AsString)));
      jprint1.WriteLn(vTotal(diskon,GetRupiah(dm.Q2.FieldByName('diskon').AsString)));
      jprint1.WriteLn(vTotal(grandtotal,GetRupiah(dm.Q2.FieldByName('grandtotal').AsString)));
      jprint1.WriteLn(vTotal(Bayar,Fbayar.Etunai.Text));
      jprint1.WriteLn(vTotal(nontunai,Fbayar.Ebayar.Text));
      jprint1.WriteLn(vTotal(Kembali,Fbayar.Ekembali.Text));

      jPrint1.WriteLn(Enter);

      jprint1.WriteLn(Header( 'TERIMA KASIH' ));
      jprint1.WriteLn(Header( 'BARANG YANG SUDAH DIBELI' ));
      jprint1.WriteLn(Header( 'TIDAK DAPAT DIKEMBALIKAN' ));
     Jprint1.PotongKertas;

     jprint1.Alhamdulillah;



end;

function TFreturJualNew.PrinterInvoice: String;
var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(apathExe+'SetKasir.ini');
  try
     Result := aIni.ReadString('KOMPUTER','printerinvoice','Default Printer');
  finally
    aIni.Free;

  end;
end;

function TFreturJualNew.PrinterStruk: String;
var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(apathExe+'SetKasir.ini');
  try
     Result := aIni.ReadString('KOMPUTER','printerstruk','Default Printer');
  finally
    aIni.Free;

  end;
end;

procedure TFreturJualNew.PrintStruck(Nota: String);
const
  SQLNota = ' SELECT                                          '+
            '      p.fakturjual,                              '+
            '      p.tgljual,                                 '+
            '      p.idpelanggan,                             '+
            '      pl.idjenispelanggan,                       '+
            '      pl.namapelanggan,                          '+
            '      pl.alamat,                                 '+
            '      pl.kota,                                   '+
            '      pl.notelpon,                               '+
            '      (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE '+
            '     "KREDIT" END) as pembayaran,                              '+
            '      pl.poin,                                    '+
            '      p.total,                                   '+
            '      p.diskon,                                  '+
            '      p.grandtotal,                              '+
            '      pg.namalengkap,                            '+
            '      s.namasales,                            '+
            '      p.ppn,                            '+
            '      p.nontunai,                                '+
            '      p.bayar,                                   '+
            '      p.kembali                                  '+
            '    FROM                                         '+
            '      penjualan p                                '+
            '      LEFT JOIN pelanggan pl                     '+
            '        ON pl.`idpelanggan` = p.`idpelanggan`    '+
            '      LEFT JOIN m_user pg                        '+
            '       ON pg.iduser=p.`iduser`                   '+
            '      LEFT JOIN sales s                          '+
            '       ON s.idsales=p.idsales ';

begin
  ExQry(Dlaporan.Qpenjualan,SQLNota+' WHERE fakturjual="'+nota+'"',True);


    Dlaporan.Fr1.LoadFromFile(aPathRpt+'\invoice3.fr3');
  //  FMemo(Dlaporan.Fr1,'Lterbilang').Text:= MyTerbilang(Dlaporan.Qpenjualan.FieldByName('grandtotal').AsFloat);
    Dlaporan.Fr1.PrepareReport(True);
    Dlaporan.Fr1.PrintOptions.ShowDialog := True;
    Dlaporan.Fr1.PrintOptions.Printer    := PrinterInvoice;
    if CheckAuto = True then
     Dlaporan.Fr1.Print else
     Dlaporan.Fr1.ShowReport();

end;

function TFreturJualNew.RataKanan(pjg: Integer; txt: string): string;
var
   i : integer;
   Panjang : Integer;
   mulai  : String;
   sisa : Integer;
begin
  Panjang := Length(txt);
  sisa := pjg - panjang;

  mulai := '';
  for I := 1 to sisa do
    mulai := mulai + ' ';

  Result := mulai + txt;


end;

procedure TFreturJualNew.ReplaceData;
var
  i:integer;
begin
  for i := sg1.row to sg1.RowCount -1 do
  begin
    sg1.Cells[0,i]:= Inttostr(i);
    sg1.Cells[1,i]:= sg1.Cells[1,i+1];
    sg1.Cells[2,i]:= sg1.Cells[2,i+1];
    sg1.Cells[3,i]:= sg1.Cells[3,i+1];
    sg1.Cells[4,i]:= sg1.Cells[4,i+1];
    sg1.Cells[5,i]:= sg1.Cells[5,i+1];
    sg1.Cells[6,i]:= sg1.Cells[6,i+1];
    sg1.Cells[7,i]:= sg1.Cells[7,i+1];
    sg1.Cells[8,i]:= sg1.Cells[8,i+1];
    sg1.Cells[9,i]:= sg1.Cells[9,i+1];
    sg1.Cells[10,i]:= sg1.Cells[10,i+1];
    sg1.Cells[11,i]:= sg1.Cells[11,i+1];
    sg1.Cells[12,i]:= sg1.Cells[12,i+1];
    sg1.Cells[13,i]:= sg1.Cells[13,i+1];

  end;
end;

procedure TFreturJualNew.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [3,5,8] then
       HAlign := taRightJustify
    else if ACOl in [ 7 ] then
       HAlign := taCenter;
  end;

end;

procedure TFreturJualNew.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if (ACol in [3,5,8,9]) then
      begin
        isFloat := True;
        FloatFormat :='%.0n';
      end
  else
       isFloat := False;
end;

procedure TFreturJualNew.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  stts , Hargamulti : String;
begin
  case KEy of
   VK_INSERT : begin
                 if sg1.Cells[1,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin

                      ExQry(dm.Q1,'SELECT * FROM hargaperpelanggan WHERE kodebarang="'+sg1.Cells[1,sg1.Row]+'" '+
                      ' AND kodepelanggan="'+EkodeCust.Text+'"',True);

                      if dm.Q1.IsEmpty = False  then begin
                         ExQry(dm.QMultiSatuan,'SELECT s.kodebarang,s.satuan,s.isi,s.harga,(b.hargabeli * s.isi) as hargabeli FROM '+
                         ' hargaperpelanggan s LEFT JOIN barang b ON b.kodebarang=s.kodebarang '+
                         ' WHERE s.kodepelanggan="'+EkodeCust.Text+'" '+
                         ' AND s.kodebarang="'+sg1.Cells[1,sg1.Row]+'"',True);

                         FpilihSatuan.Show;
                         FpilihSatuan.cHargabeli.Visible := False;
                         FpilihSatuan.cHarga.Visible     := True;

                         FpilihSatuan.isFormSatuan := 3;

                      end else begin

                          ExQry(dm.Q2,'SELECT idjenispelanggan FROM pelanggan WHERE kodepelanggan="'+EkodeCust.Text+'"',True);
                            stts := GetVal(dm.Q2,'idjenispelanggan');

                            if stts = '4' then hargamulti :='harga'
                            else
                            if stts = '5' then hargamulti :='hargagrosir'
                            else
                            if stts = '6' then hargamulti:='hargapartai'
                            else
                            if stts = '7' then hargamulti:='hargapartai4'
                            else
                            if stts = '8' then hargamulti:='hargapartai5';
                          ExQry(dm.QMultiSatuan,'SELECT s.kodebarang,s.satuan,s.isi,s.'+hargamulti+' as harga,(b.hargabeli * s.isi) as hargabeli FROM multisatuan s left join barang b '+
                          ' ON b.kodebarang=s.kodebarang WHERE b.kodebarang="'+sg1.Cells[1,sg1.Row]+'"',True);
                          if DM.QMultiSatuan.IsEmpty then
                             Warning('Tidak ada multi satuan')
                          else begin
                             FpilihSatuan.Show;
                             FpilihSatuan.cHargabeli.Visible := False;
                             FpilihSatuan.cHarga.Visible     := True;

                             FpilihSatuan.isFormSatuan := 3;
                          end;
                      end;
                    end;
               end;
   end;
end;

procedure TFreturJualNew.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [3,4,5,7,8,9]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFreturJualNew.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if sg1.Col in [3,5,7,8,9]  then begin
     HitungSubtotal(sg1.Row);
     HitungTotal;

   end;

   
   if (Key = 66) and (Shift = [ssCtrl]) then
   begin
      sg1.Options  := sg1.Options + [goRowSelect];
      sg1.Options  := sg1.Options - [goEditing];
      sg1.Row      := 1;
      sg1.Col      := 1;
   end;
   if (Key = 70) and (Shift = [ssCtrl]) then
   begin
      BukaLaci;
   end;

end;

procedure TFreturJualNew.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if ACol in [1,3,5,8,10] then
    sg1.Options := sg1.Options +[GoEditing]
  else
    sg1.Options := sg1.Options -[goEditing];
end;

procedure TFreturJualNew.Simpan;
var
  x : integer;
  idpelanggan,KodeBarang : string;
  hargajual : real;
  Kredit : Boolean;
  Check : Boolean;
  Hargabeli : Real;
  ppn : Real;
  Lunas : Boolean;
  HppBkp : Real;
  HppNonBkp : Real;
begin


    idpelanggan := getData(dm.Q2,'pelanggan where kodepelanggan="'+EkodeCust.Text+'"','idpelanggan');
    dm.Q1.Connection.StartTransaction;
    try
      if sumBKP > 0 then
         ppn := sumBKP * asPPn / 100 else
         ppn := 0;
      addParam('nobukti',       Enobukti.Text,            aList,'str');
      addParam('tgl',           frmTgl(DtBukti.Date),     aList,'date');
      addParam('idpelanggan',   idpelanggan,              aList,'str');
      addParam('iduser',        Fmain.sbr1.Panels[1].Text,aList,'str');
      addParam('nobuktijual',   EFakturPenjualan.Text,    aList,'str');
      addParam('total',         StrToDecimal(SumGrid(sg1,9)),aList,'str');
      addParam('nominalbkp',    StrToDecimal(FloatToStr(sumBKP+ppn)),aList,'str');
      addParam('nominalnonbkp', StrToDecimal(FloatToStr(ETotal.AsFLoat - (Sumbkp+ppn))),aList,'str');
      addParam('keterangan',    Eket.Text,aList,'str');

      OpenTable(dm.Q2,['idreturjual'],'returpenjualan where nobukti="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'returpenjualan',alist)
      else
         UpdatePOST(dm.Q1,'returpenjualan',alist,'idreturjual',GetVal(dm.Q2,'idreturjual'));



      OpenTable(dm.Q1,['pembayaran'],'penjualan WHERE fakturjual="'+EFakturPenjualan.Text+'"');

      Kredit := GetValInt(dm.Q1,'pembayaran') = 1;

      HppBkp := 0;
      HppNonBkp := 0;
      for x := 1 to sg1.RowCount -1 do
        begin

          if (sg1.Cells[1,x] <> '') and (sg1.Cells[2,x]<>'')  then
          begin
              if  (CellF(sg1.Cells[8,x]) <> 0) then begin

              sg1.GetCheckBoxState(10,x,Check);

              openTable(dm.Q2,['kodebarang'],'barang where kodebarcode="'+sg1.cells[1,x]+'"');
              KodeBarang := Getval(dm.Q2,'kodebarang');

              hargajual  := StrToFloatDef(nilai(sg1.Cells[9,x]),0) / StrToFloatDef(nilai(sg1.Cells[11,x]),0);

              if UPPERCASE(sg1.Cells[15,x]) = 'TRUE' then
                 hppBkp  := hppBkp +(StrToFloatDef(nilai(sg1.Cells[12,x]),0) * StrToFloatDef(nilai(sg1.Cells[8,x]),0)) else
                 HppNonBkp  := HppNonBkp + (StrToFloatDef(nilai(sg1.Cells[12,x]),0) * StrToFloatDef(nilai(sg1.Cells[8,x]),0));


              addParam('nobukti',     Enobukti.Text,          aList,'str');
              addParam('kodebarang',  KodeBarang,             Alist,'str');
              addParam('satuan',      sg1.Cells[6,x],         Alist,'str');
              addParam('harga',       FloatToStr(hargajual),  Alist,'str');
              addParam('hpp',         StrToDecimal(nilai(sg1.Cells[12,x])),        Alist,'str');
              addParam('jumlah',      KomaDatabase(sg1.Cells[8,x]),   Alist,'str');
              addParam('diskonpersen',KomaDatabase(sg1.Cells[4,x]),   Alist,'str');
              addParam('diskonrupiah',nilai(sg1.Cells[5,x]),  Alist,'str');
              addParam('subtotal',    nilai(sg1.Cells[9,x]),  Alist,'str');
              addParam('isi',         KomaDatabase(sg1.Cells[11,x]), Alist,'str');
              addParam('idgudang',    GetIdcmb(cbGudang),     Alist,'str');
              addParam('gantiuang',   BolStr(Check),     Alist,'str');

              OpenTable(dm.Q2,['idjualdetail'],
              'detailreturjual WHERE kodebarang="'+kodebarang+'" '+
              'AND nobukti="'+Enobukti.Text+'"');

              if dm.Q2.IsEmpty then
                 Post(dm.Q1,'detailreturjual',aList)
              else
                 updatePOST(dm.Q1,'detailreturjual',aList,'idjualdetail',GetVal(dm.Q2,'idjualdetail'));


              ExQry(dm.Q5,' SELECT kodebarang FROM hargabelirata WHERE kodebarang="'+KodeBarang+'" ',True);
              hargabeli := GetHargaBeli(KodeBarang,StrToFloatDef(nilai(sg1.Cells[12,x]),0),
              StrToFloatDef(nilai(sg1.Cells[8,x]),0));

              if dm.Q5.IsEmpty then begin
                ExQry(dm.Q3,'INSERT INTO hargabelirata (kodebarang,hargabeli) VALUES ( '+
                '"'+KodeBarang+'","'+StrTODecimal(Format('%.4n',[hargabeli]))+'")',False);
              end
              else begin
                 ExQry(dm.Q3,'UPDATE hargabelirata SET hargabeli="'+StrToDecimal(Format('%.4n',[hargabeli]))+'" WHERE '+
                 ' kodebarang="'+KodeBarang+'" ',False);
              end;

              PostingKartuStok(
                     dm.Q5,Enobukti.Text,DtBukti.Date,
                     KodeBarang,
                     GetIdcmb(cbGudang),
                     sg1.Cells[6,x],
                     CellF(sg1.Cells[12,x]),
                     'MASUK',
                     CellF(sg1.Cells[8,x]),
                     'RETUR PENJUALAN NO BUKTI ['+Enobukti.Text+']');

              if (Check  = True) then begin

                   ExQry(dm.Q1,'UPDATE penjualandetil SET jumlahretur=jumlahretur+"'+koma(sg1.Cells[8,x])+'" '+
                  ' WHERE fakturjual="'+EFakturPenjualan.Text+'" AND kodebarang="'+kodebarang+'"',False);
                end ;

              end;
          end else
          if (sg1.Cells[1,x] = '') and (sg1.Cells[8,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
            MessageBox(Handle,'Kode Barcode Harus Di Isi !! '+#13+' Silahkan Isi terlebih Dahulu !! '+#13+
                       'Atau batalkan item dengan menekan tombol [ DELETE ]','ERROR',MB_ICONERROR);
            sg1.Row := x;
            sg1.Col := 1;
            Abort;
          end;
        end;
         Lunas  := UPPERCASE(getData(dm.Q3,'piutang WHERE fakturjual="'+EFakturPenjualan.Text+'"','lunas')) = 'TRUE';
         hppBkp     := hppBkp / ((asPPn + 100) / 100);
        if (Kredit) and (not lunas) then begin
            PostingJurnal(dm.Q2,'104.001',Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                  DtBukti.Date,ETotal.AsFLoat,sumBKP + ppn,ETotal.AsFLoat - (sumBKP + ppn),'K');
             ExQry(dm.Q2,'UPDATE piutang set piutang.piutang=piutang.piutang-"'+StrToDecimal(FloatToStr(ETotal.AsFLoat))+'",'+
            ' kekurangan=piutang.piutang-dibayar,nominalbkp=nominalbkp-"'+StrToDecimal(FloatToStr(SumBkp+ppn))+'",'+
            ' nominalnonbkp=nominalnonbkp-"'+StrToDecimal(FloatToStr(Etotal.AsFLoat - (sumBKP+ppn)))+'" '+
            ' WHERE fakturjual="'+EFakturPenjualan.Text+'"',False);

            PostingJurnal(dm.Q2,'103.001',Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                      DtBukti.Date,HppBkp + HppNonBkp,HppBkp,HppNonBkp,'D');
            PostingJurnal(dm.Q2,'503.001',Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+EFakturPenjualan.Text+']',
                       DtBukti.Date,sumBKP + (ETotal.AsFLoat - (sumBKP + ppn)),sumBKP+ppn,ETotal.AsFLoat - (sumBKP + ppn),'D');
            PostingJurnal(dm.Q2,'202.001',Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+EFakturPenjualan.Text+']',
                      DtBukti.Date,ppn,ppn,0,'D');
            PostingJurnal(dm.Q2,'501.001',Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+EFakturPenjualan.Text+']',
                      DtBukti.Date,HppBkp + HppNonBkp,HppBkp,HppNonBkp,'K');

        end else begin

               PostingJurnal(dm.Q2,'103.001',Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+EFakturPenjualan.Text+']',
                          DtBukti.Date,HppBkp + HppNonBkp,HppBkp,HppNonBkp,'D');
               PostingJurnal(dm.Q2,Copy(cbAkun.Text,1,7),Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+EFakturPenjualan.Text+']',
                          DtBukti.Date,ETotal.AsFLoat,sumBKP + ppn,ETotal.AsFLoat - (sumBKP + ppn),'K');
               PostingJurnal(dm.Q2,'501.001',Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+EFakturPenjualan.Text+']',
                          DtBukti.Date,HppBkp + HppNonBkp,HppBkp,HppNonBkp,'K');
               PostingJurnal(dm.Q2,'202.001',Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+EFakturPenjualan.Text+']',
                          DtBukti.Date,ppn,ppn,0,'D');

               PostingJurnal(dm.Q2,'503.001',Enobukti.Text,'RETUR PENJUALAN NO BUKTI ['+EFakturPenjualan.Text+']',
                           DtBukti.Date,sumBKP + (ETotal.AsFLoat - (sumBKP + ppn)),sumBKP,ETotal.AsFLoat - (sumBKP + ppn),'D');
           end;
       
       
          dm.Q1.Connection.Commit;


      except
        on e:Exception do begin
          dm.Q1.Connection.Rollback;
          raise Exception.Create('Gagal Diproses : '+ e.Message);
        end;

      end;

      if MessageDlg('Cetak Bukti Retur Penjualan?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            ExQry(Dlaporan.QreturJual,' SELECT                                    '+
                                      '    rb.nobukti,                            '+
                                      '    rb.tgl,                                '+
                                      '    rb.nobuktijual,                        '+
                                      '    s.namapelanggan,                       '+
                                      '    rb.total,                              '+
                                      '    rb.keterangan                          '+
                                      '  FROM                                     '+
                                      '    returpenjualan rb                      '+
                                      '    LEFT JOIN penjualan p                  '+
                                      '      ON p.`fakturjual` = rb.`nobuktijual` '+
                                      '    LEFT JOIN pelanggan s                  '+
                                      '      ON s.`idpelanggan` = rb.`idpelanggan` '+
                                      ' WHERE rb.nobukti="'+Enobukti.Text+'"',True);
            Dlaporan.Fr1.LoadFromFile(aPathRpt+'\notareturjual.fr3');
            Dlaporan.Fr1.ShowReport();
          end;
          TampilAwal;

end;

function TFreturJualNew.Sparator(txt: string): string;

var
  I: Integer;
  hasil : String;
begin
  hasil:='';
  for I := 1 to 40 do
     hasil := hasil +txt;
  Result := hasil;


end;

function TFreturJualNew.sumBKP: Real;
var
  i : integer;
  Subtotal : real;
begin
  Subtotal := 0;
  for i := 1 to sg1.RowCount -1  do begin
    if (UPPERCASE(sg1.Cells[15,i]) = 'TRUE') and (sg1.Cells[9,i] <> '') then begin
       Subtotal := Subtotal + StrToFloatDef(nilai(sg1.Cells[9,i]),0);
    end;

  end;

  Result := Subtotal / ((asPPn + 100) / 100);

end;

procedure TFreturJualNew.TampilAwal;
begin
  ClearText(Self);

  Enobukti.Text  := GetCode(dm.Q1,'returpenjualan','nobukti','RJ'+setIdKom);
  setTanggal(Self);
  bersihkanGrid;
  sNota :='';
  OpenTable(dm.Q1,['kodepelanggan','namapelanggan'],'pelanggan WHERE namapelanggan="UMUM"');
  if dm.Q1.IsEmpty then begin
    Warning('Data pelanggan umum masih kosong harap di isi dulu');
    FreturJualNew.Close;

  end else
  begin
    ENamaCust.Text := GetVal(dm.Q1,'namapelanggan');
    EkodeCust.Text := GetVal(dm.Q1,'kodepelanggan');

  end;

  ExQry(dm.QUser,'SELECT * FROM m_user WHERE iduser="'+setIdUser+'"',True);
  ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
  ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);
    cbAKun.Properties.Items.Clear;
  while not dm.Q2.Eof do begin
    cbAKun.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    dm.Q2.Next;
  end;
  cbgudang.ItemIndex  := idxCmb(cbgudang,GetValInt(dm.QUser,'gudang_jual'));
  cbAKun.ItemIndex := cbAKun.Properties.Items.IndexOf(GetVal(dm.Quser,'kas_penjualan'));


end;

function TFreturJualNew.ToFloat(ACol, ARow: integer): Extended;
begin
if not ACOl in [3] then
    Result := StrToFloatDef(koma(sg1.Cells[aCol,aRow]),0)
  else
    Result := StrToFloatDef(nilai(sg1.Cells[aCol,aRow]),0);
end;

function TFreturJualNew.vItems(Hrg, qty, stn, subt: string): String;
var


  jml : integer;


  txt : string;
begin
 txt   := DupeString(' ',1) + hrg;

  jml   := 9 - Length(txt);
  txt   := txt + DupeString(' ',jml) + 'X ' + qty;
  jml   := 13 - Length(txt);
  txt   := txt + DupeString(' ',jml)+ stn;
  jml   := 28 - Length(txt);
  txt   := txt + DupeString(' ',jml)+ '='+RataKanan(7,subt);
  Result := txt;


end;

function TFreturJualNew.vTotal(lbl, vValue: string): string;
var
  i : integer;
  vlbl : Integer;
  jml : integer;
  hasilJumlah : string;

begin

  vlbl := Length(lbl);

  jml     := (35 - (vlbl + 10));


  hasilJumlah := '';
  for I := 1 to jml do
    hasilJumlah := hasilJumlah +' ';

  hasilJumlah   :=  hasilJumlah +'     =';


  Result := lbl + hasilJumlah +RataKanan(7,vValue);


end;

end.
