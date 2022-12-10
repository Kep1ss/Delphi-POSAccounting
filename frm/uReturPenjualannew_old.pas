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
  dxSkinOffice2016Colorful, dxSkinMoneyTwins;

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
    Label13: TLabel;
    EScanBarcode: TcxTextEdit;
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
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EScanBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBukaPendingClick(Sender: TObject);
    procedure btnFocusClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCopyNotaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CInvoiceKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCariClick(Sender: TObject);
  private
    { Private declarations }

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
    function  GetHarga(kdBarcode:string) : Extended;
    function  cekQty(kodebarcode:String;jml:real):String;
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
    { Public declarations }
  end;
  const
    _SQLCaribarang =' SELECT                 '+
                   '   b.idbarang,          '+
                   '   b.kodebarang,        '+
                   '   b.kodebarcode,       '+
                   '   b.namabarang,        '+
                   '   k.idkategori,        '+
                   '   k.namakategori,      '+
                   '   b.satuanbeli,        '+
                   '   b.satuanjual,        '+
                   '   b.isi,               '+
                   '   b.stokmin,           '+
                   '   b.stokmax,           '+
                   '   b.hargabeli,         '+
                   '   b.margin,            '+
                   '   b.hargaecer,         '+
                   '   b.hargagrosir,       '+
                   '   b.hargapartai,       '+
                   '   b.diskonpersen,      '+
                   '   b.diskonrupiah,      '+
                   '   b.ppn                '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori';

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
  ExQry(dm.Qcaribarang,_SQLcariStok+' WHERE MONTH(ks.tgl)="'+intToStr(MonthOf(now))+'" '+
   ' AND ks.idgudang="'+GetIdcmb(cbGudang)+'" GROUP BY b.kodebarang',True);
   FcariBarang.Show;
  FcariBarang.isFormTransaksi := 6;
end;

procedure TFreturJualNew.btnCariClick(Sender: TObject);
begin
   ExQry(dtrx.Qpenjualan,FcariPenjualan.SQLpenjualan + ' LEFT JOIN penjualandetil dt '+
                     ' ON dt.`fakturjual`=p.`fakturjual` WHERE dt.jumlah > dt.`jumlahretur` '+
                     ' GROUP BY p.`fakturjual`',True);
   FcariPenjualan.Show;
end;

procedure TFreturJualNew.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[10,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
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
  FpasswordAdmin.Show;
  FpasswordAdmin.isFOrmPassword := 1;

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

function TFreturJualNew.cekQty(kodebarcode: String; jml: real): String;
var
  q1,Q2,Q3 : real;
  hrg : string;
  harga : String;
begin
      ExQry(dm.Q3,'select q.qty1,q.qty2,q.qty3,q.harga1,q.harga2,q.harga3 '+
      ' from quantity q '+
      ' left join barang b on q.kodebarcode=b.kodebarcode '+
      ' where b.kodebarcode="'+kodebarcode+'"',True);
      if dm.Q3.IsEmpty = False then begin
      Q1    := dm.Q3.FieldByName('qty1').AsFloat;
      Q2    := dm.Q3.FieldByName('qty2').AsFloat;
      Q3    := dm.Q3.FieldByName('qty3').AsFloat;
      harga := FloatToStr(GetHarga(kodebarcode));


      if (Q1 <>0) and (q2 =0) and (q3 =0) then begin
          if (jml >= Q1) then
              hrg := GetRupiah(dm.Q3.FieldByName('harga1').AsString)
          else
          if (jml < Q1) then
              hrg := GetRupiah(harga);
      end else
      if (Q1 <> 0) and (Q2 <>0) and (Q3 =0) then  begin
          if (jml < Q1) and (jml < Q2) then
              hrg := GetRupiah(harga)
          else
          if (jml >= Q1) and (jml < Q2) then
              hrg := GetRupiah(dm.Q3.FieldByName('harga1').AsString)
          else
          if (jml > Q1 ) and (jml >= Q2) then
              hrg := GetRupiah(dm.Q3.FieldByName('harga2').AsString);
      end
      else
      if (Q1<>0) and (Q2<>0) and (Q3<>0) then
      begin
        if (jml < Q1) and (jml <Q2) and (jml <Q3) then
          hrg := GetRupiah(harga)
        else
        if (jml >= Q1) and (jml <Q2) and (jml < Q3) then
          hrg := GetRupiah(dm.Q3.FieldByName('harga1').AsString)
        else
        if (jml > Q1) and (jml >= Q2) and (jml < Q3) then
          hrg := GetRupiah(dm.Q3.FieldByName('harga2').AsString)
        else
        if (jml > Q1) and (jml > Q2) and (jml >=Q3) then
          hrg := GetRupiah(dm.Q3.FieldByName('harga3').AsString);
      end else
      if (Q1 =0) and (Q2=0) and (Q3=0) then
        hrg := GetRupiah(harga);
     end else
     begin
        hrg := GetRupiah(FloatToStr(GetHarga(kodebarcode)));

     end;

    Result := hrg;
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

    ColCount    := 12;
    RowCount    := 2 ;



    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'HARGA';
    Cells[4,0]  := 'DISC. (1)';
    Cells[5,0]  := 'DISC. (2)';
    Cells[6,0]  := 'DISC. (3)';
    Cells[7,0]  := 'SATUAN';
    Cells[8,0]  := 'QTY';
    Cells[9,0]  := 'SUBTOTAL ';
    Cells[10,0]  := 'Isi ';
    Cells[11,0]  := 'hpp ';

    ColWidths[0]:= 50;
    ColWidths[1]:= 150;
    ColWidths[2]:= 250;
    ColWidths[3]:= 60;
    ColWidths[4]:= 60;
    ColWidths[5]:= 60;
    ColWidths[6]:= 60;
    ColWidths[7]:= 70;
    ColWidths[8]:= 70;
    ColWidths[9]:= 120;
    ColWidths[10]:= 0;
    ColWidths[11]:= 0;


    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;
 end;

end;

procedure TFreturJualNew.EScanBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  i : integer;

  status : string;
begin
  case Key of
  VK_RETURN : begin
                 OpenTable(dm.Q1,['kodepelanggan','namapelanggan','idjenispelanggan','poin'],'pelanggan WHERE kodepelanggan="'+EScanBarcode.Text+'"');
                 if dm.Q1.IsEmpty = False then begin
                    ENamaCust.Text := GetVal(dm.Q1,'namapelanggan')+' POIN : ['+GetValR(dm.Q1,'poin')+']';
                    EkodeCust.Text := GetVal(dm.Q1,'kodepelanggan');
                    status         := GetVal(dm.Q1,'idjenispelanggan');
                    for i := 1  to sg1.RowCount -1 do
                      begin
                        exQry(dm.Q3,'select hargaecer,hargagrosir,hargapartai,hargapartai4,hargapartai5 '+
                                          'From barang where kodebarcode="'+sg1.Cells[1,i]+'"',True);

                          if (UpperCase(status) ='5') then begin
                           if (dm.Q3.Fields[1].AsFloat <> 0) then
                               sg1.Cells[3,i]    := GetRupiah(dm.Q3.Fields[1].AsString)
                              else
                               sg1.Cells[3,i]    := GetRupiah(dm.Q3.Fields[0].AsString);
                          end else
                          if (UpperCase(status) ='4') then begin
                           if dm.Q3.Fields[0].AsFloat <> 0 then
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString)
                              else
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString);
                          end else
                          if UpperCase(status) ='6' then begin
                           if dm.Q3.Fields[2].AsFloat <> 0 then
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[2].AsString)
                              else
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString);
                          end;
                           if UpperCase(status) ='7' then begin
                           if dm.Q3.Fields[3].AsFloat <> 0 then
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[3].AsString)
                              else
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString);
                          end;
                           if UpperCase(status) ='8' then begin
                           if dm.Q3.Fields[4].AsFloat <> 0 then
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[4].AsString)
                              else
                              sg1.Cells[3,i]  := GetRupiah(dm.Q3.Fields[0].AsString);
                          end;

                        HitungSubtotal(i);


                    end;
                    HitungTotal;
                    Focus;
                 end else
                 begin
                   btnCariPelanggan.Click;
                 end;

              end;
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
  OpenTable(dm.Q1,['gudangjual'],'profile where idprofil=1');
  cbGudang.ItemIndex := idxCmb(cbGudang,dm.Q1.Fields[0].AsInteger);
  Focus;
end;

function TFreturJualNew.GetHarga(kdBarcode: string): Extended;
var
  qry   : string;
  stts  : string;
begin

  qry   := 'SELECT idjenispelanggan from pelanggan where kodepelanggan="'+Ekodecust.Text+'"';
  ExQry(dm.Q3,qry,True);
  stts  := dm.Q3.Fields[0].AsString;

  qry   := ' SELECT hargaecer,hargagrosir,hargapartai,hargapartai4,hargapartai5 FROM barang where '+
           ' kodebarcode="'+kdBarcode+'" ';

  ExQry(dm.Q2,qry,True);

  if (UpperCase(stts) ='5') then begin
     if (dm.Q2.Fields[1].AsFloat <> 0) then
        Result    := dm.Q2.Fields[1].AsFloat
     else
        Result    := dm.Q2.Fields[0].AsFloat;
  end else
  if (UpperCase(stts) ='4') then begin
     if dm.Q2.Fields[0].AsFloat <> 0 then
        Result := dm.Q2.Fields[0].AsFloat
     else
        Result := dm.Q2.Fields[0].AsFloat;
  end else
  if UpperCase(stts) ='6' then begin
     if dm.Q2.Fields[2].AsFloat <> 0 then
        Result := dm.Q2.Fields[2].AsFloat
     else
        Result := dm.Q2.Fields[0].AsFloat;
  end;
  if UpperCase(stts) ='7' then begin
     if dm.Q2.Fields[3].AsFloat <> 0 then
        Result := dm.Q2.Fields[3].AsFloat
     else
        Result := dm.Q2.Fields[0].AsFloat;
  end;
  if UpperCase(stts) ='8' then begin
     if dm.Q2.Fields[4].AsFloat <> 0 then
        Result := dm.Q2.Fields[4].AsFloat
     else
        Result := dm.Q2.Fields[0].AsFloat;
  end;
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
  Harga , Jumlah , DiskonPersen,SubTotal,Diskon2,Diskon3 : Real;
  isiJual : Real;
  hargaDiskon1,HargaDiskon2,HargaDiskon3,FixHarga : Real;
begin
  with sg1 do begin
    Harga        := StrToFloatDef(nilai(Cells[3,aRow]),0);
    Jumlah       := StrToFloatDef(nilai(Cells[8,aRow]),0);
    DiskonPersen := StrToFloatDef(koma(Cells[4,aRow]),0);
    Diskon2      := StrToFloatDef(koma(Cells[5,aRow]),0);
    Diskon3      := StrToFloatDef(koma(Cells[6,aRow]),0);

    hargaDiskon1 := Round(Harga * DiskonPersen / 100);
    FixHarga     := Harga - hargaDiskon1;
    hargaDiskon2 := Round(FixHarga * Diskon2 / 100);
    FixHarga     := FixHarga - hargaDiskon2;
    hargaDiskon3 := Round(FixHarga * Diskon3 / 100);
    FixHarga     := FixHarga - hargaDiskon3;


    isiJual      := CariIsi(Cells[1,aRow],Cells[6,aRow]) * Jumlah;

    SubTotal     := FixHarga * Jumlah;

    Cells[9,aRow] := GetRupiah(FloatToStr(Subtotal));
    Cells[10,aRow] := GetRupiah(FloatToStr(isiJual));
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

    ColCount    := 12;
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

  end;
end;

procedure TFreturJualNew.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [3,4,5,6,8,9,10] then
       HAlign := taRightJustify
    else if ACOl in [ 7 ] then
       HAlign := taCenter;
  end;

end;

procedure TFreturJualNew.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if (ACol in [4,5,6]) then
      begin
        isFloat := True;
        FloatFormat :='%.2n';
      end
  else if (ACol in [3,8,9] )then begin
      IsFloat := True;
      FloatFormat := '%.0n';
  end

  else
       isFloat := False;
end;

procedure TFreturJualNew.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 pas : Integer;
 hrg : Real;
 isiJual,jml,qty : Real;
 ppn : Real;
begin
  if  (Sg1.Col = 1) and (key = 13)  then BEGIN
       if COPY(sg1.Cells[1,sg1.Row],1,1) = '+' then begin
          jml := StrToFloatDef(StringReplace(sg1.Cells[1,sg1.Row],'+','',[RfReplaceAll]),0);
          sg1.Cells[8,sg1.Row -1] := Koma(FloatToStr(jml));

          HitungSubtotal(sg1.Row -1);;
          HitungTotal;
          bersihCell;
       end else begin
       if (sg1.Cells[1,sg1.Row] <> '') then begin

            ExQry(dm.Q1,_SQLCaribarang+' WHERE b.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'"',True);

            if Dm.Q1.IsEmpty then begin
               ExQry(dm.Qcaribarang,_SQLcariStok+' WHERE namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
               ' AND MONTH(ks.tgl)="'+intToStr(MonthOf(now))+'" AND ks.idgudang="'+Getidcmb(cbGudang)+'" '+
               ' or kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'" AND MONTH(ks.tgl)="'+intToStr(MonthOf(now))+'" '+
               ' AND ks.idgudang="'+Getidcmb(cbGudang)+'"  GROUP BY b.kodebarang',True);
               FcariBarang.Show;
               FcariBarang.isFormTransaksi := 6;

            end else begin

               pas    := Posisi(UPPERCASE(GetVal(dm.Q1,'kodebarcode')));

               if (pas <> 0) and (pas <> sg1.Row) then begin

                  ppn               := GetValF(dm.Q1,'ppn');
                  sg1.Cells[7,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[7,pas],0)+1);

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

                  sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                  sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'kodebarcode');
                  sg1.Cells[2,sg1.Row] := GetVal(dm.Q1,'namabarang');
                  hrg                  := GetHarga(GetVal(dm.Q1,'kodebarcode'));
                  sg1.Cells[3,sg1.Row] := GetRupiah(FloatTostr(hrg));
                  sg1.Cells[4,sg1.Row] := '';
                  sg1.Cells[5,sg1.Row] := '';
                  sg1.Cells[6,sg1.Row] := '';
                  sg1.Cells[7,sg1.Row] := GetVal(dm.Q1,'satuanjual');
                  sg1.Cells[8,sg1.Row] := '1';
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

           ExQry(dm.Qcaribarang,_SQLcariStok+' WHERE namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
               ' AND MONTH(ks.tgl)="'+intToStr(MonthOf(now))+'" AND ks.idgudang="'+Getidcmb(cbGudang)+'" '+
               ' or kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'" AND MONTH(ks.tgl)="'+intToStr(MonthOf(now))+'" '+
               ' AND ks.idgudang="'+Getidcmb(cbGudang)+'"  GROUP BY b.kodebarang',True);
               FcariBarang.Show;
                 FcariBarang.isFormTransaksi := 6;
          end;
      end;
    end else begin
          if ( sg1.Col in [2..7] ) and (key = 13) then
             begin
              sg1.Row := sg1.Row;
              sg1.Col := sg1.Col + 1
             end
          else If ( sg1.Col in [8] ) and (key = 13) then               
              Focus;
    end;


    case KEy of
   VK_INSERT : begin
                 if sg1.Cells[1,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin
                      ExQry(dm.QMultiSatuan,'SELECT * FROM multisatuan mt left join barang b '+
                      ' ON b.kodebarang=mt.kodebarang WHERE b.kodebarcode="'+sg1.Cells[1,sg1.Row]+'"',True);
                      if DM.QMultiSatuan.IsEmpty then
                         Warning('Tidak ada multi satuan')
                      else
                         FpilihSatuan.Show;
                         FpilihSatuan.isFormSatuan := 6;
                    end;
               end;

   end;
end;

procedure TFreturJualNew.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [4,5,6,8,9,10]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFreturJualNew.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if sg1.Col in [4,5,6,8,9,10]  then begin
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
   if ACol in [1,4,5,6,8] then
    sg1.Options := sg1.Options +[GoEditing]
  else
    sg1.Options := sg1.Options -[goEditing];
end;

procedure TFreturJualNew.Simpan;
var
  x : integer;
  idpelanggan,KodeBarang : string;
  hpp,hargajual : real;
  TotalHargaJual,TotalHpp : Real;
  isKredit : Boolean;

begin


    idpelanggan := getData(dm.Q2,'pelanggan where kodepelanggan="'+EkodeCust.Text+'"','idpelanggan');

    ExQry(dm.Q2,'SELECT pembayaran FROM penjualan WHERE fakturjual="'+EFakturPenjualan.Text+'"',True);
    isKredit := GetValInt(dm.Q2,'pembayaran') = 1;
    dm.Q1.Connection.StartTransaction;
    try
      TotalHargaJual := 0;
      TotalHpp       := 0;
      addParam('nobukti',       Enobukti.Text,            aList,'str');
      addParam('tgl',           frmTgl(DtBukti.Date),     aList,'date');
      addParam('idpelanggan',   idpelanggan,              aList,'str');
      addParam('iduser',        Fmain.sbr1.Panels[1].Text,aList,'str');
      addParam('nobuktijual',   EFakturPenjualan.Text,    aList,'str');
      addParam('total',         SumGrid(sg1,9),aList,'str');
      addParam('keterangan',    Eket.Text,aList,'str');

      OpenTable(dm.Q2,['idreturjual'],'returpenjualan where nobukti="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'returpenjualan',alist)
      else
         UpdatePOST(dm.Q1,'returpenjualan',alist,'idreturjual',GetVal(dm.Q2,'idreturjual'));

      ExQry(dm.Q1,'DELETE FROM rekapjualretur WHERE nobukti="'+Enobukti.Text+'"',False);

      addParam('nobukti',       Enobukti.Text,aList,'str');
      addParam('tgl',           frmTgl(DtBukti.Date),     aList,'date');
      addParam('idpelanggan',   idpelanggan,              aList,'str');
      addParam('totalreturpenjualan',SumGrid(sg1,9),aList,'str');

      Post(dm.Q1,'rekapjualretur',alist);

      for x := 1 to sg1.RowCount -1 do
        begin

          if (sg1.Cells[1,x] <> '') and (sg1.Cells[2,x]<>'') then
          begin


              openTable(dm.Q2,['kodebarang','hargabeli'],'barang where kodebarcode="'+sg1.cells[1,x]+'"');
              KodeBarang := Getval(dm.Q2,'kodebarang');
              hargajual  := StrToFloatDef(nilai(sg1.Cells[9,x]),0) / StrToFloatDef(nilai(sg1.Cells[10,x]),0);
              addParam('nobukti',     Enobukti.Text,          aList,'str');
              addParam('kodebarang',  KodeBarang,             Alist,'str');
              addParam('satuan',      sg1.Cells[7,x],         Alist,'str');
              addParam('harga',       StrToDecimal(FloatToStr(hargajual)),  Alist,'str');
              addParam('hpp',         KomaDatabase(sg1.Cells[11,x]),        Alist,'str');
              addParam('jumlah',      KomaDatabase(sg1.Cells[8,x]),   Alist,'str');
              addParam('diskonpersen',KomaDatabase(sg1.Cells[4,x]),   Alist,'str');
              addParam('diskon2',nilai(sg1.Cells[5,x]),  Alist,'str');
              addParam('diskon3',nilai(sg1.Cells[6,x]),  Alist,'str');
              addParam('subtotal',    nilai(sg1.Cells[9,x]),  Alist,'str');
              addParam('isi',         KomaDatabase(sg1.Cells[10,x]), Alist,'str');
              addParam('idgudang',    GetIdcmb(cbGudang),     Alist,'str');

              OpenTable(dm.Q2,['idjualdetail'],
              'detailreturjual WHERE kodebarang="'+kodebarang+'" '+
              'AND nobukti="'+Enobukti.Text+'"');

              if dm.Q2.IsEmpty then
                 Post(dm.Q1,'detailreturjual',aList)
              else
                 updatePOST(dm.Q1,'detailreturjual',aList,'idjualdetail',GetVal(dm.Q2,'idjualdetail'));

              ExQry(dm.Q1,'UPDATE penjualandetil SET jumlahretur=jumlahretur+"'+koma(sg1.Cells[8,x])+'" '+
              ' WHERE fakturjual="'+EFakturPenjualan.Text+'" AND kodebarang="'+kodebarang+'"',False);




              PostingKartuStok(dm.Q5,Enobukti.Text,DtBukti.Date,
                              KodeBarang,GetIdcmb(cbGudang),sg1.Cells[7,x],
                              hpp,'MASUK',CellF(sg1.Cells[10,x]),
                              'RETUR PENJUALAN NO BUKTI ['+Enobukti.Text+']');

              TotalHargaJual := TotalHargaJual + CellF(sg1.Cells[9,x]);
              TotalHpp       := TotalHpp + (CellF(sg1.Cells[11,x]) * CellF(sg1.Cells[8,x]));
          end;
        end;

          ExQry(dm.Q1,'UPDATE penjualan SET total=(Select SUM((harga-diskonrupiah) * (jumlah - jumlahretur)) '+
              ' FROM penjualandetil WHERE fakturjual="'+EFakturPenjualan.TExt+'" ),grandtotal=total -diskon'+
              ' WHERE fakturjual="'+EFakturPenjualan.Text+'" ',False);

          ExQry(dm.Q3,'SELECT grandtotal FROM penjualan WHERE fakturjual="'+EFakturPenjualan.Text+'"',True);

          if dm.Q3.Fields[0].AsFloat > 0 then
              ExQry(dm.Q1,'UPDATE piutang SET piutang.piutang="'+dm.Q3.Fields[0].AsString+'", '+
                  ' kekurangan=IF(dibayar < piutang.piutang,piutang.piutang-dibayar,0) '+
                  ' WHERE fakturjual="'+EFakturPenjualan.Text+'" ',False)
          else
             ExQry(dm.Q1,'DELETE FROM piutang WHERE fakturjual="'+EFakturPenjualan.Text+'"',False);

        PostingJurnal(dm.Q5,'103.001',Enobukti.Text,
                              'RETUR PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                              DtBukti.Date,TotalHpp,'D');

        if isKredit then
           PostingJurnal(dm.Q5,'104.001',Enobukti.Text,
                              'RETUR PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                              DtBukti.Date,TotalHargaJual,'K')
        else
           PostingJurnal(dm.Q5,'101.003',Enobukti.Text,
                              'RETUR PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                              DtBukti.Date,TotalHargaJual,'K');
        PostingJurnal(dm.Q5,'401.001',Enobukti.Text,
                              'RETUR PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                              DtBukti.Date,TotalHargaJual,'D');
        PostingJurnal(dm.Q5,'501.001',
                              Enobukti.Text,
                              'RETUR PENJUALAN NO BUKTI ['+Enobukti.Text+']',DtBukti.Date,TotalHpp,'K');
        dm.Q1.Connection.Commit;
      except
        dm.Q1.Connection.Rollback;
        ShowMessage('Error');
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

  Lebar : integer;
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
