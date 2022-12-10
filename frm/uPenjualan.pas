unit uPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  cxButtons, cxDropDownEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox,
  uEngine, uComCtrl, uctrlFrm, uOvEdit, dxSkiniMaginary, cxCheckBox,IniFIles,
  strUtils, uTerbilang, ujosprint,Winapi.ShellAPI,System.DateUtils, cxMemo, cxLabel, AdvUtil, UBayarPiutang,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFPenjualanBarang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Enobukti: TcxTextEdit;
    ENamaCust: TcxTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbPembayaran: TcxComboBox;
    cbTempo: TcxComboBox;
    btnCariSupplier: TcxButton;
    Label11: TLabel;
    Label12: TLabel;
    cbGudang: TcxComboBox;
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
    ETotal: TcxTextEdit;
    EkodeCust: TcxTextEdit;
    btnPenjualanNew: TcxButton;
    btnSimpan: TcxButton;
    btnCariPelanggan: TcxButton;
    btnCariBarang: TcxButton;
    btnHapus: TcxButton;
    Label13: TLabel;
    EScanBarcode: TcxTextEdit;
    btnFocus: TcxButton;
    stat1: TStatusBar;
    btnPending: TcxButton;
    btnBukaPending: TcxButton;
    btnCopyNota: TcxButton;
    jPrint1: TJPRINTER;
    Label16: TLabel;
    ESales: TcxTextEdit;
    lbl1: TLabel;
    E1: TcxTextEdit;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Esubtotal: TcxTextEdit;
    Edisc: TcxTextEdit;
    EdiscRp: TcxTextEdit;
    EGrandTotal: TcxTextEdit;
    lbl2: TLabel;
    m1: TcxMemo;
    lbl6: TLabel;
    lbl7: TLabel;
    Label14: TLabel;
    dtp1: TDateTimePicker;
    Label23: TLabel;
    Label24: TLabel;
    ENomerPO: TcxTextEdit;
    dt1: TDateTimePicker;
    btnTutup: TcxButton;
    Label26: TLabel;
    EKeterangan: TcxTextEdit;
    btnGantiKasir: TcxButton;
    Lkasir: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    LtotalRokok: TLabel;
    LtotalNonRokok: TLabel;
    LpiutangSebelumnya: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    EPembulatan: TcxTextEdit;
    cxButton1: TcxButton;
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure FormCreate(Sender: TObject);
    procedure cbPembayaranPropertiesChange(Sender: TObject);
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
    procedure btnPenjualanNewClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EScanBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPendingClick(Sender: TObject);
    procedure btnBukaPendingClick(Sender: TObject);
    procedure btnFocusClick(Sender: TObject);
    procedure btnCopyNotaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CInvoiceKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ESalesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdiscPropertiesChange(Sender: TObject);
    procedure E2PropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btnGantiKasirClick(Sender: TObject);
    procedure EPembulatanKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg1RowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    isEditHarga:Boolean;
    function sumBkp :Real;
    function  pembulatan(text:String):String;


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
    function  GetHarga(kdBarcode:string;satuan:String) : Extended;
    function  cekQty(kodebarcode:String;jml:real;stn:string):Real;
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
    function CheckMax:Boolean;
    function CheckStok(kodebarang:string;qty:Integer):Boolean;
    procedure SaveTemp(Arow:Integer);
    procedure KosongkanTemp;
    procedure SaveHargaJual(KodeBarang:string;Harga:String;Satuan:String);
    { Public declarations }
  end;


var
  FPenjualanBarang: TFPenjualanBarang;
  aList : TStringList;
  sNota       : String;
  isEditHarga : Boolean;
implementation

{$R *.dfm}

uses udm, uCaripelanggan, uCariBarang, uMainMenu, uBayar, uDlaporan,
  uPendingTransaksi, uCopyNota, uPilihSatuan, uDtrx, uSalesOrder,
  uPasswordAdmin, uCariSales, uGantiBarcode, uCariPenjualanCabang,
  uDataPenjualan, uLogin, uInputQty, uGantiKasir, uBayarTitip;

procedure TFPenjualanBarang.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFPenjualanBarang.bersihkanGrid;
var
  i : integer;
  x : integer;
begin
  for i := 1 to sg1.RowCount -1 do
  for x := 0 to sg1.ColCount -1 do
    sg1.Cells[x,i] := '';
  sg1.RowCount := 2;

end;

procedure TFPenjualanBarang.btn1Click(Sender: TObject);
begin
  FCariPenjualanCabang.ShowModal;
end;

procedure TFPenjualanBarang.btnPenjualanNewClick(Sender: TObject);
begin
  if MessageDlg('Apakah yakin akan menghapus Transaksi?',mtConfirmation,[Mbyes,mbNo],0)=mrYes then
  begin
    KosongkanTemp;
    TampilAwal;
  end;
end;

procedure TFPenjualanBarang.btnBukaPendingClick(Sender: TObject);
begin
  FpendingTransaksi.Show;
end;

procedure TFPenjualanBarang.btnCariBarangClick(Sender: TObject);
begin

   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' LIMIT 100',True);
   FcariBarang.isFormTransaksi     := 1;
   FcariBarang.chargabeli.Visible  := False;
   FcariBarang.cHargaBeli2.Visible := False;
   FcariBarang.ShowModal;
end;

procedure TFPenjualanBarang.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[9,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
    begin
      try
        Bersihcell;
        ReplaceData;
        if (sg1.Row <> sg1.RowCount -1) and (sg1.Cells[2,sg1.RowCount -1] = '') then
        sg1.RowCount :=  sg1.RowCount -1;
        ExQry(dm.Q2,'DELETE FROM temptable WHERE kodebarang="'+sg1.cells[10,sg1.Row]+'"',False);
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

procedure TFPenjualanBarang.btnPendingClick(Sender: TObject);
var
  x : integer;
  idpelanggan,KodeBarang : string;
  notempo : string;
  hpp : Real;

begin
  ExQry(dm.Q1,'select * from tempjual where fakturjual="'+sNota+'"',True);

  if dm.Q1.IsEmpty = False then
  notempo := sNota else
  notempo := GetCodeB(dm.Q1,'tempjual','fakturjual','PJ'+setIdKom);

  if sg1.Cells[2,1] ='' then
  begin
    Peringatan('Item penjualan belum dimasukan');
    focus;
  end else
  begin
    idpelanggan := getData(dm.Q2,'pelanggan where kodepelanggan="'+EkodeCust.Text+'"','idpelanggan');
    dm.Q1.Connection.StartTransaction;
    try

      addParam('fakturjual',   notempo,            aList,'str');
      addParam('tgljual',      frmTgl(dt1.Date),     aList,'date');
      addParam('pembayaran',   IntToStr(cbPembayaran.ItemIndex),        aList,'str');
      addParam('idpelanggan',  idpelanggan,              aList,'str');
      addParam('iduser',       stat1.Panels[3].Text,aList,'str');
      addParam('total',        SumGrid(sg1,8),aList,'str');
      addParam('diskon',       StrTODecimal(EdiscRp.Text),aList,'str');
      addParam('grandtotal',   StrTODecimal(EGrandTotal.Text),aList,'str');
      addParam('nontunai',     Trim(Fbayar.Ebayar.isAngka),aList,'str');
      addParam('bayar',        Trim(Fbayar.ETUnai.isAngka),aList,'str');
      addParam('kembali',      Trim(Fbayar.Ekembali.isAngka), aList,'str');
      addParam('idsales',      getData(dm.Q1,'sales WHERE kodesales="'+E1.Text+'"','idsales'),aList,'str');

      OpenTable(dm.Q2,['idjual'],'tempjual where fakturjual="'+notempo+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'tempjual',alist)
      else
         UpdatePOST(dm.Q1,'tempjual',alist,'idjual',GetVal(dm.Q2,'idjual'));

      ExQry(dm.Q2,'delete from tempjualdetail where fakturjual="'+notempo+'"',False);
      for x := 1 to sg1.RowCount -1 do
        begin

          if sg1.Cells[8,x] <> '' then
          begin
            if StrToFloatDef(nilai(sg1.Cells[9,x]),0) = 0 then
               sg1.Cells[9,x] := '1';

              openTable(dm.Q2,['b.kodebarang','h.hargabeli'],'barang b LEFT JOIN hargabelirata h '+
              ' ON h.kodebarang=b.kodebarang '+
              ' where b.kodebarang="'+sg1.cells[10,x]+'" GROUP BY b.kodebarang');
              KodeBarang := Getval(dm.Q2,'kodebarang');
              hpp        := Getvalf(dm.Q2,'hargabeli');
              addParam('fakturjual',  notempo,          aList,'str');
              addParam('kodebarang',  sg1.Cells[10,x],             Alist,'str');
              addParam('satuan',      sg1.Cells[7,x],         Alist,'str');
              addParam('harga',       StrTODecimal(sg1.Cells[3,x]),  Alist,'str');
              addParam('hpp',         StrTODecimal(FloatToStr(hpp)),                    Alist,'str');
              addParam('jumlah',      KomaDatabase(sg1.Cells[4,x]),   Alist,'str');
              addParam('diskonpersen',StrTODecimal(sg1.Cells[5,x]),   Alist,'str');
              addParam('diskonrupiah',StrTODecimal(sg1.Cells[6,x]),  Alist,'str');
              addParam('subtotal',    StrTODecimal(sg1.Cells[8,x]),  Alist,'str');
              addParam('isi',         KomaDatabase(sg1.Cells[9,x]), Alist,'str');
              addParam('idgudang',    GetIdcmb(cbGudang),     Alist,'str');

              Post(dm.Q1,'tempjualdetail',aList)

          end else
          if (sg1.Cells[2,x] = '') and (sg1.Cells[8,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
            MessageBox(Handle,'Kode Barcode Harus Di Isi !! '+#13+' Silahkan Isi terlebih Dahulu !! '+#13+
                       'Atau batalkan item dengan menekan tombol [ DELETE ]','ERROR',MB_ICONERROR);
            sg1.Row := x;
            sg1.Col := 2;
            dm.Q1.Connection.Rollback;
            Abort;
          end;
        end;


          dm.Q1.Connection.Commit;
      except
        dm.Q1.Connection.Rollback;
      end;
    KosongkanTemp;
    TampilAwal;
  end;
end;

procedure TFPenjualanBarang.btnSimpanClick(Sender: TObject);
begin
  if sg1.Cells[2,1] = '' then begin
    Error('Belum ada transaksi');
  end else if NOT CheckEdit(Self) then begin
   if cbPembayaran.ItemIndex = -1 then
    begin
      peringatan(' Pembayaran belum ditentukan');
      cbPembayaran.ItemIndex := 0;
    end else begin
        ExQry(dm.Q3,'SELECT fakturjual FROM penjualan WHERE fakturjual="'+Enobukti.Text+'"',True);

      if dm.Q3.IsEmpty = False then begin
         if isEdit = True then begin

                 if MessageDlg('No Faktur Sudah Diinput !!!, Apakah ingin mengubah data ? ',mtWarning,[mbYes,mbNo],0) = Mryes then
                  begin
                         if CheckMax = False then begin

                            Fbayar.Etotal.Text      := GetRupiah(SumGrid(sg1,8));
                            Fbayar.EdiscRp.Text     := EdiscRp.Text;
                            Fbayar.EGrandTotal.Text := EGrandTotal.Text;
                            if cbPembayaran.ItemIndex = 1 then

                            Fbayar.Ekembali.Text    := EGrandTotal.Text
                            else begin
                              Fbayar.ETUnai.Text    := EGrandTotal.Text;
                              Fbayar.Ekembali.Text    := '0';
                            end;

                            ExQry(dm.Q2,'SELECT poin FROM pelanggan WHERE kodepelanggan="'+EkodeCust.Text+'"',True);
                            Fbayar.Epelanggan.Text  := ENamaCust.Text;
                            Fbayar.EPoin.Text       := GetValR(dm.Q2,'poin');
                            Fbayar.Show;

                        end  else
                        begin
                             Error('Piutang pelanggan melampaui '+#13+'jumlah piutang yang telah ditetapkan');
                             Exit;

                        end;
                  end else
                  Exit;
         end else begin
            Enobukti.Text  := GetCodeB(dm.Q1,'penjualan','fakturjual','PJ'+setIdUser);
            if CheckMax = False then begin

                  ExQry(dm.Q2,'SELECT SUM(kekurangan) as totalpiutang FROM v_piutang WHERE kodepelanggan="'+EkodeCust.Text+'" '+
                  ' AND lunas=false',True);



                  Fbayar.Etotal.Text      := GetRupiah(SumGrid(sg1,8));
                  Fbayar.EdiscRp.Text     := EdiscRp.Text;
                  Fbayar.EGrandTotal.Text := EGrandTotal.Text;
                  Fbayar.ETotalPiutang.Text:= GetValR(dm.Q2,'totalpiutang');
                  Fbayar.ETotalHarusBayar.Text := Format('%.2n',[GetValf(dm.Q2,'totalpiutang')+EgrandTotal.AsFLoat]);
                  ExQry(dm.Q2,'SELECT poin FROM pelanggan WHERE kodepelanggan="'+EkodeCust.Text+'"',True);
                  Fbayar.Epelanggan.Text  := ENamaCust.Text;
                  Fbayar.EPoin.Text       := GetValR(dm.Q2,'poin');
                  if cbPembayaran.ItemIndex = 1 then

                  Fbayar.Ekembali.Text    := EGrandTotal.Text
                  else
                  Fbayar.Ekembali.Text    := '0';


                  Fbayar.Show;

          end
         end;
      end else begin
        if CheckMax = False then begin

          ExQry(dm.Q2,'SELECT SUM(kekurangan) as totalpiutang FROM v_piutang WHERE kodepelanggan="'+EkodeCust.Text+'" '+
          ' AND lunas=false',True);



          Fbayar.Etotal.Text      := GetRupiah(SumGrid(sg1,8));
          Fbayar.EdiscRp.Text     := EdiscRp.Text;
          Fbayar.EGrandTotal.Text := EGrandTotal.Text;
          Fbayar.ETotalPiutang.Text:= GetValR(dm.Q2,'totalpiutang');
          Fbayar.ETotalHarusBayar.Text := Format('%.2n',[GetValf(dm.Q2,'totalpiutang')+EgrandTotal.AsFLoat]);
          ExQry(dm.Q2,'SELECT poin FROM pelanggan WHERE kodepelanggan="'+EkodeCust.Text+'"',True);
          Fbayar.Epelanggan.Text  := ENamaCust.Text;
          Fbayar.EPoin.Text       := GetValR(dm.Q2,'poin');
          if cbPembayaran.ItemIndex = 1 then

          Fbayar.Ekembali.Text    := EGrandTotal.Text
          else
          Fbayar.Ekembali.Text    := '0';


          Fbayar.Show;

      end  else
      begin
           Error('Piutang pelanggan melampaui '+#13+'jumlah piutang yang telah ditetapkan');
           Exit;

      end;
    end;
   end 
  end;
end;

procedure TFPenjualanBarang.btnCariPelangganClick(Sender: TObject);
begin
  FcariPelanggan.EPencarian.Text := EScanBarcode.Text;
  Fcaripelanggan.Show;
  Fcaripelanggan.isFormPelanggan := 0;
end;

procedure TFPenjualanBarang.btnCopyNotaClick(Sender: TObject);
begin
  FCopyNota.Show;
  FCopyNota.cxg3.SetFocus;
end;

procedure TFPenjualanBarang.btnFocusClick(Sender: TObject);
begin
  Focus;
end;

procedure TFPenjualanBarang.btnGantiKasirClick(Sender: TObject);
begin
  FGantiKasir.ShowModal;
end;

procedure TFPenjualanBarang.btnTutupClick(Sender: TObject);
begin
  Close;

end;

procedure TFPenjualanBarang.BukaLaci;

var
  Path : String;
begin
  Path := ExtractFilePath(Application.ExeName)+'buka.exe';

  ShellExecute(handle,'Open',
    pChar(Path),
    nil,nil,SW_hide);


end;

function TFPenjualanBarang.CariIsi(barcode, Satuan: string): Extended;
begin
  ExQry(dm.Q6,'select mt.isi from multisatuan mt LEFT JOIN '+
  ' barang b ON b.kodebarang=mt.kodebarang '+
  ' WHERE mt.satuan="'+satuan+'" AND '+
  ' (b.kodebarcode="'+barcode+'" OR b.kodebarang="'+barcode+'")',True);

  if dm.Q6.IsEmpty then
     Result :=   1
  else
  begin
    if dm.Q6.Fields[0].AsFloat = 0 then
    Result := 1 else
    Result := dm.Q6.Fields[0].AsFloat;
  end;
end;


procedure TFPenjualanBarang.cbPembayaranPropertiesChange(Sender: TObject);
begin
  case cbPembayaran.ItemIndex of
  0 : cbTempo.ItemIndex := -1;
  1 : begin
        cbTempo.ItemIndex := 0;
        Fbayar.Label9.Caption := 'KEKURANGAN'
      end;
  end;
end;

function TFPenjualanBarang.cekQty(kodebarcode: String; jml: real;stn:String): Real;
var
  harga : Real;
begin
      harga := GetHarga(kodebarcode,stn);
      ExQry(dm.Q3,'select q.harga,q.satuan,q.qtyawal,q.qtyakhir '+
      ' From multiqty q '+
      ' where q.kodebarang="'+kodebarcode+'" AND q.satuan="'+stn+'" '+
      ' AND '+StrToDecimal(FloatToStr(jml))+' >= q.qtyawal '+
      ' AND '+StrToDecimal(FloatToStr(jml))+'<q.qtyakhir ',True);


      if not dm.Q3.IsEmpty then begin
         Result := GetValF(dm.Q3,'harga');
        end else
        Result := harga;

end;

function TFPenjualanBarang.CheckAuto: Boolean;

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

function TFPenjualanBarang.CheckDirect: Boolean;
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


function TFPenjualanBarang.CheckMax: Boolean;
var
  jmlPiutang, MaxPiutang  : Real;
begin
  ExQry(dm.Q1,'SELECT SUM(kekurangan) as total from piutang p LEFT join penjualan pj '+
  ' ON pj.fakturjual=p.fakturjual LEFT join pelanggan pl ON pl.idpelanggan=pj.idpelanggan '+
  ' WHERE pl.kodepelanggan="'+EkodeCust.Text+'" AND lunas=False',True);
  jmlPiutang := CellF(SumGrid(sg1,8)) + GetValF(dm.Q1,'total');

  ExQry(dm.Q1,'SELECT maxpiutang,metodepiutang From pelanggan WHERE kodepelanggan="'+EkodeCust.Text+'"',True);

  MaxPiutang := GetValF(dm.Q1,'maxpiutang');
  Result := False;
  if GetVal(dm.Q1,'metodepiutang')<>'JUMLAH NOTA' then begin

    if (jmlPiutang >= MaxPiutang) and (MaxPiutang <> 0) and (isEdit = False) then
      Result := True;
  end;


end;

function TFPenjualanBarang.CheckStok(kodebarang: string; qty: Integer): Boolean;
var
  Stok : Integer;
begin
  ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE  ks.kodebarang="'+kodebarang+'" ',True);
  Stok := GetValInt(dm.Q1,'STOK');

  if Stok < qty then
     Result := False else
  Result := True;

end;

procedure TFPenjualanBarang.CInvoiceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Scan Barcode
  if Key = VK_F2 then
    Focus;
end;

procedure TFPenjualanBarang.CreateGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    ClearAll;

    ColCount    := 14;
    RowCount    := 2 ;



    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'HARGA';
    Cells[4,0]  := 'QTY';
    Cells[5,0]  := 'DISC(%)';
    Cells[6,0]  := 'DISC(Rp)';
    Cells[7,0]  := 'SATUAN';
    Cells[8,0]  := 'SUBTOTAL ';
    Cells[9,0]  := 'Isi ';
    Cells[10,0] := 'kodebarang ';
    Cells[11,0] := 'hpp ';
    Cells[12,0] := 'kategori ';
    Cells[13,0] := 'bkp';

    ColWidths[0]:= 50;
    ColWidths[1]:= 0;
    ColWidths[2]:= 350;
    ColWidths[3]:= 100;
    ColWidths[4]:= 70;
    ColWidths[5]:= 80;
    ColWidths[6]:= 80;
    ColWidths[7]:= 70;
    ColWidths[8]:= 120;
    ColWidths[9]:= 0;
    ColWidths[10]:= 0;
    ColWidths[11]:= 0;
    ColWidths[12]:= 0;
    ColWidths[13]:= 0;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;

 end;

end;

procedure TFPenjualanBarang.cxButton1Click(Sender: TObject);
begin
    if not Assigned(FbayarPiutangTitip) then
  Application.CreateForm(TFbayarPiutangTitip,FbayarPiutangTitip);
  FbayarPiutangTitip.TampilanAwal;
  FbayarPiutangTitip.ShowModal;
end;

procedure TFPenjualanBarang.E2PropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFPenjualanBarang.EPembulatanKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  HitungTotal;
end;

procedure TFPenjualanBarang.EdiscPropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFPenjualanBarang.ESalesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

    ExQry(dm.Q1,'SELECT * FROM sales WHERE namasales="'+ESales.Text+'"',True);

    if dm.Q1.IsEmpty  then begin
       ExQry(dm.QSales,'SELECT * FROM sales ',True);

       Fcarisales.Show;
       FcariSales.isFormSales := 0;
    end else
    begin
      ESales.Text := GetVal(dm.Q1,'namasales');
      E1.Text     := GetVal(dm.Q1,'kodesales');
    end;
  end;
end;

procedure TFPenjualanBarang.EScanBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  i : integer;
begin
  case Key of
  VK_RETURN : begin
                 OpenTable(dm.Q1,['kodepelanggan','namapelanggan','idjenispelanggan','poin','maxjmlinvoice','alamat'],'pelanggan WHERE '+
                 ' kodepelanggan="'+EScanBarcode.Text+'" or namapelanggan LIKE "%'+EScanBarcode.Text+'%"');

                 ExQry(dm.Q2,'SELECT SUM(kekurangan) as totalpiutang FROM v_piutang WHERE kodepelanggan="'+EkodeCust.Text+'" '+
                 ' AND lunas=false',True);

                 LpiutangSebelumnya.Caption := Format('%.2n',[GetValF(dm.Q2,'totalpiutang')]);
                 if (dm.Q1.IsEmpty = False) and (dm.Q1.RecordCount = 1) then begin
                    ENamaCust.Text := GetVal(dm.Q1,'namapelanggan')+' POIN : ['+GetValR(dm.Q1,'poin')+']';
                    EkodeCust.Text := GetVal(dm.Q1,'kodepelanggan');
                    m1.Text        := GetVal(dm.Q1,'alamat');
                    for i := 1  to sg1.RowCount -1 do
                      begin
                        if sg1.Cells[2,i] <> '' then begin
                            sg1.Cells[3,i] := Format('%.2n',[GetHarga(sg1.Cells[10,i],sg1.Cells[7,i])]);
                            HitungSubtotal(i);
                        end;

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

procedure TFPenjualanBarang.Focus;
begin
  sg1.SetFocus;
  sg1.Options := sg1.Options + [goEditing];
  sg1.Options := sg1.Options - [goRowSelect];
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=2;
  bersihCell;
end;

procedure TFPenjualanBarang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFPenjualanBarang.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if StrToFloatDef(nilai(SumGrid(sg1,8)),0) > 0 then begin
   CanClose := False;
   if MessageDlg('Transaksi Belum Selesai, Apakah ingin menutup Program?',
       mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
         ExQry(dm.QUser,'SELECT * from m_user WHERE username="'+Fmain.sbr1.Panels[2].Text+'"',True);
         if GetVal(dm.QUser,'penjualan_only') = 'True' then
         begin
          // CanClose := True;
               KosongkanTemp;
           Application.Terminate;
         end else begin
            KosongkanTemp;
            CanClose := True;
         end;
       end;

 end else begin
  ExQry(dm.QUser,'SELECT * from m_user WHERE username="'+Fmain.sbr1.Panels[2].Text+'"',True);
         if GetVal(dm.QUser,'penjualan_only') = 'True' then
         begin
           if MessageDlg('Apakah Yakin akan menutup program?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
              Application.Terminate
           else CanClose := False;
         end else CanClose := True;
 end;
end;

procedure TFPenjualanBarang.FormCreate(Sender: TObject);
begin

  FPenjualanBarang   := Self;
  ESales.isCari      := True;
  CreateGrid;
end;

procedure TFPenjualanBarang.FormShow(Sender: TObject);

begin
  aList := TStringLIst.Create;
  stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
  Focus;
  ExQry(dm.QUser,'SELECT * from m_user WHERE username="'+Fmain.sbr1.Panels[2].Text+'"',True);
  dtp1.Date := now;
  OpenTable(dm.Q1,['editharga'],'m_user WHERE iduser="'+stat1.Panels[3].Text+'"');
  isEditHarga := GetValBol(dm.Q1,'editharga');
end;

function TFPenjualanBarang.GetHarga(kdBarcode: string;satuan:string): Extended;
var
  qry   : string;
  stts  : string;
begin

  qry   := 'SELECT idjenispelanggan from pelanggan where kodepelanggan="'+Ekodecust.Text+'"';
  ExQry(dm.Q3,qry,True);
  stts  := dm.Q3.Fields[0].AsString;

  ExQry(dm.Q5,'SELECT harga FROM hargaperpelanggan WHERE satuan="'+Satuan+'" '+
  ' AND kodebarang="'+kdBarcode+'" AND kodepelanggan="'+EkodeCust.Text+'" ',True);

  if dm.Q5.IsEmpty = False then begin
     Result := GetValF(dm.Q5,'harga');

  end else begin

        qry   := ' SELECT m.harga,m.hargagrosir,m.hargapartai,m.tglawal,m.tglakhir,m.hargapromo,'+
                 ' m.tglawal2,m.tglakhir2,m.hargapromo2,m.tglawal3,m.tglakhir3,m.hargapromo3 FROM multisatuan m'+
                 ' LEFT JOIN barang b ON b.kodebarang=m.kodebarang where '+
                 ' m.kodebarang="'+kdBarcode+'" AND m.satuan="'+Satuan+'" ';

        ExQry(dm.Q2,qry,True);

        if (UpperCase(stts) ='5') then begin
           if (GetValF(dm.Q2,'hargapromo2') > 0)
              and (now >= dm.Q2.FieldByName('tglawal2').AsDateTime)
              and (Now <= dm.Q2.FieldByName('tglakhir2').AsDateTime)   then begin

              Result := GetValF(dm.Q2,'hargapromo2')
              end else begin
               if (dm.Q2.FieldByName('hargagrosir').AsFloat <> 0) then
                  Result    := dm.Q2.FieldByName('hargagrosir').AsFloat
               else
                  Result    := dm.Q2.FieldByName('harga').AsFloat;
              end;
        end else
        if (UpperCase(stts) ='4') then begin
           if (GetValF(dm.Q2,'hargapromo') > 0)
              and (now >= dm.Q2.FieldByName('tglawal').AsDateTime)
              and (Now <= dm.Q2.FieldByName('tglakhir').AsDateTime)   then begin

              Result := GetValF(dm.Q2,'hargapromo')
              end else begin
                 if dm.Q2.Fields[0].AsFloat <> 0 then
                    Result := dm.Q2.FieldByName('harga').AsFloat
                 else
                    Result := dm.Q2.FieldByName('harga').AsFloat;
              end;

          // ShowMessage(dm.Q2.Fields[0].AsString);
        end else
        if UpperCase(stts) ='6' then begin
           if (GetValF(dm.Q2,'hargapromo3') > 0)
              and (now >= dm.Q2.FieldByName('tglawal3').AsDateTime)
              and (Now <= dm.Q2.FieldByName('tglakhir3').AsDateTime)   then begin

              Result := GetValF(dm.Q2,'hargapromo3')
              end else begin
                 if dm.Q2.FieldByName('hargapartai').AsFloat <> 0 then
                    Result := dm.Q2.FieldByName('hargapartai').AsFloat
                 else begin

                    Result := dm.Q2.FieldByName('harga').AsFloat;
                 end;
              end;
        end else
        if UpperCase(stts) ='7' then begin
           if dm.Q2.Fields[0].AsFloat <> 0 then
              Result := dm.Q2.Fields[0].AsFloat
           else begin

              Result := dm.Q2.Fields[0].AsFloat;
           end;
        end  else
        if UpperCase(stts) ='8' then begin
           if dm.Q2.Fields[0].AsFloat <> 0 then
              Result := dm.Q2.Fields[0].AsFloat
           else begin

              Result := dm.Q2.Fields[0].AsFloat;
           end;
        end else Result    := dm.Q2.Fields[0].AsFloat

  end;



end;


function TFPenjualanBarang.Header(txt: string): string;
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

procedure TFPenjualanBarang.HitungSubtotal(AROW:Integer);
var
  Harga , Jumlah,TotalJUmlah , DiskonPersen,SubTotal,Diskon2 : Real;
  isiJual : Real;
  hargaDiskon1,FixHarga : Real;
  stokAkhir : Real;
  stts : string;
  isi : Real;
  jml : String;
begin
  with sg1 do begin
     ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE b.kodebarang="'+sg1.Cells[10,Arow]+'" ',True);

    stokAkhir     := GetValF(dm.Q1,'stok');
    Jumlah        := StrToFloatDef(koma(Cells[4,aRow]),0);
    isi           := CariIsi(Cells[10,Arow],Cells[7,aRow]);
    TotalJUmlah   :=  isi * Jumlah ;



       if (TotalJUmlah > stokAkhir) and (not isMinus) then begin
          Error('Stok tidak mencukupi !!'+#13+'Sisa Stok = '+FloatTOStr(stokAkhir / isi)+' '+
          ' '+Cells[7,AROw]+#13+'Jumlah Yg diinput = '+FloatToStr(TotalJUmlah/isi)+' '+
          ' '+Cells[7,AROw]+'');
          Cells[4,Arow] := '1';
          Cells[8,aRow] := Cells[3,aRow];
          Exit;

       end;

    stts :=getData(dm.Q3,'pelanggan WHERE kodepelanggan="'+EkodeCust.Text+'"','idjenispelanggan');
    ExQry(dm.Q5,'SELECT editharga FROM m_user WHERE iduser="'+stat1.Panels[3].Text+'"',True);
    isEditHarga := dm.Q5.FieldByName('editharga').AsBoolean;

    if (stts = '4')  then begin

        if ((sg1.Col = 4) or (sg1.Col = 2)) and  (Jumlah > 1)then  begin
//          if (isEditHarga = False) then

          sg1.Cells[3,AROW] := Format('%.2n',[cekQty(sg1.Cells[10,AROW],Jumlah,sg1.Cells[7,AROW])]);
        end ;

    end else if stts = '5' then begin

          if ((sg1.Col = 4) or (sg1.Col = 2)) and  (Jumlah > 1) then
//          if (isEditHarga = False) then
              sg1.Cells[3,AROW] := Format('%.2n',[cekQty(sg1.Cells[10,AROW],Jumlah,sg1.Cells[7,AROW])]);

    end else if stts = '6' then begin


          if ((sg1.Col = 4) or (sg1.Col = 2))and  (Jumlah > 1)  then
//          if (isEditHarga = False) then
          sg1.Cells[3,AROW] := Format('%.2n',[cekQty(sg1.Cells[10,AROW],Jumlah,sg1.Cells[7,AROW])]);

    end else if stts = '7' then begin


          if ((sg1.Col = 4) or (sg1.Col = 2)) and  (Jumlah > 1) then
//          if (isEditHarga = False) then
          sg1.Cells[3,AROW] := Format('%.2n',[cekQty(sg1.Cells[10,AROW],Jumlah,sg1.Cells[7,AROW])]);

    end;


    Harga        := StrToFloatDef(nilai(Cells[3,aRow]),0);

    DiskonPersen := StrToFloatDef(koma(Cells[5,aRow]),0);

    if (DiskonPersen > 0) then begin
       hargaDiskon1 := ROUND(Harga * DiskonPersen / 100);
       FixHarga     := Harga - hargaDiskon1;
       Cells[6,Arow]:= Format('%.0n',[HargaDiskon1*Jumlah]);
    end  else  FixHarga := Harga;

    SubTotal     := Round(Harga * Jumlah);
    Diskon2      := StrToFloatDef(nilai(Cells[6,aRow]),0);

    if Diskon2 > 0 then
       SubTotal  := SubTotal - Diskon2;



    isiJual      := CariIsi(Cells[10,aRow],Cells[7,aRow]) * Jumlah;

    Cells[8,aRow] := GetRupiah(FloatToStr(Subtotal));
    Cells[9,aRow] := FloatToStr(isiJual);
    HitungTotal;
    SaveTemp(Arow);
  end;
end;

procedure TFPenjualanBarang.HitungTotal;
var
  Total , Diskon, PPn, GrandTotal,TotalRokok,TotalNonRokok : Real;
  DiskonPesen,DiskonRUpiah : Real;
  BiayaLain : Real;
  i : Integer;
begin
  Esubtotal.Text := GetRupiah(SumGrid(sg1,8));

  Total       := Esubtotal.AsFLoat;
  DiskonPesen := Edisc.AsFLoat;

  DiskonRUpiah:= Round(Total * DiskonPesen / 100);

  if DiskonPesen > 0 then
     EdiscRp.Text := GetRupiah(FloatToStr(DiskonRUpiah));


  Diskon      := EdiscRp.AsFLoat;
  GrandTotal  := Total - Diskon + PPn + BiayaLain;

  EPembulatan.Text := pembulatan(FloatToStr(total-diskon));
  EGrandTotal.Text := GetRupiah(Bulat(FloatToStr(GrandTotal)));
  ETotal.Text      := GetRupiah(Bulat(FloatToStr(GrandTotal)));

  TotalRokok    := 0;
  TotalNonRokok := 0;
  for I := 1 to sg1.RowCount -1 do begin
    if UPPERCASE(sg1.Cells[12,i]) = 'ROKOK' then
       TotalRokok := TotalRokok + CellF(sg1.Cells[8,i])
    else
       TotalNonRokok := TotalNonRokok + CellF(sg1.Cells[8,i]);
  end;

  LtotalRokok.Caption    := Format('%.0n',[TotalRokok]);
  LtotalNonRokok.Caption := Format('%.0n',[TotalNonRokok]);


end;

procedure TFPenjualanBarang.KosongkanTemp;
begin
  ExQry(dm.Q1,'DELETE FROM temptable WHERE iduser="'+stat1.Panels[3].Text+'"',False);
end;

function TFPenjualanBarang.pembulatan(text: String): String;
var
  angka : real;
  bil : real;
begin
  angka := StrToint(Copy(text,length(text)-1,2));

  if   (angka <100) and (angka <> 0)then
  begin
    bil := 100 - angka;
    Result := GetRupiah(FloatTostr(bil));
  end else
    Result := '0';
end;

function TFPenjualanBarang.Posisi(kodebarcode: String;stn:string): integer;
var
  i:integer;
  hasil : integer;
begin
  for i := 1 to sg1.RowCount-1  do begin
    if (sg1.Cells[10,i] = kodebarcode) and (sg1.Cells[7,i] = stn) then begin
      hasil  := i;

      Break;
    end else
      hasil  := 0;
  end;
  Result := hasil;
end;

procedure TFPenjualanBarang.printdirect(Nofaktur: string;CP : Boolean);
var
  i           : integer;
  total       : string;
  diskon      : string;
  grandtotal  : string;
  nontunai    : string;
  Bayar       : String;
  Kembali     : String;
  totalDiskon : Real;
  TotalSebelumDiskon : Real;
  TotalRokok , TotalNonRokok : String;
  TotalPoin  : string;
  TotalPoinPelanggan : string;
  PoinRokok , PoinNonRokok : Integer;
  BiayaLain : String;
  Keterangan : String;
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
            '      pl.poin,                               '+
            '      s.namasales,                               '+
            '      p.pembayaran,                              '+
            '      p.total,                                   '+
            '      p.diskon,                                  '+
            '      p.grandtotal,                              '+
            '      pg.namalengkap,                            '+
            '      p.nontunai,                                '+
            '      p.keterangan,                                '+
            '      p.bayar,                                   '+
            '      p.biayalain,                                   '+
            '      p.kembali,                                 '+
            '      p.totalrokok,                              '+
            '      p.totalnonrokok,biayalain,lastupdate                  '+
            '    FROM                                         '+
            '      penjualan p                                '+
            '      LEFT JOIN pelanggan pl                     '+
            '        ON pl.`idpelanggan` = p.`idpelanggan`    '+
            '      LEFT JOIN m_user pg                        '+
            '       ON pg.iduser=p.`iduser`                   '+
            '      LEFT JOIN sales s ON                       '+
            '         s.idsales=p.idsales ';
  _SQLDetailJual = ' SELECT                                  '+
                     '     d.iddetil,                          '+
                     '     d.fakturjual,                       '+
                     '     d.kodebarang,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,'+
                     '     d.hpp,                              '+
                     '     SUM(d.jumlah) as jumlah,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskon2,                     '+
                     '     d.diskon3,                     '+
                     '     d.diskonrupiah,                     '+
                     '     d.subtotal,                         '+
                     '     d.harga * jumlah as subtotal2,      '+
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
     ExQry(dm.Q1,'select * '+
     'from profile where idprofil=1',True);


     jprint1.WriteLn(Header(dm.Q1.FieldByName('nama').AsString));
     jprint1.WriteLn(Header(dm.Q1.FieldByName('alamat').AsString));
     jprint1.WriteLn(Header(dm.Q1.FieldByName('kota').AsString));
     jprint1.WriteLn(Header(dm.Q1.FieldByName('notelepon').AsString));
     jPrint1.WriteLn(Enter);
     ExQry(dm.Q2,SQLnota+' WHERE fakturjual="'+Nofaktur+'"',True);

     if CP = TRue then
     jPrint1.WriteLn('COPY STRUK');

     jprint1.WriteLn(' No.    : '+dm.Q2.FieldByName('fakturjual').AsString+' '+RataKanan(5,'Tgl :')+''+RataKanan(10,FormatDateTime('dd/mm/yyyy',GetValDate(dm.Q2,'lastupdate'))));
     jprint1.WriteLn(' Kasir  : '+dm.Q2.FieldByName('namalengkap').AsString+' '+RataKanan(8,' Jam :')+''+RataKanan(10,FormatDateTime('hh:nn:ss',GetValDate(dm.Q2,'lastupdate'))));
//     jprint1.WriteLn(' Cust   : '+ Enamacust.Text);
//     jprint1.WriteLn(' Packing: '+dm.Q2.FieldByName('namasales').AsString);

     TotalPoinPelanggan   := GetVal(dm.Q2,'poin');

     totalDiskon := 0 ;
     jprint1.WriteLn(Sparator('='));
     ExQry(dm.Q3,_SQLDetailJual+' where fakturjual="'+Nofaktur+'" GROUP BY b.namabarang,d.satuan ORDER BY iddetil ASC',True);
      for i := 0 to dm.Q3.RecordCount -1 do
      begin
         jprint1.WriteLn(' '+IntToStr(dm.Q3.RecNo)+'. '+dm.Q3.FieldByName('namabarang').AsString);
         jprint1.WriteLn('  '+vItems(GetRupiah(dm.Q3.FieldByName('harga').AsString),
                                           dm.Q3.FieldByName('jumlah').AsString,
                                           dm.Q3.FieldByName('satuan').AsString,
                                           GetRupiah(dm.Q3.FieldByName('subtotal2').AsString)));
         totalDiskon := totalDiskon + dm.Q3.FieldByName('diskonrupiah').AsFloat;
         dm.Q3.Next;
      end;
      TotalSebelumDiskon :=  dm.Q2.FieldByName('total').AsFloat + totalDiskon;
      jprint1.WriteLn(Sparator('='));
      total       := '  TOTAL         ';
      diskon      := '  DISKON        ';
     // BiayaLain   := '  BIAYA KIRIM   ';
      grandtotal  := '  GRANDTOTAL    ';
      Bayar       := '  BAYAR         ';
    //  nontunai    := '  NON TUNAI     ';
     // TotalRokok  := '  CIGARET       ';
     // TotalNonRokok:= '  NON CIGARET   ';

      //if dm.Q2.FieldByName('grandtotal').AsFloat > dm.Q2.FieldByName('bayar').AsFloat then
      //Kembali     := '  KEKURANGAN    ' else
      Kembali     := '  KEMBALI       ';
      TotalPoin    :='  TOTAL POIN    ';

      jprint1.WriteLn(vTotal(total,Format('%.0n',[TotalSebelumDiskon])));
     // jPrint1.WriteLn(vTotal(TotalRokok,Trim(GetRupiah(dm.Q2.FieldByName('totalrokok').AsString))));
     // jPrint1.WriteLn(vTotal(TotalNonRokok,Trim(GetRupiah(dm.Q2.FieldByName('totalnonrokok').AsString))));
      jprint1.WriteLn(vTotal(diskon,Format('%.0n',[totalDiskon])));
     // jprint1.WriteLn(vTotal(BiayaLain,GetRupiah(dm.Q2.FieldByName('biayalain').AsString)));
      jprint1.WriteLn(vTotal(grandtotal,GetRupiah(dm.Q2.FieldByName('grandtotal').AsString)));
      jprint1.WriteLn(vTotal(Bayar,Trim(GetRupiah(dm.Q2.FieldByName('bayar').AsString))));
    //  jprint1.WriteLn(vTotal(nontunai,Trim(GetRupiah(dm.Q2.FieldByName('nontunai').AsString))));
      jprint1.WriteLn(vTotal(Kembali,Trim(GetRupiah(dm.Q2.FieldByName('kembali').AsString))));

      jPrint1.WriteLn(Enter);
      jprint1.WriteLn('  MEMBER : '+ ENamaCust.Text + '['+EkodeCust.Text+'] POIN : '+getVal(dm.Q2,'poin'));
      jprint1.WriteLn('  ITEM/QTY : '+IntToStr(sg1.RowCount - 2)+'/'+SumGrid(sg1,4));

  // jPrint1.WriteLn('  KETERANGAN');
     // jPrint1.WriteLn('  '+GetVal(dm.Q2,'keterangan'));

      jprint1.WriteLn(Header( GetVal(dm.Q1,'footernota')));
      //jprint1.WriteLn(Header( GetVal(dm.Q1,'footernota2') ));
   //   jprint1.WriteLn(Header( GetVal(dm.Q1,'footernota3') ));
      Jprint1.PotongKertas;

      jprint1.Alhamdulillah;



end;

function TFPenjualanBarang.PrinterInvoice: String;
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

function TFPenjualanBarang.PrinterStruk: String;
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

procedure TFPenjualanBarang.PrintStruck(Nota: String);
const
  SQLNota = ' SELECT  p.fakturjual,                                   '+
            '              p.tgljual,                           '+
            '              p.idpelanggan,                       '+
            '              pl.idjenispelanggan,                 '+
            '              pl.namapelanggan,                    '+
            '              pl.poin,                             '+
            '              pl.alamat,                            '+
            '              pl.kota,                              '+
            '              pl.notelpon,                          '+
            '              (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as pembayaran,  '+
            '              p.total,                             '+
            '              p.tglkirim,                          '+
            '              p.diskon,                            '+
            '              p.grandtotal,                       '+
            '              pg.namalengkap,                      '+
            '              p.nontunai,                          '+
            '              p.bayar,                             '+
            '              p.kembali,                           '+
            '              p.biayalain,                           '+
            '              p.komputerid,                        '+
            '              k.namakomputer,                      '+
            '              p.ppn,                               '+
             '             p.edc,                               '+
             '             p.kartu,                             '+
             '             p.sucharge,                          '+
             '             p.totalnontunai,                    '+
             '             s.namasales,                        '+
             '             p.totalrokok,                        '+
             '             p.totalnonrokok,                        '+
             '             p.tgltempo,                        '+
             '             p.keterangan,                        '+
             '             p.bayar_poin,                        '+
            '              p.nokartu '+
            '    FROM                                         '+
            '      penjualan p                                '+
            '      LEFT JOIN pelanggan pl                     '+
            '        ON pl.`idpelanggan` = p.`idpelanggan`    '+
            '      LEFT JOIN m_user pg                        '+
            '       ON pg.iduser=p.`iduser`   left join komputer k on    '+
            ' k.komputerid=p.komputerid LEFT JOIN sales s on s.idsales=p.idsales';

begin

    if CheckDirect then
       printdirect(Nota,False) else
    begin
        ExQry(Dlaporan.Qpenjualan,SQLNota+' WHERE fakturjual="'+nota+'"',True);
            if (TipeStruk = 'STRUK')  then  begin
                  try
                   BukaLaci;
                 except
                 end;
                  if SizeStruk = '80 mm' then

                  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\nota 78.fr3')  else
                  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\nota 58.fr3');
                  if DLaporan.Qpenjualan.FieldByName('pembayaran').AsString = 'CASH' then

                  FMemo(Dlaporan.Fr1,'LabelKem').Text := 'Kembali' else
                  FMemo(Dlaporan.Fr1,'LabelKem').Text := 'Kekurangan';

            end else
            begin
                  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\invoice3.fr3')
            end;

      //  FMemo(Dlaporan.Fr1,'Lterbilang').Text:= MyTerbilang(Dlaporan.Qpenjualan.FieldByName('grandtotal').AsFloat);
        Dlaporan.Fr1.PrepareReport(True);
        Dlaporan.Fr1.PrintOptions.ShowDialog := False;
        if TipeStruk = 'STRUK' then
        Dlaporan.Fr1.PrintOptions.Printer    := PrinterStruk else
        Dlaporan.Fr1.PrintOptions.Printer    := PrinterInvoice;
        if CheckAuto = True then
         Dlaporan.Fr1.Print else
         Dlaporan.Fr1.ShowReport();
    end;


end;

function TFPenjualanBarang.RataKanan(pjg: Integer; txt: string): string;
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

procedure TFPenjualanBarang.ReplaceData;
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


  end;
end;

procedure TFPenjualanBarang.SaveHargaJual(KodeBarang:string;Harga:String;Satuan:String);
var
  JenisPelanggan : String;
  HargaPelanggan : String;
  HargaSatuan    : String;
begin
  ExQry(dm.Q6,'SELECT idjenispelanggan FROM pelanggan WHERE kodepelanggan="'+EkodeCust.Text+'"',True);

  JenisPelanggan := GetVal(dm.Q6,'idjenispelanggan');

  if JenisPelanggan = '4' then begin
     HargaPelanggan := 'hargaecer';
     HargaSatuan    := 'harga';
  end;
  if JenisPelanggan = '5' then begin
     HargaPelanggan := 'hargagrosir';
     HargaSatuan    := 'hargagrosir';
  end;
  if JenisPelanggan = '6' then begin
     HargaPelanggan := 'hargapartai';
     HargaSatuan    := 'hargapartai';
  end;

  ExQry(dm.Q6,'UPDATE barang SET '+HargaPelanggan+'="'+StrToDecimal(Harga)+'" '+
              ' WHERE kodebarang="'+KodeBarang+'"',False);
  ExQry(dm.Q6,'UPDATE multisatuan SET '+HargaSatuan+'="'+StrToDecimal(Harga)+'" '+
  ' WHERE satuan="'+satuan+'" AND kodebarang="'+Kodebarang+'"',False);

end;

procedure TFPenjualanBarang.SaveTemp(Arow:Integer);
var
  lst : TStringList;
  HargaJual : Real;
begin
    lst := TStringList.Create;

    try
        hargajual  := StrToFloatDef(nilai(sg1.Cells[3,Arow]),0);

        addParam('kodebarang',  sg1.cells[10,Arow],  lst,'str');
        addParam('satuan',      sg1.Cells[7,Arow],   lst,'str');
        addParam('harga',       FloatToStr(hargajual),  lst,'str');
        addParam('hpp',         StrToDecimal(sg1.Cells[11,Arow]), lst,'str');
        addParam('jumlah',      StrToDecimal(sg1.Cells[4,Arow]),   lst,'str');
        addParam('diskonpersen',StrToDecimal(sg1.Cells[5,Arow]),   lst,'str');
        addParam('diskonrupiah',StrToDecimal(sg1.Cells[6,Arow]),   lst,'str');
        addParam('subtotal',    StrToDecimal(sg1.Cells[8,Arow]),   lst,'str');
        addParam('isi',         StrToDecimal(sg1.Cells[9,Arow]),   lst,'str');
        addParam('iduser',      stat1.Panels[3].Text,   lst,'str');
        ExQry(dm.Q2,'SELECT iddetil,kodebarang,satuan FROM temptable WHERE kodebarang="'+sg1.cells[10,Arow]+'" '+
        ' AND satuan="'+sg1.Cells[7,Arow]+'"',True);
        if dm.Q2.IsEmpty then

        Post(dm.Q6,'temptable',lst) else
        updatePOST(dm.Q6,'temptable',lst,'iddetil',GetVal(dm.Q2,'iddetil'));
    finally
      lst.Free;
    end;

end;

procedure TFPenjualanBarang.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [3,5,8,9] then
       HAlign := taRightJustify
    else if ACOl in [6, 4,7 ] then
       HAlign := taCenter;
  end;

end;

procedure TFPenjualanBarang.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
   if (ACol in [3,6,8]) then
      begin
        isFloat := True;
        FloatFormat :='%.0n';
      end
  else
       isFloat := False;
end;

procedure TFPenjualanBarang.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 pas : Integer;
 hrg : Real;
 isiJual,jml,qty : Real;
 ppn : Real;
 satuan :String;
 stts : string;
 hargamulti : String;
begin
  if  (Sg1.Col = 2) and (key = 13)  then BEGIN
       if (COPY(sg1.Cells[2,sg1.Row],1,1) = '+') and (sg1.Cells[3,sg1.Row] = '') then begin
          jml                     := StrToFloatDef(koma(StringReplace(sg1.Cells[2,sg1.Row],'+','',[rfReplaceAll])),0);

          sg1.Cells[4,sg1.Row -1] := StringReplace(FloatToStr(jml),',','.',[rfReplaceAll]);


          HitungSubtotal(sg1.Row-1);
          HitungTotal;


          bersihCell;
       end else begin
       if (sg1.Cells[2,sg1.Row] <> '') then begin
            if sg1.Cells[10,sg1.Row] <> '' then begin
               ExQry(dm.Q5,'SELECT namabarang FROM barang where kodebarang="'+sg1.Cells[10,sg1.row]+'"',True);
               MessageDlg('Terjadi Kesalahan input',mtError,[mbOK],0);
               sg1.Cells[2,sg1.Row] := GetVal(dm.Q5,'namabarang');
               Focus;
               Exit;
            end;


            ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE (m.kodebarcode LIKE "%'+sg1.Cells[2,Sg1.Row]+'%" '+
            ' OR b.kodebarcode LIKE "%'+sg1.Cells[2,Sg1.Row]+'%" OR b.kodebarang="'+sg1.Cells[2,Sg1.Row]+'" '+
            ' OR b.namabarang LIKE "%'+sg1.Cells[2,sg1.Row]+'%") GROUP BY b.kodebarang',True);

            if Dm.Q1.RecordCount > 1 then begin
               ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[2,sg1.Row]+'%" '+
               ' or b.kodebarcode like"%'+sg1.Cells[2,sg1.Row]+'%") GROUP by b.kodebarang LIMIT 100',True);
               FcariBarang.cStok.Visible := True;
               FcariBarang.isFormTransaksi := 1;
               FcariBarang.cHargaBeli2.Visible := False;
               FcariBarang.cHargaBeli.Visible  := False;
               FcariBarang.ShowModal;

            end else if dm.Q1.RecordCount = 0 then begin
                Error('Data barang tidak ditemukan, Ketik manual dulu yaa,');
                Exit;
            end else if dm.Q1.RecordCount = 1 then begin

                sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
                sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'kodebarcode');
                sg1.Cells[10,sg1.Row]:= GetVal(dm.Q1,'kodebarang');
                sg1.Cells[11,sg1.Row]:= GetVal(dm.Q1,'hargarata');
                sg1.Cells[12,sg1.Row]:= GetVal(dm.Q1,'namakategori');
                sg1.Cells[13,sg1.Row]:= GetVal(dm.Q1,'bkp');
                sg1.Cells[2,sg1.Row] := GetVal(dm.Q1,'namabarang');
                sg1.Cells[7,sg1.Row] := GetVal(dm.Q1,'satuan');
                hrg                  := GetHarga(GetVal(dm.Q1,'kodebarang'),GetVal(dm.Q1,'satuan'));
                sg1.Cells[3,sg1.Row] := Format('%.2n',[hrg]);
                sg1.Cells[5,sg1.Row] := '';
                sg1.Cells[6,sg1.Row] := '';

                sg1.Cells[4,sg1.Row] := '1';
                HitungSubtotal(sg1.Row);



                pas    := Posisi(UPPERCASE(GetVal(dm.Q1,'kodebarang')),sg1.Cells[7,sg1.Row]);


                if (pas <> 0) and (pas <> sg1.Row) then begin

                    ppn               := GetValF(dm.Q1,'ppn');
                    sg1.Cells[4,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[4,pas],0)+1);

                    HitungSubtotal(pas);


                 {  if  sg1.Cells[1,sg1.Row +1] <>'' then begin
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
                      BersihCell;  }

                      Focus;
                end else
                begin
                  HitungSubtotal(sg1.Row);

                  if sg1.Cells[2,sg1.RowCount -1] <>'' then
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

             ExQry(dm.QcariBarang,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[2,sg1.Row]+'%" '+
            ' or m.kodebarcode like"%'+sg1.Cells[2,sg1.Row]+'%") GROUP BY b.kodebarang  LIMIT 100',True);
            FcariBarang.cStok.Visible := True;
            FcariBarang.isFormTransaksi := 1;
            FcariBarang.cHargaBeli2.Visible := False;
            FcariBarang.cHargaBeli.Visible  := False;
            FcariBarang.ShowModal;
          end;
      end;
      HitungTotal;
    end else if (Key = VK_ADD) and (sg1.Col = 2) and (sg1.Cells[3,sg1.Row]<>'') then begin
        Key := 0;
        FinputQty.Lnamabarang.Caption :=  sg1.Cells[2,sg1.Row];
        FinputQty.ShowModal;

    end else begin
          if ( sg1.Col in [3..6] ) and (key = 13) then
             begin
              sg1.Row := sg1.Row;
              HitungSubtotal(sg1.Row);
              sg1.Col := sg1.Col + 1;
              HitungTotal;
             end
          else If ( sg1.Col in [7] ) and (key = 13) then
              Focus;

    end;

    if (sg1.Col = 2) and (sg1.Cells[8,sg1.Row] <> '') then begin
      if Key = VK_BACK then begin
         Bersihcell;
        ReplaceData;
        if (sg1.Row <> sg1.RowCount -1) and (sg1.Cells[2,sg1.RowCount -1] = '') then
        sg1.RowCount :=  sg1.RowCount -1;
        ExQry(dm.Q2,'DELETE FROM temptable WHERE kodebarang="'+sg1.cells[10,sg1.Row]+'" AND iduser="'+setIdUser+'"',False);
        HitungTotal;
        Focus;

      end;
    end;




    case KEy of
   VK_F1 : begin
                 if sg1.Cells[2,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin

                      ExQry(dm.Q1,'SELECT * FROM hargaperpelanggan WHERE kodebarang="'+sg1.Cells[10,sg1.Row]+'" '+
                      ' AND kodepelanggan="'+EkodeCust.Text+'"',True);

                      if dm.Q1.IsEmpty = False  then begin
                         ExQry(dm.QMultiSatuan,'SELECT s.kodebarang,s.satuan,s.isi,s.harga,(b.hargabeli * s.isi) as hargabeli, '+
                         ' s.tglawal,s.tglakhir,s.hargapromo,s.tglawal2,s.tglakhir2,s.hargapromo2,s.tglawal3,s.tglakhir3,s.hargapromo3 FROM '+
                         ' hargaperpelanggan s LEFT JOIN barang b ON b.kodebarang=s.kodebarang '+
                         ' WHERE s.kodepelanggan="'+EkodeCust.Text+'" '+
                         ' AND s.kodebarang="'+sg1.Cells[10,sg1.Row]+'"',True);

                         FpilihSatuan.Show;
                         if GetValF(dm.QMultiSatuan,'hargapromo') > 0 then

                         FpilihSatuan.cPromo1.Visible    := True;
                         FpilihSatuan.cPromo2.Visible    := True;
                         FpilihSatuan.cPromo3.Visible    := True;
                         FpilihSatuan.cHargabeli.Visible := False;
                         FpilihSatuan.cHarga.Visible     := True;

                         FpilihSatuan.isFormSatuan := 0;

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
                          ExQry(dm.QMultiSatuan,'SELECT s.kodebarang,s.satuan,s.isi,s.'+hargamulti+' as harga,(b.hargabeli * s.isi) as hargabeli,'+
                          ' s.tglawal,s.tglakhir,s.hargapromo,s.tglawal2,s.tglakhir2,s.hargapromo2,s.tglawal3,s.tglakhir3,s.hargapromo3 FROM multisatuan s left join barang b '+
                          ' ON b.kodebarang=s.kodebarang WHERE b.kodebarang="'+sg1.Cells[10,sg1.Row]+'"',True);
                          if DM.QMultiSatuan.IsEmpty then
                             Warning('Tidak ada multi satuan')
                          else begin
                             FpilihSatuan.Show;
                             FpilihSatuan.cPromo1.Visible    := True;
                             FpilihSatuan.cPromo2.Visible    := True;
                             FpilihSatuan.cPromo3.Visible    := True;
                             FpilihSatuan.cHargabeli.Visible := False;
                             FpilihSatuan.cHarga.Visible     := True;

                             FpilihSatuan.isFormSatuan := 0;
                          end;
                      end;
                    end;
               end;
               // DIskon Penjualan
   VK_F10     : Edisc.SetFocus;

   // Scan Barcode Pelanggan
   VK_F3      : EScanBarcode.SetFocus;
   end;
end;

procedure TFPenjualanBarang.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [3,4,5,7,8,9]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;

      HitungSubtotal(sg1.Row);
      HitungTotal;

  end;

end;

procedure TFPenjualanBarang.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if sg1.Col in [3,4,5,6,8,9]  then begin

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
   // Ctrl + D ... Ganti barcode barang
   if (key = 68) and (Shift = [ssCtrl]) then
   begin
      With FBarcodeBarang do begin
         ExQry(dm.Q1,'SELECT kodebarang,namabarang,kodebarcode FROM barang '+
         ' WHERE kodebarang="'+Sg1.Cells[10,sg1.Row]+'"',True);
         EkodeBarang.Text := sg1.Cells[10,sg1.Row];
         EnamaBarang.Text := sg1.Cells[2,sg1.Row];
         EbarcodeLama.Text:= GetVal(dm.Q1,'kodebarcode');
         EbarcodeBaru.Text := '';
         ShowModal;
      end;
   end;

end;

procedure TFPenjualanBarang.sg1RowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  if sg1.Col in [3,4,5,6,8,9]  then begin
      HitungSubtotal(OldRow);
      HitungTotal;

   end;
end;

procedure TFPenjualanBarang.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);

begin

   if ACol in [2,3,4,5,6] then begin
      if (ACol = 3) and (isEditHarga = false) then
         sg1.Options := sg1.Options -[goEditing] else

      sg1.Options := sg1.Options +[GoEditing];
   end
  else
    sg1.Options := sg1.Options -[goEditing];
end;

procedure TFPenjualanBarang.Simpan;
var
  x : integer;
  idpelanggan,Tempo,NoPiutang,idsales : string;
  hargajual,bayar,hppBkp,HppNonBkp, piutang,PiutangBkp,PiutangNonBKp,ppn : real;
  sisaBKP : Real;
  SisaNonBkp : Real;
  Saved : Boolean;
  isSaveHarga   : Boolean;
  Idgudang      : String;

  procedure DeleteHold;
  begin
    ExQry(dm.Q1,'DELETE FROM tempjual where fakturjual="'+sNota+'"',False);
    ExQry(dm.Q1,'DELETE FROM tempjualdetail where fakturjual="'+sNota+'"',False);
    sNota :='';
  end;
begin

    idpelanggan := getData(dm.Q2,'pelanggan where kodepelanggan="'+EkodeCust.Text+'"','idpelanggan');
    if idpelanggan = '' then
    begin
      ExQry(dm.Q2,'SELECT idpelanggan FROM pelanggan where namapelanggan="UMUM"',True);
      idpelanggan := GetVal(dm.Q2,'idpelanggan');
    end;


    Saved := False;
    if E1.Text <> '' then
    ExQry(dm.Q2,'SELECT idsales FROM sales where kodesales="'+E1.Text+'"',True) else
    ExQry(dm.Q2,'SELECT idsales FROM sales where namasales="UMUM"',True);
    idsales     := GetVal(dm.Q2,'idsales');
    if cbGudang.ItemIndex < 0 then
       Idgudang := '2' else Idgudang := GetIdcmb(cbGudang);
       dm.con1.StartTransaction;

    try
      Tempo := Copy(cbTempo.Text,1,pos(' ',cbTempo.Text)-1);

      if sumBkp > 0 then
        ppn := sumBkp * asPPn / 100 else
        ppn := 0;

      addParam('fakturjual',   Enobukti.Text,            aList,'str');
      addParam('tgljual',      frmTgl(dt1.Date),     aList,'date');
      addParam('pembayaran',   IntToStr(cbPembayaran.ItemIndex),        aList,'str');
      addParam('idpelanggan',  idpelanggan,              aList,'str');
      addParam('idsales',      idsales,              aList,'str');
      addParam('iduser',       stat1.Panels[3].Text,aList,'str');
      addParam('total',        SumGrid(sg1,8),aList,'str');
      addParam('diskon',       nilai(EdiscRp.Text),aList,'str');
     // addParam('ppn',          nilai(EPpn.Text),aList,'str');
      addParam('grandtotal',   EGrandTotal.isAngka,aList,'str');
      addParam('tglkirim',     frmTgl(dtp1.Date),aList,'date');
      addParam('bayar_poin',   TRIM(Fbayar.EBayarPoin.isAngka), aList,'str');
      addParam('pembulatan',  EPembulatan.isAngka, aList,'str');

      addParam('komputerid',   setIdKom,aList,'str');
      addParam('nomerso',      ENomerPO.Text, aList,'str');
      addParam('bayar',        Trim(Fbayar.ETUnai.isAngka),aList,'str');
      addParam('kembali',      Trim(Fbayar.Ekembali.isAngka), aList,'str');
      addParam('nontunai',     Trim(Fbayar.Ebayar.isAngka),aList,'str');
      addParam('sucharge',     StrToDecimal(nilai(Fbayar.Epersensucharge.Text)),aList,'str');
      addParam('totalnontunai',Fbayar.ETotalNonTUnai.isAngka,aList,'str');
      addParam('nominalvoucher',Fbayar.EnominalVoucer.isAngka,aList,'str');
      addParam('edc',          Fbayar.Lmesin.Caption,aList,'str');
      addParam('kartu',        Fbayar.Lkartu.Caption,aList,'str');
      addParam('biayalain',    StrToDecimal(nilai(Fbayar.EBiayaLain.Text)),aList,'str');
      addParam('nokartu',      Fbayar.NoKartu,alist,'str');
      addParam('keterangan',   EKeterangan.Text,alist,'str');
      addParam('totalrokok',   StrToDecimal(nilai(LtotalRokok.Caption)),alist,'str');
      addParam('totalnonrokok',StrToDecimal(nilai(LtotalNonRokok.Caption)),alist,'str');
      addParam('nominalbkp',   StrToDecimal(FloatToStr(sumBkp+ppn)),alist,'str');
      addParam('nominalnonbkp',StrToDecimal(FloatToStr(EGrandTotal.AsFLoat - (sumBkp + ppn))),alist,'str');
   //   if CSuratJalan.Checked then
   //   addParam('kirim',        '1', aList,'int');

      if cbPembayaran.ItemIndex = 1 then
      addParam('tgltempo',    frmTgl(dt1.Date + StrToInt(Tempo) ),alist,'date');
      OpenTable(dm.Q2,['idjual'],'penjualan where fakturjual="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'penjualan',alist)
      else
         UpdatePOST(dm.Q1,'penjualan',alist,'idjual',GetVal(dm.Q2,'idjual'));


      ExQry(dm.Q1,'DELETE FROM kartustok WHERE nobukti="'+Enobukti.Text+'"',False);
      ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+Enobukti.Text+'"',False);
      ExQry(dm.Q1,'DELETE FROM penjualandetil WHERE fakturjual="'+Enobukti.Text+'"',False);

      if (sg1.Cells[1,sg1.RowCount -1] <> '') and (sg1.Cells[8,sg1.RowCount -1] <> '') then
          sg1.RowCount := sg1.RowCount + 1;
      //isSaveHarga := SaveHarga;
      hppBkp    := 0;
      HppNonBkp := 0;
      for x := 1 to sg1.RowCount -1 do
        begin

          if (sg1.Cells[1,x] <> '') and (sg1.Cells[8,x]<>'') then
          begin


              hargajual  := StrToFloatDef(nilai(sg1.Cells[3,x]),0);
              if UPPERCASE(sg1.Cells[13,x]) = 'TRUE' then
                 hppBkp  := hppBkp +(StrToFloatDef(nilai(sg1.Cells[11,x]),0) * StrToFloatDef(nilai(sg1.Cells[9,x]),0)) else
                 HppNonBkp  := HppNonBkp + (StrToFloatDef(nilai(sg1.Cells[11,x]),0) * StrToFloatDef(nilai(sg1.Cells[9,x]),0));

              addParam('fakturjual',  Enobukti.Text,          aList,'str');
              addParam('kodebarang',  sg1.cells[10,x],             Alist,'str');
              addParam('satuan',      sg1.Cells[7,x],         Alist,'str');
              addParam('harga',       FloatToStr(hargajual),  Alist,'str');
              addParam('hpp',         StrToDecimal(sg1.cells[11,x]),        Alist,'str');
              addParam('jumlah',      KomaDatabase(sg1.Cells[4,x]),   Alist,'str');
              addParam('diskonpersen',StrToDecimal(sg1.Cells[5,x]),   Alist,'str');
              addParam('diskonrupiah',StrToDecimal(sg1.Cells[6,x]),   Alist,'str');
              addParam('subtotal',    StrToDecimal(sg1.Cells[8,x]),  Alist,'str');
              addParam('isi',         KomaDatabase(sg1.Cells[9,x]), Alist,'str');
              addParam('idgudang',    Idgudang,     Alist,'str');

              Post(dm.Q1,'penjualandetil',aList);

        //      if isSaveHarga then
        //         SaveHargaJual(sg1.Cells[10,x],StrToDecimal(FloatToStr(hargajual)),sg1.Cells[7,x]);

            //  HargaDiskon    := CellF(sg1.Cells[8,x]) / CellF(sg1.Cells[4,x]);

           //   NominalDiskon  := (hargajual - HargaDiskon) * CellF(sg1.Cells[4,x]);

              PostingKartuStok(dm.Q1,Enobukti.Text,
                              dt1.Date,sg1.cells[10,x],GetIdcmb(cbGudang),
                              sg1.Cells[7,x], CellF(sg1.cells[11,x]),
                              'KELUAR',StrToFloatDef(nilai(sg1.Cells[9,x]),0),
                              'PENJUALAN NO BUKTI ['+Enobukti.Text+']');





          end else
          if (sg1.cells[10,x] = '') and (sg1.Cells[4,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
            MessageBox(Handle,'Kode Barcode Harus Di Isi !! '+#13+' Silahkan Isi terlebih Dahulu !! '+#13+
                       'Atau batalkan item dengan menekan tombol [ DELETE ]','ERROR',MB_ICONERROR);
            sg1.Row := x;
            sg1.Col := 1;
            Abort;
          end;
        end;
          ExQry(dm.Q2,'DELETE FROM piutang WHERE fakturjual="'+Enobukti.Text+'"',False);
          if cbPembayaran.ItemIndex = 1 then begin
             Tempo := Copy(cbTempo.Text,1,Pos(' ',cbTempo.Text)-1);
             addParam('fakturjual', Enobukti.Text,                          aList,'str');
             addParam('tglinput',   frmTgl(dt1.Date),                   aList,'date');
             addParam('tgltempo',   frmTgl(dt1.Date + StrToInt(Tempo)), aList,'date');
             addParam('piutang',    nilai(EGrandTotal.Text),                     aList,'str');
             addParam('kekurangan', StrToDecimal(FloatToStr(Fbayar.EGrandTotal.AsFLoat - (Fbayar.ETUnai.AsFLoat + Fbayar.Ebayar.AsFLoat))), aList,'str');

             addParam('nominalbkp',StrToDecimal(FloatToStr(sumBkp+ppn)), aList,'str');
             addParam('nominalnonbkp',StrToDecimal(FloatToStr(EGrandTotal.AsFLoat- (sumBkp+ppn))), aList,'str');
             addParam('dibayar',    Trim(Fbayar.ETUnai.isAngka),aList,'str');
           
             OpenTable(dm.Q2,['idpiutang'],'piutang where fakturjual="'+Enobukti.Text+'"');
             if dm.Q2.IsEmpty then
               Post(dm.Q1,'piutang',aList)
             else
               updatePOST(dm.Q1,'piutang',aList,'idpiutang',GetVal(dm.Q2,'idpiutang'));

          end;

          if cbPembayaran.ItemIndex = 0 then begin
                 PostingJurnal(dm.Q1,Copy(Fbayar.cbKas.Text,1,7),
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,Fbayar.EGrandTotal.AsFLoat - Fbayar.Ebayar.AsFLoat - Fbayar.EBayarPoin.AsFLoat,sumBkp+ppn,Fbayar.ETUnai.AsFLoat, 'D');
                 if Fbayar.EBayarPoin.AsFLoat > 0 then
                 PostingJurnal(dm.Q1,'502.012',
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,Fbayar.EBayarPoin.AsFLoat,0,Fbayar.EBayarPoin.AsFLoat, 'D');
          end else begin

            // 100.000 : 60000 : 40000
            // 70.000
              if Fbayar.ETUnai.AsFLoat > 0 then begin
                  if Fbayar.ETUnai.AsFLoat > sumBkp + ppn then  begin

                    PostingJurnal(dm.Q1,Copy(Fbayar.cbKas.Text,1,7),
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,Fbayar.ETUnai.AsFLoat,sumBkp+ppn,Fbayar.ETUnai.AsFLoat - (sumBkp + ppn),'D');
                    sisaBKP := 0;
                    SisaNonBkp := EGrandTotal.AsFLoat - (Fbayar.ETUnai.AsFLoat - (sumBkp + ppn));
                   end else begin
                    PostingJurnal(dm.Q1,Copy(Fbayar.cbKas.Text,1,7),
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,Fbayar.ETUnai.AsFLoat,Fbayar.ETUnai.AsFLoat,0,'D') ;
                    sisaBKP    := (sumBkp + ppn) - Fbayar.ETUnai.AsFLoat;


                    SisaNonBkp := EGrandTotal.AsFLoat - (sumBkp + ppn);
                   end;
               end else begin
                  sisaBKP     := sumBkp + ppn;
                  SisaNonBkp  := EGrandTotal.AsFLoat - sisaBKP;
               end;

                  PostingJurnal(dm.Q1,'104.001',
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,Fbayar.EGrandTotal.AsFLoat - Fbayar.ETUnai.AsFLoat,
                               sisaBKP,SisaNonBkp,'D');
          end;

               hppBkp     := hppBkp / ((asPPn + 100) / 100);

               PostingJurnal(dm.Q1,'501.001',
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,hppBkp + HppNonBkp,hppBkp,HppNonBkp,'D');

               PostingJurnal(dm.Q1,'502.014',
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,Fbayar.EdiscRp.AsFLoat,Fbayar.EdiscRp.AsFLoat,0,'D');

               if EPembulatan.AsFLoat > 0 then

               PostingJurnal(dm.Q1,'402.001',
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,EPembulatan.AsFLoat,0,0,'K');


               PostingJurnal(dm.Q1,'401.001',
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,Fbayar.Etotal.AsFLoat,sumBkp,Fbayar.EGrandTotal.AsFLoat - (sumBkp + ppn ),'K');
               PostingJurnal(dm.Q1,'202.001',Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,ppn,ppn,0,'K');
               PostingJurnal(dm.Q1,'103.001',
                               Enobukti.Text,
                               'PENJUALAN NO BUKTI ['+Enobukti.Text+']',
                               dt1.Date,hppBkp + HppNonBkp,hppBkp,HppNonBkp,'K');

          if StrToFloatDef(nilai(Fbayar.EbayarPiutang.Text),0) > 0 then begin


              bayar   := StrToFloatDef(nilai(Fbayar.EbayarPiutang.Text),0);
              ExQry(dm.Q2,'SELECT * FROM v_piutang WHERE '+
              ' ( kodepelanggan="'+EkodeCust.Text+'") '+
              ' AND kekurangan > 0 ORDER BY fakturjual ASC',True);
              repeat
                NoPiutang := GetCode(dm.Q4,'bayarpiutang','nobukti','BP.');
                piutang := dm.Q2.FieldByName('kekurangan').AsFloat;
                PiutangBkp := dm.Q2.FieldByName('nominalbkp').AsFloat;
                PiutangNonBKp := dm.Q2.FieldByName('nominalnonbkp').AsFloat;

                if bayar  >= piutang then begin
                    ExQry(dm.Q1,' UPDATE piutang h JOIN penjualan p ON h.fakturjual=p.fakturjual '+
                  ' SET h.kekurangan=0,h.lunas=true,h.dibayar=p.grandtotal '+
                  ' WHERE h.fakturjual="'+dm.Q2.FieldByName('fakturjual').AsString+'"',False);
                   with dm.Q1 do begin
                    Close;
                    SQL.Text := 'INSERT INTO bayarpiutang (nobukti,tgl,idpelanggan,iduser,'+
                                ' keterangan,nominal,nopiutang,noakun,carabayar) '+
                                'VALUES (:nobukti,:tgl,:idpelanggan,:iduser,'+
                                ':keterangan,:nominal,:nopiutang,:noakun,:carabayar) ';
                    ParamByName('nobukti').AsString     := NoPiutang;
                    ParamByName('tgl').AsDate           := dt1.Date;
                    ParamByName('idpelanggan').AsString := GetVal(dm.Q2,'idpelanggan');
                    ParamByName('iduser').AsString      := stat1.Panels[3].Text;
                    ParamByName('keterangan').AsString  := '' ;
                    ParamByName('nominal').AsFloat      := piutang;
                    ParamByName('nopiutang').AsString    := GetVal(dm.Q2,'fakturjual');
                    ParamByName('noakun').AsString       := Copy(Fbayar.cbKas.Text,1,7);
                    ParamByName('carabayar').AsString    := 'TUNAI';
                    ExecSQL;
                  end;
                  PostingJurnal(dm.Q1,'104.001',NoPiutang,'PEMBAYARAN PIUTANG ['+ENamaCust.Text+']',
                  dtp1.Date,piutang,PiutangBkp,piutang - PiutangBkp,'K');
                  PostingJurnal(dm.Q1,Copy(Fbayar.cbKas.Text,1,7),NoPiutang,'PEMBAYARAN PIUTANG ['+ENamaCust.Text+'] ',
                  dtp1.Date,piutang,PiutangBkp,piutang - PiutangBkp,'D');

                  Bayar    := Bayar - piutang;
                  dm.Q2.Next;
                end else
                begin

                ExQry(dm.Q1,' UPDATE piutang h SET h.kekurangan=h.kekurangan - "'+FloatTostr(Bayar)+'",'+
                              ' h.dibayar=h.dibayar+"'+FloatTostr(Bayar)+'" '+
                             ' WHERE fakturjual="'+dm.Q2.FieldByName('fakturjual').AsString+'"',False);
                  with dm.Q1 do begin
                    Close;
                    SQL.Text := 'INSERT INTO bayarpiutang (nobukti,tgl,idpelanggan,iduser,'+
                                ' keterangan,nominal,nopiutang,noakun,carabayar) '+
                                'VALUES (:nobukti,:tgl,:idpelanggan,:iduser,'+
                                ':keterangan,:nominal,:nopiutang,:noakun,:carabayar) ';
                    ParamByName('nobukti').AsString     := NoPiutang;
                    ParamByName('tgl').AsDate           := dt1.Date;
                    ParamByName('idpelanggan').AsString := GetVal(dm.Q2,'idpelanggan');
                    ParamByName('iduser').AsString      := stat1.Panels[3].Text;
                    ParamByName('keterangan').AsString  := '' ;
                    ParamByName('nominal').AsFloat      := Bayar;
                    ParamByName('nopiutang').AsString    := GetVal(dm.Q2,'fakturjual');
                    ParamByName('noakun').AsString       := Copy(Fbayar.cbKas.Text,1,7);
                    ParamByName('carabayar').AsString    := 'TUNAI';
                    ExecSQL;
                  end;
                  PostingJurnal(dm.Q1,'104.001',NoPiutang,'PEMBAYARAN PIUTANG ['+ENamaCust.Text+']',
                  dtp1.Date,Bayar,PiutangBkp-Bayar,piutang - (PiutangBkp-bayar),'K');
                  PostingJurnal(dm.Q1,Copy(Fbayar.cbKas.Text,1,7),NoPiutang,'PEMBAYARAN PIUTANG ['+ENamaCust.Text+'] ',
                  dtp1.Date,Bayar,PiutangBkp-bayar,piutang - (PiutangBkp-bayar),'D');
                  Bayar := 0;
                end;

              until Bayar = 0;
          end;

          if Fbayar.EBayarPoin.AsFLoat > 0 then
             ExQry(dm.Q1,'UPDATE pelanggan SET poin=poin-'+StrToDecimal(Fbayar.EBayarPoin.Text)+' WHERE kodepelanggan="'+EkodeCust.Text+'"',False);

          dm.con1.Commit;
          Saved := True;
      except
        on E:Exception do begin
          MessageDlg('Gagal input Data : '+#13+' Pesan Error : '+E.Message,
          mtError,[mbOK],0);
          dm.con1.Rollback;
          Saved := False;
          Abort;
        end;
      end;
   if Saved then begin

        if MessageDlg('Print Struk?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
           PrintStruck(Enobukti.Text);
        end;
        DeleteHold;
        KosongkanTemp;
        if Assigned(FdataPenjualan) then
           FdataPenjualan.LoadData;

        TampilAwal;
        Focus;
        ETotal.Text := 'SISA : '+Fbayar.Ekembali.Text;
        isEdit := False;
    end;
end;

function TFPenjualanBarang.Sparator(txt: string): string;

var
  I: Integer;
  hasil : String;
begin
  hasil:='';
  for I := 1 to 40 do
     hasil := hasil +txt;
  Result := hasil;


end;

function TFPenjualanBarang.sumBkp: Real;
var
  i : integer;
  Subtotal : Real;
begin
  Subtotal := 0;

  for i := 1 to sg1.RowCount -1 do begin

    if (UPPERCASE(sg1.Cells[13,i]) = 'TRUE') and (sg1.Cells[8,i] <> '') then
       Subtotal := Subtotal + CellF(sg1.Cells[8,i]);

  end;

  result := Subtotal / ((asPpn + 100) / 100);

end;

procedure TFPenjualanBarang.TampilAwal;
var
  i : Integer;
begin
  ClearText(Self);
  isEdit   := False;
  CreateGrid;
  Enobukti.Text  := GetCodeB(dm.Q1,'penjualan','fakturjual','PJ'+setIdUser);
  setTanggal(Self);
  bersihkanGrid;
  cbPembayaran.ItemIndex := 0;
  sNota :='';
  Lkasir.Caption := 'KASIR : '+stat1.Panels[4].Text;
  OpenTable(dm.Q1,['kodepelanggan','namapelanggan','alamat'],'pelanggan WHERE namapelanggan="UMUM"');
  if dm.Q1.IsEmpty then begin
    Warning('Data pelanggan umum masih kosong harap di isi dulu');
    FPenjualanBarang.Close;

  end else
  begin
    ENamaCust.Text := GetVal(dm.Q1,'namapelanggan');
    EkodeCust.Text := GetVal(dm.Q1,'kodepelanggan');
    m1.Text        := GetVal(dm.Q1,'alamat');
    if M1.Text = '' then M1.Text := '-';


    if ENamaCust.Text <> 'UMUM' then begin

       ExQry(dm.Q2,'SELECT SUM(kekurangan) as totalpiutang FROM v_piutang WHERE kodepelanggan="'+EkodeCust.Text+'" '+
                 ' AND lunas=false',True);

       LpiutangSebelumnya.Caption := Format('%.2n',[GetValF(dm.Q2,'totalpiutang')]);
    end;

  end;

  OpenTable(dm.Q1,['kodesales','namasales'],'sales WHERE namasales="UMUM"');
  if dm.Q1.IsEmpty then begin
    Warning('Data pelanggan umum masih kosong harap di isi dulu');
    FPenjualanBarang.Close;

  end else
  begin
    ESales.Text := GetVal(dm.Q1,'namasales');
    E1.Text := GetVal(dm.Q1,'kodesales');

  end;
  dt1.Date := now;
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  OpenTable(dm.Q1,['gudangjual'],'profile');
  cbGudang.ItemIndex := idxCmb(cbGudang,GetValInt(dm.Q1,'gudangjual'));
  LpiutangSebelumnya.Caption := '0';
  LtotalRokok.Caption        := '0';
  LtotalNonRokok.Caption     := '0';
  ETotal.Text                := '0';
  EGrandTotal.Text           := '0';

  ExQry(dm.Q2,'SELECT * FROM temptable WHERE iduser="'+stat1.Panels[3].Text+'"',True);

  if dm.Q2.IsEmpty = False then begin
     if MessageDlg('Terdapat Transaksi Belum Selesai, Lanjutkan transaksi?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
        FPenjualanBarang.sg1.RowCount := DM.Q2.RecordCount +2;

        i := 0;
        while not dm.Q2.Eof do begin
             sg1.Cells[0,i+1]:= Inttostr(DM.Q2.RecNo);
             ExQry(dm.Q3,'select m.kodebarcode,b.namabarang,hr.hargabeli,k.namakategori FROM multisatuan m '+
             ' LEFT JOIN barang b ON b.kodebarang=m.kodebarang LEFT JOIN hargabelirata hr ON hr.kodebarang=b.kodebarang '+
             ' LEFT JOIN kategori k on k.idkategori=b.idkategori '+
             ' WHERE m.kodebarang="'+GetVal(DM.Q2,'kodebarang')+'" '+
             ' AND m.satuan="'+GetVal(DM.Q2,'satuan')+'"',True);
             sg1.Cells[1,i+1]:= GetVal(DM.Q3,'kodebarcode');
             sg1.Cells[2,i+1]:= GetVal(DM.Q3,'namabarang');
             sg1.Cells[3,i+1]:= GetValR(DM.Q2,'harga');
             sg1.Cells[4,i+1]:= GetVal(DM.Q2,'jumlah');
             sg1.Cells[5,i+1]:= GetVal(DM.Q2,'diskonpersen');
             sg1.Cells[6,i+1]:= GetValR(DM.Q2,'diskonrupiah');
             sg1.Cells[7,i+1]:= GetVal(DM.Q2,'satuan');
             sg1.Cells[8,i+1]:= GetValR(DM.Q2,'subtotal');
             sg1.Cells[9,i+1]:= GetValR(DM.Q2,'isi');
             sg1.Cells[10,i+1]:= GetVal(DM.Q2,'kodebarang');
             sg1.Cells[11,i+1]:= GetVal(DM.Q3,'hargabeli');
             sg1.Cells[12,i+1]:= GetVal(DM.Q3,'namakategori');
             inc(i);
             Dm.Q2.Next;

        end;
        HitungTotal;
     end else KosongkanTemp;


  end;



end;

function TFPenjualanBarang.TipeStruk: String;
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
function TFPenjualanBarang.ToFloat(ACol, ARow: integer): Extended;
begin
if not ACOl in [3] then
    Result := StrToFloatDef(koma(sg1.Cells[aCol,aRow]),0)
  else
    Result := StrToFloatDef(nilai(sg1.Cells[aCol,aRow]),0);
end;

function TFPenjualanBarang.vItems(Hrg, qty, stn, subt: string): String;
var

  harga : Integer;
  jml : integer;

  Lebar : integer;
  txt : string;
begin


  txt   := DupeString(' ',1) + hrg;

  jml   := 9 - Length(txt);
  txt   := txt + DupeString(' ',jml) + 'X ' + qty;
  jml   := 13 - Length(txt);
  txt   := txt + DupeString(' ',jml)+ stn;
  jml   := 26 - Length(txt);
  txt   := txt + DupeString(' ',jml)+ '='+RataKanan(10,subt);
  Result := txt;


end;

function TFPenjualanBarang.vTotal(lbl, vValue: string): string;
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

  hasilJumlah   :=  hasilJumlah +'   =';


  Result := lbl + hasilJumlah +RataKanan(10,vValue);


end;

end.
