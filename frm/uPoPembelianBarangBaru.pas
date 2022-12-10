unit uPoPembelianBarangBaru;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.ComCtrls, dxCore, Math,
  cxDateUtils, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  cxButtons, cxDropDownEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox,
  uEngine, uComCtrl, uctrlFrm, uOvEdit, dxSkiniMaginary, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful,System.DateUtils, dxSkinMoneyTwins, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
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
  TFpoPembelianBarang = class(TForm)
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
    btnCariSupplier: TcxButton;
    sg1: TAdvStringGrid;
    G2: TcxGroupBox;
    ETotal: TcxTextEdit;
    EKodeSupplier: TcxTextEdit;
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
    CheckBox1: TCheckBox;
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
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
    procedure EDiskonperPropertiesChange(Sender: TObject);
    procedure EppnperPropertiesChange(Sender: TObject);
    procedure EdiskonrpPropertiesChange(Sender: TObject);
    procedure EppnrupKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
  private
    aList : TStringList;
    { Private declarations }
  public

    hargaSetelahDiskon : Real;
    procedure TampilAwal;
    procedure CreateGrid;
    procedure bersihCell;
    procedure ReplaceData;
    procedure KosongKanGrid;
    procedure PrintPo(nobukti:String);
    procedure Focus;
    function  Posisi(kodebarcode:String;stn:string):integer;
    procedure HitungTotal;
    procedure HitungSubtotal(Arow:Integer);
    procedure PrintBukti(NoFak : string);
    function GetHargaBeli(kodebarang:string; HargaBaru       : Real;   JumlahBaru      : Real;var saldolama:Real) : Real;
    function CariIsi(barcode:string;Satuan:string):Extended;
    { Public declarations }
  end;


var
  FpoPembelianBarang: TFpoPembelianBarang;
  SHowHarga  : Boolean;


implementation

{$R *.dfm}

uses udm, uCariSupplier, uCariBarang, uMainMenu, uUbahHarga, uCariPObeli, uDtrx,
  uDlaporan, uPilihSatuan, uInputDataBarang;

procedure TFpoPembelianBarang.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFpoPembelianBarang.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFpoPembelianBarang.btnCariBarangClick(Sender: TObject);
begin
   FcariBarang.Show;
   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' GROUP BY b.kodebarang',True);
   FcariBarang.Show;
  FcariBarang.isFormTransaksi := 3;
end;

procedure TFpoPembelianBarang.btnCariPOClick(Sender: TObject);
begin
  FCariPo.Show;
  ExQry(dtrx.Qpobeli,_SQLcariPO+' WHERE nobukti not in (select nopo from pembelian)',True);
end;

procedure TFpoPembelianBarang.btnFocusClick(Sender: TObject);
begin
  Focus;
end;

procedure TFpoPembelianBarang.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[11,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
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

procedure TFpoPembelianBarang.btnSimpanClick(Sender: TObject);
var
  x : integer;
  idSupplier,KodeBarang : string;
  hargabeli,HargaNormal,HargaDiskon,Hargadiskon2,HargaDiskon3,hargafix : Real;
  SaldoLama : Real;
begin

  if not CheckEdit(Self) then begin

  begin
    idSupplier := getData(dm.Q2,'m_supplier where kodesupplier="'+Ekodesupplier.Text+'"','idsupplier');
    dm.Q1.Connection.StartTransaction;
    try
      addParam('nobukti',   Enobukti.Text,            aList,'str');
      addParam('tgl',       frmTgl(DtBukti.Date),     aList,'date');
      addParam('idsupplier',idsupplier,               aList,'str');
      addParam('createby',  Fmain.sbr1.Panels[1].Text,aList,'str');
      addParam('total',     StrToDecimal(ESubtotal.Text),        aList,'str');
      addParam('diskon',    StrToDecimal(Ediskonrp.Text),        aList,'str');
      addParam('ppn',       StrToDecimal(Eppnrup.Text),        aList,'str');
      addParam('grandtotal',StrToDecimal(Egrandtotal.Text),      aList,'str');

      OpenTable(dm.Q2,['idpobeli'],'pobeli where nobukti="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'pobeli',alist)
      else
         UpdatePOST(dm.Q1,'pobeli',alist,'idpobeli',GetVal(dm.Q2,'idpobeli'));


      if sg1.Cells[1,sg1.RowCount -1] <> '' then
       sg1.RowCount := sg1.RowCount + 1;

      ExQry(dm.Q1,'DELETE FROM pobelidetail where nobukti="'+Enobukti.Text+'"',False);
      for x := 1 to sg1.RowCount -1 do
        begin

          if (sg1.Cells[1,x] <> '') and ( sg1.Cells[12,x]<> '') then
          begin
            if StrToFloatDef(nilai(sg1.Cells[13,x]),0) = 0 then
               sg1.Cells[13,x] := '1';

              HargaNormal := CellF(sg1.Cells[5,x]);
              HargaDiskon := HargaNormal - (HargaNormal * StrToFloatDef(sg1.Cells[8,x],0) /100);
              Hargadiskon2:= HargaDiskon - (HargaDiskon * StrToFloatDef(sg1.Cells[9,x],0) /100);
              HargaDiskon3:= Hargadiskon2 - (Hargadiskon2 * StrToFloatDef(sg1.Cells[10,x],0) / 100);

              hargafix :=HargaDiskon3;

              addParam('nobukti',     Enobukti.Text,          aList,'str');
              addParam('kodebarang',  sg1.Cells[14,x],             Alist,'str');
              addParam('satuan',      sg1.Cells[3,x],         Alist,'str');
              addParam('sisastok',    StrToDecimal(sg1.Cells[4,x]),         Alist,'str');
              addParam('hargabeli',   StrToDecimal(nilai(sg1.Cells[6,x])),  Alist,'str');
              addParam('ppn',         StrToDecimal(nilai(sg1.Cells[7,x])),  Alist,'str');
              addParam('jumlah',      StrToDecimal(nilai(sg1.Cells[5,x])),   Alist,'str');
              addParam('disk1',       StrToDecimal(nilai(sg1.Cells[9,x])),   Alist,'str');
              addParam('disk2',       StrToDecimal(nilai(sg1.Cells[10,x])),  Alist,'str');
              addParam('disk3',       StrToDecimal(nilai(sg1.Cells[11,x])),  Alist,'str');
              addParam('subtotal',    StrToDecimal(nilai(sg1.Cells[12,x])),  Alist,'str');
              addParam('isi',         nilai(sg1.Cells[13,x]), Alist,'str');

              OpenTable(dm.Q2,['idpobelidetail'],
              'pobelidetail WHERE kodebarang="'+kodebarang+'" '+
              'AND nobukti="'+Enobukti.Text+'"');

              if dm.Q2.IsEmpty then
                 Post(dm.Q1,'pobelidetail',aList)
              else
                 updatePOST(dm.Q1,'pobelidetail',aList,'idpobelidetail',GetVal(dm.Q2,'idpobelidetail'));

              ExQry(dm.Q1,' SELECT kodebarang FROM hargabelirata WHERE kodebarang="'+sg1.Cells[13,x]+'"',True);

          end else
          if (sg1.Cells[1,x] = '') and (CellF(sg1.Cells[12,x])>0) or (Sg1.Cells[2,x]<>'') then begin

            MessageBox(Handle,'Kode Barcode Harus Di Isi !! '+#13+' Silahkan Isi terlebih Dahulu !! '+#13+
                       'Atau batalkan item dengan menekan tombol [ DELETE ]','ERROR',MB_ICONERROR);
            sg1.Row := x;
            sg1.Col := 1;
            dm.Q1.Connection.Rollback;
            Abort;
          end;
        end;
          dm.Q1.Connection.Commit;
          Informasi('Data berhasil disimpan');
          if MessageDlg('Print PO pembelian',mtConfirmation,[mbYes,mbNo],0) =  mrYes then
             PrintPO(ENobukti.Text);

          TampilAwal;
      except
        dm.Q1.Connection.Rollback;
      end;
    end;



  end;
end;

procedure TFpoPembelianBarang.btnSupplierClick(Sender: TObject);
begin
  FcariSupplier.Show;
  FcariSupplier.isFormSUpplier := 2;
end;

procedure TFpoPembelianBarang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFpoPembelianBarang.btnUbahClick(Sender: TObject);
const
_SQLbarang =' SELECT                 '+
                   '   b.idbarang,          '+
                   '   b.kodebarang,        '+
                   '   b.kodebarcode,       '+
                   '   b.namabarang,        '+
                   '   b.namabarcode,       '+
                   '   b.hargasebelum,      '+
                   '   k.idkategori,        '+
                   '   k.namakategori,      '+
                   '   b.satuanbeli,        '+
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
                   '   b.ppn,                '+
                   '   b.stok,                '+
                   '   b.warningiflimit,     '+
                   '   h.hargabeli as hargabeliratarata  '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN hargabelirata h ON '+
                   '   h.kodebarang=b.kodebarang';
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
     EHargaBeli.Text      := GetValR(dm.QBarang,'hargabeli');
     EHargaJual.Text      := GetValR(dm.QBarang,'hargaecer');
     EHargaGrosir.Text    := GetValR(dm.QBarang,'hargagrosir');
     EHargaPartai.Text    := GetValR(dm.QBarang,'hargapartai');

     Eppn.Text            := GetVal(dm.QBarang,'ppn');
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

function TFpoPembelianBarang.CariIsi(barcode, Satuan: string): Extended;
begin
  ExQry(dm.Q5,'select mt.isi from multisatuan mt '+
  ' WHERE mt.satuan="'+satuan+'" AND mt.kodebarcode="'+barcode+'"',True);

  if dm.Q5.IsEmpty then begin
     ExQry(dm.Q4,'SELECT isi FROM barang WHERE satuanbeli="'+satuan+'" AND kodebarcode="'+barcode+'"',TRue);
     Result :=   dm.Q4.Fields[0].AsFloat;
  end
  else
  begin
    Result := dm.Q5.Fields[0].AsFloat;
  end;
end;

procedure TFpoPembelianBarang.CheckBox1Click(Sender: TObject);
var
  isiBeli , hrg , ppn, Hargabeli: Real;

  idSupplier : string;
  i : integer;
begin
  if CheckBox1.Checked = True then begin

       idSupplier := getData(dm.Q1,'m_supplier WHERE kodesupplier="'+EKodeSupplier.Text+'"','idsupplier');
       ExQry(dm.Q1,' SELECT                                              '+
                     '     d.kodebarang,                                   '+
                     '     b.kodebarcode,                                  '+
                     '     b.namabarang,                                   '+
                     '     b.minimalorder,                                   '+
                     '     b.ppn,                                   '+
                     '     d.harga,                                   '+
                     '     b.satuanjual,                                   '+
                     '     b.stokmin,                                 '+
                     '     fc_stok(b.kodebarang,'+IntToStr(MonthOf(Now))+','+
                     '     '+IntToStr(YearOf(Now))+') as stok              '+
                     '   FROM                                              '+
                     '     detailbeli d                                    '+
                     '     LEFT JOIN pembelian p                           '+
                     '       ON d.`nobukti` = p.`nobukti`                  '+
                     '     LEFT JOIN barang b                              '+
                     '       ON b.`kodebarang` = d.`kodebarang`            '+
                     '     LEFT JOIN multisatuan m                         '+
                     '       ON m.`kodebarang` = d.`kodebarang`            '+
                     '   WHERE p.`idsupplier` = "'+idSupplier+'" and b.warningiflimit=true           '+
                     '  GROUP BY d.kodebarang HAVING stok <= b.stokmin ORDER BY '+
                     ' d.iddetilbeli DESC',True);
       if dm.Q1.IsEmpty = False then begin

           i := 1;
           sg1.RowCount := dm.Q1.RecordCount + 2;
          while not dm.Q1.Eof do begin




            sg1.Cells[0,i] := IntToStr(i);
            sg1.Cells[1,i] := GetVal(dm.Q1,'kodebarcode');
            sg1.Cells[14,i]:= GetVal(dm.Q1,'kodebarang');
            sg1.Cells[2,i] := GetVal(dm.Q1,'namabarang');
            sg1.Cells[3,i] := GetVal(dm.Q1,'satuanjual');
            isiBeli              := CariIsi(sg1.Cells[1,i],sg1.Cells[3,i]);
            if isiBeli = 0 then isiBeli := 1;

            hrg                  := GetValF(dm.Q1,'harga') * isiBeli;
            sg1.Cells[4,i] := GetVal(dm.Q1,'stok');
            sg1.Cells[5,i] := GetVal(dm.Q1,'minimalorder');
            sg1.Cells[6,i] := FloatTostr(hrg);
            sg1.Cells[7,i] := GetVal(dm.Q1,'ppn');

            if (GetValF(dm.Q1,'harga') > 0) then  begin

            if (GetValF(dm.Q1,'ppn') > 0) and(GetValF(dm.Q1,'harga') > 0) then
            ppn                  := GetValF(dm.Q1,'harga') * GetValF(dm.Q1,'ppn') / 100;

            sg1.Cells[8,i] := Format('%.0n',[getValf(dm.Q1,'harga')+ppn]);
            hargaBeli  := CellF(sg1.Cells[5,i]) ;


            end;

            sg1.Cells[9,i]  := '';
            sg1.Cells[10,i] := '';
            sg1.Cells[11,i] := '';




            HitungSubtotal(i);
            inc(i);


            dm.Q1.Next;
          end;
          HitungTotal;
       end;
  end else
     CreateGrid;
end;

procedure TFpoPembelianBarang.CreateGrid;
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
    Cells[3,0]  := 'STN [INSERT]';
    Cells[4,0]  := 'STOK';
    Cells[5,0]  := 'QTY ORDER';
    Cells[6,0]  := 'HRG BELI';
    Cells[7,0]  := 'PPN(%)';
    Cells[8,0]  := 'HRG PPN';
    Cells[9,0]  := 'DISK(1)';
    Cells[10,0]  := 'DISK(2)';
    Cells[11,0] := 'DISK(3)';
    Cells[12,0] := 'SUBTOTAL ';
    Cells[13,0] := 'ISI ';
    Cells[14,0] := 'Kdbrng ';

    ColWidths[0]:= 30;
    ColWidths[1]:= 130;
    ColWidths[2]:= 200;
    ColWidths[3]:= 100;
    ColWidths[4]:= 80;
    ColWidths[5]:= 80;
    ColWidths[6]:= 80;
    ColWidths[7]:= 80;
    ColWidths[8]:= 80;
    ColWidths[9]:= 80;
    ColWidths[10]:= 80;
    ColWidths[11]:= 80;
    ColWidths[12]:= 80;
    ColWidths[13]:= 80;
    ColWidths[14]:= 0;

    Row          := RowCount -1;
    Col          :=1;

    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch       := True;
 end;

end;

procedure TFpoPembelianBarang.EDiskonperPropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFpoPembelianBarang.EdiskonrpPropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFpoPembelianBarang.EppnperPropertiesChange(Sender: TObject);
begin
  HitungTotal;
end;

procedure TFpoPembelianBarang.EppnrupKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  HitungTotal;
end;

procedure TFpoPembelianBarang.EsatuanKeyDown(Sender: TObject; var Key: Word;
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

procedure TFpoPembelianBarang.Focus;
begin
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=1;
  sg1.SetFocus;
end;

procedure TFpoPembelianBarang.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := True;
end;

procedure TFpoPembelianBarang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFpoPembelianBarang.FormCreate(Sender: TObject);
begin
  CreateGrid;
  EDiskonper.isPersen := True;
  Ediskonrp.isRupiah  := True;

end;

procedure TFpoPembelianBarang.FormShow(Sender: TObject);
begin

  aList := TStringLIst.Create;

  sg1.SetFocus;
  ExQry(dm.Q1,'SELECT * from m_user WHERE username="'+Fmain.sbr1.Panels[2].Text+'"',True);

  SHowHarga := GetValBol(dm.Q1,'showharga');

  if SHowHarga then ETotal.Visible := True else Etotal.Visible := False;


end;

function TFpoPembelianBarang.GetHargaBeli(kodebarang: string; HargaBaru       : Real;   JumlahBaru      : Real;
  var saldolama: Real): Real;
var
  HargaLama       : Real;

  StokLama        : Real;

  HargaRata_rata  : Real;
begin
  ExQry(dm.Q1,'   SELECT hargabeli from hargabelirata WHERE kodebarang="'+kodeBarang+'" LIMIT 1 ',True);

  HargaLama := GetValF(dm.Q1,'hargabeli');

  ExQry(dm.Q1,  ' SELECT  SUM(ks.saldoawal + ks.masuk - ks.keluar) as stok '+
                ' FROM kartustok ks WHERE ks.kodebarang="'+kodeBarang+'" '+
                '  AND MONTH(tgl)="'+intTOStr(MonthOf(now))+'" '+
                ' AND YEAR(tgl)="'+intToStr(YearOf(now))+'"',True);

  StokLama  := GetValF(dm.Q1,'stok');
  saldolama := StokLama;
  if ( saldolama + JumlahBaru > 0)  then

  HargaRata_rata := ((HargaLama * StokLama) + (HargaBaru * JumlahBaru)) / ( StokLama + JumlahBaru ) else
  HargaRata_rata := HargaBaru;


  Result         := HargaRata_rata;
end;

procedure TFpoPembelianBarang.HitungSubtotal(AROW:Integer);
var
  Harga , Jumlah ,SubTotal,isi : Real;
  Diskon1,Diskon2,Diskon3,FixHarga,ppn,HargaSetelahPPN : Real;
  HargaDiskon1,HargaDiskon2,HargaDiskon3 : Real;
begin
  with sg1 do begin
    Harga           := CellF(Cells[6,aRow]);
    ppn             := CellF(Cells[7,aRow]);

    Jumlah          := StrToFloatDef(koma(Cells[5,aRow]),0);

    Diskon1         := StrToFloatDef(koma(Cells[9,aRow]),0);
    Diskon2         := StrToFloatDef(nilai(Cells[10,aRow]),0);
    Diskon3         := StrToFloatDef(nilai(Cells[11,aRow]),0);

    hargaDiskon1    := (Harga * Diskon1 / 100);
    FixHarga        := Harga - hargaDiskon1;
    hargaDiskon2    := (FixHarga * Diskon2 / 100);
    FixHarga        := FixHarga - hargaDiskon2;
    hargaDiskon3    := (FixHarga * Diskon3 / 100);
    FixHarga        := FixHarga - hargaDiskon3;



    hargaSetelahDiskon := FixHarga;
    HargaSetelahPPN    := hargaSetelahDiskon + (hargaSetelahDiskon * ppn /100);
    sg1.Cells[8,Arow]  := Format('%.2n',[HargaSetelahPPN]);
    isi          := CariIsi(Cells[1,aRow],Cells[3,aRow]) * Jumlah;
    SubTotal     := HargaSetelahPPN * Jumlah;

    Cells[12,aRow] := Format('%.2n',[Subtotal]);
    Cells[13,aRow] := GetRupiah(FloatToStr(isi));
  end;
end;

procedure TFpoPembelianBarang.HitungTotal;
var
  Total , Diskon, GrandTotal : Real;
  DiskonPesen,DiskonRUpiah,PPnPersen,PPnRupiah : Real;
begin
  Esubtotal.Text := Format('%.2n',[StrTOFloatDEf(SumGrid(sg1,12),0)]);

  Total       := Esubtotal.AsFLoat;
  DiskonPesen := EDiskonper.AsFLoat;
  PPnPersen   := Eppnper.AsFLoat;

  DiskonRUpiah:= Total * DiskonPesen / 100;

  if DiskonPesen > 0 then
     Ediskonrp.Text := GetRupiah(FloatToStr(DiskonRUpiah));

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

procedure TFpoPembelianBarang.KosongKanGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=1 to RowCount do
    Cells[c,r]:='';

    ColCount    := 14;
    RowCount    := 2 ;
  end;
end;

function TFpoPembelianBarang.Posisi(kodebarcode: String;stn : string): integer;
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

procedure TFpoPembelianBarang.PrintBukti(NoFak: string);
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


    Dlaporan.Fr1.LoadFromFile(aPathRpt+'\cetakBeli.fr3');
  //  FMemo(Dlaporan.Fr1,'Lterbilang').Text:= MyTerbilang(Dlaporan.Qpenjualan.FieldByName('grandtotal').AsFloat);
    Dlaporan.Fr1.PrepareReport(True);
    Dlaporan.Fr1.PrintOptions.ShowDialog := True;
    Dlaporan.Fr1.PrintOptions.Printer    := PrinterInvoice;
    if CheckAuto = True then
     Dlaporan.Fr1.Print else
     Dlaporan.Fr1.ShowReport();

end;


procedure TFpoPembelianBarang.PrintPo(nobukti: String);
const
 SQLPO = ' SELECT                                         '+
         '       p.idpobeli,                              '+
         '       p.nobukti,                               '+
         '       p.tgl,                                   '+
         '       p.idsupplier,                            '+
         '       s.namasupplier,                          '+
         '       s.alamat,                                '+
         '       s.kota,                                  '+
         '       s.notelpon,                              '+
         '       u.namalengkap,                           '+
         '       p.total                                  '+
         '     FROM                                       '+
         '       pobeli p                                 '+
         '       LEFT JOIN m_supplier s                   '+
         '         ON s.`idsupplier` = p.`idsupplier`     '+
         '       LEFT JOIN m_user u                       '+
         '     ON u.iduser=p.createby                     ';
begin
  ExQry(Dlaporan.Qpobeli,SQLPO+' WHERE nobukti="'+nobukti+'"',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\cetakPO.fr3');
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.ShowReport();
end;

procedure TFpoPembelianBarang.ReplaceData;
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
  end;
end;

procedure TFpoPembelianBarang.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [11] then
    HAlign := taRightJustify;
  end;

end;

procedure TFpoPembelianBarang.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if (ACol in [4,5,8,9,10,11,12]) then
      begin
        isFloat := True;
        FloatFormat :='%.2n';
      end
  else
       isFloat := False;
end;

procedure TFpoPembelianBarang.sg1KeyDown(Sender: TObject; var Key: Word;
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
        ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE (m.kodebarcode="'+sg1.Cells[1,Sg1.Row]+'" '+
        ' OR  b.namabarang LIKE "%'+sg1.Cells[1,sg1.Row]+'%")',True);

        if (Dm.Q1.IsEmpty) or (dm.Q1.RecordCount > 1) then begin
           ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
           ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'%") GROUP BY b.kodebarang',True);
           FcariBarang.Show;
           FcariBarang.isFormTransaksi := 3;

        end else if dm.Q1.RecordCount = 1 then begin



              sg1.Cells[0,sg1.Row] := IntToStr(sg1.Row);
              sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'kodebarcode');
              sg1.Cells[14,sg1.Row]:= GetVal(dm.Q1,'kodebarang');
              sg1.Cells[2,sg1.Row] := GetVal(dm.Q1,'namabarang');
              sg1.Cells[3,sg1.Row] := GetVal(dm.Q1,'satuan');
              isiBeli              := CariIsi(sg1.Cells[1,sg1.Row],sg1.Cells[3,sg1.Row]);
              hrg                  := GetValF(dm.Q1,'hargabeli') * isiBeli;
              sg1.Cells[4,sg1.Row] := GetVal(dm.Q1,'stok');
              sg1.Cells[5,sg1.Row] := GetVal(dm.Q1,'minimalorder');
              sg1.Cells[6,sg1.Row] := FloatTostr(hrg);
              sg1.Cells[7,sg1.Row] := GetVal(dm.Q1,'ppn');

              if GetValF(dm.Q1,'ppn') > 0 then
              ppn                  := GetValF(dm.Q1,'hargabeli') * GetValF(dm.Q1,'ppn') / 100;

              sg1.Cells[8,sg1.Row] := Format('%.0n',[getValf(dm.Q1,'hargabeli')+ppn]);
              hargaBeli  := CellF(sg1.Cells[5,sg1.Row]) ;

              sg1.Cells[9,sg1.Row] := '';
              sg1.Cells[10,sg1.Row] := '';
              sg1.Cells[11,sg1.Row] := '';

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
        ' OR  b.namabarang LIKE "%'+sg1.Cells[1,sg1.Row]+'%")',True);
          FcariBarang.Show;
          FcariBarang.isFormTransaksi := 3;
     end;
  end;
  end;

end;

procedure TFpoPembelianBarang.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [4,5,8,9,10]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFpoPembelianBarang.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);


begin

    if (sg1.Col in  [4,5,6,8,9,10]) then
    begin
        HitungSubtotal(sg1.Row);
        HitungTotal;
       

      end ;




   case KEy of
   VK_RETURN : if sg1.Col in [2..10] then sg1.Col := sg1.Col + 1 else Focus;

  { VK_INSERT : begin
                 if sg1.Cells[1,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin
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
               end;  }
   end;
end;

procedure TFpoPembelianBarang.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);

begin

   if SHowHarga = False then
      begin
        if ACol in [1,4,5,8,9,10] then
           sg1.Options := sg1.Options +[GoEditing] else
           sg1.Options := sg1.Options -[GoEditing];
      end;

end;

procedure TFpoPembelianBarang.TampilAwal;
begin
  ClearText(Self);
  KosongKanGrid;

  Enobukti.Text  := GetCode(dm.Q1,'pobeli','nobukti','POB'+setIdKom);
  setTanggal(Self);


  OpenTable(dm.Q1,['kodesupplier','namasupplier'],'m_supplier WHERE namasupplier="UMUM"');

  if dm.Q1.IsEmpty then begin

    Warning('SUPPLIER UMUM TIDAK DITEMUKAN '+#13+' SILAHKAN ISI TERLEBIH DAHULU');
    CLose;

  end else
  begin
    FpoPembelianBarang.ESupplier.Text      := GetVal(dm.Q1,'namasupplier');
    FpoPembelianBarang.EKodeSupplier.Text  := GetVal(dm.Q1,'kodesupplier');
  end;

 
end;


end.
