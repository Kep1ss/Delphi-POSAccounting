unit uCariPenjualanCabang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinSharp,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxTextEdit, cxLabel, dxBevel, uComCtrl, uctrlFrm, uEngine, uOvEdit,
  dxSkiniMaginary, cxCurrencyEdit, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, DBAccess, MyAccess, Vcl.ComCtrls,
  Vcl.StdCtrls, MemDS, cxGroupBox, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFCariPenjualanCabang = class(TForm)
    cxGroupBox2: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    EPencarian: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxgrd1: TcxGrid;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    QCabang: TMyQuery;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    dt1: TDateTimePicker;
    DCabang: TMyDataSource;
    cxGrid1DBTableView1nama: TcxGridDBColumn;
    cxGrid1DBTableView1var_database: TcxGridDBColumn;
    DPembelian: TMyDataSource;
    QPenjualan: TMyQuery;
    cxgGrid1DBTableView1fakturjual: TcxGridDBColumn;
    cxgGrid1DBTableView1tgljual: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
    cxgGrid1DBTableView1diskon: TcxGridDBColumn;
    cxgGrid1DBTableView1grandtotal: TcxGridDBColumn;
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dt1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;




var
  FCariPenjualanCabang: TFCariPenjualanCabang;

implementation

{$R *.dfm}

uses uDtrx, udm, uReturBeliNew, uPembelian, uPenjualan;

procedure TFCariPenjualanCabang.cxgGrid1DBTableView1DblClick(Sender: TObject);
var
  i         : Integer;

begin

  with FPenjualanBarang do
    begin
        isEdit := True;
        FPenjualanBarang.CreateGrid;
        ExQry(dm.Q1,' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     p.nomerso,                                '+
                     '     pl.namapelanggan,                             '+
                     '     pl.kodepelanggan,                             '+
                     '     pl.alamat,                             '+
                     '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as TRX,      '+
                     '     (CASE WHEN p.nontunai<>0 THEN "NON TUNAI" ELSE "TUNAI" end ) as pembayaran,   '+
                     '     p.total,'+
                     '     p.diskon,                                     '+
                     '     p.grandtotal,'+
                     '     pg.namalengkap,                               '+
                     '     s.namasales,                                  '+
                     '     s.kodesales,                                  '+
                     '     p.tglkirim,                                   '+
                     '     p.kirim,                                   '+
                     '     p.ppn,                                   '+
                     '     p.bayar,                                      '+
                     '     p.kembali                                     '+
                     '   FROM                                            '+
                     '     '+GetVal(QCabang,'var_database')+'.penjualan p '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.pelanggan pl                        '+
                     '       ON pl.`idpelanggan` = p.`idpelanggan`       '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.m_user pg                           '+
                     '      ON pg.iduser=p.`iduser`                      '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.sales s  '+
                     '     ON s.idsales=p.idsales                           '+
                     '   WHERE p.fakturjual="'+GetVal(QPenjualan,'fakturjual')+'" ',True);




        ExQry(Dm.Q5,' select           '+
                    ' tp.fakturjual,   '+
                    ' tp.kodebarang,tp.satuan, '+
                    ' b.kodebarang,b.kodebarcode,b.namabarang,'+
                    ' tp.harga,tp.jumlah,tp.diskonpersen,'+
                    ' tp.diskonrupiah,tp.diskon2,tp.diskon3,'+
                    ' tp.subtotal,tp.isi,tp.hpp,tp.idgudang from '+GetVal(QCabang,'var_database')+'.penjualandetil tp '+
                    ' left join '+GetVal(QCabang,'var_database')+'.barang b on tp.kodebarang=b.kodebarang '+
                    ' where tp.fakturjual="'+Qpenjualan.FieldByName('fakturjual').AsString+'"',True);
        i:=0;


        FPenjualanBarang.sg1.RowCount := DM.Q5.RecordCount +2;
        Dm.Q5.First;
        while Dm.Q5.Eof = False do
        begin
          ExQry(dm.Q3,'SELECT kodebarang FROM barang WHERE namabarang="'+GetVal(dm.Q2,'namabarang')+'"',True);

          if dm.Q3.IsEmpty then begin
             MessageDlg('Barang tidak ditemukan dimaster barang',mtInformation,[mbOK],0);

          end else begin
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
          end;
             inc(i);
             Dm.Q5.Next;
          end;

        FPenjualanBarang.Enobukti.Text  := GetCode(dm.Q4,'penjualan','fakturjual','PJ'+setIdKom);
        FPenjualanBarang.Etotal.Text     := GetRupiah(SumGrid(FPenjualanBarang.sg1,8));
        if GetVal(dm.Q1,'TRX') ='CASH' then

        FPenjualanBarang.cbPembayaran.ItemIndex := 0 else
        FPenjualanBarang.cbPembayaran.ItemIndex := 1;
        FPenjualanBarang.ESales.Text      := GetVal(dm.Q1,'namasales');
        FPenjualanBarang.E1.Text          := GetVal(dm.Q1,'kodesales');
        FPenjualanBarang.Esubtotal.Text   := GetValR(dm.Q1,'total');
        FPenjualanBarang.Edisc.Text       := FloatToStr(Round((GetValF(dm.Q1,'diskon')/GetValF(dm.Q1,'total'))*100));
        FPenjualanBarang.EdiscRp.Text     := GetValR(dm.Q1,'diskon');
        FPenjualanBarang.EGrandTotal.Text   := GetValR(dm.Q1,'grandtotal');
        FPenjualanBarang.ENamaCust.Text     := dm.Q1.FieldByName('namapelanggan').AsString;
        FPenjualanBarang.EkodeCust.Text     := dm.Q1.FieldByName('kodepelanggan').AsString;
        FPenjualanBarang.ENomerPO.Text      := dm.Q1.FieldByName('nomerso').AsString;
        FPenjualanBarang.EscanBarcode.Text  := dm.Q1.FieldByName('kodepelanggan').AsString;
        FPenjualanBarang.m1.Text            := dm.Q1.FieldByName('alamat').AsString;
        FPenjualanBarang.cbGudang.ItemIndex := idxCmb(FPenjualanBarang.cbGudang,GetValInt(dm.Q5,'idgudang'));
       // FkoreksiNota.EscanBarcode.OnKeyDown(Sender,Key,[]);
        FPenjualanBarang.HitungTotal;
        FPenjualanBarang.dt1.Date       := dm.Q1.FieldByName('tgljual').AsDateTime;
        FPenjualanBarang.Show;

        //FkoreksiNota.Focus;
  end;
      Close;
end;

procedure TFCariPenjualanCabang.cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     cxgGrid1DBTableView1.OnDblClick(Sender);
end;

procedure TFCariPenjualanCabang.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  ExQry(QPenjualan,' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     p.nomerso,                                '+
                     '     pl.namapelanggan,                             '+
                     '     pl.kodepelanggan,                             '+
                     '     pl.alamat,                             '+
                     '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as TRX,      '+
                     '     (CASE WHEN p.nontunai<>0 THEN "NON TUNAI" ELSE "TUNAI" end ) as pembayaran,   '+
                     '     p.total,'+
                     '     p.diskon,                                     '+
                     '     p.grandtotal,'+
                     '     pg.namalengkap,                               '+
                     '     s.namasales,                                  '+
                     '     s.kodesales,                                  '+
                     '     p.tglkirim,                                   '+
                     '     p.kirim,                                   '+
                     '     p.ppn,                                   '+
                     '     p.bayar,                                      '+
                     '     p.kembali                                     '+
                     '   FROM                                            '+
                     '     '+GetVal(QCabang,'var_database')+'.penjualan p '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.pelanggan pl '+
                     '       ON pl.`idpelanggan` = p.`idpelanggan`       '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.m_user pg '+
                     '      ON pg.iduser=p.`iduser`                      '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.sales s  '+
                     '      ON s.idsales=p.idsales '+
                     '   WHERE p.tgljual="'+Tanggal(dt1.Date)+'" ',True  );
end;

procedure TFCariPenjualanCabang.dt1Change(Sender: TObject);
begin
  ExQry(QPenjualan,' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     p.nomerso,                                '+
                     '     pl.namapelanggan,                             '+
                     '     pl.kodepelanggan,                             '+
                     '     pl.alamat,                             '+
                     '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as TRX,      '+
                     '     (CASE WHEN p.nontunai<>0 THEN "NON TUNAI" ELSE "TUNAI" end ) as pembayaran,   '+
                     '     p.total,'+
                     '     p.diskon,                                     '+
                     '     p.grandtotal,'+
                     '     pg.namalengkap,                               '+
                     '     s.namasales,                                  '+
                     '     s.kodesales,                                  '+
                     '     p.tglkirim,                                   '+
                     '     p.kirim,                                   '+
                     '     p.ppn,                                   '+
                     '     p.bayar,                                      '+
                     '     p.kembali                                     '+
                     '   FROM                                            '+
                     '     '+GetVal(QCabang,'var_database')+'.penjualan p '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.pelanggan pl                        '+
                     '       ON pl.`idpelanggan` = p.`idpelanggan`       '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.m_user pg                           '+
                     '      ON pg.iduser=p.`iduser`                      '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.sales s '+
                     '     ON s.idsales=p.idsales                            '+
                     '   WHERE p.tgljual="'+Tanggal(dt1.Date)+'" ',True  );
end;

procedure TFCariPenjualanCabang.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_RETURN : ExQry(QPenjualan,' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     p.nomerso,                                '+
                     '     pl.namapelanggan,                             '+
                     '     pl.kodepelanggan,                             '+
                     '     pl.alamat,                             '+
                     '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as TRX,      '+
                     '     (CASE WHEN p.nontunai<>0 THEN "NON TUNAI" ELSE "TUNAI" end ) as pembayaran,   '+
                     '     p.total,'+
                     '     p.diskon,                                     '+
                     '     p.grandtotal,'+
                     '     pg.namalengkap,                               '+
                     '     s.namasales,                                  '+
                     '     s.kodesales,                                  '+
                     '     p.tglkirim,                                   '+
                     '     p.kirim,                                   '+
                     '     p.ppn,                                   '+
                     '     p.bayar,                                      '+
                     '     p.kembali                                     '+
                     '   FROM                                            '+
                     '     '+GetVal(QCabang,'var_database')+'.penjualan p '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.pelanggan pl                        '+
                     '       ON pl.`idpelanggan` = p.`idpelanggan`       '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.m_user pg                           '+
                     '      ON pg.iduser=p.`iduser`                      '+
                     '     LEFT JOIN '+GetVal(QCabang,'var_database')+'.sales s      '+
                     '     ON s.idsales=p.idsales                           '+
                     '   WHERE p.tgljual="'+Tanggal(dt1.Date)+'" AND '+
                     '   (p.fakturjual LIKE "%'+EPencarian.Text+'%" '+
                     '   OR pl.namapelanggan LIKE "%'+Epencarian.Text+'%")',True  );
   VK_DOWN   : cxgrd1.SetFocus;
  end;
end;

procedure TFCariPenjualanCabang.FormShow(Sender: TObject);
begin
  QCabang.Close;
   QCabang.SQL.Text := ' SELECT * FROM tokomanager.toko ';
   QCabang.Open;

   dt1.Date :=Now;
end;

end.
