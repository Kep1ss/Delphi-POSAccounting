unit uPembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  cxButtons, cxDropDownEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox,
  uEngine, uComCtrl, uOvEdit, dxSkiniMaginary, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful,System.DateUtils, dxSkinMoneyTwins,Math, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFpembelianBarang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Enobukti: TcxTextEdit;
    DtBukti: TcxDateEdit;
    ESupplier: TcxTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbPembayaran: TcxComboBox;
    cbTempo: TcxComboBox;
    btnCariSupplier: TcxButton;
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
    ETotal: TcxTextEdit;
    EKodeSupplier: TcxTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    EnoPO: TcxTextEdit;
    Label13: TLabel;
    Label14: TLabel;
    ENoReferensi: TcxTextEdit;
    btnCariPO: TcxButton;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnCariBarang: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    btnSupplier: TcxButton;
    btnUbah: TcxButton;
    Label17: TLabel;
    Label18: TLabel;
    ESubtotal: TcxTextEdit;
    Label19: TLabel;
    Label20: TLabel;
    EDiskonper: TcxTextEdit;
    Label23: TLabel;
    Egrandtotal: TcxTextEdit;
    Label25: TLabel;
    Ediskonrp: TcxTextEdit;
    Label15: TLabel;
    Label16: TLabel;
    Eppnper: TcxTextEdit;
    Eppnrup: TcxTextEdit;
    Label21: TLabel;
    cbAkun: TcxComboBox;
    Label22: TLabel;
    cbGudang: TcxComboBox;
    sg2: TAdvStringGrid;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Eketerangan: TcxTextEdit;
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure cbPembayaranPropertiesChange(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnUbahClick(Sender: TObject);
    procedure EsatuanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFocusClick(Sender: TObject);
    procedure btnCariPOClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure EDiskonperPropertiesChange(Sender: TObject);
    procedure EppnperPropertiesChange(Sender: TObject);
    procedure EdiskonrpPropertiesChange(Sender: TObject);
    procedure sg1RowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure sg2CanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sg2GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure sg2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ESupplierKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    aList : TStringList;
    { Private declarations }
  public

    hargaSetelahDiskon : Real;
    procedure TampilAwal;
    procedure CreateGrid;
    procedure CreateGridMultiHarga;
    procedure bersihCell;
    procedure ReplaceData;
    procedure KosongKanGrid;
    procedure Focus;
    function  Posisi(kodebarcode:String;stn:string):integer;
    procedure HitungTotal;
    procedure HitungSubtotal(Arow:Integer);
    function  ToFloat(ACol:Integer;ARow:integer):Extended;
    procedure PrintBukti(NoFak : string);
    function GetHargaBeli(kodebarang:string; HargaBaru       : Real;   JumlahBaru      : Real;var saldolama:Real) : Real;
    function CariIsi(barcode:string;Satuan:string):Extended;
    { Public declarations }
  end;



var
  FpembelianBarang: TFpembelianBarang;
  SHowHarga  : Boolean;


implementation

{$R *.dfm}

uses udm, uCariSupplier, uCariBarang, uMainMenu, uUbahHarga, uCariPObeli, uDtrx,
  uDlaporan, uPilihSatuan, uInputDataBarang;

procedure TFpembelianBarang.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFpembelianBarang.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFpembelianBarang.btnCariBarangClick(Sender: TObject);
begin
   FcariBarang.Show;
   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+'  '+
   ' GROUP BY b.kodebarang',True);
   FcariBarang.Show;
   FcariBarang.isFormTransaksi := 0;
end;

procedure TFpembelianBarang.btnCariPOClick(Sender: TObject);
begin
  FCariPo.Show;
  ExQry(dtrx.Qpobeli,_SQLcariPO+' WHERE nobukti not in (select nopo from pembelian)',True);
end;

procedure TFpembelianBarang.btnFocusClick(Sender: TObject);
begin
  Focus;
end;

procedure TFpembelianBarang.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[19,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
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

procedure TFpembelianBarang.btnSimpanClick(Sender: TObject);
var
  x , i: integer;
  idSupplier,KodeBarang,Tempo : string;
  hargabeli,HargaNormal,HargaDiskon,Hargadiskon2,
  HargaBeliLama,HargaDiskon3,hargafix ,ppn,HargaSetelahPPN : Real;
  SaldoLama : Real;
begin

  if not CheckEdit(Self) then begin

  if cbPembayaran.ItemIndex = -1 then
  begin
    peringatan(' Pembayaran belum ditentukan');
    cbPembayaran.ItemIndex := 0;
  end else

  begin
    if MessageDlg('Apakah yakin akan melakukan pembelian barang?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin

            idSupplier := getData(dm.Q2,'m_supplier where kodesupplier="'+Ekodesupplier.Text+'"','idsupplier');
            dm.Q1.Connection.StartTransaction;
            try
              addParam('nobukti',   Enobukti.Text,            aList,'str');
              addParam('tgl',       frmTgl(DtBukti.Date),     aList,'date');
              addParam('pembayaran',cbPembayaran.Text,        aList,'str');
              addParam('idsupplier',idsupplier,               aList,'str');
              addParam('iduser',    Fmain.sbr1.Panels[1].Text,aList,'str');
              addParam('nopo',      EnoPO.Text,               aList,'str');
              addParam('refnota',   ENoReferensi.Text,        aList,'str');
              addParam('total',     StrToDecimal(ESubtotal.Text),        aList,'str');
              addParam('diskon',    StrToDecimal(Ediskonrp.Text),        aList,'str');
              addParam('ppn',       StrToDecimal(Eppnrup.Text),        aList,'str');
              addParam('grandtotal',StrToDecimal(Egrandtotal.Text),      aList,'str');
              addParam('keterangan', Eketerangan.Text, aList,'str');
              OpenTable(dm.Q2,['idpembelian'],'pembelian where nobukti="'+Enobukti.Text+'"');
              if Dm.Q2.IsEmpty then
                 Post(dm.Q1,'pembelian',alist)
              else
                 UpdatePOST(dm.Q1,'pembelian',alist,'idpembelian',GetVal(dm.Q2,'idpembelian'));




              ExQry(dm.Q1,'DELETE FROM detailbeli WHERE nobukti="'+Enobukti.Text+'"',False);
              ExQry(dm.Q1,'DELETE FROM kartustok WHERE nobukti="'+Enobukti.Text+'"',False);
              ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+Enobukti.Text+'"',False);
              ExQry(dm.Q1,'DELETE FROM hutang WHERE nobukti="'+Enobukti.Text+'"',False);

              if cbPembayaran.ItemIndex = 1 then begin
                  PostingJurnal(dm.Q1,'201.001',Enobukti.Text,'PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                           DtBukti.Date,Egrandtotal.AsFLoat,0,Egrandtotal.AsFLoat,'K');
                  PostingJurnal(dm.Q1,'103.001',Enobukti.Text,'PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                              DtBukti.Date,ESubtotal.AsFLoat,0,ESubtotal.AsFLoat,'D');
                  PostingJurnal(dm.Q1,'402.001',Enobukti.Text,'PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                              DtBukti.Date,Ediskonrp.AsFLoat,0,Ediskonrp.AsFLoat,'K');
              end else if cbPembayaran.ItemIndex = 0 then begin

                  PostingJurnal(dm.Q1,'103.001',Enobukti.Text,'PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                        DtBukti.Date,ESubtotal.AsFLoat,0,ESubtotal.AsFLoat,'D');
                  PostingJurnal(dm.Q1,Copy(cbAKun.Text,1,Pos('|',cbAKun.Text)-2),Enobukti.Text,
                          'PEMBELIAN NO BUKTI ['+Enobukti.Text+'] SUPPLIER : ['+Esupplier.Text+']',
                         DtBukti.Date,Egrandtotal.AsFLoat,0,Egrandtotal.AsFLoat,'K');
                  PostingJurnal(dm.Q1,'402.001',Enobukti.Text,'PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                              DtBukti.Date,Ediskonrp.AsFLoat,0,Ediskonrp.AsFLoat,'K');
              end;



              if sg1.Cells[1,sg1.RowCount -1] <> '' then
               sg1.RowCount := sg1.RowCount + 1;


              for x := 1 to sg1.RowCount -1 do
                begin

                  if (sg1.Cells[19,x] <> '') and (sg1.Cells[2,x] <> '')and ( sg1.Cells[17,x]<> '') then
                  begin
                    if StrToFloatDef(nilai(sg1.Cells[18,x]),0) = 0 then
                       sg1.Cells[18,x] := '1';

                      HargaNormal := CellF(sg1.Cells[5,x]);
                      ppn         := CellF(sg1.Cells[6,x]);
                      HargaDiskon := HargaNormal - (HargaNormal * StrToFloatDef(sg1.Cells[14,x],0) /100);
                      Hargadiskon2:= HargaDiskon - (HargaDiskon * StrToFloatDef(sg1.Cells[15,x],0) /100);
                     // HargaDiskon3:= Hargadiskon2 - (Hargadiskon2 * StrToFloatDef(sg1.Cells[20,x],0) / 100);

                      hargafix := Hargadiskon2;
                      HargaSetelahPPN := StrToFloatDef(Nilai(sg1.Cells[17,x]),0) /StrToFloatDef(nilai(sg1.Cells[18,x]),0) ;

                      addParam('nobukti',     Enobukti.Text,          aList,'str');
                      addParam('kodebarang',  sg1.Cells[19,x],             Alist,'str');
                      addParam('satuan',      sg1.Cells[3,x],         Alist,'str');
                      addParam('harga',       StrToDecimal(nilai(sg1.Cells[5,x])),  Alist,'str');
                      addParam('ppn',         nilai(sg1.Cells[6,x]),  Alist,'str');
                      addParam('hargaecer',   nilai(sg1.Cells[9,x]),  Alist,'str');
                      addParam('hargagrosir', nilai(sg1.Cells[11,x]),  Alist,'str');
                      addParam('hargapartai', nilai(sg1.Cells[13,x]),  Alist,'str');
                      addParam('jumlah',      KomaDatabase(nilai(sg1.Cells[4,x])),   Alist,'str');
                      addParam('diskonpersen',KomaDatabase(sg1.Cells[14,x]),   Alist,'str');
                      addParam('diskon2',KomaDatabase(sg1.Cells[15,x]),  Alist,'str');
                      addParam('subtotal',    KomaDatabase(nilai(sg1.Cells[17,x])),  Alist,'str');
                      addParam('isi',         StrToDecimal(sg1.Cells[18,x]), Alist,'str');


                      OpenTable(dm.Q2,['iddetilbeli'],
                      'detailbeli WHERE kodebarang="'+kodebarang+'" '+
                      'AND nobukti="'+Enobukti.Text+'"');

                      if dm.Q2.IsEmpty then
                         Post(dm.Q1,'detailbeli',aList)
                      else
                         updatePOST(dm.Q1,'detailbeli',aList,'iddetilbeli',GetVal(dm.Q2,'iddetilbeli'));

                      ExQry(dm.Q1,' UPDATE pobelidetail SET masuk=IFNULL(masuk,0)+"'+KomaDatabase(sg1.Cells[4,x])+'" '+
                                  ' WHERE kodebarang="'+sg1.Cells[19,x]+'" AND nobukti="'+EnoPo.Text+'"',False);

                      ExQry(dm.Q5,' SELECT kodebarang,hargabeli FROM hargabelirata WHERE kodebarang="'+sg1.Cells[19,x]+'" ',True);
                      HargaBeliLama := GetValF(dm.Q5,'hargabeli');
                      hargabeli     := GetHargaBeli(sg1.Cells[19,x],HargaSetelahPPN,CellF(sg1.Cells[18,x]),SaldoLama);

                      if dm.Q5.IsEmpty then begin
                        ExQry(dm.Q3,'INSERT INTO hargabelirata (kodebarang,hargasebelum,hargabeli) VALUES ( '+
                        '"'+sg1.Cells[19,x]+'","'+StrTODecimal(Format('%.4n',[hargabeli]))+'","'+StrTODecimal(Format('%.4n',[hargabeli]))+'")',False);
                      end
                      else begin
                       ExQry(dm.Q3,'UPDATE hargabelirata SET hargasebelum="'+StrToDecimal(Format('%.4n',[HargaBeliLama]))+'",'+
                       ' hargabeli="'+StrToDecimal(Format('%.4n',[hargabeli]))+'" WHERE '+
                       ' kodebarang="'+sg1.Cells[19,x]+'" ',False);
                      end;

                      PostingKartuStok(DM.Q5,Enobukti.Text,
                                           DtBukti.Date,sg1.Cells[19,x],
                                           GetIdcmb(cbGudang),sg1.Cells[3,x],
                                           HargaSetelahPPN,'MASUK',
                                           StrToFloatDef(nilai(sg1.Cells[18,x]),0),
                                           'PEMBELIAN NO BUKTI ['+Enobukti.Text+']');





                      ExQry(dm.Q1,'UPDATE barang set '+
                      'hargasebelum="'+KomaDatabase(nilai(sg1.Cells[5,x]))+'",'+
                      'hargabeli="'+StrToDecimal(FloatToStr(HargaSetelahPPN))+'",'+
                      'hargaecer="'+KomaDatabase(nilai(sg1.Cells[9,x]))+'",'+
                      'hargagrosir="'+KomaDatabase(nilai(sg1.Cells[11,x]))+'",'+
                      'hargapartai="'+KomaDatabase(nilai(sg1.Cells[13,x]))+'" '+
                      ' WHERE kodebarang="'+sg1.Cells[19,x]+'"',False);

                      ExQry(dm.Q1,'UPDATE multisatuan mm LEFT JOIN barang b ON '+
                      ' mm.kodebarang=b.kodebarang set '+
                      ' mm.harga="'+StrToDecimal(sg1.Cells[9,x])+'",'+
                      ' mm.hargagrosir="'+StrToDecimal(sg1.Cells[11,x])+'",'+
                      ' mm.hargapartai="'+StrToDecimal(sg1.Cells[13,x])+'" '+
                      ' WHERE mm.kodebarang="'+sg1.Cells[19,x]+'" AND '+
                      ' mm.satuan=b.satuanjual',False);

                      



                  end else if (sg1.Cells[19,x] = '') and (sg1.Cells[2,x] <> '')and ( sg1.Cells[17,x]<> '') then begin
                    Warning(sg1.Cells[2,x]+ ' Kodebarang Kosong, Data tidak bisa diproses');
                  end;
                end;
                  if cbPembayaran.ItemIndex = 1 then begin
                     Tempo := Copy(cbTempo.Text,1,Pos(' ',cbTempo.Text)-1);
                     addParam('nobukti',    Enobukti.Text,                          aList,'str');
                     addParam('tglinput',   frmTgl(DtBukti.Date),                   aList,'date');
                     addParam('tgltempo',   frmTgl(DtBukti.Date + StrToInt(Tempo)), aList,'date');
                     addParam('hutang',     StrToDecimal(ETotal.Text),                     aList,'str');
                     addParam('dibayar',    '0', aList,'str');
                     addParam('kekurangan', StrToDecimal(Egrandtotal.Text),                     aList,'str');
                     addParam('lunas',      '0',                     aList,'str');

                     OpenTable(dm.Q2,['idhutang'],'hutang where nobukti="'+Enobukti.Text+'"');
                     if dm.Q2.IsEmpty then
                       Post(dm.Q1,'hutang',aList)
                     else
                       updatePOST(dm.Q1,'hutang',aList,'idhutang',GetVal(dm.Q2,'idhutang'));

                  end;

                  ExQry(dm.Q1,'UPDATE pobeli SET terima=True WHERE nobukti in (SELECT nopo FROM pembelian)',False);

                  dm.Q1.Connection.Commit;
                  Informasi('Data pembelian berasil disimpan');
              except
                dm.Q1.Connection.Rollback;
              end;
            end;


            TampilAwal;
        end;
  end;
end;

procedure TFpembelianBarang.btnSupplierClick(Sender: TObject);
begin
  FcariSupplier.Show;
  FcariSupplier.isFormSUpplier := 0;
end;

procedure TFpembelianBarang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFpembelianBarang.btnUbahClick(Sender: TObject);
const
_SQLbarang = '  SELECT                 '+
                   '   b.idbarang,          '+
                   '   b.kodebarang,        '+
                   '   b.kodebarcode,       '+
                   '   b.namabarang,        '+
                   '   b.namabarcode,       '+
                   '   b.hargasebelum,      '+
                   '   k.idkategori,        '+
                   '   k.namakategori,      '+
                   '   b.satuanbeli,        '+
                   '   b.idsupplier,        '+
                   '   s.namasupplier,        '+
                   '   b.minimalorder,      '+
                   '   b.satuanjual,        '+
                   '   b.isi,               '+
                   '   b.stokmin,           '+
                   '   b.stokmax,           '+
                   '   b.hargabeli,         '+
                   '   b.margin,            '+
                   '  (b.hargabeli + (b.hargabeli * b.ppn / 100)) as HargaPPN, ' +
                   '   b.hargaecer,         '+
                   '   b.hargagrosir,       '+
                   '   b.hargapartai,       '+
                   '   b.hargapartai4,       '+
                   '   b.hargapartai5,       '+
                   '   b.diskonpersen,      '+
                   '   b.diskonrupiah,      '+
                   '   b.hargapromo,      '+
                   '   b.tglawal,      '+
                   '   b.tglakhir,      '+
                   '   b.hargapromo2,      '+
                   '   b.tglawal2,      '+
                   '   b.tglakhir2,      '+
                   '   b.hargapromo3,      '+
                   '   b.tglawal3,      '+
                   '   b.tglakhir3,      '+
                   '   b.ppn,                '+
                   '   b.stok,                '+
                   '   b.warningiflimit,    '+
                   '   b.bkp,    '+
                   '   h.hargabeli as hargabeliratarata     '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN hargabelirata h ON '+
                   '   h.kodebarang=b.kodebarang  '+
                   '   LEFT JOIN m_supplier s ON '+
                   '   s.idsupplier=b.idsupplier';
var
  smb   : Tcxcombobox;
  stxt1 : TcxTextEdit;
  stxt2 : TcxTextEdit;
  stxt3 : TcxTextEdit;
  stxt4 : TcxTextEdit;
  stxt5 : TcxTextEdit;
  stxt6 : TcxTextEdit;
  stxt7 : TcxTextEdit;

  i     : Integer;
begin

  if sg1.Cells[1,sg1.Row] = '' then begin

      if MessageDlg('Input barang Baru ???',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin

          Finputbarang.Show;
          FinputBarang.EHargaBeli.Enabled := True;
          FinputBarang.TampilanAwal;
          FinputBarang.CanEdit := False;
      end;

  end else
  begin

   if not Assigned(FinputBarang) then
  Application.CreateForm(TFinputBarang, FinputBarang);

  with Finputbarang do  begin
     CanEdit := True;
     ExQry(dm.QBarang,_SQLbarang+' WHERE b.kodebarcode="'+sg1.Cells[1,sg1.Row]+'"',True);
     Ekodebarang.Text     := GetVal(dm.QBarang,'kodebarang');
     Ekodebarcode.Text    := GetVal(dm.QBarang,'kodebarcode');
     Enamabarang.Text     := GetVal(dm.QBarang,'namabarang');
     cbKategori.ItemIndex := idxCmb(cbKategori,GetValInt(dm.QBarang,'idkategori'));
     cbsatuanbeli.Text    := GetVal(dm.QBarang,'satuanbeli');
     cbSatuanjual.Text    := GetVal(dm.QBarang,'satuanjual');
     EisiBox.Text         := GetValR(dm.QBarang,'isi');
     EStokMin.Text        := GetValR(dm.QBarang,'stokmin');
     EstokMax.Text        := GetValR(dm.QBarang,'stokmax');
     Eppn.Text            := GetVal(dm.QBarang,'ppn');
     EHargaBeli.Text      := GetValCur(dm.QBarang,'hargabeli');
     EHargaSetelahPPN.Text:= getValCur(dm.QBarang,'HargaPPN');
     EHargaJual.Text      := GetValCur(dm.QBarang,'hargaecer');
     EHargaGrosir.Text    := GetValCur(dm.QBarang,'hargagrosir');
     EHargaPartai.Text    := GetValCur(dm.QBarang,'hargapartai');
     EMinimalOrder.Text   := GetValR(dm.QBarang,'minimalorder');
     Ecogs.Text           := GetValCur(dm.QBarang,'hargabeliratarata');

     idBarang             := GetVal(dm.QBarang,'idbarang');
     EnamaBarcode.Text    := GetVal(dm.QBarang,'namabarcode');

     OpenTable(dm.Q1,['*'],'multisatuan WHERE kodebarang="'+Ekodebarang.Text+'"');
     dm.Q1.RecNo := 2;
     i:=1;
     while not dm.Q1.Eof do begin

      if dm.Q1.RecNo >=2  then begin
       smb   := TcxComboBox(FindComponent('cbSatuan'+intTostr(i)));
       stxt1 := TcxTextEdit(FindComponent('EIsi'+intTostr(i)));
       stxt2 := TcxTextEdit(FindComponent('EHarga'+intTostr(i)));
       stxt3 := TcxTextEdit(FindComponent('EHargagrosir'+intTostr(i)));
       stxt4 := TcxTextEdit(FindComponent('EHargapartai'+intTostr(i)));
       stxt7 := TcxTextEdit(FindComponent('Ekodebarcode'+intTostr(i)));

       smb.Text   := GetVal(dm.Q1,'satuan');
       stxt1.Text := GetValR(dm.Q1,'isi');
       stxt2.Text := GetValR(dm.Q1,'harga');
       stxt3.Text := GetValR(dm.Q1,'hargagrosir');
       stxt4.Text := GetValR(dm.Q1,'hargapartai');
       stxt7.Text := GetVal(dm.Q1,'kodebarcode');
       Inc(i);
      end;
       dm.Q1.Next;


     end;

     OpenTable(dm.Q1,['*'],'multiqty WHERE kodebarang="'+Ekodebarang.Text+'"');
     dm.Q1.First;
     i:=1;
     while not dm.Q1.Eof do begin
       stxt1 := TcxTextEdit(FindComponent('Eqty'+intTostr(i)));
       stxt2 := TcxTextEdit(FindComponent('Eqtydan'+intTostr(i)));
       stxt3 := TcxTextEdit(FindComponent('Ehrg'+intTostr(i)));

       stxt1.Text := GetValR(dm.Q1,'qtyawal');
       stxt2.Text := GetValR(dm.Q1,'qtyakhir');
       stxt3.Text := GetValR(dm.Q1,'harga');
       Inc(i);
       dm.Q1.Next;

     end;

     Show;
  end;
end;
end;

function TFpembelianBarang.CariIsi(barcode, Satuan: string): Extended;
begin
  ExQry(dm.Q5,'select mt.isi from multisatuan mt '+
  ' WHERE mt.satuan="'+satuan+'" AND (mt.kodebarcode="'+barcode+'" OR mt.kodebarang="'+Barcode+'")',True);

  if dm.Q5.IsEmpty then begin
     ExQry(dm.Q4,'SELECT isi FROM barang WHERE satuanbeli="'+satuan+'" AND (kodebarcode="'+barcode+'" or kodebarang="'+BarCode+'")',TRue);
     Result :=   dm.Q4.Fields[0].AsFloat;
  end
  else
  begin
    Result := dm.Q5.Fields[0].AsFloat;
  end;
end;

procedure TFpembelianBarang.cbPembayaranPropertiesChange(Sender: TObject);
begin
  case cbPembayaran.ItemIndex of
  0 : begin
        cbTempo.ItemIndex := -1;
        cbAkun.Enabled    := (cbPembayaran.ItemIndex = 0) and (EnoPO.Text = '');
      end;
  1 : begin
        cbTempo.Enabled   := True;
        cbTempo.ItemIndex := 0;
        cbAkun.Enabled    := (cbPembayaran.ItemIndex = 0) and (EnoPO.Text = '');
      end;
  end;
end;

procedure TFpembelianBarang.CreateGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=0 to RowCount do
    Cells[c,r]:='';

    ColCount    := 20;
    RowCount    := 2 ;

    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'STN';
    Cells[4,0]  := 'QTY ';
    Cells[5,0]  := 'HRG BELI';
    Cells[6,0]  := 'PPN(%)';
    Cells[7,0]  := 'HRG PPN';
    Cells[8,0]  := '%';
    Cells[9,0]  := 'HRG TOKO';
    Cells[10,0]  := '%';
    Cells[11,0]  := 'HRG PARTAI';
    Cells[12,0] := '%';
    Cells[13,0] := 'HRG CABANG';
    Cells[14,0] := 'DISK(1)';
    Cells[15,0] := 'DISK(2)';
    Cells[16,0] := 'FREE ITEM';
    Cells[17,0] := 'SUBTOTAL ';
    Cells[18,0] := 'ISI ';
    Cells[19,0] := 'Kdbrng ';

    ColWidths[0]:= 30;
    ColWidths[1]:= 100;
    ColWidths[2]:= 100;
    ColWidths[3]:= 30;
    ColWidths[4]:= 30;
    ColWidths[5]:= 70;
    ColWidths[6]:= 50;
    ColWidths[7]:= 70;
    ColWidths[8]:= 30;
    ColWidths[9]:= 70;
    ColWidths[10]:= 30;
    ColWidths[11]:= 80;
    ColWidths[12]:= 30;
    ColWidths[13]:= 80;
    ColWidths[14]:= 70;
    ColWidths[15]:= 50;
    ColWidths[16]:= 0;
    ColWidths[17]:= 100;
    ColWidths[18]:= 30;
    ColWidths[19]:= 0;

    Row          := RowCount -1;
    Col          :=1;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;
 end;

end;

procedure TFpembelianBarang.CreateGridMultiHarga;
begin
  with sg2 do begin
    ClearAll;

    ColCount  := 9;
    RowCount  := 2;

    FixedCols := 0;

    Cells[0,0]:= 'Satuan';
    Cells[1,0]:= 'Isi';
    Cells[2,0]:= '%';
    Cells[3,0]:= 'Harga 1';
    Cells[4,0]:= '%';
    Cells[5,0]:= 'Harga 2';
    Cells[6,0]:= '%';
    Cells[7,0]:= 'Harga 3';
    Cells[8,0]:= 'Kode Barcode';

    ColWidths[0] := 100;
    ColWidths[1] := 40;
    ColWidths[2] := 40;
    ColWidths[3] := 100;
    ColWidths[4] := 40;
    ColWidths[5] := 100;
    ColWidths[6] := 40;
    ColWidths[7] := 100;
    ColWidths[8] := 150;

    ColumnSize.StretchColumn := 8;
    ColumnSize.Stretch       := True;
  end;
end;

procedure TFpembelianBarang.EDiskonperPropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFpembelianBarang.EdiskonrpPropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFpembelianBarang.EppnperPropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFpembelianBarang.EsatuanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY = VK_LEFT then
  begin
    sg1.Col := sg1.Col -1;
    sg1.SetFocus;
  end else
  if Key = VK_RIGHT then
  begin
    sg1.Col := sg1.Col +1;
    sg1.SetFocus;
  end else
  if (Key = VK_UP ) and (sg1.Row <> 1) then
  begin
    sg1.Col := sg1.Col;
    sg1.Row := sg1.Row -1;
    sg1.SetFocus;
  end
end;

procedure TFpembelianBarang.ESupplierKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    btnCariSupplier.Click;

  end;
end;

procedure TFpembelianBarang.Focus;
begin
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=1;
  sg1.SetFocus;
end;

procedure TFpembelianBarang.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := True;
end;

procedure TFpembelianBarang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFpembelianBarang.FormCreate(Sender: TObject);
begin

  EDiskonper.isPersen := True;
  Ediskonrp.isRupiah  := True;
  CreateGrid;
end;

procedure TFpembelianBarang.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_F6 : btnBaru.Click;
  VK_F1 : btnSimpan.Click;
  VK_F3 : btnCariBarang.Click;
  VK_F2 : begin
       if sg1.Focused then
        sg2.SetFocus else
     if sg2.Focused then
        sg1.SetFocus;

  end;
  VK_F5 : btnUbah.Click;
  VK_DELETE : btnHapus.Click;
  VK_ESCAPE : btnTutup.Click;
  end;
end;

procedure TFpembelianBarang.FormShow(Sender: TObject);
begin

  aList := TStringLIst.Create;

  sg1.SetFocus;
  ExQry(dm.QUser,'SELECT * from m_user WHERE username="'+Fmain.sbr1.Panels[2].Text+'"',True);

  SHowHarga := GetValBol(dm.QUser,'showharga');

  if SHowHarga then ETotal.Visible := True else Etotal.Visible := False;

  ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
  ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);
    cbAKun.Properties.Items.Clear;
  while not dm.Q2.Eof do begin
    cbAKun.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    dm.Q2.Next;
  end;
  cbgudang.ItemIndex  := idxCmb(cbgudang,GetValInt(dm.QUser,'gudang_beli'));
  cbAKun.ItemIndex := cbAKun.Properties.Items.IndexOf(GetVal(dm.Quser,'kas_pembelian'));
  cbPembayaran.Properties.OnChange(Sender);
end;

function TFpembelianBarang.GetHargaBeli(kodebarang: string; HargaBaru       : Real;   JumlahBaru      : Real;
  var saldolama: Real): Real;
var
  HargaLama       : Real;

  StokLama        : Real;

  HargaRata_rata  : Real;
begin
  ExQry(dm.Q1,'   SELECT hargabeli from hargabelirata WHERE kodebarang="'+kodeBarang+'" LIMIT 1 ',True);

  HargaLama := GetValF(dm.Q1,'hargabeli');

  ExQry(dm.Q1,  ' SELECT  stok '+
                ' FROM barang  WHERE kodebarang="'+kodeBarang+'" ',True);

  StokLama  := GetValF(dm.Q1,'stok');
  saldolama := StokLama;
  if ( saldolama + JumlahBaru > 0)  then

  HargaRata_rata := ((HargaLama * StokLama) + (HargaBaru * JumlahBaru)) / ( StokLama + JumlahBaru ) else
  HargaRata_rata := HargaBaru;

  Result         := HargaRata_rata;
end;

procedure TFpembelianBarang.HitungSubtotal(AROW:Integer);
var
  Harga , Jumlah ,SubTotal,isi ,PPn: Real;
  Diskon1,Diskon2,Diskon3,FixHarga,HargaSetelahPPn : Real;
  HargaDiskon1,HargaDiskon2,HargaDiskon3 : Real;
  freeItem : Real;
begin
  with sg1 do begin
    Harga        := CellF(Cells[5,aRow]);

    if Harga > 0 then begin

        Jumlah       := StrToFloatDef(koma(Cells[4,aRow]),0);
        ppn          := CellF(Cells[6,aRow]);

        Diskon1      := StrToFloatDef(koma(Cells[14,aRow]),0);
        Diskon2      := StrToFloatDef(koma(Cells[15,aRow]),0);
        freeItem      := StrToFloatDef(koma(Cells[16,aRow]),0);

        hargaDiskon1 := (Harga * Diskon1 / 100);
        FixHarga     := Harga - hargaDiskon1;
        hargaDiskon2 := (FixHarga * Diskon2 / 100);
        FixHarga     := FixHarga - hargaDiskon2;



        hargaSetelahDiskon := FixHarga;
        HargaSetelahPPN    := hargaSetelahDiskon + (hargaSetelahDiskon * ppn /100);
        isi          := CariIsi(Cells[19,aRow],Cells[3,aRow]) * Jumlah;
        SubTotal     := HargaSetelahPPN * (Jumlah - freeItem);

        Cells[7,aRow]  := Format('%.2n',[HargaSetelahPPN]);
        Cells[17,aRow] := Format('%.2n',[Subtotal]);
        Cells[18,aRow] := FloatToStr(isi);
    end;
  end;
end;

procedure TFpembelianBarang.HitungTotal;
var
  Total , Diskon, GrandTotal : Real;
  DiskonPesen,DiskonRUpiah,PPnPersen,PPnRupiah : Real;
begin
  Esubtotal.Text := Format('%.2n',[StrTOFloatDEf(SumGrid(sg1,17),0)]);

  Total       := Esubtotal.AsFLoat;
  DiskonPesen := EDiskonper.AsFLoat;
  PPnPersen   := Eppnper.AsFLoat;

  DiskonRUpiah:= Total * DiskonPesen / 100;

  if DiskonPesen > 0 then
     Ediskonrp.Text := Format('%.2n',[DiskonRUpiah]);

  if Ediskonrp.AsFLoat > 0 then

     Diskon      := Ediskonrp.AsFLoat else
     Diskon      := 0;

  if PPnPersen > 0 then begin

      PPnRupiah    := Total * PPnPersen /100;
      Eppnrup.Text := Format('%.2n',[PPnRupiah]);
  end;


  GrandTotal  := Total - Diskon + PPnRupiah;

  EGrandTotal.Text := Format('%.2n',[GrandTotal]);
  ETotal.Text      := Format('%.2n',[GrandTotal]);



end;

procedure TFpembelianBarang.KosongKanGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=1 to RowCount do
    Cells[c,r]:='';

    ColCount    := 20;
    RowCount    := 2 ;
  end;
end;

function TFpembelianBarang.Posisi(kodebarcode: String;stn : string): integer;
var
  i:integer;
  hasil : integer;
begin
  for i := 1 to sg1.RowCount-1  do begin
    if (sg1.Cells[1,i] = kodebarcode) and (sg1.Cells[3,i] = stn) then begin
      hasil  := i;

      Break;
    end else
      hasil  := 0;
  end;
  Result := hasil;
end;

procedure TFpembelianBarang.PrintBukti(NoFak: string);
const
  SQLNota = ' SELECT                                '+
            '      p.nobukti,                       '+
            '      p.tgl AS tglbeli,                '+
            '      s.namasupplier AS namasupplier,  '+
            '      p.refnota AS refnota,            '+
            '      p.total AS total,                '+
            '      u.namalengkap AS namapegawai     '+
            '    FROM                               '+
            '      pembelian p                      '+
            '      LEFT JOIN m_supplier s           '+
            '        ON s.`idsupplier` = p.`idsupplier` '+
            '      LEFT JOIN m_user u                   '+
            '        ON u.`iduser` = p.`iduser`';

begin
  ExQry(Dlaporan.QLapPembelian,SQLNota+' WHERE nobukti="'+NoFak+'"',True);


    Dlaporan.Fr1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\cetakBeli.fr3');
  //  FMemo(Dlaporan.Fr1,'Lterbilang').Text:= MyTerbilang(Dlaporan.Qpenjualan.FieldByName('grandtotal').AsFloat);
    Dlaporan.Fr1.PrepareReport(True);
    Dlaporan.Fr1.PrintOptions.ShowDialog := True;
    Dlaporan.Fr1.PrintOptions.Printer    := PrinterInvoice;
    if CheckAuto = True then
     Dlaporan.Fr1.Print else
     Dlaporan.Fr1.ShowReport();

end;


procedure TFpembelianBarang.ReplaceData;
var
  i:integer;
begin
  for i := sg1.row to sg1.RowCount -1 do
  begin
    sg1.Cells[0,i]:=Inttostr(i);
    sg1.Cells[1,i]:=sg1.Cells[1,i+1];
    sg1.Cells[2,i]:=sg1.Cells[2,i+1];
    sg1.Cells[3,i]:=sg1.Cells[3,i+1];
    sg1.Cells[4,i]:=sg1.Cells[4,i+1];
    sg1.Cells[5,i]:=sg1.Cells[5,i+1];
    sg1.Cells[6,i]:=sg1.Cells[6,i+1];
    sg1.Cells[7,i]:=sg1.Cells[7,i+1];
    sg1.Cells[8,i]:=sg1.Cells[8,i+1];
    sg1.Cells[9,i]:=sg1.Cells[9,i+1];
    sg1.Cells[10,i]:=sg1.Cells[10,i+1];
    sg1.Cells[11,i]:=sg1.Cells[11,i+1];
    sg1.Cells[12,i]:=sg1.Cells[12,i+1];
    sg1.Cells[13,i]:=sg1.Cells[13,i+1];
    sg1.Cells[14,i]:=sg1.Cells[14,i+1];
    sg1.Cells[15,i]:=sg1.Cells[15,i+1];
    sg1.Cells[16,i]:=sg1.Cells[16,i+1];
    sg1.Cells[17,i]:=sg1.Cells[17,i+1];
    sg1.Cells[18,i]:=sg1.Cells[18,i+1];
    sg1.Cells[19,i]:=sg1.Cells[19,i+1];
  end;
end;

procedure TFpembelianBarang.sg1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin

  if (SHowHarga = False) And (aCOl in [5,17]) AND (ARow >=1) then begin
     with TStringGrid(Sender) do
    begin
      //paint the background Green
      Canvas.Font.Color   := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol, ARow]);
    end;

  end;

end;

procedure TFpembelianBarang.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [17] then
    HAlign := taRightJustify;
  end;

end;

procedure TFpembelianBarang.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if (ACol in [5,9,11,13,14,15,16,17]) then
      begin
        isFloat := True;
        FloatFormat :='%.2n';
      end
  else if (ACol in [8,10,12]) then
       begin
        isFloat := True;
        FloatFormat :='%.2n';
       end
  else
       isFloat := False;
end;

procedure TFpembelianBarang.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var
 pas : Integer;
 hrg : Real;
 isiBeli,jml,qty : Real;
 ppn : Real;

 persen1,persen2,persen3 : Real;
 hargaBeli ,HargaJual1,hargajual2,hargajual3 : real;
 laba1,laba2,laba3 : real;
begin
  if (Sg1.Col = 1) And (key = 13) then begin
     if COPY(sg1.Cells[1,sg1.Row],1,1) = '+' then begin
        jml := StrToFloatDef(StringReplace(sg1.Cells[1,sg1.Row],'+','',[RfReplaceAll]),0);
        sg1.Cells[4,sg1.Row -1] := Koma(FloatToStr(jml));

        HitungSubtotal(sg1.Row -1);;
        HitungTotal;
        bersihCell;
     end else begin
     if (sg1.Cells[1,sg1.Row] <> '') then begin
        ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE (b.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" '+
        ' OR  b.namabarang LIKE "%'+sg1.Cells[1,sg1.Row]+'%" OR b.kodebarang="'+Sg1.Cells[1,sg1.Row]+'" '+
        ' ) GROUP BY b.kodebarang',True);



        if (Dm.Q1.IsEmpty) or (dm.Q1.RecordCount > 1) then begin
           ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
           ' OR b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'" OR b.kodebarang="'+Sg1.Cells[1,sg1.Row]+'") '+
           ' GROUP BY b.kodebarang',True);
           FcariBarang.Show;
           FcariBarang.isFormTransaksi := 0;

        end else if dm.Q1.RecordCount = 1 then begin



              sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
              sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'kodebarcode');
              sg1.Cells[19,sg1.Row]:= GetVal(dm.Q1,'kodebarang');
              sg1.Cells[2,sg1.Row] := GetVal(dm.Q1,'namabarang');
              sg1.Cells[3,sg1.Row] := GetVal(dm.Q1,'satuanjual');
              isiBeli              := CariIsi(sg1.Cells[1,sg1.Row],sg1.Cells[3,sg1.Row]);
              hrg                  := GetValF(dm.Q1,'hargabeli');
              sg1.Cells[4,sg1.Row] := '1';
              sg1.Cells[5,sg1.Row] := FloatTostr(hrg);
              sg1.Cells[6,sg1.Row] := GetVal(dm.Q1,'ppn');

              if GetValF(dm.Q1,'ppn') > 0 then
              ppn                  := GetValF(dm.Q1,'hargabeli') * GetValF(dm.Q1,'ppn') / 100;

              sg1.Cells[7,sg1.Row] := Format('%.0n',[getValf(dm.Q1,'hargabeli')+ppn]);
              hargaBeli  := CellF(sg1.Cells[5,sg1.Row]) ;

              if hargaBeli > 0 then begin

                  HargaJual1 := GetValF(dm.Q1,'harga');
                  HargaJual2 := GetValF(dm.Q1,'hargagrosir');
                  hargajual3 := GetValF(dm.Q1,'hargapartai');

                  laba1 := hargajual1 - hargaBeli;
                  laba2 := hargajual2 - hargaBeli;
                  laba3 := hargajual3 - hargaBeli;


                  persen1 := (laba1 / hargaBeli) * 100;
                  persen2 := (laba2 / hargaBeli) * 100;
                  persen3 := (laba3 / hargaBeli) * 100;

                  if HargaJual1 > 0 then
                  sg1.Cells[8,sg1.Row] := Format('%.2n',[persen1]);
                  sg1.Cells[9,sg1.Row] := GetVal(dm.Q1,'harga');
                  if HargaJual2 > 0 then
                  sg1.Cells[10,sg1.Row] := Format('%.2n',[persen2]);
                  sg1.Cells[11,sg1.Row] := GetVal(dm.Q1,'hargagrosir');
                  if HargaJual3 > 0 then
                  sg1.Cells[12,sg1.Row]:= Format('%.2n',[persen3]);
                  sg1.Cells[13,sg1.Row]:= GetVal(dm.Q1,'hargapartai');


                  sg1.Cells[14,sg1.Row] := '';
                  sg1.Cells[15,sg1.Row] := '';
                  sg1.Cells[16,sg1.Row] := '';
              end;

              pas    := Posisi(UPPERCASE(GetVal(dm.Q1,'kodebarcode')),sg1.Cells[3,sg1.Row]);
              if (pas <> 0) and (pas <> sg1.Row) then begin
                      isiBeli           := CariIsi(sg1.Cells[1,pas],sg1.Cells[3,pas]);
                      sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);
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
              end else begin
                    HitungSubtotal(sg1.Row);

                    if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
                    sg1.RowCount := sg1.RowCount + 1;

                    Focus;

              end;

        end;
        HitungTotal;
     end
     else begin

          ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE (m.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" '+
        ' OR  b.namabarang LIKE "%'+sg1.Cells[1,sg1.Row]+'%" OR b.kodebarang="'+Sg1.Cells[1,sg1.Row]+'" ) GROUP BY b.kodebarang',True);
          FcariBarang.Show;
          FcariBarang.isFormTransaksi := 0;
     end;
  end;
  end;

end;

procedure TFpembelianBarang.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [4,5,8,10,11,14,15,16,17,18,19]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFpembelianBarang.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
   var
    hargappn: real;
    laba1,laba2,laba3,persen1,persen2,persen3 : Real;

begin

    if (sg1.Col in  [4,5,9,6,11,13,14,15,16,6]) then
    begin
        HitungSubtotal(sg1.Row);
        HitungTotal;
        if StrToFloatDef(nilai(sg1.Cells[18,sg1.Row]),0) > 0 then

        hargappn := StrToFloatDef(Nilai(sg1.Cells[17,sg1.Row]),0) / StrToFloatDef(Nilai(sg1.Cells[18,sg1.Row]),0);

        if hargappn <> 0 then begin

            laba1       := StrToFloatDef(koma(sg1.Cells[9,sg1.Row]),0) - (hargappn);
            laba2       := StrToFloatDef(koma(sg1.Cells[11,sg1.Row]),0) - (hargappn);
            laba3       := StrToFloatDef(koma(sg1.Cells[13,sg1.Row]),0) - (hargappn);
            persen1     := (laba1 / (hargappn)) * 100;
            persen2     := (laba2 / (hargappn)) * 100;
            persen3     := (laba3 / (hargappn)) * 100;
             if CellF(sg1.Cells[9,sg1.Row]) > 0then
            sg1.Cells[8,sg1.Row] := Format('%.2n',[persen1]);
            if CellF(sg1.Cells[11,sg1.Row]) > 0then
            sg1.Cells[10,sg1.Row] := Format('%.2n',[persen2]);
            if CellF(sg1.Cells[13,sg1.Row]) > 0then
            sg1.Cells[12,sg1.Row] := Format('%.2n',[persen3]);


        end;



      end ;




   case KEy of
   VK_RETURN : if sg1.Col in [2..12] then sg1.Col := sg1.Col + 1 else Focus;

   VK_INSERT : begin
                 if sg1.Cells[1,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin
                      ExQry(dm.Q1,'INSERT INTO multisatuan(kodebarang,satuan,isi) SELECT kodebarang,satuanbeli,isi FROM barang '+
                      ' WHERE kodebarang="'+sg1.Cells[19,sg1.Row]+'" AND satuanbeli not in (select satuan FROM multisatuan WHERE '+
                      ' kodebarang="'+sg1.Cells[19,sg1.Row]+'")',False);
                      ExQry(dm.QMultiSatuan,'SELECT s.*,(b.hargabeli * s.isi) as hargabeli FROM multisatuan s left join barang b '+
                      ' ON b.kodebarang=s.kodebarang WHERE b.kodebarang="'+sg1.Cells[19,sg1.Row]+'"',True);
                      if DM.QMultiSatuan.IsEmpty then
                         Warning('Tidak ada multi satuan')
                      else begin
                         FpilihSatuan.Show;
                         FpilihSatuan.cHargabeli.Visible := True;
                         FpilihSatuan.cHarga.Visible     := False;

                         FpilihSatuan.isFormSatuan := 2;
                      end;
                    end;
               end;
   end;
end;

procedure TFpembelianBarang.sg1RowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
var
    i : integer;
    HargaBeli,Persen1,Persen2,Persen3,
    HargaJual1,HargaJual2,HargaJual3 : Real;

begin
  for i := 0  to sg1.ColCount -1 do
  begin
    sg1.Colors[i,NewRow] := clYellow;
    sg1.ColorsTo[i,NewRow] := clYellow;
    sg1.Colors[i,OldRow] := clWhite;
    sg1.ColorsTo[i,OldRow] := clWhite;
  end;

  ExQry(dm.Q5,'SELECT * FROM multisatuan WHERE kodebarang="'+sg1.Cells[19,NewRow]+'"',True);
  CreateGridMultiHarga;
   if dm.Q5.RecordCount > 1 then begin
      dm.Q5.RecNo := 2;
      HargaBeli   := StrToFloatDef(nilai(sg1.Cells[17,NewRow]),0) / StrToFloatDef(nilai(sg1.Cells[18,NewRow]),0);
      while not dm.Q5.Eof do begin
         sg2.Cells[0,sg2.RowCount -1] := GetVal(dm.Q5,'satuan');
         sg2.Cells[1,sg2.RowCount -1] := GetVal(dm.Q5,'isi');
      //   ShowMessage(GetVal(dm.Q5,'isi'));
         if GetValF(dm.Q5,'harga') > 0 then begin
           HargaJual1 := GetValF(dm.Q5,'harga') / GetValF(dm.Q5,'isi');
           Persen1    := (HargaJual1 - HargaBeli) / HargaBeli * 100;
         end else begin
           HargaJual1 := 0;
           Persen1    := 0;
         end;
         if GetValF(dm.Q5,'hargagrosir') > 0 then begin
            HargaJual2 := GetValF(dm.Q5,'hargagrosir') / GetValF(dm.Q5,'isi');
            Persen2    := (HargaJual2 - HargaBeli) / HargaBeli * 100;
         end else begin
           HargaJual2 := 0;
           Persen2    := 0;
         end;
         if GetValF(dm.Q5,'hargapartai') > 0 then begin
           HargaJual3:= GetValF(dm.Q5,'hargapartai') / GetValF(dm.Q5,'isi');
           Persen3    := (HargaJual3 - HargaBeli) / HargaBeli * 100;
         end else begin
           HargaJual3 := 0;
           Persen3    := 0;
         end;

         sg2.Cells[2,sg2.RowCount -1] := Format('%.2n',[Persen1]);
         sg2.Cells[3,sg2.RowCount -1] := Format('%.2n',[GetValF(dm.Q5,'harga')]);
         sg2.Cells[4,sg2.RowCount -1] := Format('%.2n',[Persen2]);
         sg2.Cells[5,sg2.RowCount -1] := Format('%.2n',[GetValF(dm.Q5,'hargagrosir')]);
         sg2.Cells[6,sg2.RowCount -1] := Format('%.2n',[Persen3]);
         sg2.Cells[7,sg2.RowCount -1] := Format('%.2n',[GetValF(dm.Q5,'hargapartai')]);

         sg2.Cells[8,sg2.RowCount -1] := GetVal(dm.Q5,'kodebarcode');
         dm.Q5.Next;
         sg2.RowCount := sg2.RowCount + 1;

      end;

   end;

end;

procedure TFpembelianBarang.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);

begin

   if SHowHarga = False then
      begin
        if ACol in [1,4,5,6,9,11,13,14,15,16] then
           sg1.Options := sg1.Options +[GoEditing] else
           sg1.Options := sg1.Options -[GoEditing];
      end else
   if (SHowHarga = True)  then
      begin
        if ACol in [1,4,5,6,9,11,13,14,15,16] then
           sg1.Options := sg1.Options +[GoEditing] else
           sg1.Options := sg1.Options -[GoEditing];

      end;

   

end;

procedure TFpembelianBarang.sg2CanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  CanEdit := ACol in [3,5,7,8];
end;

procedure TFpembelianBarang.sg2GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if ACol in [2,4,6] then begin
     IsFloat     := True;
     FloatFormat := '%.2n';
  end else if ACol in [3,5,7] then begin
     IsFloat     := True;
     FloatFormat := '%.0n';

  end;
end;

procedure TFpembelianBarang.sg2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    HargaBeli,Persen1,Persen2,Persen3,Persen4,Persen5,
    HargaJual1,HargaJual2,HargaJual3,HargaJual4,HargaJual5 : Real;
    i : Integer;

begin

     if sg2.Cells[0,sg2.Row] <> '' then begin

         HargaBeli   := StrToFloatDef(nilai(sg1.Cells[17,sg1.Row]),0) / StrToFloatDef(Nilai(sg1.Cells[18,sg1.Row]),0);

         if (sg2.Col in [3,5,7]) and (HargaBeli > 0) then begin

             if CellF(sg2.Cells[3,sg2.Row]) > 0 then begin
               HargaJual1 := StrToFloatDef(nilai(sg2.Cells[3,sg2.Row]),0) / StrToFloatDef(nilai(sg2.Cells[1,sg2.Row]),0);
               Persen1    := (HargaJual1 - HargaBeli) / HargaBeli * 100;
             end else begin
               HargaJual1 := 0;
               Persen1    := 0;
             end;
             if CellF(sg2.Cells[5,sg2.Row]) > 0 then begin
                HargaJual2 := StrToFloatDef(nilai(sg2.Cells[5,sg2.Row]),0) / StrToFloatDef(nilai(sg2.Cells[1,sg2.Row]),0);
                Persen2    := (HargaJual2 - HargaBeli) / HargaBeli * 100;
             end else begin
               HargaJual2 := 0;
               Persen2    := 0;
             end;
             if CellF(sg2.Cells[7,sg2.Row]) > 0 then begin
               HargaJual3 := StrToFloatDef(nilai(sg2.Cells[7,sg2.Row]),0) / StrToFloatDef(nilai(sg2.Cells[1,sg2.Row]),0);
               Persen3    := (HargaJual3 - HargaBeli) / HargaBeli * 100;
             end else begin
               HargaJual3 := 0;
               Persen3    := 0;
             end;

             sg2.Cells[2,sg2.Row] := Format('%.2n',[Persen1]);
             sg2.Cells[4,sg2.Row] := Format('%.2n',[Persen2]);
             sg2.Cells[6,sg2.Row] := Format('%.2n',[Persen3]);


         end;
     end;

  if Key = VK_RETURN then begin
     if (sg2.Col > 2) and (sg2.Col < sg2.ColCount -2) then
        sg2.Col := sg2.Col + 2 else
        begin
          sg2.Col := 3;
          sg2.Row := sg2.Row + 1;
        end;

  end;

  if Key = VK_F4 then begin
     for i := 1 to sg2.RowCount -1 do begin
      if sg2.Cells[0,i] <> '' then begin
         ExQry(dm.Q1,'UPDATE multisatuan mm LEFT JOIN barang b ON '+
        ' mm.kodebarang=b.kodebarang set '+
        ' mm.harga="'+StrToDecimal(sg2.Cells[3,i])+'",'+
        ' mm.hargagrosir="'+StrToDecimal(sg2.Cells[5,i])+'",'+
        ' mm.hargapartai="'+StrToDecimal(sg2.Cells[7,i])+'", '+

        ' mm.kodebarcode="'+StrToDecimal(sg2.Cells[8,i])+'" '+
        ' WHERE mm.kodebarang="'+sg1.Cells[19,sg1.Row]+'" AND '+
        ' mm.satuan="'+sg2.Cells[0,i]+'"',False);

      end;

    end;
    MessageDlg('Harga Berhasil Diupdate',mtInformation,[mbOK],0);

  end;


end;

procedure TFpembelianBarang.TampilAwal;
begin
  ClearText(Self);
  KosongKanGrid;
  CreateGrid;
  CreateGridMultiHarga;
  Enobukti.Text  := GetCode(dm.Q1,'pembelian','nobukti','PB'+setIdKom);
  setTanggal(Self);
  cbPembayaran.ItemIndex := 0;
  cbPembayaran.Enabled   := True;
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  ExQry(dm.Q1,'SELECT gudangbeli FROM profile',True);
  cbGudang.ItemIndex := idxCmb(cbGudang,GetValInt(dm.Q1,'gudangbeli'));

  OpenTable(dm.Q1,['kodesupplier','namasupplier'],'m_supplier WHERE namasupplier="UMUM"');

  if dm.Q1.IsEmpty then begin

    Warning('SUPPLIER UMUM TIDAK DITEMUKAN '+#13+' SILAHKAN ISI TERLEBIH DAHULU');
    CLose;

  end else
  begin
    FpembelianBarang.ESupplier.Text      := GetVal(dm.Q1,'namasupplier');
    FpembelianBarang.EKodeSupplier.Text  := GetVal(dm.Q1,'kodesupplier');
  end;
  Egrandtotal.Text := '0';
  ETotal.Text      := '0';
  ESubtotal.Text   := '0';
  Eppnper.Text     := '0';
  Eppnrup.Text     := '0';

end;

function TFpembelianBarang.ToFloat(ACol, ARow: integer): Extended;
begin
if not ACOl in [13] then
    Result := StrToFloatDef(koma(sg1.Cells[aCol,aRow]),0)
  else
    Result := StrToFloatDef(nilai(sg1.Cells[aCol,aRow]),0);
end;

end.
