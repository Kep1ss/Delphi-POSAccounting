unit uReturBeliNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  cxButtons, cxDropDownEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox,
  uEngine, uComCtrl, uctrlFrm, uOvEdit, dxSkiniMaginary, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, cxMemo,System.DateUtils, dxSkinMoneyTwins, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  dxSkinGlassOceans, dxSkinLiquidSky, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinLilian, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFreturbelinew = class(TForm)
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
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    ETotal: TcxTextEdit;
    btnSupplier: TcxButton;
    EKodeSupplier: TcxTextEdit;
    btnFocus: TcxButton;
    lbl1: TLabel;
    m1: TcxMemo;
    lbl2: TLabel;
    lbl3: TLabel;
    cbGudang: TcxComboBox;
    Label7: TLabel;
    Label8: TLabel;
    EnoPembelian: TcxTextEdit;
    btn1: TcxButton;
    cxgrpbx1: TcxGroupBox;
    sg1: TAdvStringGrid;
    cxgrpbx2: TcxGroupBox;
    EPencarian: TcxTextEdit;
    cxdataGrid1DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    cxdataGrid1DBTableView1kodebarang: TcxGridDBColumn;
    cxdataGrid1DBTableView1namabarang: TcxGridDBColumn;
    Label21: TLabel;
    cbAkun: TcxComboBox;
    Label9: TLabel;
    Label10: TLabel;
    cbPembayaran: TcxComboBox;
    cxlbl1: TcxLabel;
    btnCariBarang: TcxButton;
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
    procedure btnFocusClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure cxdataGrid1DBTableView1DblClick(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    aList : TStringList;
    function sumBKP : Real;
    { Private declarations }
  public
    procedure TampilAwal;
    procedure CreateGrid;
    procedure bersihCell;
    procedure ReplaceData;
    procedure KosongKanGrid;
    procedure Focus;
    function  Posisi(kodebarcode:String):integer;
    procedure HitungTotal;
    procedure HitungSubtotal(Arow:Integer);
    function  ToFloat(ACol:Integer;ARow:integer):Extended;
    function CariIsi(barcode:string;Satuan:string):Extended;
    function GetHargaBeli(kodebarang: string; HargaBaru       : Real;   JumlahBaru      : Real): Real;
    { Public declarations }
  end;


var
  Freturbelinew: TFreturbelinew;


implementation

{$R *.dfm}

uses udm, uCariSupplier, uCariBarang, uMainMenu, uUbahHarga, uCariPObeli, uDtrx,
  uPilihSatuan, uCaripembelian;

procedure TFreturbelinew.bersihCell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
end;

procedure TFreturbelinew.btn1Click(Sender: TObject);
begin
  ExQry(dtrx.QPembelian,_SQLCariBelior+' LEFT JOIN detailbeli '+
                      ' db ON db.nobukti=p.nobukti '+
                      ' WHERE db.retur < db.isi AND p.nobukti IN '+
                      ' (SELECT nobuktibeli FROM penerimaanbarang) '+
                      ' GROUP BY p.nobukti',True);
  FcariPembelian.isCariPembelian := 2;
  FcariPembelian.Show;
end;

procedure TFreturbelinew.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFreturbelinew.btnCariBarangClick(Sender: TObject);
begin
  FcariBarang.isFormTransaksi := 5;
  ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' where b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
  ' or b.kodebarcode LIKE "%'+sg1.Cells[1,sg1.Row]+'%"  or '+
  ' b.kodebarang="'+sg1.Cells[1,sg1.Row]+'" group BY b.kodebarang,ks.idgudang',True);


  FcariBarang.ShowModal;

end;

procedure TFreturbelinew.btnFocusClick(Sender: TObject);
begin
  Focus;
end;

procedure TFreturbelinew.btnHapusClick(Sender: TObject);
begin

  if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (sg1.RowCount >= 2)  then
  begin
    if (sg1.Cells[8,sg1.Row] <>'') or (sg1.Cells[2,sg1.Row] <>'') then
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

procedure TFreturbelinew.btnSimpanClick(Sender: TObject);
var
  x : integer;
  idSupplier,KodeBarang : string;
  Kredit, Lunas : Boolean;
  HargaBeli ,HargaSetelahPPN,Jumlah: Real;
  ppn : Real;
begin

  if not CheckEdit(Self) then begin
    idSupplier := getData(dm.Q2,'m_supplier where kodesupplier="'+Ekodesupplier.Text+'"','idsupplier');
    dm.Q1.Connection.StartTransaction;
    try
      if sumBKP > 0 then
         ppn := sumBKP * asPPn / 100 else
         ppn := 0;
      addParam('nobukti',   Enobukti.Text,            aList,'str');
      addParam('tgl',       frmTgl(DtBukti.Date),     aList,'date');
      if idSupplier <> '' then

      addParam('idsupplier',idsupplier,               aList,'str');
      addParam('iduser',    Fmain.sbr1.Panels[1].Text,aList,'str');
      addParam('total',     StrToDecimal(nilai(ETotal.Text)),       aList,'str');
      addParam('keterangan',m1.Text,       aList,'str');
      addParam('nobuktibeli',EnoPembelian.Text,       aList,'str');
      addParam('nominalbkp',StrToDecimal(FloatToStr(sumBKP + ppn)), aList,'str');
      addParam('nominalnonbkp', StrToDecimal(FloatToStr(ETotal.AsFLoat - (sumBKP + ppn))), aList,'str');

      OpenTable(dm.Q2,['idretur'],'returpembelian where nobukti="'+Enobukti.Text+'"');
      if Dm.Q2.IsEmpty then
         Post(dm.Q1,'returpembelian',alist)
      else
         UpdatePOST(dm.Q1,'returpembelian',alist,'idretur',GetVal(dm.Q2,'idretur'));

      for x := 1 to sg1.RowCount -1 do
        begin

          if (sg1.Cells[1,x] <> '') and ( sg1.Cells[8,x]<> '') then
          begin
            if StrToFloatDef(nilai(sg1.Cells[9,x]),0) = 0 then
               sg1.Cells[9,x] := '1';

              OpenTable(dm.Q2,['kodebarang','hargaecer','hargagrosir','hargapartai'],
              'barang where kodebarcode="'+sg1.cells[1,x]+'"');
              KodeBarang := GetVal(dm.Q2,'kodebarang');
              addParam('nobukti',     Enobukti.Text,          aList,'str');
              addParam('kodebarang',  KodeBarang,             Alist,'str');
              addParam('satuan',      sg1.Cells[3,x],         Alist,'str');
              addParam('harga',       StrToDecimal(sg1.Cells[4,x]),  Alist,'str');

              addParam('diskonpersen',StrToDecimal(sg1.Cells[5,x]),   Alist,'str');
              addParam('diskon2',     StrToDecimal(sg1.Cells[6,x]),   Alist,'str');
              addParam('diskon3',     StrToDecimal(sg1.Cells[7,x]),  Alist,'str');
              addParam('jumlah',      nilai(sg1.Cells[8,x]),   Alist,'str');
              addParam('subtotal',    StrToDecimal(sg1.Cells[9,x]),  Alist,'str');
              addParam('isi',         nilai(sg1.Cells[10,x]), Alist,'str');
              addParam('idgudang',    GetIdcmb(cbGudang),     Alist,'str');


              OpenTable(dm.Q2,['idreturbeli'],
              'detailreturbeli WHERE kodebarang="'+kodebarang+'" '+
              'AND nobukti="'+Enobukti.Text+'"');

              if dm.Q2.IsEmpty then
                 Post(dm.Q1,'detailreturbeli',aList)
              else
                 updatePOST(dm.Q1,'detailreturbeli',aList,'idreturbeli',GetVal(dm.Q2,'idreturbeli'));
              HargaSetelahPPN := StrToFloatDef(nilai(sg1.Cells[4,x]),0);
              Jumlah          := StrToFloatDef(nilai(sg1.Cells[10,x]),0);

              ExQry(dm.Q5,' SELECT kodebarang FROM hargabelirata WHERE kodebarang="'+KodeBarang+'" ',True);
              hargabeli := GetHargaBeli(KodeBarang,HargaSetelahPPN,Jumlah);

              if dm.Q5.IsEmpty then begin
                ExQry(dm.Q3,'INSERT INTO hargabelirata (kodebarang,hargabeli) VALUES ( '+
                '"'+KodeBarang+'","'+StrTODecimal(Format('%.4n',[hargabeli]))+'")',False);
              end
              else begin
               ExQry(dm.Q3,'UPDATE hargabelirata SET hargabeli="'+StrToDecimal(Format('%.4n',[hargabeli]))+'" WHERE '+
               ' kodebarang="'+KodeBarang+'" ',False);
              end;
              ExQry(dm.Q1,'UPDATE detailbeli SET retur=retur+"'+nilai(sg1.Cells[8,x])+'" '+
              ' WHERE kodebarang="'+KodeBarang+'" AND nobukti="'+EnoPembelian.Text+'"',False);

              PostingKartuStok(dm.Q5,Enobukti.Text,DtBukti.Date,
                              KodeBarang,GetIdcmb(cbGudang),sg1.Cells[3,x],
                              CellF(sg1.Cells[4,x]),'KELUAR',CellF(sg1.Cells[10,x]),
                              'RETUR PEMBELIAN NO BUKTI ['+Enobukti.Text+']');
          end else
          if (sg1.Cells[1,x] = '') and (sg1.Cells[8,x]<>'') or (Sg1.Cells[2,x]<>'') then begin
            MessageBox(Handle,'Kode Barcode Harus Di Isi !! '+#13+' Silahkan Isi terlebih Dahulu !! '+#13+
                       'Atau batalkan item dengan menekan tombol [ DELETE ]','ERROR',MB_ICONERROR);
            sg1.Row := x;
            sg1.Col := 1;
            dm.Q1.Connection.Rollback;
            Abort;
          end;
        end;

        Kredit := getData(dm.Q3,'pembelian WHERE nobukti="'+EnoPembelian.Text+'"','pembayaran') = 'KREDIT';
        Lunas  := UPPERCASE(getData(dm.Q3,'hutang WHERE nobukti="'+EnoPembelian.Text+'"','lunas')) = 'TRUE';

        if (Kredit) and (NOT lunas) then begin

             PostingJurnal(dm.Q1,'103.001',Enobukti.Text,'RETUR PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                        DtBukti.Date,sumBKP + (ETotal.AsFLoat - (sumBKP + ppn)),SumBkp,(Etotal.asFloat - (SumBkp + ppn)),'K');

             PostingJurnal(dm.Q1,'103.002',Enobukti.Text,'RETUR PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                        DtBukti.Date,ppn,ppn,0,'K');

             PostingJurnal(dm.Q1,'201.001',Enobukti.Text,'RETUR NO BUKTI ['+Enobukti.Text+']',
                        DtBukti.Date,ETotal.AsFLoat,SumBkp + ppn,Etotal.asFloat - (SumBkp + ppn),'D');

             ExQry(dm.Q1,'UPDATE hutang SET hutang.hutang=hutang-"'+StrToDecimal(Etotal.Text)+'", '+
             ' kekurangan=hutang-dibayar,nominalbkp=nominalbkp-"'+StrToDecimal(FloatToStr(SumBkp+ppn))+'",'+
             ' nominalnonbkp=nominalnonbkp-"'+StrToDecimal(FloatToStr(Etotal.AsFLoat - (sumBKP+ppn)))+'" '+
             ' WHERE nobukti="'+EnoPembelian.Text+'"',False);

        end else begin
          PostingJurnal(dm.Q1,Copy(cbAkun.Text,1,7),Enobukti.Text,'RETUR NO BUKTI ['+Enobukti.Text+']',
                       DtBukti.Date,ETotal.AsFLoat,SumBkp,(Etotal.asFloat - (SumBkp + ppn)),'D');
          PostingJurnal(dm.Q1,'103.001',Enobukti.Text,'RETUR PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                      DtBukti.Date,sumBKP + (ETotal.AsFLoat - (sumBKP + ppn)),SumBkp,(Etotal.asFloat - (SumBkp + ppn)),'K');
          PostingJurnal(dm.Q1,'103.002',Enobukti.Text,'RETUR PEMBELIAN NO BUKTI ['+Enobukti.Text+']',
                      DtBukti.Date,ppn,ppn,0,'K');
        end;


          dm.Q1.Connection.Commit;
      except
        dm.Q1.Connection.Rollback;
      end;
      Informasi('Data Retur pembelian berasil disimpan');
      TampilAwal;
    end;


end;

procedure TFreturbelinew.btnSupplierClick(Sender: TObject);
begin
  FcariSupplier.Show;
  FcariSupplier.isFormSUpplier := 3;
end;

procedure TFreturbelinew.btnTutupClick(Sender: TObject);
begin
  Close;
end;

function TFreturbelinew.CariIsi(barcode, Satuan: string): Extended;
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

procedure TFreturbelinew.CreateGrid;
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


    ColumnSize.StretchColumn := 2;
    ColumnSize.Stretch := True;


    Cells[0,0]  := 'NO';
    Cells[1,0]  := 'KODE BARANG';
    Cells[2,0]  := 'NAMA BARANG';
    Cells[3,0]  := 'SATUAN [INSERT]';
    Cells[4,0]  := 'HARGA';
    Cells[5,0]  := 'DISC(1)';
    Cells[6,0]  := 'DISC(2)';
    Cells[7,0]  := 'DISC(3)';
    Cells[8,0]  := 'QTY [F4]';
    Cells[9,0]  := 'SUBTOTAL ';
    Cells[10,0]  := 'Isi ';
    Cells[11,0]  := 'bkp ';

    ColWidths[0]:= 50;
    ColWidths[1]:= 150;
    ColWidths[2]:= 250;
    ColWidths[3]:= 60;
    ColWidths[4]:= 60;
    ColWidths[5]:= 60;
    ColWidths[6]:= 70;
    ColWidths[7]:= 80;
    ColWidths[8]:= 100;
    ColWidths[9]:= 100;
    ColWidths[10]:= 0;
    ColWidths[11]:= 0;


 end;

end;

procedure TFreturbelinew.cxdataGrid1DBTableView1DblClick(Sender: TObject);
begin
  if Posisi(GetVal(dtrx.Qdetailbeli,'kodebarcode')) > 0 then begin
    Warning('Barang sudah terpilih');
    Exit;
  end else begin

        sg1.Cells[0,sg1.RowCount -1] := IntToStr(sg1.RowCount -1);
        sg1.Cells[1,sg1.RowCount -1] := GetVal(dtrx.Qdetailbeli,'kodebarcode');
        sg1.Cells[2,sg1.RowCount -1] := GetVal(dtrx.Qdetailbeli,'namabarang');
        sg1.Cells[3,sg1.RowCount -1] := GetVal(dtrx.Qdetailbeli,'satuan');
        sg1.Cells[4,sg1.RowCount -1] := GetValCur(dtrx.Qdetailbeli,'harga');
        sg1.Cells[5,sg1.RowCount -1] := GetValCur(dtrx.Qdetailbeli,'diskonpersen');
        sg1.Cells[6,sg1.RowCount -1] := GetValCur(dtrx.Qdetailbeli,'diskon2');
        sg1.Cells[7,sg1.RowCount -1] := GetValCur(dtrx.Qdetailbeli,'diskon3');
        sg1.Cells[8,sg1.RowCount -1] := GetVal(dtrx.Qdetailbeli,'jumlah');
        sg1.Cells[9,sg1.RowCount -1] := GetValCur(dtrx.Qdetailbeli,'subtotal');
        sg1.Cells[10,sg1.RowCount -1] := GetVal(dtrx.Qdetailbeli,'isi');
        sg1.Cells[11,sg1.RowCount -1] := GetVal(dtrx.Qdetailbeli,'bkp');
        sg1.RowCount                 := sg1.RowCount + 1;
        HitungTotal;
  end;

end;

procedure TFreturbelinew.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dtrx.Qdetailbeli,_cariDetailbeli+' WHERE nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'" '+
            ' AND d.retur < d.isi AND b.namabarang LIKE "%'+EPencarian.Text+'%" ',True);
end;

procedure TFreturbelinew.Focus;
begin
  sg1.Row := sg1.RowCount -1;
  sg1.Col :=1;
  sg1.SetFocus;
end;

procedure TFreturbelinew.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := True;
end;

procedure TFreturbelinew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFreturbelinew.FormShow(Sender: TObject);
begin
  aList := TStringLIst.Create;
  sg1.SetFocus;

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
  cbgudang.ItemIndex  := idxCmb(cbgudang,GetValInt(dm.QUser,'gudang_beli'));
  cbAKun.ItemIndex := cbAKun.Properties.Items.IndexOf(GetVal(dm.Quser,'kas_pembelian'));
  cbAkun.ItemIndex := 1;

end;

function TFreturbelinew.GetHargaBeli(kodebarang: string; HargaBaru,
  JumlahBaru: Real): Real;
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
  if ( StokLama - JumlahBaru > 0)  then

  HargaRata_rata := ((HargaLama * StokLama) - (HargaBaru * JumlahBaru)) / ( StokLama - JumlahBaru ) else
  HargaRata_rata := HargaBaru;

  Result         := HargaRata_rata;

end;

procedure TFreturbelinew.HitungSubtotal(AROW:Integer);
var
  Harga , Jumlah ,SubTotal,isi : Real;
  Diskon1,Diskon2,Diskon3,FixHarga : Real;
  HargaDiskon1,HargaDiskon2,HargaDiskon3 : Real;
begin
  with sg1 do begin
    Harga        := StrToFloatDef(nilai(Cells[4,aRow]),0);
    Jumlah       := StrToFloatDef(koma(Cells[8,aRow]),0);

    Diskon1      := StrToFloatDef(koma(Cells[5,aRow]),0);
    Diskon2      := StrToFloatDef(nilai(Cells[6,aRow]),0);
    Diskon3      := StrToFloatDef(nilai(Cells[7,aRow]),0);

    hargaDiskon1 := (Harga * Diskon1 / 100);
    FixHarga     := Harga - hargaDiskon1;
    hargaDiskon2 := (FixHarga * Diskon2 / 100);
    FixHarga     := FixHarga - hargaDiskon2;
    hargaDiskon3 := (FixHarga * Diskon3 / 100);
    FixHarga     := FixHarga - hargaDiskon3;


    isi          := CariIsi(Cells[1,aRow],Cells[3,aRow]) * Jumlah;
    SubTotal     := FixHarga * Jumlah;

    Cells[9,aRow] := Format('%.2n',[Subtotal]);
    Cells[10,aRow] := GetRupiah(FloatToStr(isi));
  end;
end;


procedure TFreturbelinew.HitungTotal;
begin
  ETotal.Text := Format('%.2n',[StrToFloatDef(SumGrid(sg1,9),0)]);
end;

procedure TFreturbelinew.KosongKanGrid;
var
  c,r :integer;
begin
  with sg1 do
  begin
    for c:=0 to ColCount do
    for r:=1 to RowCount do
    Cells[c,r]:='';

    ColCount    := 11;
    RowCount    := 2 ;
  end;
end;

function TFreturbelinew.Posisi(kodebarcode: String): integer;
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

procedure TFreturbelinew.ReplaceData;
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
  end;
end;

procedure TFreturbelinew.sg1GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then begin
    if ACol in [3,4,5,6,8,9] then
    HAlign := taRightJustify;
  end;

end;

procedure TFreturbelinew.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
  if (ACol in [4,5,6,7,9]) then
      begin
        isFloat := True;
        FloatFormat :='%.2n';
      end
  else
       isFloat := False;
end;

procedure TFreturbelinew.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var
 pas : Integer;
 hrg : Real;
 isiBeli,jml,qty : Real;
 ppn : Real;
begin
  if (Sg1.Col = 1) And (key = 13) then begin
     if COPY(sg1.Cells[1,sg1.Row],1,1) = '+' then begin
        jml := StrToFloatDef(StringReplace(sg1.Cells[1,sg1.Row],'+','',[RfReplaceAll]),0);
        sg1.Cells[7,sg1.Row -1] := Koma(FloatToStr(jml));

        HitungSubtotal(sg1.Row -1);;
        HitungTotal;
        bersihCell;
     end else begin
     if (sg1.Cells[1,sg1.Row] <> '') then begin
        ExQry(dm.Q1,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%"  '+
               ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'%") GROUP BY b.kodebarang',True);

        if (Dm.Q1.IsEmpty) or (dm.Q1.RecordCount > 1) then begin

           ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%"  '+
               ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'%")   GROUP BY b.kodebarang',True);
               FcariBarang.Show;
               FcariBarang.isFormTransaksi := 5;

        end else begin

           pas    := Posisi(UPPERCASE(GetVal(dm.Q1,'kodebarcode')));

           if (pas <> 0) and (pas <> sg1.Row) then begin
             // isiBeli           := GetValF(dm.Q1,'isi');


              sg1.Cells[8,pas]  := FloatToStr(StrToFloatDef(sg1.Cells[8,pas],0)+1);

              HitungSubtotal(pas);
              sg1.Cells[10,pas] := FloatToStr(StrToFloatDef(sg1.Cells[8,pas],0)+1);

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
              isiBeli              := GetValF(dm.Q1,'isi');
              hrg                  := GetValF(dm.Q1,'hargabeli');
              sg1.Cells[4,sg1.Row] := GetRupiah(FloatTostr(hrg));
              sg1.Cells[5,sg1.Row] := '';
              sg1.Cells[6,sg1.Row] := '';

              sg1.Cells[7,sg1.Row] := '''';
              sg1.Cells[8,sg1.Row] := '1';
              HitungSubtotal(sg1.Row);
              sg1.Cells[10,sg1.Row]:= '1';


              if sg1.Cells[1,sg1.RowCount-1 ] <>'' then
              sg1.RowCount := sg1.RowCount + 1;

              Focus;
            end;
            HitungTotal;
        end;
     end
     else begin
          ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE (b.namabarang like"%'+sg1.Cells[1,sg1.Row]+'%" '+
               ' or b.kodebarcode like"%'+sg1.Cells[1,sg1.Row]+'%")  GROUP BY b.kodebarang',True);
               FcariBarang.Show;
               FcariBarang.isFormTransaksi := 5;
     end;
  end;
  end;

end;

procedure TFreturbelinew.sg1KeyPress(Sender: TObject; var Key: Char);
begin
  if sg1.Col in [4,5,6,8,9]  then begin

     if not (key in['0'..'9',#13,#8,#10,',','.']) then
        key:=#0;
  end;

end;

procedure TFreturbelinew.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if sg1.Col in [3,4,5,7,8,9]  then begin
     HitungSubtotal(sg1.Row);
     HitungTotal;

   end;

   case KEy of
   VK_RETURN : if sg1.Col in [2..6] then sg1.Col := sg1.Col + 1 else Focus;

   VK_INSERT : begin
                 if sg1.Cells[1,sg1.Row] = '' then
                    Warning('Silahkan pilih item barang dulu!!')
                 else
                    begin
                      ExQry(dm.QMultiSatuan,'SELECT s.*,(b.hargabeli * s.isi) as hargabeli FROM multisatuan s left join barang b '+
                      ' ON b.kodebarang=s.kodebarang WHERE b.kodebarang="'+sg1.Cells[1,sg1.Row]+'"',True);
                      if DM.QMultiSatuan.IsEmpty then
                         Warning('Tidak ada multi satuan')
                      else begin
                         FpilihSatuan.Show;
                         FpilihSatuan.cHargabeli.Visible := True;
                         FpilihSatuan.cHarga.Visible     := False;

                         FpilihSatuan.isFormSatuan := 3;
                      end;
                    end;
               end;

   end;
end;

procedure TFreturbelinew.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);

begin
   if ACol in [1,4,8,5,6,7] then
    sg1.Options := sg1.Options +[GoEditing]
  else
    sg1.Options := sg1.Options -[goEditing];


end;

function TFreturbelinew.sumBKP: Real;
var
  i : integer;
  Subtotal : real;
begin
  Subtotal := 0;
  for i := 1 to sg1.RowCount -1  do begin
    if (UPPERCASE(sg1.Cells[11,i]) = 'TRUE') and (sg1.Cells[9,i] <> '') then begin
       Subtotal := Subtotal + StrToFloatDef(nilai(sg1.Cells[9,i]),0);
    end;

  end;

  Result := Subtotal / ((asPPn + 100) / 100);

end;

procedure TFreturbelinew.TampilAwal;
begin
  ClearText(Self);
  CreateGrid;
  Enobukti.Text  := GetCode(dm.Q1,'returpembelian','nobukti','RB'+setIdKom);
  setTanggal(Self);


  OpenTable(dm.Q1,['kodesupplier','namasupplier'],'m_supplier WHERE namasupplier="UMUM"');

  if dm.Q1.IsEmpty then begin

    Warning('SUPPLIER UMUM TIDAK DITEMUKAN '+#13+' SILAHKAN ISI TERLEBIH DAHULU');
    CLose;

  end else
  begin
    ESupplier.Text      := GetVal(dm.Q1,'namasupplier');
    EKodeSupplier.Text  := GetVal(dm.Q1,'kodesupplier');
  end;
  dtrx.Qdetailbeli.Active := False;
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  cbGudang.ItemIndex := 0;
end;

function TFreturbelinew.ToFloat(ACol, ARow: integer): Extended;
begin
if not ACOl in [3,6] then
    Result := StrToFloatDef(koma(sg1.Cells[aCol,aRow]),0)
  else
    Result := StrToFloatDef(nilai(sg1.Cells[aCol,aRow]),0);
end;

end.
