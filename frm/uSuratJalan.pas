unit uSuratJalan;

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
  TFSuratJalan = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Enobukti: TcxTextEdit;
    DtBukti: TcxDateEdit;
    Label11: TLabel;
    Label12: TLabel;
    cbGudang: TcxComboBox;
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnCariBarang: TcxButton;
    btnHapus: TcxButton;
    cPrint: TcxCheckBox;
    btnFocus: TcxButton;
    stat1: TStatusBar;
    jPrint1: TJPRINTER;
    Label16: TLabel;
    ESales: TcxTextEdit;
    lbl1: TLabel;
    E1: TcxTextEdit;
    lbl2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    EKeterangan: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCariPelangganClick(Sender: TObject);
    procedure btnCariBarangClick(Sender: TObject);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1KeyPress(Sender: TObject; var Key: Char);
    procedure sg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnHapusClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormResize(Sender: TObject);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnBukaPendingClick(Sender: TObject);
    procedure btnFocusClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CInvoiceKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ESalesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    { Public declarations }
  end;


var
  FSuratJalan: TFSuratJalan;
  aList : TStringList;
  sNota       : String;
implementation

{$R *.dfm}

uses udm, uCaripelanggan, uCariBarang, uMainMenu, uBayar, uDlaporan,
  uPendingTransaksi, uCopyNota, uPilihSatuan, uDtrx, uSalesOrder,
  uPasswordAdmin, uCariSales;

procedure TFSuratJalan.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFSuratJalan.bersihkanGrid;
var
  i : integer;
  x : integer;
begin
  for i := 1 to sg1.RowCount -1 do
  for x := 0 to sg1.ColCount -1 do
    sg1.Cells[x,i] := '';
  sg1.RowCount := 2;

end;

procedure TFSuratJalan.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFSuratJalan.btnBukaPendingClick(Sender: TObject);
begin
  FpendingTransaksi.Show;
end;

procedure TFSuratJalan.btnCariBarangClick(Sender: TObject);
begin

   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' GROUP BY b.kodebarang',True);
   FcariBarang.Show;
  FcariBarang.isFormTransaksi := 7;
end;

procedure TFSuratJalan.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[4,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
    begin
      try
        Bersihcell;
        ReplaceData;
        if (sg1.Row <> sg1.RowCount -1) and (sg1.Cells[1,sg1.RowCount -1] = '') then
        sg1.RowCount :=  sg1.RowCount -1;

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

procedure TFSuratJalan.btnSimpanClick(Sender: TObject);
begin
  if sg1.Cells[1,1] = '' then begin
    Error('Belum ada transaksi');
  end else if NOT CheckEdit(Self) then begin


         Simpan;


  end;
end;

procedure TFSuratJalan.btnCariPelangganClick(Sender: TObject);
begin
  Fcaripelanggan.Show;
  ExQry(dm.Qpelanggan,Fcaripelanggan.sqlPelanggan,True);
  Fcaripelanggan.isFormPelanggan := 0;
end;

procedure TFSuratJalan.btnFocusClick(Sender: TObject);
begin
  Focus;
end;

procedure TFSuratJalan.btnTutupClick(Sender: TObject);
begin
  FpasswordAdmin.Show;
  FpasswordAdmin.isFOrmPassword := 1;

end;

procedure TFSuratJalan.BukaLaci;

var
  Path : String;
begin
  Path := ExtractFilePath(Application.ExeName)+'buka.exe';

  ShellExecute(handle,'Open',
    pChar(Path),
    nil,nil,SW_hide);


end;

function TFSuratJalan.CariIsi(barcode, Satuan: string): Extended;
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

function TFSuratJalan.CheckAuto: Boolean;

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

function TFSuratJalan.CheckDirect: Boolean;
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


procedure TFSuratJalan.CInvoiceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    Focus;
end;

procedure TFSuratJalan.CreateGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=0 to RowCount do
    Cells[c,r]:='';

    ColCount    := 6;
    RowCount    := 2 ;



    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'SATUAN';
    Cells[4,0]  := 'QTY';
    Cells[5,0]  := 'X';

    ColWidths[0]:= 50;
    ColWidths[1]:= 150;
    ColWidths[2]:= 250;
    ColWidths[3]:= 60;
    ColWidths[4]:= 60;
    ColWidths[5]:= 0;

    AturGrid(sg1,4);
 end;

end;

procedure TFSuratJalan.ESalesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

    ExQry(dm.Q1,'SELECT * FROM sales WHERE kodesales="'+ESales.Text+'"',True);

    if dm.Q1.IsEmpty  then begin
       ExQry(dm.QSales,'SELECT * FROM sales WHERE namasales like"%'+ESales.Text+'%"',True);

       Fcarisales.Show;
       FcariSales.isFormSales := 1;
    end else
    begin
      ESales.Text := GetVal(dm.Q1,'namasales');
      E1.Text     := GetVal(dm.Q1,'kodesales');
    end;
  end;
end;

procedure TFSuratJalan.Focus;
begin
  sg1.SetFocus;
  sg1.Options := sg1.Options + [goEditing];
  sg1.Options := sg1.Options - [goRowSelect];
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=1;
  bersihCell;
end;

procedure TFSuratJalan.FormActivate(Sender: TObject);
begin
  Focus;
end;

procedure TFSuratJalan.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := True;
end;

procedure TFSuratJalan.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if MessageDlg('Yakin menutup program?',
       mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
    CanClose := True;
    aList.Free;
 end ELSE
 CanClose := False;
end;

procedure TFSuratJalan.FormCreate(Sender: TObject);
begin
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);

  ESales.isCari    := True;
 // AturGrid(sg1,8);
end;

procedure TFSuratJalan.FormResize(Sender: TObject);
begin
  if sg1.Cells[0,0] ='' then begin
     CreateGrid;
     AturGrid(sg1,4);
  end;
end;

procedure TFSuratJalan.FormShow(Sender: TObject);
begin
  aList := TStringLIst.Create;
  OpenTable(dm.Q1,['gudangjual'],'profile where idprofil=1');
  cbGudang.ItemIndex := idxCmb(cbGudang,dm.Q1.Fields[0].AsInteger);
  Focus;
end;




function TFSuratJalan.Header(txt: string): string;
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




function TFSuratJalan.Posisi(kodebarcode: String): integer;
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

procedure TFSuratJalan.printdirect(Nofaktur: string;CP : Boolean);
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

function TFSuratJalan.PrinterInvoice: String;
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

function TFSuratJalan.PrinterStruk: String;
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

procedure TFSuratJalan.PrintStruck(Nota: String);
const
  SQLNota = ' SELECT                                      '+
            '      p.nobukti,                             '+
            '      p.tgl,                                 '+
            '      p.idsales,                             '+
            '      s.namasales,p.keterangan                            '+
            '    FROM                                         '+
            '      suratjalan p                                '+
            '      LEFT JOIN sales s                          '+
            '       ON s.idsales=p.idsales ';

  SQLdetail = ' SELECT                             '+
              '        sj.nobukti,                 '+
              '        sj.kodebarang,              '+
              '        b.namabarang,               '+
              '        sj.satuan,                  '+
              '        sj.jumlah,                  '+
              '        sj.idgudang                 '+
              '      FROM                          '+
              '        detailsuratjalan sj         '+
              '        LEFT JOIN barang b          '+
              '          ON sj.`kodebarang` = b.`kodebarang`  ';


begin
  ExQry(Dlaporan.QSuratJalan,SQLNota+' WHERE nobukti="'+nota+'"',True);

  ExQry(Dlaporan.Qdetailsuratjalan,SQLdetail+' WHERE nobukti="'+nota+'"',True);


    Dlaporan.Fr1.LoadFromFile(aPathRpt+'\suratjalan.fr3');
  //  FMemo(Dlaporan.Fr1,'Lterbilang').Text:= MyTerbilang(Dlaporan.Qpenjualan.FieldByName('grandtotal').AsFloat);
    Dlaporan.Fr1.PrepareReport(True);
    Dlaporan.Fr1.PrintOptions.ShowDialog := True;
    Dlaporan.Fr1.PrintOptions.Printer    := PrinterInvoice;
    if CheckAuto = True then
     Dlaporan.Fr1.Print else
     Dlaporan.Fr1.ShowReport();

end;

function TFSuratJalan.RataKanan(pjg: Integer; txt: string): string;
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

procedure TFSuratJalan.ReplaceData;
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

  end;
end;

procedure TFSuratJalan.sg1KeyDown(Sender: TObject; var Key: Word;
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

         
          bersihCell;
       end else begin
       if (sg1.Cells[1,sg1.Row] <> '') then begin

            ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE b.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" '+
            ' OR b.namabarang LIKE "%'+sg1.Cells[1,sg1.Row]+'%" OR b.kodebarang="'+sg1.Cells[1,sg1.Row]+'"',True);

            if Dm.Q1.IsEmpty then begin
               ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
               ' or kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'%" GROUP BY b.kodebarang',True);
               FcariBarang.Show;
               FcariBarang.isFormTransaksi := 7;

            end else begin

               pas    := Posisi(UPPERCASE(GetVal(dm.Q1,'kodebarcode')));

               if (pas <> 0) and (pas <> sg1.Row) then begin

                  ppn               := GetValF(dm.Q1,'ppn');
                  sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);

            
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
                  sg1.Cells[3,sg1.Row] := GetVal(dm.Q1,'satuanjual');
                  sg1.Cells[4,sg1.Row] := '1';

                  if sg1.Cells[1,sg1.RowCount -1] <>'' then
                  begin
                    sg1.RowCount := sg1.RowCount + 1;
                    Focus;
                    BersihCell;
                  end;

                  Focus;
                end;

            end;
          end else
          begin

             ExQry(dm.QcariBarang,FcariBarang._SQLCaribarang+' WHERE b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
            ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'%" GROUP BY b.kodebarang',True);
            FcariBarang.Show;
            FcariBarang.isFormTransaksi := 7;
          end;
      end;
    end else begin
          if ( sg1.Col in [2..3] ) and (key = 13) then
             begin
              sg1.Row := sg1.Row;
              sg1.Col := sg1.Col + 1
             end
          else If ( sg1.Col in [4] ) and (key = 13) then
              Focus;
    end;



end;

procedure TFSuratJalan.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [4]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFSuratJalan.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin



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

procedure TFSuratJalan.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if ACol in [1,4] then
    sg1.Options := sg1.Options +[GoEditing]
  else
    sg1.Options := sg1.Options -[goEditing];
end;

procedure TFSuratJalan.Simpan;
var
  x : integer;
  KodeBarang : string;
  hpp : real;



begin

  dm.Q1.Connection.StartTransaction;
    try
      addParam('nobukti',   Enobukti.Text,            aList,'str');
      addParam('tgl',      frmTgl(DtBukti.Date),     aList,'date');
      addParam('idsales',getData(dm.Q1,'sales WHERE kodesales="'+E1.Text+'"','idsales'),aList,'str');
      addParam('keterangan',   EKeterangan.Text,aList,'str');


      OpenTable(dm.Q2,['idsuratjalan'],'suratjalan where nobukti="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'suratjalan',alist)
      else
         UpdatePOST(dm.Q1,'suratjalan',alist,'idsuratjalan',GetVal(dm.Q2,'idsuratjalan'));

      for x := 1 to sg1.RowCount -1 do
        begin

          if (sg1.Cells[1,x] <> '') and (sg1.Cells[2,x]<>'') then
          begin
              openTable(dm.Q2,['kodebarang','hargabeli'],'barang where kodebarcode="'+sg1.cells[1,x]+'"');
              KodeBarang := Getval(dm.Q2,'kodebarang');
              hpp        := GetValF(dm.Q2,'hargabeli');
              addParam('nobukti',     Enobukti.Text,          aList,'str');
              addParam('kodebarang',  KodeBarang,             Alist,'str');
              addParam('satuan',      sg1.Cells[3,x],         Alist,'str');
              addParam('jumlah',      KomaDatabase(sg1.Cells[4,x]),   Alist,'str');
              addParam('idgudang',    GetIdcmb(cbGudang),     Alist,'str');

              OpenTable(dm.Q2,['iddetailsuratjalan'],
              ' detailsuratjalan WHERE kodebarang="'+kodebarang+'" '+
              ' AND nobukti="'+Enobukti.Text+'"');

              if dm.Q2.IsEmpty then
                 Post(dm.Q1,'detailsuratjalan',aList)
              else
                 updatePOST(dm.Q1,'detailsuratjalan',aList,'iddetailsuratjalan',GetVal(dm.Q2,'iddetailsuratjalan'));


              PostingKartuStok(dm.Q5,Enobukti.Text,
                              now,KodeBarang,GetIdcmb(cbGudang),
                              sg1.Cells[3,x], hpp,
                              'KELUAR',CellF(sg1.Cells[4,x]),
                              'SURAT JALAN NO BUKTI ['+Enobukti.Text+']');


          end else
          if (sg1.Cells[1,x] = '') and (sg1.Cells[4,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
            MessageBox(Handle,'Kode Barcode Harus Di Isi !! '+#13+' Silahkan Isi terlebih Dahulu !! '+#13+
                       'Atau batalkan item dengan menekan tombol [ DELETE ]','ERROR',MB_ICONERROR);
            sg1.Row := x;
            sg1.Col := 1;
            dm.Q1.Connection.Rollback;
            Abort;
          end;
        end;

          dm.Q1.Connection.Commit;
      except
        dm.Q1.Connection.Rollback;
      end;
    if cPrint.Checked then begin
       PrintStruck(Enobukti.Text);
    end;

    TampilAwal;
end;

function TFSuratJalan.Sparator(txt: string): string;

var
  I: Integer;
  hasil : String;
begin
  hasil:='';
  for I := 1 to 40 do
     hasil := hasil +txt;
  Result := hasil;


end;

procedure TFSuratJalan.TampilAwal;
begin
  ClearText(Self);

  Enobukti.Text  := GetCode(dm.Q1,'suratjalan','nobukti','SR'+setIdKom);
  setTanggal(Self);
  bersihkanGrid;
  sNota :='';
  cPrint.Checked   := True;

end;

function TFSuratJalan.ToFloat(ACol, ARow: integer): Extended;
begin
if not ACOl in [3] then
    Result := StrToFloatDef(koma(sg1.Cells[aCol,aRow]),0)
  else
    Result := StrToFloatDef(nilai(sg1.Cells[aCol,aRow]),0);
end;

function TFSuratJalan.vItems(Hrg, qty, stn, subt: string): String;
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

function TFSuratJalan.vTotal(lbl, vValue: string): string;
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
