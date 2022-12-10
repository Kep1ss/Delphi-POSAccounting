unit uPendingTransaksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  Vcl.StdCtrls, cxGroupBox, cxCurrencyEdit, uctrlFrm, uComCtrl, Vcl.Menus,
  cxButtons, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinMoneyTwins,
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
  dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFpendingTransaksi = class(TForm)
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
    cxg1fakturjual: TcxGridDBColumn;
    cxg1tgljual: TcxGridDBColumn;
    cxg1namapelanggan: TcxGridDBColumn;
    cxg1grandtotal: TcxGridDBColumn;
    cxg1namalengkap: TcxGridDBColumn;
    cxGrid1DBTableView1kodebarang: TcxGridDBColumn;
    cxGrid1DBTableView1namabarang: TcxGridDBColumn;
    cxGrid1DBTableView1satuan: TcxGridDBColumn;
    cxGrid1DBTableView1harga: TcxGridDBColumn;
    cxGrid1DBTableView1jumlah: TcxGridDBColumn;
    cxGrid1DBTableView1subtotal: TcxGridDBColumn;
    btnOk: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    btn1: TcxButton;
    btnHapusPending: TcxButton;
    procedure cxg1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxg1DblClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxg1CanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure cxg1SelectionChanged(Sender: TcxCustomGridTableView);
    procedure EPencarianEnter(Sender: TObject);
    procedure EPencarianExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnHapusPendingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FpendingTransaksi: TFpendingTransaksi;

implementation

{$R *.dfm}

uses uDtrx, uEngine, uPenjualan, udm, uDlaporan;

procedure TFpendingTransaksi.btn1Click(Sender: TObject);
const
  _SQLtemp = 'SELECT                                          '+
             '     p.fakturjual,                              '+
             '     p.tgljual,                                 '+
             '     p.idpelanggan,                             '+
             '     pl.namapelanggan,                          '+
             '     pl.kodepelanggan,                          '+
             '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as pembayaran, '+
             '     p.total,                                   '+
             '     p.diskon,                                  '+
             '     p.grandtotal,                              '+
             '     pg.namalengkap,                            '+
             '     p.bayar,                                   '+
             '     p.kembali                                  '+
             '   FROM                                         '+
             '     tempjual p                                 '+
             '     LEFT JOIN pelanggan pl                     '+
             '       ON pl.`idpelanggan` = p.`idpelanggan`    '+
             '     LEFT JOIN m_user pg                        '+
             '      ON pg.iduser=p.`iduser`                   ';

  var
    noTemp : string;


begin
  noTemp := GetVal(dtrx.Qtempjual,'fakturjual');
  ExQry(dtrx.Qtempjual,_SQLtemp+' WHERE p.fakturjual="'+noTemp+'"',True);
  dtrx.Qtempjualdetail.Active := False;
  dtrx.Qtempjualdetail.Active := True;

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frPrintOrder.fr3') ;
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := False;
  Dlaporan.Fr1.Print;

end;

procedure TFpendingTransaksi.btnHapusClick(Sender: TObject);
begin

  ExQry(dm.Q1,'SELECT * from m_user WHERE iduser="'+setIdUser+'" ',True);

  if (GetVal(dm.Q1,'level') <> 'SUPER ADMIN') then
      begin
        Error('Penghapusan Data Hanya bisa dilakukan admin');
      end else
  begin
        ExQry(dm.Q1,'DELETE FROM tempjual',False);
        ExQry(dm.Q1,'DELETE FROM tempjualdetail',False);
        dtrx.Qtempjual.Active := False;
        dtrx.Qtempjual.Active := True;
  end;
end;

procedure TFpendingTransaksi.btnHapusPendingClick(Sender: TObject);
begin
  ExQry(dm.Q1,'SELECT * from m_user WHERE iduser="'+setIdUser+'" ',True);

  if (GetVal(dm.Q1,'level') = 'SUPER ADMIN')then
      begin

          if MessageDlg('Hapus pending?',mtConfirmation,[mbYes,mbNo],0)=mrYes then begin


              ExQry(dm.Q1,'DELETE FROM tempjual WHERE fakturjual="'+getVal(dtrx.Qtempjual,'fakturjual')+'"',False);
              ExQry(dm.Q1,'DELETE FROM tempjualdetail WHERE fakturjual="'+getVal(dtrx.Qtempjual,'fakturjual')+'"',False);
              dtrx.Qtempjual.Active := False;
              dtrx.Qtempjual.Active := True;
          end;
      end else
      Error('Penghapusan hanya boleh dilakukan admin');
end;

procedure TFpendingTransaksi.btnOkClick(Sender: TObject);
begin
  cxg1DblClick(Sender);
end;

procedure TFpendingTransaksi.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFpendingTransaksi.cxg1CanSelectRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
  AAllow := TRue;
end;

procedure TFpendingTransaksi.cxg1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ExQry(dtrx.Qtempjualdetail,' SELECT                                   '+
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
                             '     tempjualdetail d                     '+
                             '     LEFT JOIN barang b                   '+
                             '       ON d.`kodebarang` = b.`kodebarang` '+
                             '     LEFT JOIN lokasi l                   '+
                             '       ON l.`idlokasi` = d.`idgudang`     '+
                             ' WHERE d.fakturjual="'+GetVal(dtrx.Qtempjual,'fakturjual')+'"',True);

end;

procedure TFpendingTransaksi.cxg1DblClick(Sender: TObject);
var
  i:integer;
  key : Word;
begin

  FPenjualanBarang.bersihkanGrid;
  FPenjualanBarang.sg1.RowCount :=2;
  ExQry(DTRX.Qtempjualdetail,' SELECT                            '+
                             '       d.fakturjual,               '+
                             '       d.kodebarang,               '+
                             '       b.kodebarcode,               '+
                             '       b.namabarang,               '+
                             '       k.namakategori,               '+
                             '       d.satuan,                   '+
                             '       d.harga,                    '+
                             '       d.hpp,                      '+
                             '       d.jumlah,                   '+
                             '       d.diskonpersen,             '+
                             '       d.diskonrupiah,             '+
                             '       d.subtotal,                 '+
                             '       d.isi                      '+
                             '     FROM                          '+
                             '       tempjualdetail d            '+
                             '       LEFT JOIN barang b          '+
                             '         ON d.`kodebarang` = b.`kodebarang` '+
                             '       LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
                             '  where d.fakturjual="'+GetVal(dtrx.Qtempjual,'fakturjual')+'"',True);
  i:=0;
  FPenjualanBarang.sg1.RowCount := Dtrx.Qtempjualdetail.RecordCount +2;
  while Dtrx.Qtempjualdetail.Eof = False do
  begin
    with FPenjualanBarang do
    begin
       sg1.Cells[0,i+1]:= Inttostr(dtrx.Qtempjualdetail.RecNo);
       sg1.Cells[1,i+1]:= GetVal(dtrx.Qtempjualdetail,'kodebarcode');
       sg1.Cells[2,i+1]:= GetVal(dtrx.Qtempjualdetail,'namabarang');
       sg1.Cells[3,i+1]:= GetVal(dtrx.Qtempjualdetail,'harga');
       sg1.Cells[5,i+1]:= GetVal(dtrx.Qtempjualdetail,'diskonpersen');
       sg1.Cells[6,i+1]:= GetVal(dtrx.Qtempjualdetail,'diskonrupiah');
       sg1.Cells[7,i+1]:= GetVal(dtrx.Qtempjualdetail,'satuan');
       sg1.Cells[4,i+1]:= GetVal(dtrx.Qtempjualdetail,'jumlah');
       sg1.Cells[8,i+1]:= GetVal(dtrx.Qtempjualdetail,'subtotal');
       sg1.Cells[9,i+1]:= GetVal(dtrx.Qtempjualdetail,'isi');
       sg1.Cells[10,i+1]:= GetVal(dtrx.Qtempjualdetail,'kodebarang');
       sg1.Cells[11,i+1]:= GetVal(dtrx.Qtempjualdetail,'hpp');
       sg1.Cells[12,i+1]:= GetVal(dtrx.Qtempjualdetail,'namakategori');
       inc(i);
       Dtrx.Qtempjualdetail.Next;
    end;
  end;
  sNota := GetVal(dtrx.Qtempjual,'fakturjual');
  key   := 13;
  FPenjualanBarang.Enobukti.Text   := GetCode(dm.Q1,'penjualan','fakturjual','PJ'+setIdKom);
  FPenjualanBarang.HitungTotal;
  FPenjualanBarang.ENamaCust.Text  := GetVal(dtrx.Qtempjual,'namapelanggan');
  FPenjualanBarang.EkodeCust.Text  := GetVal(dtrx.Qtempjual,'kodepelanggan');
  FPenjualanBarang.EscanBarcode.Text := GetVal(dtrx.Qtempjual,'kodepelanggan');
  FPenjualanBarang.ESales.Text     := GetVal(dtrx.Qtempjual,'namasales');
  FPenjualanBarang.E1.Text         := GetVal(dtrx.Qtempjual,'kodesales');
 
  if FPenjualanBarang.E1.Text = '' then begin
     OpenTable(dm.Q1,['kodesales','namasales'],'sales WHERE namasales="UMUM"');

    FPenjualanBarang.ESales.Text := GetVal(dm.Q1,'namasales');
    FPenjualanBarang.E1.Text := GetVal(dm.Q1,'kodesales');



  end;

  FPenjualanBarang.Focus;
  Close;
end;

procedure TFpendingTransaksi.cxg1SelectionChanged(
  Sender: TcxCustomGridTableView);
begin
  ExQry(dtrx.Qtempjualdetail,' SELECT                                   '+
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
                             '     tempjualdetail d                     '+
                             '     LEFT JOIN barang b                   '+
                             '       ON d.`kodebarang` = b.`kodebarang` '+
                             '     LEFT JOIN lokasi l                   '+
                             '       ON l.`idlokasi` = d.`idgudang`     '+
                             ' WHERE d.fakturjual="'+GetVal(dtrx.Qtempjual,'fakturjual')+'"',True);
end;

procedure TFpendingTransaksi.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text :='';
  EPencarian.Style.Font.Style :=   EPencarian.Style.Font.Style - [fsItalic];
  EPencarian.Style.Font.Color := clBlack;
end;

procedure TFpendingTransaksi.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text :='NO Faktur atau nama pelanggan';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
  EPencarian.Style.Font.Color := clGrayText;
end;

procedure TFpendingTransaksi.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
     ExQry(dtrx.Qtempjual,' SELECT                                         '+
                       '       p.fakturjual,                            '+
                       '       p.tgljual,                               '+
                       '       p.idpelanggan,                           '+
                       '       pl.namapelanggan,                        '+
                       '       pl.kodepelanggan,                        '+
                       '       (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as pembayaran, '+
                       '       p.total,                                 '+
                       '       p.diskon,                                '+
                       '       p.grandtotal,                            '+
                       '       pg.namalengkap,                          '+
                       '       p.bayar,                                 '+
                       '       p.kembali,                                '+
                       '       s.kodesales,                                '+
                       '       s.namasales                                '+
                       '     FROM                                       '+
                       '       tempjual p                               '+
                       '       LEFT JOIN pelanggan pl                   '+
                       '         ON pl.`idpelanggan` = p.`idpelanggan`  '+
                       '       LEFT JOIN m_user pg                      '+
                       '        ON pg.iduser=p.`iduser`                 '+
                       '       LEFT JOIN sales s ON s.idsales=p.idsales '+
                       '  WHERE  pl.namapelanggan LIKE "%'+Epencarian.Text+'%" '+
                       ' OR p.fakturjual like"%'+Epencarian.Text+'%"',True);

  end;
end;

procedure TFpendingTransaksi.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    cxg1DblClick(Sender);
  end;
end;

procedure TFpendingTransaksi.FormShow(Sender: TObject);
begin
  ExQry(dtrx.Qtempjual,' SELECT                                         '+
                       '       p.fakturjual,                            '+
                       '       p.tgljual,                               '+
                       '       p.idpelanggan,                           '+
                       '       pl.namapelanggan,                        '+
                       '       pl.kodepelanggan,                        '+
                       '       (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) as pembayaran, '+
                       '       p.total,                                 '+
                       '       p.diskon,                                '+
                       '       p.grandtotal,                            '+
                       '       pg.namalengkap,                          '+
                       '       p.bayar,                                 '+
                       '       p.kembali,                                '+
                       '       s.kodesales,                                '+
                       '       s.namasales                                '+
                       '     FROM                                       '+
                       '       tempjual p                               '+
                       '       LEFT JOIN pelanggan pl                   '+
                       '         ON pl.`idpelanggan` = p.`idpelanggan`  '+
                       '       LEFT JOIN m_user pg                      '+
                       '        ON pg.iduser=p.`iduser`                 '+
                       '       LEFT JOIN sales s ON s.idsales=p.idsales ',True);
  dtrx.Qtempjualdetail.Active := False;
  cxg3.SetFocus;
end;

end.
