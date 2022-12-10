unit uCopyNota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  Vcl.StdCtrls, cxGroupBox, cxCurrencyEdit, uctrlFrm, uComCtrl, Vcl.Menus,
  cxButtons, uTerbilang,uEngine, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxCalc, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFCopyNota = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGroupBox1: TcxGroupBox;
    cxg3: TcxGrid;
    cxg1: TcxGridDBTableView;
    cxg2: TcxGridLevel;
    cxGrid1DBTableView1kodebarang: TcxGridDBColumn;
    cxGrid1DBTableView1namabarang: TcxGridDBColumn;
    cxGrid1DBTableView1satuan: TcxGridDBColumn;
    cxGrid1DBTableView1harga: TcxGridDBColumn;
    cxGrid1DBTableView1jumlah: TcxGridDBColumn;
    cxGrid1DBTableView1subtotal: TcxGridDBColumn;
    btnOk: TcxButton;
    btnTutup: TcxButton;
    cxg1fakturjual: TcxGridDBColumn;
    cxg1tgljual: TcxGridDBColumn;
    cxg1namapelanggan: TcxGridDBColumn;
    cxg1grandtotal: TcxGridDBColumn;
    cxg1namalengkap: TcxGridDBColumn;
    procedure cxg1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxg1CanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure cxg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EPencarianEnter(Sender: TObject);
    procedure EPencarianExit(Sender: TObject);
    procedure btnEditNotaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCopyNota: TFCopyNota;

implementation

{$R *.dfm}

uses uDtrx, uPenjualan, udm, uDlaporan;

procedure TFCopyNota.btnEditNotaClick(Sender: TObject);
var
  i : integer;
begin
  with FPenjualanBarang do
      begin
          isEdit := True;
          FPenjualanBarang.CreateGrid;
          ExQry(Dm.Q5,'select tp.fakturjual,tp.kodebarang,tp.satuan,b.kodebarang,b.kodebarcode,b.namabarang,'+
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
          FPenjualanBarang.cbGudang.ItemIndex := idxCmb(FPenjualanBarang.cbGudang,GetValInt(dm.Q5,'idgudang'));
          FPenjualanBarang.dt1.Date       := dtrx.Qpenjualan.FieldByName('tgljual').AsDateTime;
          FPenjualanBarang.EKeterangan.Text := GetVal(dtrx.Qpenjualan,'keterangan');
          FPenjualanBarang.Show;

           FCopyNota.close;

          //FkoreksiNota.Focus;
    end;
end;

procedure TFCopyNota.btnOkClick(Sender: TObject);
begin
  FPenjualanBarang.PrintStruck(dtrx.Qpenjualan.FieldByName('fakturjual').AsString);
end;

procedure TFCopyNota.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFCopyNota.cxg1CanSelectRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
  AAllow := TRue;
end;

procedure TFCopyNota.cxg1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ExQry(dtrx.QdetailJual,' SELECT                                   '+
                             '     d.iddetil,                           '+
                             '     d.fakturjual,                        '+
                             '     d.kodebarang,                        '+
                             '     b.namabarang,                        '+
                             '     d.satuan,                            '+
                             '     d.harga,                             '+
                             '     d.hpp,                               '+
                             '     d.jumlah,                            '+
                             '     d.diskonpersen,                      '+
                             '     d.diskonrupiah,                      '+
                             '     d.subtotal,                          '+
                             '     d.isi,                               '+
                             '     d.idgudang,                          '+
                             '     l.namalokasi                         '+
                             '  FROM                                    '+
                             '     penjualandetil d                     '+
                             '     LEFT JOIN barang b                   '+
                             '       ON d.`kodebarang` = b.`kodebarang` '+
                             '     LEFT JOIN lokasi l                   '+
                             '       ON l.`idlokasi` = d.`idgudang`     '+
                             ' WHERE d.fakturjual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',True);

end;

procedure TFCopyNota.cxg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  i:integer;
begin
  case Key of
//  VK_RETURN : begin
//                   with FPenjualanBarang do
//                    begin
//                        isEdit := True;
//                        FPenjualanBarang.CreateGrid;
//                        ExQry(Dm.Q5,'select tp.fakturjual,tp.kodebarang,tp.satuan,b.kodebarang,b.kodebarcode,b.namabarang,'+
//                        'tp.harga,tp.jumlah,tp.diskonpersen,tp.diskonrupiah,tp.diskon2,tp.diskon3,k.namakategori,'+
//                        ' tp.subtotal,tp.isi,tp.hpp,tp.idgudang from penjualandetil tp left join barang b on tp.kodebarang=b.kodebarang '+
//                        ' left join kategori k ON k.idkategori=b.idkategori where tp.fakturjual='''+dtrx.Qpenjualan.FieldByName('fakturjual').AsString+'''',True);
//                        i:=0;
//
//
//                        FPenjualanBarang.sg1.RowCount := DM.Q5.RecordCount +2;
//                        Dm.Q5.First;
//                        while Dm.Q5.Eof = False do
//                        begin
//                             sg1.Cells[0,i+1]:= Inttostr(DM.Q5.RecNo);
//                             sg1.Cells[1,i+1]:= GetVal(DM.Q5,'kodebarcode');
//                             sg1.Cells[2,i+1]:= GetVal(DM.Q5,'namabarang');
//                             sg1.Cells[3,i+1]:= GetValR(DM.Q5,'harga');
//                             sg1.Cells[4,i+1]:= GetVal(DM.Q5,'jumlah');
//                             sg1.Cells[5,i+1]:= GetVal(DM.Q5,'diskonpersen');
//                             sg1.Cells[6,i+1]:= GetValR(DM.Q5,'diskonrupiah');
//                             sg1.Cells[7,i+1]:= GetVal(DM.Q5,'satuan');
//                             sg1.Cells[8,i+1]:= GetValR(DM.Q5,'subtotal');
//                             sg1.Cells[9,i+1]:= GetValR(DM.Q5,'isi');
//                             sg1.Cells[10,i+1]:= GetVal(DM.Q5,'kodebarang');
//                             sg1.Cells[11,i+1]:= GetVal(DM.Q5,'hpp');
//                             sg1.Cells[12,i+1]:= GetVal(DM.Q5,'namakategori');
//                             inc(i);
//                             Dm.Q5.Next;
//                          end;
//
//                        FPenjualanBarang.Enobukti.Text   := GetVal(dtrx.Qpenjualan,'fakturjual');
//                        FPenjualanBarang.Etotal.Text      := GetRupiah(SumGrid(FPenjualanBarang.sg1,8));
//                        if GetVal(dtrx.Qpenjualan,'TRX') ='CASH' then
//
//                        FPenjualanBarang.cbPembayaran.ItemIndex := 0 else
//                        FPenjualanBarang.cbPembayaran.ItemIndex := 1;
//                        FPenjualanBarang.ESales.Text      := GetVal(dtrx.Qpenjualan,'namasales');
//                        FPenjualanBarang.E1.Text          := GetVal(dtrx.Qpenjualan,'kodesales');
//                        FPenjualanBarang.Esubtotal.Text   := GetValR(dtrx.Qpenjualan,'total');
//                        FPenjualanBarang.EdiscRp.Text     := GetValR(dtrx.Qpenjualan,'diskon');
//                        FPenjualanBarang.EGrandTotal.Text   := GetValR(dtrx.Qpenjualan,'grandtotal');
//                        ExQry(dm.Q3,'SELECT p.nomerso,pl.namapelanggan,pl.kodepelanggan,pl.alamat '+
//                        ' from penjualan p LEFT JOIN pelanggan pl ON pl.idpelanggan=p.idpelanggan '+
//                        ' WHERE p.fakturjual="'+dtrx.Qpenjualan.FieldByName('fakturjual').AsString+'"',True);
//                        FPenjualanBarang.ENamaCust.Text     := DM.Q3.FieldByName('namapelanggan').AsString;
//                        FPenjualanBarang.EkodeCust.Text     := DM.Q3.FieldByName('kodepelanggan').AsString;
//                        FPenjualanBarang.ENomerPO.Text     := DM.Q3.FieldByName('nomerso').AsString;
//                        FPenjualanBarang.EscanBarcode.Text  := DM.Q3.FieldByName('kodepelanggan').AsString;
//                        FPenjualanBarang.m1.Text            := DM.Q3.FieldByName('alamat').AsString;
//                        FPenjualanBarang.cbGudang.ItemIndex := idxCmb(FPenjualanBarang.cbGudang,GetValInt(dm.Q5,'idgudang'));
//                        FPenjualanBarang.dt1.Date       := dtrx.Qpenjualan.FieldByName('tgljual').AsDateTime;
//                        FPenjualanBarang.EKeterangan.Text := GetVal(dtrx.Qpenjualan,'keterangan');
//                        FPenjualanBarang.sg1.SetFocus;
//                        //FkoreksiNota.Focus;
//                  end;
//                  close;
//              end;
  VK_RETURN : begin
              btnOk.Click;
             // Close;
             end;
  end;
end;

procedure TFCopyNota.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text :='';
  EPencarian.Style.Font.Style :=   EPencarian.Style.Font.Style - [fsItalic];
  EPencarian.Style.Font.Color := clBlack;
end;

procedure TFCopyNota.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text :='NO Faktur atau nama pelanggan';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
  EPencarian.Style.Font.Color := clGrayText;
end;

procedure TFCopyNota.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
     ExQry(dtrx.Qpenjualan,' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     p.nomerso,                                '+
                     '     pl.namapelanggan,                             '+
                     '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as TRX,      '+
                     '     (CASE WHEN p.nontunai<>0 THEN "NON TUNAI" ELSE "TUNAI" end ) as pembayaran,   '+
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
                     '     LEFT JOIN piutang pu ON pu.fakturjual=p.fakturjual'+
                       '  WHERE  pl.namapelanggan LIKE "%'+Epencarian.Text+'%" '+
                       ' OR p.fakturjual like"%'+Epencarian.Text+'%"',True);
    cxg3.SetFocus;
  end;
end;

procedure TFCopyNota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

  end;
end;

procedure TFCopyNota.FormShow(Sender: TObject);
begin
  ExQry(dtrx.Qpenjualan,' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     p.nomerso,                                '+
                     '     pl.namapelanggan,                             '+
                     '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as TRX,      '+
                     '     (CASE WHEN p.nontunai<>0 THEN "NON TUNAI" ELSE "TUNAI" end ) as pembayaran,   '+
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
                     '     LEFT JOIN piutang pu ON pu.fakturjual=p.fakturjual where '+
                     '    p.tgljual="'+tanggal(Now)+'"  '+
                       ' ORDER BY p.tgljual DESC LIMIT 100',True);
  dtrx.QdetailJual.Active := False;
  cxg3.SetFocus;
end;

end.
