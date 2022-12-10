unit uPemakainBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  cxButtons, cxDropDownEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox,
  uEngine, uComCtrl, uctrlFrm, uOvEdit, dxSkiniMaginary, cxCheckBox,IniFIles,
  strUtils, uTerbilang, ujosprint,Winapi.ShellAPI, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful,System.DateUtils, cxMemo, dxSkinMoneyTwins,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  TFpemakainBarang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Enobukti: TcxTextEdit;
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnCariBarang: TcxButton;
    btnHapus: TcxButton;
    btnFocus: TcxButton;
    stat1: TStatusBar;
    jPrint1: TJPRINTER;
    Label15: TLabel;
    Label19: TLabel;
    Esubtotal: TcxTextEdit;
    dt1: TDateTimePicker;
    Label3: TLabel;
    Eketerangan: TcxMemo;
    Label11: TLabel;
    Label12: TLabel;
    cbGudang: TcxComboBox;
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure FormCreate(Sender: TObject);
    procedure btnCariBarangClick(Sender: TObject);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1KeyPress(Sender: TObject; var Key: Char);
    procedure sg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnHapusClick(Sender: TObject);
    procedure sg1GetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFocusClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function nominalBkp:real;

  public
    isEdit : boolean;
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
    function Posisi(kodebarcode:String;stn:string):integer;
    function PrinterStruk : String;
    function TipeStruk : String;
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
    function CheckStok(kodebarang:string;qty:Integer):Boolean;
    { Public declarations }
  end;

var
  FpemakainBarang: TFpemakainBarang;
  aList : TStringList;
  sNota       : String;
implementation

{$R *.dfm}

uses udm, uCaripelanggan, uCariBarang, uMainMenu, uBayar, uDlaporan,
  uPendingTransaksi, uCopyNota, uPilihSatuan, uDtrx, uSalesOrder,
  uPasswordAdmin, uCariSales;

procedure TFpemakainBarang.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFpemakainBarang.bersihkanGrid;
var
  i : integer;
  x : integer;
begin
  for i := 1 to sg1.RowCount -1 do
  for x := 0 to sg1.ColCount -1 do
    sg1.Cells[x,i] := '';
  sg1.RowCount := 2;

end;

procedure TFpemakainBarang.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFpemakainBarang.btnCariBarangClick(Sender: TObject);
begin

   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+'  GROUP BY b.kodebarang',True);
   FcariBarang.Show;
  FcariBarang.isFormTransaksi := 1;
end;

procedure TFpemakainBarang.btnHapusClick(Sender: TObject);
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

procedure TFpemakainBarang.btnSimpanClick(Sender: TObject);
begin
  if sg1.Cells[1,1] = '' then begin
    Error('Belum ada transaksi');
  end else if NOT CheckEdit(Self) then begin
    Simpan;
  end;
end;

procedure TFpemakainBarang.btnFocusClick(Sender: TObject);
begin
  Focus;
end;

procedure TFpemakainBarang.BukaLaci;


begin


end;

function TFpemakainBarang.CariIsi(barcode, Satuan: string): Extended;
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


function TFpemakainBarang.CheckAuto: Boolean;

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

function TFpemakainBarang.CheckDirect: Boolean;
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




function TFpemakainBarang.CheckStok(kodebarang: string; qty: Integer): Boolean;
var
  Stok : Integer;
begin
  ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE b.kodebarang="'+kodebarang+'" GROUP BY b.kodebarang',True);
  Stok := GetValInt(dm.Q1,'STOK');

  if Stok < qty then
     Result := False else
  Result := True;

end;

procedure TFpemakainBarang.CreateGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    ClearAll;
    ColCount    := 10;
    RowCount    := 2 ;



    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'HARGA';
    Cells[4,0]  := 'SATUAN';
    Cells[5,0]  := 'QTY';
    Cells[6,0]  := 'SUBTOTAL ';
    Cells[7,0]  := 'Isi ';
    Cells[8,0]  := 'kodebarang ';
    Cells[9,0]  := 'bkp ';

    ColWidths[0]:= 50;
    ColWidths[1]:= 200;
    ColWidths[2]:= 350;
    ColWidths[3]:= 100;
    ColWidths[4]:= 60;
    ColWidths[5]:= 70;
    ColWidths[6]:= 120;
    ColWidths[7]:= 0;
    ColWidths[8]:= 0;
    ColWidths[9]:= 0;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;

 end;

end;

procedure TFpemakainBarang.Focus;
begin
  sg1.SetFocus;
  sg1.Options := sg1.Options + [goEditing];
  sg1.Options := sg1.Options - [goRowSelect];
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=1;
  bersihCell;
end;

procedure TFpemakainBarang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFpemakainBarang.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if MessageDlg('Yakin menutup program?',
       mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
    CanClose := True;

 end ELSE
 CanClose := False;
end;

procedure TFpemakainBarang.FormCreate(Sender: TObject);
begin

  CreateGrid;

end;

procedure TFpemakainBarang.FormShow(Sender: TObject);
begin
  aList := TStringLIst.Create;
  stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
  dt1.Date := now;
  OpenTable(dm.Q1,['gudangjual'],'profile');
  cbGudang.ItemIndex := idxCmb(cbGudang,GetValInt(dm.Q1,'gudangjual'));
end;



function TFpemakainBarang.Header(txt: string): string;
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

procedure TFpemakainBarang.HitungSubtotal(AROW:Integer);
var
  Harga , Jumlah ,SubTotal : Real;
  isiJual : Real;
  FixHarga : Real;
begin
  with sg1 do begin
    Jumlah       := StrToFloatDef(koma(Cells[5,aRow]),0);
    Harga        := StrToFloatDef(nilai(Cells[3,aRow]),0);
    if CheckStok(sg1.Cells[8,aRow],StrToIntDef(koma(Cells[5,aRow]),0)) = False then
    begin
            Error('Stok tidak mencukupi');

            sg1.Cells[5,aRow] := '0';

            Cells[6,aRow] := GetRupiah(FloatToStr(0));
            Cells[7,aRow] := GetRupiah(FloatToStr(0));
            Exit;
    end;
    isiJual      := CariIsi(Cells[1,aRow],Cells[4,aRow]) * Jumlah;

    SubTotal     := Harga * Jumlah;

    Cells[6,aRow] := GetRupiah(FloatToStr(Subtotal));
    Cells[7,aRow] := GetRupiah(FloatToStr(isiJual));
  end;
end;

procedure TFpemakainBarang.HitungTotal;

begin
  Esubtotal.Text := GetRupiah(SumGrid(sg1,6));

end;

function TFpemakainBarang.nominalBkp: real;
var
  i : integer;
  Subtotal : Real;
begin
  Subtotal := 0;

  for i := 1 to sg1.RowCount -1 do begin

    if (UPPERCASE(sg1.Cells[9,i]) = 'TRUE') and (sg1.Cells[6,i] <> '') then
       Subtotal := Subtotal + CellF(sg1.Cells[6,i]);

  end;

  result := Subtotal / ((asPpn + 100) / 100);

end;

function TFpemakainBarang.Posisi(kodebarcode: String;stn:string): integer;
var
  i:integer;
  hasil : integer;
begin
  for i := 1 to sg1.RowCount-1  do begin
    if (sg1.Cells[1,i] = kodebarcode) and (sg1.Cells[4,i] = stn) then begin
      hasil  := i;

      Break;
    end else
      hasil  := 0;
  end;
  Result := hasil;
end;

procedure TFpemakainBarang.printdirect(Nofaktur: string;CP : Boolean);
var
  i : integer;
  total : string;
  diskon : string;
  grandtotal : string;
  nontunai : string;
  Bayar : String;
  Kembali : String;


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

function TFpemakainBarang.PrinterInvoice: String;
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

function TFpemakainBarang.PrinterStruk: String;
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

procedure TFpemakainBarang.PrintStruck(Nota: String);
const
  SQLNota = ' SELECT                     '+
            '      p.nobukti,            '+
            '      p.tgl,                '+
            '      p.total,              '+
            '      u.username,           '+
            '      p.keterangan          '+
            '    FROM                    '+
            '      pemakainbarang p      '+
            '      LEFT JOIN m_user u    '+
            '        ON p.`iduser` = u.`iduser` ';

begin
    ExQry(dtrx.Qpemakainbarang,SQLNota+' WHERE nobukti="'+nota+'"',True);

    dtrx.Qdetailpemakainbarang.Active       := False;
    dtrx.Qdetailpemakainbarang.MasterSource := dtrx.Dpemakaianbarang;
    dtrx.Qdetailpemakainbarang.MasterFields := 'nobukti';
    dtrx.Qdetailpemakainbarang.DetailFields := 'nobukti';
    dtrx.Qdetailpemakainbarang.Active       := True;

    Dlaporan.Fr1.LoadFromFile(aPathRpt+'\cetakPemakainBarang.fr3');
    Dlaporan.Fr1.PrepareReport(True);
    Dlaporan.Fr1.PrintOptions.ShowDialog := True;
    Dlaporan.Fr1.ShowReport();
end;

function TFpemakainBarang.RataKanan(pjg: Integer; txt: string): string;
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

procedure TFpemakainBarang.ReplaceData;
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

  end;
end;

procedure TFpemakainBarang.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [3,6] then
       HAlign := taRightJustify
    else if ACOl in [4, 5 ] then
       HAlign := taCenter;
  end;

end;

procedure TFpemakainBarang.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if (ACol in [3,5,6]) then
      begin
        isFloat := True;
        FloatFormat :='%.0n';
      end
  else
       isFloat := False;
end;

procedure TFpemakainBarang.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 pas : Integer;
 hrg : Real;
 isiJual,jml,qty : Real;
 satuan :String;
begin
  if  (Sg1.Col = 1) and (key = 13)  then BEGIN
       if COPY(sg1.Cells[1,sg1.Row],1,1) = '+' then begin
          jml                     := StrToFloatDef(StringReplace(sg1.Cells[1,sg1.Row],'+','',[rfReplaceAll]),0);
          sg1.Cells[5,sg1.Row -1] := Koma(FloatToStr(jml));

          HitungSubtotal(sg1.Row -1);;
          HitungTotal;
          bersihCell;
       end else begin
       if (sg1.Cells[1,sg1.Row] <> '') then begin

            ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE (m.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" '+
            ' OR b.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" OR b.kodebarang="'+sg1.Cells[1,Sg1.Row]+'" '+
            ' OR b.namabarang LIKE "%'+sg1.Cells[1,sg1.Row]+'%")',True);

            if Dm.Q1.RecordCount > 1 then begin
               ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE (namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
               ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'") GROUP BY b.kodebarang',True);
               FcariBarang.Show;
               FcariBarang.isFormTransaksi := 8;

            end else begin

                sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'kodebarcode');
                sg1.Cells[8,sg1.Row] := GetVal(dm.Q1,'kodebarang');
                sg1.Cells[2,sg1.Row] := GetVal(dm.Q1,'namabarang');
                sg1.Cells[4,sg1.Row] := GetVal(dm.Q1,'satuan');
                sg1.Cells[3,sg1.Row] := GetValR(dm.Q1,'hargabeli');

                sg1.Cells[7,sg1.Row] := '1';

                pas    := Posisi(UPPERCASE(GetVal(dm.Q1,'kodebarcode')),sg1.Cells[4,sg1.Row]);


                if (pas <> 0) and (pas <> sg1.Row) then begin

                   sg1.Cells[5,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[5,pas],0)+1);

                    HitungSubtotal(pas);


                   if  sg1.Cells[1,sg1.Row +1] <>'' then begin
                       BersihCell;
                       ReplaceData;
                       sg1.RowCount    := sg1.RowCount -1;
                       Focus;
                   end else
                   if (sg1.Row = sg1.RowCount -2) and (sg1.Cells[1,sg1.RowCount -1]='')  then begin
                       BersihCell;
                       sg1.RowCount    := sg1.RowCount -1;
                       Focus;
                   end else
                   if sg1.Cells[1,sg1.Row]=sg1.Cells[1,sg1.RowCount -1] then
                      BersihCell;

                      Focus;
                end else
                begin
                  HitungSubtotal(sg1.Row);

                  if sg1.Cells[1,sg1.RowCount -1] <>'' then
                  begin
                    sg1.RowCount := sg1.RowCount + 1;
                    Focus;
                    BersihCell;
                  end;

                  Focus;
                end;
                HitungTotal;
            end;
          end else
          begin

             ExQry(dm.QcariBarang,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
            ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'") GROUP BY b.kodebarang',True);
            FcariBarang.Show;
            FcariBarang.isFormTransaksi := 8;
          end;
      end;
      HitungTotal;
    end else begin
          if ( sg1.Col in [2..4] ) and (key = 13) then
             begin
              sg1.Row := sg1.Row;
              sg1.Col := sg1.Col + 1
             end
          else If ( sg1.Col in [5] ) and (key = 13) then
              Focus;
    end;


    case KEy of
   VK_INSERT : begin
                 if sg1.Cells[1,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin
                      ExQry(dm.QMultiSatuan,'SELECT s.*,(b.hargabeli * s.isi) as hargabeli FROM multisatuan s left join barang b '+
                      ' ON b.kodebarang=s.kodebarang WHERE b.kodebarang="'+sg1.Cells[8,sg1.Row]+'"',True);
                      if DM.QMultiSatuan.IsEmpty then
                         Warning('Tidak ada multi satuan')
                      else begin
                         FpilihSatuan.Show;
                         FpilihSatuan.cHargabeli.Visible := False;
                         FpilihSatuan.cHarga.Visible     := True;

                         FpilihSatuan.isFormSatuan := 0;
                      end;
                    end;
               end;
   end;
end;

procedure TFpemakainBarang.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [3,5]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFpemakainBarang.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if sg1.Col in [3,5]  then begin
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


end;

procedure TFpemakainBarang.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);

begin
   OpenTable(dm.Q1,['editharga'],'m_user WHERE iduser="'+stat1.Panels[3].Text+'"');
   if ACol in [1,3,5] then begin
      if (ACol = 3) and (GetValBol(dm.Q1,'editharga') = False) then
         sg1.Options := sg1.Options -[goEditing] else

      sg1.Options := sg1.Options +[GoEditing];
   end
  else
    sg1.Options := sg1.Options -[goEditing];
end;

procedure TFpemakainBarang.Simpan;
var
  x : integer;
  KodeBarang : string;
  hpp : real;

  totalHpp      : Real;
  Ppn : Real;

begin


    dm.Q1.Connection.StartTransaction;
    try
      if nominalBkp > 0 then
         Ppn := nominalBkp * asPPn / 100 else
         Ppn := 0;
      addParam('nobukti',   Enobukti.Text,            aList,'str');
      addParam('tgl',      frmTgl(dt1.Date),     aList,'date');
      addParam('iduser',   stat1.Panels[3].Text,aList,'str');
      addParam('total',    SumGrid(sg1,6),aList,'str');
      addParam('nominalbkp',  StrToDecimal(FloatToStr(nominalBkp+Ppn)),aList,'str');
      addParam('nominalnonbkp',StrToDecimal(FloatToStr(Esubtotal.AsFLoat - (nominalBkp+Ppn))),aList,'str');
      addParam('keterangan',Eketerangan.Text,aList,'str');

       OpenTable(dm.Q2,['idpemakain'],'pemakainbarang where nobukti="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'pemakainbarang',alist)
      else
         UpdatePOST(dm.Q1,'pemakainbarang',alist,'idpemakain',GetVal(dm.Q2,'idpemakain'));


      ExQry(dm.Q1,'DELETE FROM kartustok WHERE nobukti="'+Enobukti.Text+'"',False);
      ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+Enobukti.Text+'"',False);
      ExQry(dm.Q1,'DELETE FROM detailpemakainbarang WHERE nobukti="'+Enobukti.Text+'"',False);



      if (sg1.Cells[1,sg1.RowCount -1] <> '') and (sg1.Cells[6,sg1.RowCount -1] <> '') then
          sg1.RowCount := sg1.RowCount + 1;

      for x := 1 to sg1.RowCount -1 do
        begin

          if (sg1.Cells[1,x] <> '') and (sg1.Cells[6,x]<>'') then
          begin


              openTable(dm.Q2,['kodebarang','hargabeli'],'hargabelirata where kodebarang="'+sg1.cells[8,x]+'"');
              KodeBarang := Getval(dm.Q2,'kodebarang');
              hpp        := GetValF(dm.Q2,'hargabeli');
          //    ShowMessage(kodebarang);
              addParam('nobukti',  Enobukti.Text,          aList,'str');
              addParam('kodebarang',  KodeBarang,             Alist,'str');
              addParam('satuan',      sg1.Cells[4,x],         Alist,'str');
              addParam('harga',       nilai(sg1.Cells[3,x]),  Alist,'str');
              addParam('jumlah',      nilai(sg1.Cells[5,x]),   Alist,'str');
              addParam('subtotal',    nilai(sg1.Cells[6,x]),  Alist,'str');
              addParam('isi',         nilai(sg1.Cells[7,x]), Alist,'str');
              addParam('idgudang',    GetIdcmb(cbGudang),     Alist,'str');

              Post(dm.Q1,'detailpemakainbarang',aList);


              totalHpp := totalHpp + (hpp * CellF(sg1.Cells[5,x]));
              PostingKartuStok(dm.Q1,Enobukti.Text,
                              dt1.Date,KodeBarang,GetIdcmb(cbGudang),
                              sg1.Cells[4,x], hpp,
                              'KELUAR',CellF(sg1.Cells[5,x]),
                              'PEMAKAIN BARANG NO BUKTI ['+Enobukti.Text+']');





          end else
          if (sg1.Cells[1,x] = '') and (sg1.Cells[6,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
            MessageBox(Handle,'Kode Barcode Harus Di Isi !! '+#13+' Silahkan Isi terlebih Dahulu !! '+#13+
                       'Atau batalkan item dengan menekan tombol [ DELETE ]','ERROR',MB_ICONERROR);
            sg1.Row := x;
            sg1.Col := 1;
            dm.Q1.Connection.Rollback;
            Abort;
          end;
        end;



               PostingJurnal(dm.Q1,'502.014',
                               Enobukti.Text,
                               'PEMAKAIAN BARANG NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,totalHpp,0,0,'D');

               PostingJurnal(dm.Q1,'103.001',
                               Enobukti.Text,
                               'PEMAKAIAN BARANG NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,totalHpp,0,0,'K');


          dm.Q1.Connection.Commit;

          PrintStruck(Enobukti.Text);
          Informasi('Data berhasil disimpan');
          TampilAwal;
          Focus;
          isEdit := False;
      except
        dm.Q1.Connection.Rollback;
      end;

end;

function TFpemakainBarang.Sparator(txt: string): string;

var
  I: Integer;
  hasil : String;
begin
  hasil:='';
  for I := 1 to 40 do
     hasil := hasil +txt;
  Result := hasil;


end;

procedure TFpemakainBarang.TampilAwal;
begin
  ClearText(Self);
  CreateGrid;

  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  Enobukti.Text  := GetCode(dm.Q1,'pemakainbarang','nobukti','PR'+setIdKom);
  setTanggal(Self);
  bersihkanGrid;
  sNota :='';
  dt1.Date := now;
  OpenTable(dm.Q1,['gudangjual'],'profile where idprofil=1');
  cbGudang.ItemIndex := 1;




end;

function TFpemakainBarang.TipeStruk: String;
var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(apathExe+'SetKasir.ini');
  try
     Result := aIni.ReadString('KOMPUTER','TipeStruk','STRUK');
  finally
    aIni.Free;

  end;
end;
function TFpemakainBarang.ToFloat(ACol, ARow: integer): Extended;
begin
if not ACOl in [3] then
    Result := StrToFloatDef(koma(sg1.Cells[aCol,aRow]),0)
  else
    Result := StrToFloatDef(nilai(sg1.Cells[aCol,aRow]),0);
end;

function TFpemakainBarang.vItems(Hrg, qty, stn, subt: string): String;
var

  harga : Integer;
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

function TFpemakainBarang.vTotal(lbl, vValue: string): string;
var
  i : integer;
  vlbl : Integer;
  jml : integer;

  Lebar : integer;
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
