unit uMigration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  MyAccess, Vcl.ComCtrls,DateUtils, uEngine, uComCtrl, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TFMigrationData = class(TForm)
    Con2: TMyConnection;
    Q1: TMyQuery;
    Q3: TMyQuery;
    Q2: TMyQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EHost: TEdit;
    Euser: TEdit;
    EPassword: TEdit;
    EPort: TEdit;
    EDatabase: TEdit;
    btnConnect: TButton;
    btnSatuan: TButton;
    btnKategori: TButton;
    btnPelanggan: TButton;
    btnSupplier: TButton;
    btnBarang: TButton;
    btnPembelian: TButton;
    btnPenjualan: TButton;
    PKategori: TProgressBar;
    PSatuan: TProgressBar;
    PPelanggan: TProgressBar;
    PSupplier: TProgressBar;
    PDataBarang: TProgressBar;
    PPembelian: TProgressBar;
    PPenjualan: TProgressBar;
    Q4: TMyQuery;
    Q5: TMyQuery;
    Q6: TMyQuery;
    Q7: TMyQuery;
    dtJual2: TDateTimePicker;
    cPenjualanPiutang: TCheckBox;
    dtBeli1: TDateTimePicker;
    dtBeli2: TDateTimePicker;
    dtJual1: TDateTimePicker;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    procedure btnConnectClick(Sender: TObject);
    procedure btnKategoriClick(Sender: TObject);
    procedure btnSatuanClick(Sender: TObject);
    procedure btnPelangganClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure btnBarangClick(Sender: TObject);
    procedure btnPembelianClick(Sender: TObject);
    procedure btnPenjualanClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMigrationData: TFMigrationData;

implementation

{$R *.dfm}

uses udm;

procedure TFMigrationData.btnBarangClick(Sender: TObject);
var
  idKategori : String;
  IdSupplier : String;
begin
  Try
    Q5.Close;
    Q5.SQL.Text := ' SELECT * FROM barang';
    Q5.Open;

    PDataBarang.Max       := Q5.RecordCount;
    PDataBarang.Position  := 0;

    while not Q5.Eof do begin
       with dm.Q1 do begin
         Close;
         SQL.Text := 'INSERT INTO barang (idbarang,kodebarang,kodebarcode,namabarang,idkategori,'+
         'satuanbeli,satuanjual,isi,hargabeli,hargaecer,hargagrosir,hargapartai,'+
         'idsupplier,bkp) VALUES (:idbarang,:kodebarang,:kodebarcode,:namabarang,:idkategori,'+
         ':satuanbeli,:satuanjual,:isi,:hargabeli,:hargaecer,:hargagrosir,:hargapartai,'+
         ':idsupplier,:bkp) ';
         ParamByName('idbarang').AsString     := Q5.FieldByName('idbarang').AsString;
         ParamByName('kodebarang').AsString   := Q5.FieldByName('kodebarang').AsString;
         ParamByName('kodebarcode').AsString  := Q5.FieldByName('kodebarcode').AsString;
         ParamByName('namabarang').AsString   := Q5.FieldByName('namabarang').AsString;

         dm.Q2.Close;
         dm.Q2.SQL.Text := 'SELECT idkategori FROM kategori WHERE namakategori="'+Q5.FieldByName('kategori').AsString+'"';
         dm.Q2.Open;

         idKategori := dm.Q2.FieldByName('idkategori').AsString;
         if idKategori <> '' then

         ParamByName('idkategori').AsString   := idKategori;
         ParamByName('satuanbeli').AsString   := Q5.FieldByName('satuanbeli').AsString;
         ParamByName('satuanjual').AsString   := Q5.FieldByName('satuanjual').AsString;
         ParamByName('isi').AsInteger         := StrToIntDef(Q5.FieldByName('isi').AsString,1);
         ParamByName('hargabeli').AsString    := Q5.FieldByName('hargabeli').AsString;
         ParamByName('hargaecer').AsString    := Q5.FieldByName('hargajual').AsString;
         ParamByName('hargagrosir').AsString  := Q5.FieldByName('hargajualgrosir').AsString;
         ParamByName('hargapartai').AsString  := Q5.FieldByName('hargapartai').AsString;
         if Q5.FieldByName('idsupplier').AsString <> '' then
         ParamByName('idsupplier').AsString   := Q5.FieldByName('idsupplier').AsString;

         dm.Q6.Close;
         dm.Q6.SQL.Text := 'SELECT ispajak FROM m_supplier WHERE idsupplier="'+Q5.FieldByName('idsupplier').AsString+'"';
         dm.Q6.Open;

         ParamByName('bkp').AsBoolean := dm.Q6.FieldByName('ispajak').AsBoolean;
         ExecSQL;

         dm.Q2.Close;
         dm.Q2.SQL.Text := 'INSERT INTO multisatuan (kodebarang,satuan,isi,harga,hargagrosir,hargapartai,kodebarcode) '+
         ' VALUES (:kodebarang,:satuan,:isi,:harga,:hargagrosir,:hargapartai,:kodebarcode) ';
         dm.Q2.ParamByName('kodebarang').AsString  := Q5.FieldByName('kodebarang').AsString;
         dm.Q2.ParamByName('satuan').AsString      := Q5.FieldByName('satuanjual').AsString;
         dm.Q2.ParamByName('isi').AsInteger         := 1;
         dm.Q2.ParamByName('harga').AsFloat       := Q5.FieldByName('hargajual').AsFloat;
         dm.Q2.ParamByName('hargagrosir').AsFloat := Q5.FieldByName('hargajualgrosir').AsFloat;
         dm.Q2.ParamByName('hargapartai').AsFloat := Q5.FieldByName('hargapartai').AsFloat;
         dm.Q2.ExecSQL;



         Q6.Close;
         Q6.SQL.Text := ' SELECT kodebarang,barcode1,satuan1,qty1,harga1,hargagrosir1,hargapartai1,'+
                        ' barcode2,satuan2,qty2,harga2,hargagrosir2,hargapartai2, '+
                        ' barcode3,satuan3,qty3,harga3,hargagrosir3,hargapartai3  FROM multiharga '+
                        ' WHERE kodebarang="'+Q5.FieldByName('kodebarcode').AsString+'" ';
         Q6.Open;

         dm.Q2.Close;
         dm.Q2.SQL.Text := 'INSERT INTO multisatuan (kodebarang,satuan,isi,harga,hargagrosir,hargapartai,kodebarcode) '+
         ' VALUES (:kodebarang,:satuan,:isi,:harga,:hargagrosir,:hargapartai,:kodebarcode) ';
         dm.Q2.ParamByName('kodebarang').AsString  := Q5.FieldByName('kodebarang').AsString;
         dm.Q2.ParamByName('satuan').AsString      := Q6.FieldByName('satuan1').AsString;
         dm.Q2.ParamByName('isi').AsInteger         := StrToIntDef(Q6.FieldByName('qty1').AsString,1);
         dm.Q2.ParamByName('harga').AsFloat       := Q6.FieldByName('harga1').AsFloat;
         dm.Q2.ParamByName('hargagrosir').AsFloat := Q6.FieldByName('hargagrosir1').AsFloat;
         dm.Q2.ParamByName('hargapartai').AsFloat := Q6.FieldByName('hargapartai1').AsFloat;
         dm.Q2.ParamByName('kodebarcode').AsString := Q6.FieldByName('barcode1').AsString;
         dm.Q2.ExecSQL;

         dm.Q2.Close;
         dm.Q2.SQL.Text := 'INSERT INTO multisatuan (kodebarang,satuan,isi,harga,hargagrosir,hargapartai,kodebarcode) '+
         ' VALUES (:kodebarang,:satuan,:isi,:harga,:hargagrosir,:hargapartai,:kodebarcode) ';
         dm.Q2.ParamByName('kodebarang').AsString  := Q5.FieldByName('kodebarang').AsString;
         dm.Q2.ParamByName('satuan').AsString      := Q6.FieldByName('satuan2').AsString;
         dm.Q2.ParamByName('isi').AsInteger         := StrToIntDef(Q6.FieldByName('qty2').AsString,1);
         dm.Q2.ParamByName('harga').AsFloat       := Q6.FieldByName('harga2').AsFloat;
         dm.Q2.ParamByName('hargagrosir').AsFloat := Q6.FieldByName('hargagrosir2').AsFloat;
         dm.Q2.ParamByName('hargapartai').AsFloat := Q6.FieldByName('hargapartai2').AsFloat;
         dm.Q2.ParamByName('kodebarcode').AsString := Q6.FieldByName('barcode2').AsString;
         dm.Q2.ExecSQL;

         dm.Q2.Close;
         dm.Q2.SQL.Text := 'INSERT INTO multisatuan (kodebarang,satuan,isi,harga,hargagrosir,hargapartai,kodebarcode) '+
         ' VALUES (:kodebarang,:satuan,:isi,:harga,:hargagrosir,:hargapartai,:kodebarcode) ';
         dm.Q2.ParamByName('kodebarang').AsString  := Q5.FieldByName('kodebarang').AsString;
         dm.Q2.ParamByName('satuan').AsString      := Q6.FieldByName('satuan3').AsString;
         dm.Q2.ParamByName('isi').AsInteger         := StrToIntDef(Q6.FieldByName('qty2').AsString,1);
         dm.Q2.ParamByName('harga').AsFloat       := Q6.FieldByName('harga3').AsFloat;
         dm.Q2.ParamByName('hargagrosir').AsFloat := Q6.FieldByName('hargagrosir3').AsFloat;
         dm.Q2.ParamByName('hargapartai').AsFloat := Q6.FieldByName('hargapartai3').AsFloat;
         dm.Q2.ParamByName('kodebarcode').AsString := Q6.FieldByName('barcode3').AsString;
         dm.Q2.ExecSQL;

         dm.Q2.Close;
         dm.Q2.SQL.Text := 'INSERT INTO hargabelirata (kodebarang,hargasebelum,hargabeli) '+
         ' VALUES (:kodebarang,:hargasebelum,:hargabeli) ';
         dm.Q2.ParamByName('hargasebelum').AsFloat  := Q5.FieldByName('hargabeli').AsFloat;
         dm.Q2.ParamByName('hargabeli').AsFloat     := Q5.FieldByName('hargabeli').AsFloat;
         dm.Q2.ExecSQL;


       end;
       PDataBarang.Position := Q5.RecNo;
       Application.ProcessMessages;
       Q5.Next;
    end;
    PDataBarang.Position := PDataBarang.Max;
  Except
    MessageBox(Handle,'Gagal import data kategori','Error',MB_ICONERROR);
  End;
end;

procedure TFMigrationData.btnConnectClick(Sender: TObject);
begin
  Con2.Server   := EHost.Text;
  Con2.Username := Euser.Text;
  Con2.Password := EPassword.Text;
  Con2.Port     := StrToIntDef(EPort.Text,0);
  Con2.Database := EDatabase.Text;

  try
    Con2.Connect;
    Con2.Connected := True;
    ShowMessage('Connection Succesfuly');
  Except
    MessageBox(Handle,'Gagal Koneksi database','Error',MB_ICONERROR);
  end;
end;

procedure TFMigrationData.btnKategoriClick(Sender: TObject);
begin
  Try
    Q1.Close;
    Q1.SQL.Text := ' SELECT * FROM kategori';
    Q1.Open;

    PKategori.Max := Q1.RecordCount;
    PKategori.Position := 0;
    while not Q1.Eof do begin
       with dm.Q1 do begin
         Close;
         SQL.Text := 'INSERT INTO kategori (namakategori) VALUES (:kategori) ';
         ParamByName('kategori').AsString := Q1.FieldByName('namakategori').AsString;
         ExecSQL;
       end;
       PKategori.Position := Q1.RecNo;
       Q1.Next;
    end;
    PKategori.Position := PKategori.Max;
  Except
    MessageBox(Handle,'Gagal import data kategori','Error',MB_ICONERROR);

  End;
end;

procedure TFMigrationData.btnPelangganClick(Sender: TObject);
begin
  Try
    Q3.Close;
    Q3.SQL.Text := ' SELECT * FROM pelanggan';
    Q3.Open;

    PPelanggan.Max := Q3.RecordCount;
    PPelanggan.Position := 0;
    while not Q3.Eof do begin
       with dm.Q2 do begin
         Close;
         SQL.Text := 'INSERT INTO pelanggan (idpelanggan,kodepelanggan,namapelanggan,alamat,'+
         'kota,notelpon,idjenispelanggan,maxpiutang,poin,idsales) VALUES '+
         '(:idpelanggan,:kodepelanggan,:namapelanggan,:alamat,'+
         ':kota,:notelpon,:idjenispelanggan,:maxpiutang,:poin,:idsales) ';
         ParamByName('idpelanggan').AsString := Q3.FieldByName('idpelanggan').AsString;
         ParamByName('kodepelanggan').AsString := Q3.FieldByName('kodebarcode').AsString;
         ParamByName('namapelanggan').AsString := Q3.FieldByName('namapelanggan').AsString;
         ParamByName('alamat').AsString := Q3.FieldByName('alamat').AsString;
         ParamByName('kota').AsString := Q3.FieldByName('kota').AsString;
         ParamByName('notelpon').AsString := Q3.FieldByName('notelepon').AsString;
         if UPPERCASE(Q3.FieldByName('statuscus').AsString) ='TOKO' then
         ParamByName('idjenispelanggan').AsInteger := 4 else
         if UPPERCASE(Q3.FieldByName('statuscus').AsString) ='PARTAI' then
         ParamByName('idjenispelanggan').AsInteger := 5 else
         if UPPERCASE(Q3.FieldByName('statuscus').AsString) ='CABANG' then
         ParamByName('idjenispelanggan').AsInteger := 6   ;
         ParamByName('maxpiutang').AsInteger := 0;
         ParamByName('poin').AsInteger := Q3.FieldByName('poin').AsInteger;
         ParamByName('idsales').AsInteger := 1;
         ExecSQL;
       end;
       PPelanggan.Position := Q3.RecNo;
       Q3.Next;
    end;
    PPelanggan.Position := PPelanggan.Max;
  Except
    MessageBox(Handle,'Gagal import data Pelanggan','Error',MB_ICONERROR);

  End;
end;

procedure TFMigrationData.btnPembelianClick(Sender: TObject);
var
  isPajak : Boolean;
  nominalBKP : Real;
  nominalNOnBKp : real;
  ppn : Real;

begin
  Try
    Q2.Close;
    Q2.SQL.Text := ' SELECT * FROM pembelian WHERE tglbeli>="'+Tanggal(dtBeli1.Date)+'" '+
    ' AND tglbeli<="'+Tanggal(dtBeli2.Date)+'"';
    Q2.Open;

    PPembelian.Max := Q2.RecordCount;
    PPembelian.Position := 0;
    while not Q2.Eof do begin

      dm.Q7.Close;
      dm.Q7.SQL.Text := 'SELECT nobukti FROM pembelian WHERE nobukti="'+Q2.FieldByName('fakturbeli').AsString+'" ';
       dm.Q7.Open;

      if dm.Q7.IsEmpty then begin

           dm.Q6.Close;
           dm.Q6.SQL.Text := 'SELECT ispajak FROM m_supplier WHERE '+
           ' idsupplier="'+Q2.FieldByName('idsupplier').AsString+'" ';
           dm.Q6.Open;

           isPajak := dm.Q6.FieldByName('ispajak').AsBoolean;
           with dm.Q2 do begin
             Close;
             SQL.Text := 'INSERT INTO pembelian (nobukti,tgl,pembayaran,idsupplier,'+
             'total,grandtotal,nominalbkp,nominalnonbkp) VALUES '+
             '(:nobukti,:tgl,:pembayaran,:idsupplier,'+
             ':total,:grandtotal,:nominalbkp,:nominalnonbkp) ';
             ParamByName('nobukti').AsString        := Q2.FieldByName('fakturbeli').AsString;
             ParamByName('tgl').AsDate            := Q2.FieldByName('tglbeli').AsDateTime;
             ParamByName('pembayaran').AsString     := 'CASH';
             ParamByName('idsupplier').AsString     := Q2.FieldByName('idsupplier').AsString;
             ParamByName('total').AsFloat           := Q2.FieldByName('total').AsFloat;
             ParamByName('grandtotal').AsFloat      := Q2.FieldByName('grandtotal').AsFloat;

             if isPajak then begin
              ParamByName('nominalbkp').AsFloat      := Q2.FieldByName('grandtotal').AsFloat;
              ParamByName('nominalnonbkp').AsFloat   := 0;
              nominalBKP :=   Q2.FieldByName('grandtotal').AsFloat;
              nominalNOnBKp := 0;
             end else begin
              ParamByName('nominalbkp').AsFloat      := 0;
              ParamByName('nominalnonbkp').AsFloat   := Q2.FieldByName('grandtotal').AsFloat;
              nominalBKP :=   0;
              nominalNOnBKp := Q2.FieldByName('grandtotal').AsFloat;
             end;
             ExecSQL;
           end;
           nominalBKP := (nominalBKP / ((asPPn + 100) / 100));
           ppn        := nominalBKP * (asPPn / 100);
           PostingJurnal(dm.Q1,'103.001',
              Q2.FieldByName('fakturbeli').AsString,
              'PEMBELIAN NO BUKTI ['+Q2.FieldByName('fakturbeli').AsString+']',
              Q2.FieldByName('tglbeli').AsDateTime,
              nominalBKP + (Q2.FieldByName('grandtotal').AsFloat - (nominalBKP + ppn)),
              NominalBkp,(Q2.FieldByName('grandtotal').AsFloat - (nominalBKP + ppn)),'D');
          PostingJurnal(dm.Q1,'101.001',Q2.FieldByName('fakturbeli').AsString,
                  'PEMBELIAN NO BUKTI ['+Q2.FieldByName('fakturbeli').AsString+'] ',
                 Q2.FieldByName('tglbeli').AsDateTime,
                 Q2.FieldByName('grandtotal').AsFloat,
                 nominalBkp + ppn,Q2.FieldByName('grandtotal').AsFloat - (NominalBkp + ppn),
                 'K');
          PostingJurnal(dm.Q1,'103.002',Q2.FieldByName('fakturbeli').AsString,
          'PEMBELIAN NO BUKTI ['+Q2.FieldByName('fakturbeli').AsString+']',
                  Q2.FieldByName('tglbeli').AsDateTime,ppn ,ppn,0,'D');

           Q3.Close;
           Q3.SQL.Text := ' SELECT * FROM pembeliandetil WHERE fakturbeli="'+Q2.FieldByName('fakturbeli').AsString+'" ';
           Q3.Open;

           while not Q3.Eof do begin

                with dm.Q4 do begin
                  Close;
                  SQL.Text := 'INSERT INTO detailbeli (nobukti,kodebarang,satuan,harga,hargaecer,hargagrosir,'+
                  'hargapartai,jumlah,ppn,subtotal,isi,idgudang) '+
                  ' VALUES (:nobukti,:kodebarang,:satuan,:harga,:hargaecer,:hargagrosir,'+
                  ' :hargapartai,:jumlah,:ppn,:subtotal,:isi,:idgudang) ';
                  ParamByName('nobukti').AsString := Q3.FieldByName('fakturbeli').AsString;
                  ParamByName('kodebarang').AsString := Q3.FieldByName('kodebarang').AsString;
                  ParamByName('satuan').AsString := Q3.FieldByName('satuan').AsString;
                  ParamByName('harga').AsFloat := Q3.FieldByName('harga').AsFloat;
                  ParamByName('hargaecer').AsFloat := Q3.FieldByName('hargajual').AsFloat;
                  ParamByName('hargagrosir').AsFloat := Q3.FieldByName('hargagrosir').AsFloat;
                  ParamByName('hargapartai').AsFloat := Q3.FieldByName('hargapartai').AsFloat;
                  ParamByName('jumlah').AsFloat := Q3.FieldByName('jumlah').AsFloat;
                  ParamByName('ppn').AsFloat := Q3.FieldByName('ppn').AsFloat;
                  ParamByName('subtotal').AsFloat := Q3.FieldByName('subtotal').AsFloat;
                  ParamByName('isi').AsFloat := Q3.FieldByName('isi').AsFloat;
                  ParamByName('idgudang').AsString := '2';
                  ExecSQL;

                  PostingKartuStok(dm.Q1,Q2.FieldByName('fakturbeli').AsString,
                  Q2.FieldByName('tglbeli').AsDateTime,
                  Q3.FieldByName('kodebarang').AsString,'2',
                  Q3.FieldByName('satuan').AsString,
                  Q3.FieldByName('harga').AsFloat,
                  'MASUK',Q3.FieldByName('isi').AsFloat,'PEMBELIAN');

                  if isPajak then begin

                      Close;
                      SQL.Text := 'UPDATE barang set bkp=true WHERE '+
                      ' kodebarang="'+Q3.FieldByName('kodebarang').AsString +'" ';
                      ExecSQL;
                  end;
                end;
             Q3.Next;
           end;
      end;
       PPembelian.Position := Q2.RecNo;
       Q2.Next;
    end;
    PPembelian.Position := PPembelian.Max;
  Except
    MessageBox(Handle,'Gagal import data Satuan','Error',MB_ICONERROR);

  End;
end;

procedure TFMigrationData.btnPenjualanClick(Sender: TObject);
var
  x : integer;
  idpelanggan,Tempo,NoPiutang,idsales : string;
  hargajual,bayar,hppBkp,HppNonBkp, piutang,PiutangBkp,PiutangNonBKp,ppn : real;
  sisaBKP     : Real;
  SisaNonBkp  : Real;
  Idgudang    : String;
  NominalBKp  : Real;
  Alist : TStringLIst;
  Cash : String;

  NomerPiutang : String;
begin
   if cPenjualanPiutang.Checked then begin

       Q6.Close;
       Q6.SQL.Text := ' SELECT fakturjual FROM piutang WHERE kekurangan > 0 ';
       Q6.Open;

       NomerPiutang := '';
       while not Q6.Eof do begin
         NomerPiutang := NomerPiutang +'"'+Q6.FieldByName('fakturjual').AsString+'",';
         Q6.Next;

       end;
       Delete(NomerPiutang,length(nomerpiutang),1);
   end;

   Q2.Close;
  // Q2.SQL.Text := 'SELECT * FROM penjualan WHERE month(tgljual)="'+IntToStr(cbBulanJual.ItemIndex + 1)+'" '+
  // ' AND YEAR(tgljual)="'+IntToStr(YearOf(now))+'" ';
   if cPenjualanPiutang.Checked then
   Q2.SQL.Text := ' SELECT * FROM penjualan WHERE fakturjual IN ('+NomerPiutang+') ' else
   Q2.SQL.Text := ' SELECT * FROM penjualan WHERE tgljual>="'+Tanggal(dtJual1.Date)+'" '+
   ' AND tgljual<="'+Tanggal(dtJual2.Date)+'" ';
   Q2.Open;
   Alist := TStringList.Create;
   try

   PPenjualan.Max := Q2.RecordCount;
   PPenjualan.Position := 0;
   while not Q2.Eof do begin

      dm.Q7.Close;
      dm.Q7.SQL.Text := 'SELECT fakturjual FROM penjualan WHERE fakturjual="'+Q2.FieldByName('fakturjual').AsString+'" ';
      dm.Q7.Open;

      if dm.Q7.IsEmpty then begin

            addParam('fakturjual',   Q2.FieldByName('fakturjual').AsString,            aList,'str');
            addParam('tgljual',      frmTgl(Q2.FieldByName('tgljual').AsDateTime),     aList,'date');
            addParam('pembayaran',   Q2.FieldByName('pembayaran').AsString,        aList,'str');
            addParam('idpelanggan',  Q2.FieldByName('idpelanggan').AsString,              aList,'str');
            addParam('iduser',       Q2.FieldByName('iduser').AsString,aList,'str');
            addParam('total',        StrToDecimal(Q2.FieldByName('total').AsString),aList,'str');
            addParam('diskon',       StrToDecimal(Q2.FieldByName('diskon').AsString),aList,'str');
            addParam('grandtotal',   StrToDecimal(Q2.FieldByName('grandtotal').AsString),aList,'str');
            addParam('keterangan',   '',alist,'str');
            addParam('nominalbkp',   StrToDecimal(FloatToStr(NominalBKp+ppn)),alist,'str');
            addParam('nominalnonbkp',StrToDecimal(FloatToStr(Q2.FieldByName('grandtotal').AsFLoat - (NominalBKp + ppn))),alist,'str');

            Post(dm.Q1,'penjualan',alist);

            Q3.Close;
            Q3.SQL.Text := 'SELECT * FROM penjualandetil WHERE fakturjual="'+Q2.FieldByName('fakturjual').AsString+'"';
            Q3.Open;

            NominalBKp := 0;
            hppBkp := 0;
            HppNonBkp := 0;

            while not Q3.Eof do begin

                    hargajual  := Q3.FieldByName('harga').AsFloat;

                    dm.Q5.Close;
                    dm.Q5.SQL.Text := 'SELECT bkp FROM barang WHERE kodebarang="'+Q3.FieldByName('kodebarang').AsString+'"';
                    dm.Q5.Open;

                    if dm.Q5.FieldByName('bkp').AsBoolean = True then begin
                       hppBkp  := hppBkp +(Q3.FieldByName('hpp').AsFloat *  Q3.FieldByName('isi').AsFloat);
                       NominalBKp := NominalBKp + Q3.FieldByName('subtotal').AsFloat;
                      end else
                       HppNonBkp  := HppNonBkp + (Q3.FieldByName('hpp').AsFloat *  Q3.FieldByName('isi').AsFloat);

                    addParam('fakturjual',  Q2.FieldByName('fakturjual').AsString,          aList,'str');
                    addParam('kodebarang',  Q3.FieldByName('kodebarang').AsString,             Alist,'str');
                    addParam('satuan',      Q3.FieldByName('satuan').AsString,         Alist,'str');
                    addParam('harga',       StrToDecimal(Q3.FieldByName('harga').AsString),  Alist,'str');
                    addParam('hpp',         StrToDecimal(Q3.FieldByName('hpp').AsString),        Alist,'str');
                    addParam('jumlah',      KomaDatabase(Q3.FieldByName('jumlah').AsString),   Alist,'str');
                //    addParam('diskonpersen',StrToDecimal(Q3.FieldByName('diskon').AsString),   Alist,'str');
                //    addParam('diskonrupiah',StrToDecimal(Q3.FieldByName('diskon').AsString),   Alist,'str');
                    addParam('subtotal',    StrToDecimal(Q3.FieldByName('subtotal').AsString),  Alist,'str');
                    addParam('isi',         KomaDatabase(Q3.FieldByName('isi').AsString), Alist,'str');
                    addParam('idgudang',    '2',     Alist,'str');

                    Post(dm.Q1,'penjualandetil',aList);


                    PostingKartuStok(dm.Q1,Q2.FieldByName('fakturjual').AsString,
                                    Q2.FieldByName('tgljual').AsDateTime,
                                    Q3.FieldByName('kodebarang').AsString,
                                    '2',
                                    Q3.FieldByName('satuan').AsString,
                                    Q3.FieldByName('hpp').AsFloat,
                                    'KELUAR',Q3.FieldByName('isi').AsFloat,
                                    'PENJUALAN NO BUKTI ['+Q2.FieldByName('fakturjual').AsString+']');

                    Q3.Next;
              end;


                     if NominalBKp > 0 then begin

                      NominalBKp := NominalBKp / ((asPPn + 100) / 100);
                      ppn        := NominalBKp * asPPn / 100;
                     end else begin
                        ppn := 0;
                        NominalBKp := 0;
                     end;
                     PostingJurnal(dm.Q1,'101.001',
                                   Q2.FieldByName('fakturjual').AsString,
                                   'PENJUALAN NO BUKTI ['+Q2.FieldByName('fakturjual').AsString+']',
                                   Q2.FieldByName('tgljual').AsDateTime,
                                   Q2.FieldByName('grandtotal').AsFloat,
                                   NominalBKp+ppn,Q2.FieldByName('grandtotal').AsFloat - (NominalBKp + ppn), 'D');


                     hppBkp     := hppBkp / ((asPPn + 100) / 100);

                     PostingJurnal(dm.Q1,'501.001',
                                     Q2.FieldByName('fakturjual').AsString,
                                     'PENJUALAN NO BUKTI ['+Q2.FieldByName('fakturjual').AsString+']',
                                     Q2.FieldByName('tgljual').AsDateTime,hppBkp + HppNonBkp,hppBkp,HppNonBkp,'D');


                     PostingJurnal(dm.Q1,'401.001',
                                     Q2.FieldByName('fakturjual').AsString,
                                     'PENJUALAN NO BUKTI ['+Q2.FieldByName('fakturjual').AsString+']',
                                     Q2.FieldByName('tgljual').AsDateTime,
                                     NominalBKp + (Q2.FieldByName('grandtotal').AsFloat-(NominalBKp+ppn)),
                                     NominalBKp,Q2.FieldByName('grandtotal').AsFloat - (NominalBKp + ppn ),'K');
                     PostingJurnal(dm.Q1,'202.001',Q2.FieldByName('fakturjual').AsString,
                                     'PENJUALAN NO BUKTI ['+Q2.FieldByName('fakturjual').AsString+']',
                                     Q2.FieldByName('tgljual').AsDateTime,ppn,ppn,0,'K');
                     PostingJurnal(dm.Q1,'103.001',
                                     Q2.FieldByName('fakturjual').AsString,
                                     'PENJUALAN NO BUKTI ['+Q2.FieldByName('fakturjual').AsString+']',
                                     Q2.FieldByName('tgljual').AsDateTime,hppBkp + HppNonBkp,hppBkp,HppNonBkp,'K');

                     dm.Q1.Close;
                     dm.Q1.SQL.Text := 'UPDATE penjualan set nominalbkp=:nominalbkp,nominalnonbkp=:nominalnonbkp '+
                     ' WHERE fakturjual="'+Q2.FieldByName('fakturjual').AsString+'" ';
                     dm.Q1.ParamByName('nominalbkp').AsFloat := NominalBKp + ppn;
                     dm.Q1.ParamByName('nominalnonbkp').AsFloat := Q2.FieldByName('grandtotal').AsFloat - (NominalBKp + ppn);
      end;
     Q2.Next;
     PPenjualan.Position := Q2.RecNo;
   end;
    PPenjualan.Position := PPenjualan.Max;

   finally
      Alist.Free;
   end;
end;

procedure TFMigrationData.btnSatuanClick(Sender: TObject);
begin
    Try
    Q2.Close;
    Q2.SQL.Text := ' SELECT * FROM satuan';
    Q2.Open;

    PSatuan.Max := Q2.RecordCount;
    PSatuan.Position := 0;
    while not Q2.Eof do begin
       with dm.Q2 do begin
         Close;
         SQL.Text := 'INSERT INTO satuan (namasatuan) VALUES (:namasatuan) ';
         ParamByName('namasatuan').AsString := Q2.FieldByName('satuanbeli').AsString;
         ExecSQL;
       end;
       PSatuan.Position := Q2.RecNo;
       Q2.Next;
    end;
    PSatuan.Position := PKategori.Max;
  Except
    MessageBox(Handle,'Gagal import data Satuan','Error',MB_ICONERROR);

  End;
end;

procedure TFMigrationData.btnSupplierClick(Sender: TObject);
begin
  Try
    Q4.Close;
    Q4.SQL.Text := ' SELECT * FROM supplier';
    Q4.Open;

    PSupplier.Max := Q4.RecordCount;
    PSupplier.Position := 0;
    while not Q4.Eof do begin
       with dm.Q2 do begin
         Close;
         SQL.Text := 'INSERT INTO m_supplier (idsupplier,kodesupplier,namasupplier,alamat,'+
         'kota,notelpon) VALUES '+
         '(:idsupplier,:kodesupplier,:namasupplier,:alamat,'+
         ':kota,:notelpon) ';
         ParamByName('idsupplier').AsString := Q4.FieldByName('idsupplier').AsString;
         ParamByName('kodesupplier').AsString := Q4.FieldByName('kodesupplier').AsString;
         ParamByName('namasupplier').AsString := Q4.FieldByName('namasupplier').AsString;
         ParamByName('alamat').AsString := Q4.FieldByName('alamat').AsString;
         ParamByName('kota').AsString := Q4.FieldByName('kota').AsString;
         ParamByName('notelpon').AsString := Q4.FieldByName('notelepon').AsString;
         ExecSQL;
       end;
       PSupplier.Position := Q4.RecNo;
       Q4.Next;
    end;
    PSupplier.Position := PSupplier.Max;
  Except
    MessageBox(Handle,'Gagal import data Supplier','Error',MB_ICONERROR);

  End;
end;

procedure TFMigrationData.Button1Click(Sender: TObject);
var
  StokBarang , KartuStok ,Selisih: integer;
begin
  with dm.Q1 do begin
    Close;
    SQL.Text := 'SELECT kodebarang,stok from barang';
    open;

    ProgressBar1.Max := RecordCount;
    while not Eof do begin
      StokBarang := GetValInt(dm.Q1,'stok');

      dm.Q2.Close;
      dm.Q2.SQL.Text := 'SELECT SUM(saldoawal+masuk-keluar) as stokbarang '+
      ' FROM kartustok WHERE month(tgl)=month(CURDATE()) and '+
      ' YEAR(tgl)=YEAR(CURDATE()) AND kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" '+
      ' AND idgudang=2 ';
      dm.Q2.Open;

      KartuStok := GetValInt(dm.Q2,'stokbarang');

      Selisih := stokBarang - kartustok;


      dm.Q3.Close;
      if Selisih < 0 then

      dm.Q3.SQL.Text := 'INSERT INTO kartustok(kodebarang,tgl,idgudang,keluar) '+
      'VALUES("'+GetVal(dm.Q1,'kodebarang')+'","'+Tanggal(now)+'",'+
      '2,"'+IntToStr(abs(selisih))+'")'
      else
      dm.Q3.SQL.Text := 'INSERT INTO kartustok(kodebarang,tgl,idgudang,masuk) '+
      'VALUES("'+GetVal(dm.Q1,'kodebarang')+'","'+Tanggal(now)+'",'+
      '2,"'+IntToStr(selisih)+'")';
      dm.Q3.ExecSQL;
      ProgressBar1.Position := dm.Q1.RecNo;
      dm.Q1.Next;

    end;
  end;
end;

end.
