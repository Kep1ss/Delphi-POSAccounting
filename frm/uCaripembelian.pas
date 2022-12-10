unit uCaripembelian;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFcariPembelian = class(TForm)
    dxBevel1: TdxBevel;
    cxLabel1: TcxLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1pembayaran: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
    cxgGrid1DBTableView1refnota: TcxGridDBColumn;
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }

    isCariPembelian : integer;
  end;
  const
    _SQLCariBelior = ' SELECT                                   '+
                 '     p.idpembelian,                       '+
                 '     p.nobukti,                           '+
                 '     p.tgl,                               '+
                 '     p.nopo,                              '+
                 '     p.refnota,                              '+
                 '     p.pembayaran,                        '+
                 '     p.idsupplier,                        '+
                 '     s.kodesupplier,                      '+
                 '     s.namasupplier,                      '+
                 '     p.iduser,                            '+
                 '     u.namalengkap,                       '+
                 '     p.total                              '+
                 '   FROM                                   '+
                 '     pembelian p                          '+
                 '     LEFT JOIN m_supplier s               '+
                 '       ON s.`idsupplier` = p.`idsupplier` '+
                 '     LEFT JOIN m_user u                   '+
                 '       ON u.`iduser` = p.`iduser`         ';


    _cariDetailbeli = ' SELECT                             '+
                      '        d.iddetilbeli,              '+
                      '        d.nobukti,                  '+
                      '        d.kodebarang,               '+
                      '        b.kodebarcode,               '+
                      '        b.namabarang,               '+
                      '        d.satuan,                   '+
                      '        d.harga,                    '+
                      '        d.jumlah,                   '+
                      '        d.masuk,                   '+
                      '        d.retur,                   '+
                      '        d.diskonpersen,             '+
                      '        d.diskonrupiah,             '+
                      '        d.diskon2,                  '+
                      '        d.diskon3,                  '+
                      '        d.ppn,                      '+
                      '        d.subtotal,                 '+
                      '        d.isi,                      '+
                      '        d.idgudang,                 '+
                      '        l.namalokasi,                '+
                      '        b.bkp              '+
                      '      FROM                          '+
                      '        detailbeli d                '+
                      '        LEFT JOIN barang b          '+
                      '          ON d.`kodebarang` = b.`kodebarang`   '+
                      '        LEFT JOIN lokasi l ON l.idlokasi=d.idgudang';



var
  FcariPembelian: TFcariPembelian;

implementation

{$R *.dfm}

uses uDtrx, udm, uReturBeliNew;

procedure TFcariPembelian.cxgGrid1DBTableView1DblClick(Sender: TObject);
var
  i         : Integer;
begin

  case isCariPembelian of
  
  2: begin
          with Freturbelinew do begin
            EnoPembelian.Text   := GetVal(dtrx.QPembelian,'nobukti');
            ESupplier.Text      := GetVal(dtrx.QPembelian,'namasupplier');
            EKodeSupplier.Text  := GetVal(dtrx.QPembelian,'kodesupplier');
            cbPembayaran.ItemIndex := cbPembayaran.Properties.Items.IndexOf(GetVal(dtrx.QPembelian,'pembayaran'));
            cbAkun.Enabled      := cbPembayaran.ItemIndex = 0;

            ExQry(dtrx.Qdetailbeli,_cariDetailbeli+' WHERE nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'" '+
            ' AND d.retur < d.isi ',True);

          end;

           Close;
     end;


  end;
end;

procedure TFcariPembelian.cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     cxgGrid1DBTableView1.OnDblClick(Sender);
end;

procedure TFcariPembelian.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_RETURN : ExQry(dtrx.QPembelian,_SQLCariBelior +
   ' LEFT JOIN detailbeli '+
   ' db ON db.nobukti=p.nobukti '+
   ' WHERE db.retur < db.isi AND '+
   ' (p.nobukti like"%'+EPencarian.Text+'%" OR '+
   ' s.namasupplier like"%'+Epencarian.Text+'%") '+
   ' GROUP BY p.nobukti',True);
   VK_DOWN   : cxgrd1.SetFocus;
  end;
end;

end.
