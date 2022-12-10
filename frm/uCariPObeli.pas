  unit uCariPObeli;

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
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
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
  TFcariPO = class(TForm)
    dxBevel1: TdxBevel;
    cxLabel1: TcxLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1alamat: TcxGridDBColumn;
    cxgGrid1DBTableView1kota: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
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
                    '    pd.`ppn`,                      '+
                    '    pd.hargabeli,                        '+
                    '    b.hargaecer,                        '+
                    '    b.hargagrosir,                        '+
                    '    b.hargapartai,                        '+
                    '    b.hargapartai4,                        '+
                    '    b.hargapartai5,                        '+
                    '    pd.sisastok,                         '+
                    '    pd.disk1,                         '+
                    '    pd.disk2,                         '+
                    '    pd.disk3,                         '+
                    '    pd.jumlah,                           '+
                    '    pd.masuk,                            '+
                    '    pd.subtotal,                         '+
                    '    pd.isi                               '+
                    '  FROM                                   '+
                    '    pobelidetail pd                      '+
                    '    LEFT JOIN barang b                   '+
                    '      ON b.`kodebarang` = pd.`kodebarang`';


var
  FcariPO: TFcariPO;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm;

procedure TFcariPO.cxgGrid1DBTableView1DblClick(Sender: TObject);
var
  i : Integer;
  isiBeli , HargaNormal,HargaDiskon,HargaDIskon2,HargaDiskon3,HargaSetelahPPN,HargaFIx: Real;
  hrg ,ppn,hargajual1,hargajual2,hargajual3,laba1,laba2,laba3,persen1,persen2,persen3: real;
begin
  with FpembelianBarang do begin
    EnoPO.Text          := GetVal(dtrx.QPoBeli,'nobukti');
    ESupplier.Text      := GetVal(dtrx.QPoBeli,'namasupplier');
    EKodeSupplier.Text  := GetVal(dtrx.QPoBeli,'kodesupplier');
    cbPembayaran.ItemIndex := 0;
    cbAkun.ItemIndex     := 1;
    i:=1;

    ExQry(dm.Q1,_cariDetailPO+' WHERE nobukti="'+EnoPO.Text+'"',True);
    KosongKanGrid;
    if not dm.Q1.IsEmpty  then begin

        sg1.RowCount := dm.Q1.RecordCount +2;

        while not dm.Q1.Eof do begin
           sg1.Cells[0,i] := IntToStr(dm.Q1.RecNo);


           sg1.Cells[0,i] := IntToStr(i);
           sg1.Cells[1,i] := GetVal(dm.Q1,'kodebarcode');
           sg1.Cells[19,i]:= GetVal(dm.Q1,'kodebarang');
           sg1.Cells[2,i] := GetVal(dm.Q1,'namabarang');
           isiBeli        := CariIsi(GetVal(dm.Q1,'kodebarang'),GetVal(dm.Q1,'satuanbeli'));

           sg1.Cells[3,i] := GetVal(dm.Q1,'satuanbeli');
           sg1.Cells[4,i] := GetVal(dm.Q1,'jumlah');
           sg1.Cells[5,i] := GetVal(dm.Q1,'hargabeli');
           sg1.Cells[6,i] := GetVal(dm.Q1,'ppn');

           HargaNormal := GetValF(dm.Q1,'hargabeli');
           ppn         := GetValF(dm.Q1,'ppn');

           HargaDiskon := HargaNormal - (HargaNormal * GetValF(dm.Q1,'disk1') /100);
           Hargadiskon2:= HargaDiskon - (HargaDiskon * GetValF(dm.Q1,'disk2') /100);
           HargaDiskon3:= Hargadiskon2 - (Hargadiskon2 * GetValF(dm.Q1,'disk3') / 100);

           hargafix := HargaDiskon3;

           HargaSetelahPPN := hargafix + (hargafix * ppn /100);

           sg1.Cells[7,i] := Format('%.2n',[HargaSetelahPPN]);


           HargaJual1 := GetValF(dm.Q1,'hargaecer');
           HargaJual2 := GetValF(dm.Q1,'hargagrosir');
           hargajual3 := GetValF(dm.Q1,'hargapartai');

           laba1 := hargajual1 - HargaSetelahPPN;
           laba2 := hargajual2 - HargaSetelahPPN;
           laba3 := hargajual3 - HargaSetelahPPN;


           persen1 := (laba1 / HargaSetelahPPN) * 100;
           persen2 := (laba2 / HargaSetelahPPN) * 100;
           persen3 := (laba3 / HargaSetelahPPN) * 100;

            if HargaJual1 > 0 then
            sg1.Cells[8,i] := Format('%.2n',[persen1]);
            sg1.Cells[9,i] := GetVal(dm.Q1,'hargaecer');
            if HargaJual2 > 0 then
            sg1.Cells[10,i] := Format('%.2n',[persen2]);
            sg1.Cells[11,i] := GetVal(dm.Q1,'hargagrosir');
            if HargaJual3 > 0 then
            sg1.Cells[12,i]:= Format('%.2n',[persen3]);
            sg1.Cells[13,i]:= GetVal(dm.Q1,'hargapartai');


            sg1.Cells[14,i] := '';
            sg1.Cells[15,i] := '';
            sg1.Cells[16,i] := '';


              sg1.Cells[17,i] := GetVal(dm.Q1,'subtotal');
              sg1.Cells[18,i] := GetVal(dm.Q1,'isi');
              sg1.Cells[19,i] := GetVal(dm.Q1,'kodebarang');


           Inc(i);
           dm.Q1.Next;
        end;
        HitungTotal;
    end else
       KosongKanGrid;

       Focus;
  end;
  Close;
end;

procedure TFcariPO.cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     cxgGrid1DBTableView1.OnDblClick(Sender);
end;

procedure TFcariPO.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_RETURN : ExQry(dtrx.QPoBeli,_SQLcariPO+ ' where nobukti like"%'+EPencarian.Text+'%"',True);
   VK_DOWN   : cxgrd1.SetFocus;
  end;
end;

end.
