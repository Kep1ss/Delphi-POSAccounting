  unit uCariDataStokOpname;

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
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, DBAccess, MyAccess, MemDS,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;
type
  TFCariDataStokOpname = class(TForm)
    dxBevel1: TdxBevel;
    cxLabel1: TcxLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    QTempStokOpname: TMyQuery;
    DStokOpanme: TMyDataSource;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tanggal: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxgGrid1DBTableView1namalokasi: TcxGridDBColumn;
    cxgGrid1DBTableView1namalengkap: TcxGridDBColumn;
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  const
    _SQLcariPO = ' SELECT                                   '+
                 '     p.idpobeli,                          '+
                 '     p.nobukti,                           '+
                 '     p.tgl,                               '+
                 '     p.idsupplier,                        '+
                 '     s.namasupplier,                      '+
                 '     s.kodesupplier,                      '+
                 '     u.namalengkap,                       '+
                 '     p.total,                             '+
                 '     p.diskon,                            '+
                 '     p.ppn,                               '+
                 '     p.grandtotal ,                       '+
                 '     p.pembayaran                         '+
                 '   FROM                                   '+
                 '     pobeli p                             '+
                 '     LEFT JOIN m_supplier s               '+
                 '       ON s.`idsupplier` = p.`idsupplier` '+
                 '     LEFT JOIN m_user u                   '+
                 '       ON u.`iduser` = p.`createby`       ';


    _cariDetailPO = ' SELECT                                  '+
                    '    pd.nobukti,                          '+
                    '    pd.kodebarang,                       '+
                    '    b.`kodebarcode`,                     '+
                    '    b.`namabarang`,                      '+
                    '    b.`satuanbeli`,                      '+
                    '    b.`ppn`,                      '+
                    '    b.hargabeli,                        '+
                    '    b.hargaecer,                        '+
                    '    b.hargagrosir,                        '+
                    '    b.hargapartai,                        '+
                    '    pd.sisastok,                         '+
                    '    pd.jumlah,                           '+
                    '    pd.masuk,                            '+
                    '    pd.subtotal,                         '+
                    '    pd.isi                               '+
                    '  FROM                                   '+
                    '    pobelidetail pd                      '+
                    '    LEFT JOIN barang b                   '+
                    '      ON b.`kodebarang` = pd.`kodebarang`';


var
  FCariDataStokOpname: TFCariDataStokOpname;

implementation

{$R *.dfm}

uses uDtrx, uStokOpname, udm;

procedure TFCariDataStokOpname.cxgGrid1DBTableView1DblClick(Sender: TObject);
var
  i : integer;
begin
  with FStokOpname do begin
    cbGudang.ItemIndex := cbGudang.Properties.Items.IndexOf(GetVal(QTempStokOpname,'namalokasi'));
    cbPetugas.ItemIndex := cbPetugas.Properties.Items.IndexOf(GetVal(QTempStokOpname,'namalengkap'));
    EnoBukti.Text       := GetVal(QTempStokOpname,'nobukti');
    Eketerangan.Text    := GetVal(QTempStokOpname,'keterangan');

    with  sg1 do begin
          ExQry(dm.Q1,'SELECT so.*,b.namabarang,k.namakategori FROM temp_stokopname so '+
          ' LEFT JOIN barang b ON b.kodebarang=so.kodebarang '+
          ' LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
          ' WHERE so.nobukti="'+GetVal(QTempStokOpname,'nobukti')+'"',True);
          RowCount := dm.Q1.RecordCount +1;
          i := 1;
          while not dm.Q1.Eof do begin
             Cells[0,i] := GetVal(dm.Q1,'kodebarang');
             Cells[1,i] := GetVal(dm.Q1,'namabarang');
             Cells[2,i] := GetVal(dm.Q1,'namakategori');
             Cells[4,i] := GetVal(dm.Q1,'stokkomp');
             Cells[3,i] := GetVal(dm.Q1,'satuan');
             Cells[5,i] := '';
             Cells[6,i] := '';
             Inc(i);
             dm.Q1.Next;

          end;
          Cursor := crArrow;
        end;
  end;
  Close;
end;

procedure TFCariDataStokOpname.cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     cxgGrid1DBTableView1.OnDblClick(Sender);
end;

procedure TFCariDataStokOpname.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_RETURN : ExQry(dtrx.QPoBeli,_SQLcariPO+ ' where nobukti like"%'+EPencarian.Text+'%"',True);
   VK_DOWN   : cxgrd1.SetFocus;
  end;
end;

end.
