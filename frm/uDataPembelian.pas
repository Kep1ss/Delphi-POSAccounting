unit uDataPembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, uComCtrl,
  uEngine, uOvEdit, cxCalc, dxSkiniMaginary, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful,MyAccess,System.Win.ComObj,activex, dxSkinMoneyTwins,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,ShellApi,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,cxGridExportLink,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, uctrlFrm, uDlaporan;

 

type
  TFdataPembelian = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    G2: TcxGroupBox;
    btnTutup: TcxButton;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1pembayaran: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    Ctotal: TcxGridDBColumn;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgrd1DBTableView1kodebarang: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    Charga: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    cxgrd1DBTableView1diskonpersen: TcxGridDBColumn;
    cxgrd1DBTableView1ppn: TcxGridDBColumn;
    Csubtotal: TcxGridDBColumn;
    btnExport: TcxButton;
    btnHapus: TcxButton;
    btnUbah: TcxButton;
    btnRefresh: TcxButton;
    pm1: TPopupMenu;
    U1: TMenuItem;
    H1: TMenuItem;
    N1: TMenuItem;
    U2: TMenuItem;
    cxgGrid1DBTableView1ppn: TcxGridDBColumn;
    cxgGrid1DBTableView1diskon: TcxGridDBColumn;
    cxgGrid1DBTableView1grandtotal: TcxGridDBColumn;
    cxgrd1DBTableView1diskon2: TcxGridDBColumn;
    cxgrd1DBTableView1diskon3: TcxGridDBColumn;
    cxgGrid1DBTableView1refnota: TcxGridDBColumn;
    cxlbl1: TcxLabel;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    btnBaru: TcxButton;
    btnPrint: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure U2Click(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLPembelian = ' SELECT                                     '+
                     '     p.idpembelian,                         '+
                     '     p.nobukti,                             '+
                     '     p.refnota,                             '+
                     '     p.tgl,                                 '+
                     '     p.pembayaran,                          '+
                     '     p.ppn,                          '+
                     '     p.idsupplier,                          '+
                     '     s.namasupplier,                        '+
                     '     p.iduser,                              '+
                     '     u.namalengkap,                         '+
                     '     p.total,                                '+
                     '     p.diskon,                                '+
                     '     p.ppn,                                '+
                     '     p.grandtotal,                                '+
                     '     p.keterangan                                '+
                     '   FROM                                     '+
                     '     pembelian p                            '+
                     '     LEFT JOIN m_supplier s                 '+
                     '       ON s.`idsupplier` = p.`idsupplier`   '+
                     '     LEFT JOIN m_user u                     '+
                     '       ON u.`iduser` = p.`iduser`           ';

    _SQLDetailBeli = ' SELECT                                  '+
                     '     d.iddetilbeli,                      '+
                     '     d.nobukti,                          '+
                     '     d.kodebarang,                       '+
                     '     b.kodebarcode,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,                            '+
                     '     d.hargaecer,                        '+
                     '     d.hargagrosir,                      '+
                     '     d.hargapartai,                      '+
                     '     d.hargapartai4,                      '+
                     '     d.hargapartai5,                      '+
                     '     d.jumlah,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskonrupiah,                     '+
                     '     d.diskon2,                     '+
                     '     d.diskon3,                     '+
                     '     d.ppn,                              '+
                     '     d.subtotal,                         '+
                     '     d.isi,                              '+
                     '     d.idgudang,                         '+
                     '     b.bkp,                         '+
                     '     l.namalokasi                        '+
                     '   FROM                                  '+
                     '     detailbeli d                        '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang`'+
                     '     LEFT JOIN lokasi l                  '+
                     '       ON l.`idlokasi` = d.`idgudang`';

    { Public declarations }
  end;

var
  FdataPembelian: TFdataPembelian;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm, uProgress, uMainMenu;

procedure TFdataPembelian.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FpembelianBarang) then
  Application.CreateForm(TFpembelianBarang, FpembelianBarang);

  FpembelianBarang.TampilAwal;
  FpembelianBarang.ShowModal;

end;

procedure TFdataPembelian.btnExportClick(Sender: TObject);
begin
  ExportGridToExcel(ExtractFilePath(ParamStr(0))+'\template\Data Barang All.xls',
  cxgrd1,true,True,True);
  ShellExecute(handle,'open',PChar(ExtractFilePath(ParamStr(0))+'\template\Data Barang All.xls'),nil,nil, SW_NORMAL);
end;

procedure TFdataPembelian.btnHapusClick(Sender: TObject);
begin
 if MessageDlg('Apakah yakin data akan dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin

    ExQry(dm.Q1,'SELECT nobuktibeli FROM detailbayarhutang WHERE nobuktibeli="'+GetVal(dtrx.QPembelian,'nobukti')+'"',True);

    if dm.Q1.IsEmpty = False then begin

      Error('Data sudah dilakukan Pembayaran Hutang !!'+#13+' Silahkan lakukan Batalkan Bayar Hutang');
      Exit;
    end else begin

       ExQry(dm.Q1,'DELETE FROM pembelian WHERE nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'"',False);
       ExQry(dm.Q1,'DELETE FROM hutang WHERE nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'"',False);
       ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'"',False);
       ExQry(dm.Q1,'DELETE FROM kartustok WHERE nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'"',False);

       Dt1.Properties.OnCloseUp(Sender);
    end;
 end;

end;

procedure TFdataPembelian.btnPrintClick(Sender: TObject);
  const
  SQLA = ' SELECT                            '+
         '     p.nobukti,                    '+
         '     p.tgl AS tglbeli,             '+
         '     p.pembayaran,                 '+
         '     s.namasupplier AS namasupplier,'+
         '     p.refnota AS refnota,          '+
         '     p.total AS total,              '+
         '     p.diskon as diskon,            '+
         '     p.ppn as ppn,                  '+
         '     p.grandtotal as grandtotal,    '+
         '     u.namalengkap AS namapegawai   '+
         '   FROM                             '+
         '     pembelian p                    '+
         '     LEFT JOIN m_supplier s         '+
         '       ON s.`idsupplier` = p.`idsupplier` '+
         '     LEFT JOIN m_user u                   '+
         '       ON u.`iduser` = p.`iduser` ';
begin
  with Dlaporan.QLapPembelian do begin
    Close;
    SQL.Text :=SQLA+' where nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'" ';
    Open;
  end;

Dlaporan.fr1.LoadFromFile(aPathRpt+'\lappembelian.fr3') ;
Dlaporan.fr1.ShowReport();

end;

procedure TFdataPembelian.btnRefreshClick(Sender: TObject);
begin
  ExQry(dtrx.QPembelian,SQLPembelian+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataPembelian.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFdataPembelian.btnUbahClick(Sender: TObject);
var
  i : integer;
  KodeSupplier : String;
  hrg : Real;
  persen1,Persen2,Persen3: Real;
  laba1,laba2,laba3 : Real;
  HargaJual1,Hargajual2,Hargajual3,HargaGrosir,HargaPartai : real;
begin

  ExQry(dm.Q2,'SELECT nobuktibeli FROM penerimaanbarang '+
  ' WHERE nobuktibeli="'+GetVal(dtrx.Qpembelian,'nobukti')+'"',True);

  if dm.Q2.IsEmpty then begin
        if not Assigned(FpembelianBarang) then
        Application.CreateForm(TFpembelianBarang, FpembelianBarang);


    ExQry(dm.Q1,'SELECT nobuktibeli FROM detailbayarhutang WHERE nobuktibeli="'+GetVal(dtrx.QPembelian,'nobukti')+'"',True);

    if dm.Q1.IsEmpty = False then begin

      Error('Data sudah dilakukan Pembayaran Hutang !!'+#13+' Silahkan lakukan Batalkan Bayar Hutang');
      Exit;
    end else begin
      with FpembelianBarang do
      begin
        ClearText(Self);
        KosongKanGrid;
        isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);

         OpenTable(dm.Q1,['gudangbeli'],'profile');
         cbGudang.ItemIndex := idxCmb(cbGudang,GetValInt(dm.Q1,'gudangbeli'));
        ExQry(dm.Q1,SQLPembelian+' where nobukti="'+GetVal(dtrx.Qpembelian,'nobukti')+'"',True);

        Enobukti.Text       := GetVal(dm.Q1,'nobukti');
        DtBukti.Date        := dm.Q1.FieldByName('tgl').AsDateTime;
        KodeSupplier        := getData(dm.Q3,'m_supplier WHERE idsupplier="'+GetVal(dm.Q1,'idsupplier')+'"','kodesupplier');
        ESupplier.Text      := GetVal(dm.Q1,'namasupplier');
        EKodeSupplier.Text  := KodeSupplier;
        EKeterangan.Text    := GetVal(dm.Q1,'keterangan');
        if GetVal(dm.Q1,'pembayaran') = 'CASH' then cbPembayaran.ItemIndex := 0
        else cbPembayaran.ItemIndex := 1;



        ExQry(dm.Q2,_SQLDetailBeli+' where '+
        ' nobukti="'+GetVal(dm.Q1,'nobukti')+'"',True);

        sg1.RowCount        := dm.Q2.RecordCount +2;
        i                   := 0;
        while dm.Q2.Eof = False do
        begin


          sg1.Cells[0,i+1] := IntToStr(dm.Q2.RecNo);
          sg1.Cells[1,i+1] := GetVal(dm.Q2,'kodebarcode');
          sg1.Cells[2,i+1] := GetVal(dm.Q2,'namabarang');
          hrg              := GetValF(dm.Q2,'harga');

          sg1.Cells[3,i+1] := GetVal(dm.Q2,'satuan');
          sg1.Cells[4,i+1] := GetVal(dm.Q2,'jumlah');
          sg1.Cells[5,i+1] := FloatToStr(hrg);
          sg1.Cells[6,i+1] := GetVal(dm.Q2,'ppn');
          sg1.Cells[7,i+1] := Format('%.2n',[GetvalF(dm.Q2,'harga') + (getvalF(dm.Q2,'harga') * getValF(dm.Q2,'ppn') /100)]);
          if hrg > 0 then begin

                  HargaJual1 := GetValF(dm.Q2,'hargaecer');
                  HargaJual2 := GetValF(dm.Q2,'hargagrosir');
                  hargajual3 := GetValF(dm.Q2,'hargapartai');

                  laba1 := hargajual1 - hrg;
                  laba2 := hargajual2 - hrg;
                  laba3 := hargajual3 - hrg;


                  persen1 := (laba1 / hrg) * 100;
                  persen2 := (laba2 / hrg) * 100;
                  persen3 := (laba3 / hrg) * 100;

                  if HargaJual1 > 0 then
                  sg1.Cells[8,i+1] := Format('%.2n',[persen1]);
                  sg1.Cells[9,i+1] := GetVal(dm.Q2,'hargaecer');
                  if HargaJual2 > 0 then
                  sg1.Cells[10,i+1] := Format('%.2n',[persen2]);
                  sg1.Cells[11,i+1] := GetVal(dm.Q2,'hargagrosir');
                  if HargaJual3 > 0 then
                  sg1.Cells[12,i+1]:= Format('%.2n',[persen3]);
                  sg1.Cells[13,i+1]:= GetVal(dm.Q2,'hargapartai');


                  sg1.Cells[14,i+1] := '';
                  sg1.Cells[15,i+1] := '';
                  sg1.Cells[16,i+1] := '';

              end;
              sg1.Cells[17,i+1] := GetVal(dm.Q2,'subtotal');
              sg1.Cells[18,i+1] := GetVal(dm.Q2,'isi');
              sg1.Cells[19,i+1] := GetVal(dm.Q2,'kodebarang');
          inc(i);
          dm.Q2.Next;
        end;
          ESubtotal.Text       := GetValR(dm.Q1,'total');

          Ediskonrp.Text      := GetValR(dm.Q1,'diskon');
          Egrandtotal.Text    := GetValR(dm.Q1,'grandtotal');
          ETotal.Text         := GetValR(dm.Q1,'grandtotal');

         Show;
        // HitungTotal;

      end;
    end;
  end else begin
    Error('Data pembelian sudah dilakukan penerimaan barang,'+#13+'Data tidak bisa di Edit'+#13+'Silahkan hapus data penerimaan terlebih dahulu jika ingin mengubahnya');
  end;
end;

procedure TFdataPembelian.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  ExQry(dtrx.Qdetailbeli,_SQLDetailBeli+' WHERE d.nobukti="'+ADataController.GetValue(ARecordIndex,0)+'"',True);
end;

procedure TFdataPembelian.Dt1PropertiesCloseUp(Sender: TObject);
begin
  ExQry(dtrx.QPembelian,SQLPembelian+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataPembelian.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dtrx.QPembelian,SQLPembelian+' WHERE ( p.tgl>="'+Tanggal(dt1.Date)+'" '+
  ' AND p.tgl<="'+Tanggal(dt2.Date)+'") AND (s.namasupplier LIKE "%'+Epencarian.Text+'%" or '+
  ' p.nobukti="'+EPencarian.Text+'") '+
  ' or p.refnota LIKE "%'+EPencarian.Text+'%"',True);
end;

procedure TFdataPembelian.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

procedure TFdataPembelian.FormShow(Sender: TObject);
var
  ShHargga : Boolean;
begin
  ExQry(dm.Q1,'SELECT * FROM m_user WHERE username="'+FMain.sbr1.Panels[2].Text+'"',True);

  ShHargga := GetValBol(dm.Q1,'showHarga');


  if ShHargga = True then
  begin
    cHarga.visible := True;
    cTOtal.Visible := True;
    Csubtotal.Visible := True;
  end else
  begin
    cHarga.visible := False;
    cTOtal.Visible := False;
    Csubtotal.Visible := False;
  end;

  ExQry(dtrx.QPembelian,SQLPembelian+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);

end;

procedure TFdataPembelian.U2Click(Sender: TObject);
var
  ls : TStringList;
begin

  if MessageDlg('Apakah yakin akan mengubah data jadi transaksi KREDIT?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin

      ls := TStringList.Create;

      try
          ExQry(dm.Q2,'UPDATE pembelian SET pembayaran="KREDIT" WHERE nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'"',False);
          addParam('nobukti',    GetVal(dtrx.QPembelian,'nobukti'),                          ls,'str');
          addParam('tglinput',   frmTgl(GetValDate(dtrx.QPembelian,'tgl')),                   ls,'date');
          addParam('tgltempo',   frmTgl(GetValDate(dtrx.QPembelian,'tgl')+30), ls,'date');
          addParam('hutang',     GetVal(dtrx.QPembelian,'total'),                     ls,'str');
          addParam('dibayar',    '0',                     ls,'str');
          addParam('kekurangan', GetVal(dtrx.QPembelian,'total'),                     ls,'str');

          OpenTable(dm.Q2,['idhutang'],'hutang where nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'"');
          if dm.Q2.IsEmpty then
             Post(dm.Q1,'hutang',ls)
          else
          updatePOST(dm.Q1,'hutang',ls,'idhutang',GetVal(dm.Q2,'idhutang'));
      finally
        ls.Free;
      end;
      ExQry(dtrx.QPembelian,SQLPembelian+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);
  end;

end;



end.
