unit uCariPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uEngine, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxTextEdit, Vcl.StdCtrls,
  cxGroupBox, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFcariPenjualan = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Epencarian: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1fakturjual: TcxGridDBColumn;
    cxGrid1DBTableView1tgljual: TcxGridDBColumn;
    cxGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxGrid1DBTableView1grandtotal: TcxGridDBColumn;
    cxGrid1DBTableView1namasales: TcxGridDBColumn;
    procedure EpencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    const
      SQLpenjualan = ' SELECT                                            '+
                     '     p.fakturjual,                                 '+
                     '     p.tgljual,                                    '+
                     '     p.idpelanggan,                                '+
                     '     pl.kodepelanggan,                                '+
                     '     pl.namapelanggan,                             '+
                     '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) AS pembayaran,                                 '+
                     '     p.total,                                      '+
                     '     p.diskon,                                     '+
                     '     p.grandtotal,                                 '+
                     '     pg.namalengkap,                               '+
                     '     s.namasales,                                  '+
                     '     s.kodesales,                                  '+
                     '     p.tglkirim,                                   '+
                     '     p.kirim,                                   '+
                     '     p.ppn,                                   '+
                     '     p.bayar,                                      '+
                     '     p.kembali                                     '+
                     '   FROM                                            '+
                     '     penjualan p                                   '+
                     '     LEFT JOIN pelanggan pl                        '+
                     '       ON pl.`idpelanggan` = p.`idpelanggan`       '+
                     '     LEFT JOIN m_user pg                           '+
                     '      ON pg.iduser=p.`iduser`                      '+
                     '     LEFT JOIN sales s                             '+
                     '      ON p.idsales=s.idsales';

      _SQLDetailJual = ' SELECT                                  '+
                     '     d.iddetil,                          '+
                     '     d.fakturjual,                       '+
                     '     d.kodebarang,                       '+
                     '     b.kodebarcode,                       '+
                     '     b.bkp,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,                            '+
                     '     d.hpp,                              '+
                     '     d.jumlah - d.jumlahretur as jumlah,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskonrupiah,                         '+
                     '     d.diskon3,                           '+
                     '     d.subtotal,                         '+
                     '     d.isi,                              '+
                     '     d.idgudang,                         '+
                     '     l.namalokasi                        '+
                     '   FROM                                  '+
                     '     penjualandetil d                    '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang`'+
                     '     LEFT JOIN lokasi l                  '+
                     '       ON l.`idlokasi` = d.`idgudang` ';
  end;

var
  FcariPenjualan: TFcariPenjualan;

implementation

{$R *.dfm}

uses uDtrx, uReturPenjualannew, udm;

procedure TFcariPenjualan.cxGrid1DBTableView1DblClick(Sender: TObject);
var
  i         : Integer;

begin
  with FreturJualNew do begin
        EFakturPenjualan.Text := GetVal(dtrx.Qpenjualan,'fakturjual');
        ENamaCust.Text  := GetVal(dtrx.Qpenjualan,'namapelanggan');
        EkodeCust.Text  := GetVal(dtrx.Qpenjualan,'kodepelanggan');
        cbPembayaran.ItemIndex := cbPembayaran.Properties.Items.IndexOf(GetVal(dtrx.Qpenjualan,'pembayaran'));
        i:=1;

        ExQry(dm.Q1,_SQLDetailJual+' WHERE fakturjual="'+GetVal(dtrx.Qpenjualan,'fakturjual')+'"',True);

        if not dm.Q1.IsEmpty  then begin
            KosongKanGrid;
            sg1.RowCount := dm.Q1.RecordCount +2;

            while not dm.Q1.Eof do begin
               if GetValInt(dm.Q1,'jumlah') > 0 then begin
                 sg1.Cells[0,i] := IntToStr(dm.Q1.RecNo);
                 sg1.Cells[1,i] := GetVal(dm.Q1,'kodebarcode');
                 sg1.Cells[2,i] := GetVal(dm.Q1,'namabarang');
                 sg1.Cells[6,i] := GetVal(dm.Q1,'satuan');
                 sg1.Cells[3,i] := GetValR(dm.Q1,'harga');
                 sg1.Cells[4,i] := GetVal(dm.Q1,'diskonpersen');
                 sg1.Cells[5,i] := GetVal(dm.Q1,'diskonrupiah');
                 sg1.Cells[7,i] := GetValR(dm.Q1,'jumlah');
                 sg1.Cells[9,i] := GetValR(dm.Q1,'subtotal');
                 sg1.Cells[11,i] := GetVal(dm.Q1,'isi');
                 sg1.AddCheckBox(10,i,True,False);
                 sg1.Cells[12,i] := GetVal(dm.Q1,'hpp');
                 sg1.Cells[13,i] := FloatToStr(GetValF(dm.Q1,'harga')-GetValF(dm.Q1,'diskonrupiah'));
                 sg1.Cells[14,i] := GetVal(dm.Q1,'bkp');
                 Inc(i);
               end;
               dm.Q1.Next;
            end;
            HitungTotal;
        end else
           KosongKanGrid;

           Focus;

  end;

  Close;
end;

procedure TFcariPenjualan.EpencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

    ExQry(dtrx.Qpenjualan,FcariPenjualan.SQLpenjualan + ' LEFT JOIN penjualandetil dt '+
                     ' ON dt.`fakturjual`=p.`fakturjual` WHERE dt.jumlah > dt.`jumlahretur` '+
                     ' AND (pl.namapelanggan LIKE "%'+Epencarian.Text+'%" OR  '+
                     ' p.fakturjual LIKE "%'+Epencarian.Text+'%" )'+
                     ' GROUP BY p.`fakturjual`',True);
  end;
end;

end.
