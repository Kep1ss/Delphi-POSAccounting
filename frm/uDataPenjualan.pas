unit uDataPenjualan;

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
  dxSkiniMaginary, cxCurrencyEdit, uEngine,activex,System.Win.ComObj,MyAccess, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, cxCheckBox, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog,uctrlFrm;

 
 const
  UM_CHECK = WM_USER + 10000;
type
  TFdataPenjualan = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnTutup: TcxButton;
    btnPrint: TcxButton;
    btnHapus: TcxButton;
    btnUbah: TcxButton;
    btnCetak: TcxButton;
    Label4: TLabel;
    cbKasir: TComboBox;
    btnTerjual: TcxButton;
    cxlbl1: TcxLabel;
    cxgrd1: TcxGrid;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1Level1: TcxGridLevel;
    cxgGrid1DBTableView1fakturjual: TcxGridDBColumn;
    cxgGrid1DBTableView1tgljual: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxgGrid1DBTableView1TRX: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
    cxgGrid1DBTableView1diskon: TcxGridDBColumn;
    cxgGrid1DBTableView1grandtotal: TcxGridDBColumn;
    cxgGrid1DBTableView1namalengkap: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxgrd1DBTableView1kodebarang: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1harga: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    cxgrd1DBTableView1diskonrupiah: TcxGridDBColumn;
    cxgrd1DBTableView1subtotal: TcxGridDBColumn;
    cxgGrid1DBTableView1lunas: TcxGridDBColumn;
    cxgGrid1DBTableView1titip: TcxGridDBColumn;
    cxgGrid1DBTableView1pembayaran: TcxGridDBColumn;
    cxgGrid1DBTableView1namasales: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure ColColCexPropertiesEditValueChanged(Sender: TObject);
    procedure cxgGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxgGrid1DBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ColCheckPropertiesEditValueChanged(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure btnUbahClick(Sender: TObject);
    procedure btnKirimClick(Sender: TObject);
    procedure cbKasirChange(Sender: TObject);
    procedure btnTerjualClick(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
  private
    { Private declarations }
  public
    const
      SQLpenjualanA = ' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.lastupdate as tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     p.nomerso,                                '+
                     '     pl.namapelanggan,                             '+
                     '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as TRX,      '+
                     '     (CASE WHEN p.pembayaran=0 THEN IF(p.nontunai<>0,"NON TUNAI","TUNAI") ELSE "" end ) as pembayaran,   '+
                     '     p.total,'+
                     '     p.diskon,                                     '+
                     '     p.grandtotal,'+
                     '     p.totalrokok,'+
                     '     p.totalnonrokok,'+
                     '     pg.namalengkap,                               '+
                     '     s.namasales,                                  '+
                     '     s.kodesales,                                  '+
                     '     p.tglkirim,                                   '+
                     '     p.kirim,                                   '+
                     '     p.ppn,                                   '+
                     '     if(p.pembayaran=1,p.bayar,0) as titip,                                      '+
                     '     p.bayar,                                      '+
                     '     p.kembali,                                     '+
                     '     p.keterangan,pu.lunas                                 '+
                     '   FROM                                            '+
                     '     penjualan p '+
                     '     LEFT JOIN pelanggan pl                        '+
                     '       ON pl.`idpelanggan` = p.`idpelanggan`       '+
                     '     LEFT JOIN m_user pg                           '+
                     '      ON pg.iduser=p.`iduser`                      '+
                     '     LEFT JOIN sales s                             '+
                     '      ON p.idsales=s.idsales                       '+
                     '     LEFT JOIN piutang pu ON pu.fakturjual=p.fakturjual';
    _SQLDetailJual = ' SELECT                                  '+
                     '     d.iddetil,                          '+
                     '     d.fakturjual,                       '+
                     '     d.kodebarang,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,                            '+
                     '     d.hpp,                              '+
                     '     d.jumlah,                           '+
                     '     d.jumlahretur,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskonrupiah,                     '+
                     '      d.subtotal as subtotal ,'+
                     '     d.isi,                              '+
                     '     d.idgudang,                         '+
                     '     l.namalokasi                        '+
                     '   FROM                                  '+
                     '     penjualandetil d                    '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang`'+
                     '     LEFT JOIN lokasi l                  '+
                     '       ON l.`idlokasi` = d.`idgudang` ';


    __SQL = ' select p.fakturjual,p.tgljual,s.namasales,pl.namapelanggan, '+
                         ' pl.alamat,pl.kota,'+
                         ' p.diskon,(Case when p.pembayaran=0 then "CASH" ELSE "KREDIT" END) as Pembayaran,'+
                         ' CONCAT(TO_DAYS(CURDATE())-TO_DAYS(p.tgltempo)," ","Hari") as tempo,'+
                         ' p.total ,p.diskon,p.ppn  ,p.grandtotal,'+
                         ' b.kodebarcode,b.namabarang,pd.satuan,pd.harga,'+
                         ' pd.jumlah,pd.diskonpersen,pd.diskon2,pd.diskon3,pd.subtotal,'+
                         ' pd.isi,rj.nobukti,rj.tgl,rj.total as totalretur,'+
                         ' (Select kodebarcode from barang where kodebarang=rd.kodebarang) as kdbarcode,'+
                         ' (Select namabarang from barang where kodebarang=rd.kodebarang) as nmbarang,'+
                         'rd.satuan,rd.harga,'+
                         ' rd.diskonpersen,rd.diskon2,rd.diskon3,rd.jumlah,rd.subtotal,rd.isi '+
                         ' from penjualan p left join '+
                         ' penjualandetil pd on p.fakturjual=pd.fakturjual '+
                         ' left join sales s on s.idsales=p.idsales left join '+
                         ' pelanggan pl on pl.idpelanggan=p.idpelanggan '+
                         ' left join barang b on pd.kodebarang=b.kodebarang LEFT JOIN '+
                         ' returpenjualan rj ON rj.tgl=p.tgljual and p.idpelanggan=rj.idpelanggan '+
                         ' left join detailreturjual rd on rj.nobukti=rd.nobukti ';

    { Public declarations }

    procedure Check(AGridView: TcxGridDBTableView);
    procedure UmCheck(var Message: TMessage); message UM_CHECK;
    Procedure LoadData;
  end;

var
  FdataPenjualan: TFdataPenjualan;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm, uMainMenu, uPenjualan, uProgress, uDlaporan,
  uExportExcel;

procedure TFdataPenjualan.btnBaruClick(Sender: TObject);
begin
  FPenjualanBarang.Show;
  FPenjualanBarang.stat1.Panels[1].Text := setIdKom;
  FPenjualanBarang.stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
  FPenjualanBarang.stat1.Panels[4].Text := Fmain.sbr1.Panels[2].Text;
  FPenjualanBarang.stat1.Panels[5].Text := Fmain.sbr1.Panels[4].Text;
  FPenjualanBarang.TampilAwal;
  FPenjualanBarang.isEdit := False;

end;

procedure TFdataPenjualan.btnHapusClick(Sender: TObject);
begin
 if MessageDlg('Apakah yakin anda akan mengapus data transaksi?',mtWarning,[mbYes,mbNo],0)  =mrYes then
  begin

    ExQry(dm.Q3,'SELECT nobuktijual FROM returpenjualan WHERE nobuktijual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',True);

    if dm.Q3.IsEmpty = False then
    begin
      Error('Penjualan terhubung retur penjualan, Silahkan selesaikan retur penjualan');
      exit;
    end else begin
      ExQry(dm.Q1,'SELECT nopiutang FROM bayarpiutang WHERE nopiutang="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',True);

      if dm.Q1.IsEmpty = False then begin
         Error('Transaksi Piutang Sudah dilakukan pembayaran !!! , silahkan batalkan pembayaran piutang terlebih dahulu');
         exit;
      end else begin
          ExQry(dm.Q3,'delete from kartustok where nobukti="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',False);
          ExQry(dm.Q3,'delete from saldoakun where nobukti="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',False);
          ExQry(dm.Q3,'delete from piutang where fakturjual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',False);
          ExQry(dm.Q3,'delete from penjualandetil where fakturjual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',False);
          ExQry(dm.Q3,'delete from penjualan where fakturjual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',False);
          dtrx.Qpenjualan.Active := False;
          dtrx.Qpenjualan.Active := True;
      end;
    end;
  end;

end;

procedure TFdataPenjualan.btnKirimClick(Sender: TObject);
begin
  if MessageDlg('SEBELUM MELAKUKAN PENGIRIMAN BARANG,'+#13
                +' SILAHKAN CEK KEMBALI BARANG YG AKAN DIKIRIM',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
     if GetValBol(dtrx.Qpenjualan,'kirim') = True then begin
        Warning('Status Invoice Sudah dikirim');
        Exit;
     end else
     begin
       ExQry(dm.Q1,'UPDATE penjualan SET kirim=TRUE ,'+
       ' tglkirim="'+Tanggal(Now)+'" WHERE fakturjual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',False);

       Informasi('Proses Selesai');


       if MessageDlg('Print Invoice ??',mtConfirmation,[mbYes,mbNo],0)=mrYes then
          btnPrint.Click;
     end;

  end;

end;

procedure TFdataPenjualan.btnPrintClick(Sender: TObject);
begin
//  ExQry(dm.Q1,__SQL+' where p.tgljual>="'+FormatDateTime('yyyy-mm-dd',dt1.Date)+'" and '+
//                         ' p.tgljual<="'+FormatDateTime('yyyy-mm-dd',dt2.Date)+'" order by p.tgljual asc  ' ,True);
//  ThExport.Create(dm.Q1,FLoading.pb1,FLoading,FLoading.Lprogres);
  FexportExcel.ShowModal;
end;

procedure TFdataPenjualan.btnTerjualClick(Sender: TObject);
const
  rekap = ' SELECT                                       '+
          '        p.tgljual,                                '+
          '        pd.kodebarang,                        '+
          '        b.kodebarcode,                        '+
          '        b.namabarang,                         '+
          '        pd.harga,                         '+
          '        b.satuanjual AS satuan,               '+
          '        SUM(pd.jumlah) AS jumlah,             '+
          '        SUM(pd.harga * pd.jumlah) AS subtotal '+
          '      FROM                                    '+
          '        penjualan p                           '+
          '        LEFT JOIN penjualandetil pd           '+
          '          ON p.`fakturjual` = pd.`fakturjual`       '+
          '        LEFT JOIN barang b                    '+
          '          ON b.`kodebarang` = pd.`kodebarang` ';

begin
  with Dlaporan.QrekapitulasiBarang do begin
    Close;
    SQL.Text := rekap + ' WHERE pd.iddetil > 1';
    SQL.Add(' AND p.tgljual>="'+Tanggal(dt1.Date)+'" AND p.tgljual<="'+Tanggal(dt2.Date)+'"');
    SQL.Add(' GROUP BY b.kodebarang ORDER BY p.tgljual ASC');
    Open;
  end;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frRekapitulasiBarang.fr3');
  FMemo(Dlaporan.Fr1,'Lperiode').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dt1.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dt2.Date);
  Dlaporan.Fr1.ShowReport();
end;

procedure TFdataPenjualan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataPenjualan.btnUbahClick(Sender: TObject);
 var
  i:integer;
begin


   with FPenjualanBarang do
    begin
        ExQry(dm.Q3,'SELECT nobuktijual FROM bayarpiutang WHERE nobuktijual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',True);
        if dm.Q3.IsEmpty = False then begin
         Error('Transaksi Piutang Sudah dilakukan pembayaran !!! , silahkan batalkan pembayaran piutang terlebih dahulu');
         exit;
      end else begin
        isEdit := True;
        FPenjualanBarang.CreateGrid;
        isiCmb(dm.Q6,'lokasi',['idlokasi','namalokasi'],cbGudang);
        ExQry(Dm.Q5,'select tp.fakturjual,b.bkp,tp.kodebarang,tp.satuan,b.kodebarang,b.kodebarcode,b.namabarang,'+
        'tp.harga,tp.jumlah,tp.diskonpersen,tp.diskonrupiah,tp.diskon2,tp.diskon3,k.namakategori,'+
        ' tp.subtotal,tp.isi,tp.hpp,tp.idgudang from penjualandetil tp left join barang b on tp.kodebarang=b.kodebarang '+
        ' left join kategori k ON k.idkategori=b.idkategori where tp.fakturjual='''+dtrx.Qpenjualan.FieldByName('fakturjual').AsString+'''',True);
        i:=0;


        FPenjualanBarang.sg1.RowCount := DM.Q5.RecordCount +2;
        Dm.Q5.First;
        while Dm.Q5.Eof = False do
        begin
             sg1.Cells[0,i+1]:= Inttostr(DM.Q5.RecNo);
             sg1.Cells[1,i+1]:= GetVal(DM.Q5,'kodebarcode');
             sg1.Cells[2,i+1]:= GetVal(DM.Q5,'namabarang');
             sg1.Cells[3,i+1]:= GetValR(DM.Q5,'harga');
             sg1.Cells[4,i+1]:= GetVal(DM.Q5,'jumlah');
             sg1.Cells[5,i+1]:= GetVal(DM.Q5,'diskonpersen');
             sg1.Cells[6,i+1]:= GetValR(DM.Q5,'diskonrupiah');
             sg1.Cells[7,i+1]:= GetVal(DM.Q5,'satuan');
             sg1.Cells[8,i+1]:= GetValR(DM.Q5,'subtotal');
             sg1.Cells[9,i+1]:= GetValR(DM.Q5,'isi');
             sg1.Cells[10,i+1]:= GetVal(DM.Q5,'kodebarang');
             sg1.Cells[11,i+1]:= GetVal(DM.Q5,'hpp');
             sg1.Cells[12,i+1]:= GetVal(DM.Q5,'namakategori');
             sg1.Cells[13,i+1]:= GetVal(DM.Q5,'bkp');
             inc(i);
             Dm.Q5.Next;
          end;

        FPenjualanBarang.Enobukti.Text   := GetVal(dtrx.Qpenjualan,'fakturjual');
        FPenjualanBarang.Etotal.Text      := GetRupiah(SumGrid(FPenjualanBarang.sg1,8));
        if GetVal(dtrx.Qpenjualan,'TRX') ='CASH' then

        FPenjualanBarang.cbPembayaran.ItemIndex := 0 else
        FPenjualanBarang.cbPembayaran.ItemIndex := 1;
        FPenjualanBarang.ESales.Text      := GetVal(dtrx.Qpenjualan,'namasales');
        FPenjualanBarang.E1.Text          := GetVal(dtrx.Qpenjualan,'kodesales');
        FPenjualanBarang.Esubtotal.Text   := GetValR(dtrx.Qpenjualan,'total');
        FPenjualanBarang.EdiscRp.Text     := GetValR(dtrx.Qpenjualan,'diskon');
        FPenjualanBarang.EGrandTotal.Text   := GetValR(dtrx.Qpenjualan,'grandtotal');
        ExQry(dm.Q3,'SELECT p.nomerso,pl.namapelanggan,pl.kodepelanggan,pl.alamat '+
        ' from penjualan p LEFT JOIN pelanggan pl ON pl.idpelanggan=p.idpelanggan '+
        ' WHERE p.fakturjual="'+dtrx.Qpenjualan.FieldByName('fakturjual').AsString+'"',True);
        FPenjualanBarang.ENamaCust.Text     := DM.Q3.FieldByName('namapelanggan').AsString;
        FPenjualanBarang.EkodeCust.Text     := DM.Q3.FieldByName('kodepelanggan').AsString;
        FPenjualanBarang.ENomerPO.Text     := DM.Q3.FieldByName('nomerso').AsString;
        FPenjualanBarang.EscanBarcode.Text  := DM.Q3.FieldByName('kodepelanggan').AsString;
        FPenjualanBarang.m1.Text            := DM.Q3.FieldByName('alamat').AsString;
        FPenjualanBarang.Lkasir.Caption     := GetVal(dtrx.Qpenjualan,'namalengkap');
        FPenjualanBarang.cbGudang.ItemIndex := idxCmb(FPenjualanBarang.cbGudang,GetValInt(dm.Q5,'idgudang'));

        if FPenjualanBarang.cbGudang.ItemIndex < 0 then
        FPenjualanBarang.cbGudang.ItemIndex := idxCmb(FPenjualanBarang.cbGudang,2);
        FPenjualanBarang.dt1.Date       := dtrx.Qpenjualan.FieldByName('tgljual').AsDateTime;
        FPenjualanBarang.EKeterangan.Text := GetVal(dtrx.Qpenjualan,'keterangan');
        FPenjualanBarang.isEdit         := True;
        FPenjualanBarang.Show;
      end;

        //FkoreksiNota.Focus;
  end;
end;

procedure TFdataPenjualan.cbKasirChange(Sender: TObject);
begin
  if cbKasir.Text <> '' then

  ExQry(dtrx.Qpenjualan,SQLpenjualana+' WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" AND '+
  ' p.tgljual<="'+Tanggal(dt2.Date)+'" AND pg.namalengkap="'+cbkasir.Text+'" '+
  ' GROUP BY p.fakturjual ORDER BY p.tgljual ASC ',True);
end;

procedure TFdataPenjualan.Check(AGridView: TcxGridDBTableView);

begin

end;

procedure TFdataPenjualan.ColCheckPropertiesEditValueChanged(Sender: TObject);
var
  ACheck: TcxCheckBox;
  AGridSite: TcxGridSite;
  AGridView: TcxGridDBTableView;
begin
  ACheck := Sender as TcxCheckBox;
  AGridSite := ACheck.Parent as TcxGridSite;
  AGridView := AGridSite.GridView as TcxGridDBTableView;
  Check(AGridView);
end;

procedure TFdataPenjualan.ColColCexPropertiesEditValueChanged(Sender: TObject);
var
  ACheck: TcxCheckBox;
  AGridSite: TcxGridSite;
  AGridView: TcxGridDBTableView;
begin
  ACheck := Sender as TcxCheckBox;
  AGridSite := ACheck.Parent as TcxGridSite;
  AGridView := AGridSite.GridView as TcxGridDBTableView;
  Check(AGridView);
end;

procedure TFdataPenjualan.btnCetakClick(Sender: TObject);

begin
  FPenjualanBarang.printdirect(dtrx.Qpenjualan.FieldByName('fakturjual').AsString,true);

end;
procedure TFdataPenjualan.cxCheckBox1Click(Sender: TObject);

begin
 { AView := cxGrid1DBTableView1;
    for I := 0 to AView.DataController.RecordCount -1 do begin

    AView.DataController.Values[I,0] := cxCheckBox1.Checked;
    Check(AView);
    end;
  }
end;
procedure TFdataPenjualan.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := true;
  ExQry(dtrx.QdetailJual,_SQLDetailJual+' WHERE d.fakturjual="'+ADataController.GetValue(ARecordIndex,0)+'"',True);
end;

procedure TFdataPenjualan.cxgGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);


var
  AView: TcxGridDBTableView;
begin
  AView := Sender as TcxGridDBTableView;
  PostMessage(Handle, UM_CHECK, Integer(AView), 0);
end;



procedure TFdataPenjualan.cxgGrid1DBTableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
 { AView := TcxGridDBTableView(TcxGridSite(Sender).GridView);
  AHitTest := AView.ViewInfo.GetHitTest(X,Y);
  if AHitTest is TcxGridRowIndicatorHitTest then
  begin
    I := TcxGridRowIndicatorHitTest(AHitTest).GridRecord.Index;
    J := ColCheck.Index;
    AView.DataController.Values[I, J] := True;
    Check(AView);
  end;    }
end;

procedure TFdataPenjualan.cxGrid1DBTableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
   AAllow := (Sender.Controller.FocusedItem.Index in [0]);
end;

procedure TFdataPenjualan.DBGridEh1CellClick(Column: TColumnEh);
begin
    ExQry(dtrx.Qdetailjual,_SQLDetailJual+' WHERE fakturjual='''+dtrx.Qpenjualan.FieldByName('Fakturjual').AsString+''' ',True);

end;

procedure TFdataPenjualan.Dt1PropertiesCloseUp(Sender: TObject);

begin

  ExQry(dtrx.Qpenjualan,SQLpenjualana+' WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" AND '+
  ' p.tgljual<="'+Tanggal(dt2.Date)+'" GROUP BY p.fakturjual '+
  ' ORDER BY p.tgljual, p.idjual ASC ',True);
end;

procedure TFdataPenjualan.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  if Key = 13 then begin


  ExQry(dtrx.Qpenjualan,SQLpenjualana+' WHERE (p.fakturjual like"%'+EPencarian.Text+'%" '+
                                     ' or pl.namapelanggan like"%'+EPencarian.Text+'%" )'+
                                     ' GROUP BY p.fakturjual ORDER BY p.tgljual ASC',True);
  end;
end;

procedure TFdataPenjualan.FormCreate(Sender: TObject);
begin
  FdataPenjualan := Self;

end;

procedure TFdataPenjualan.FormShow(Sender: TObject);

begin
   ExQry(dtrx.Qpenjualan,SQLpenjualana+' WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" '+
   ' AND p.tgljual<="'+Tanggal(dt2.Date)+'" GROUP BY p.fakturjual '+
   ' ORDER BY p.lastupdate ASC',True);

   OpenTable(dm.Q1,['namalengkap'],'m_user');

   cbKasir.Items.Clear;
   while not dm.Q1.Eof do begin
      cbKasir.Items.Add(GetVal(dm.Q1,'namalengkap'));
      dm.Q1.Next;

   end;
   SetTanggal(Self);
end;

procedure TFdataPenjualan.LoadData;
begin
  ExQry(dtrx.Qpenjualan,SQLpenjualana+' WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" AND '+
  ' p.tgljual<="'+Tanggal(dt2.Date)+'" GROUP BY p.fakturjual '+
  ' ORDER BY p.lastupdate ASC',True);
end;

procedure TFdataPenjualan.UmCheck(var Message: TMessage);
begin
  Check(TcxGridDBTableView(Message.WParam));
end;

end.
