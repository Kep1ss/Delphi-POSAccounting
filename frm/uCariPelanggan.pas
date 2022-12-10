unit uCariPelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMetropolis,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uComCtrl, uctrlFrm, udm,
  uEngine, uOvEdit, dxSkinMcSkin, uTerbilang, dxSkiniMaginary,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolisDark, dxSkinOffice2007Black,
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
  TFcariPelanggan = class(TForm)
    G1: TcxGroupBox;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
    G2: TcxGroupBox;
    btnTutup: TcxButton;
    btnBaru: TcxButton;
    cxgGrid1DBTableView1kodepelanggan: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxgGrid1DBTableView1kota: TcxGridDBColumn;
    cxgGrid1DBTableView1alamat: TcxGridDBColumn;
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
  isFormPelanggan : Integer;
    const
      sqlPelanggan = 'SELECT                                '+
                     '     p.idpelanggan,                   '+
                     '     p.kodepelanggan,                 '+
                     '     p.namapelanggan,                 '+
                     '     p.metodepiutang,                 '+
                     '     p.alamat,                        '+
                     '     p.kota,                          '+
                     '     p.notelpon,                      '+
                     '     P.idjenispelanggan,              '+
                     '     jp.jenis,                        '+
                     '     p.maxpiutang,                    '+
                     '     p.top ,                          '+
                     '     p.poin,                          '+
                     '     p.maxjmlinvoice,                 '+
                     '     s.kodesales,                     '+
                     '     s.namasales,                     '+
                     '     p.idsales                        '+
                     '   FROM                               '+
                     '     pelanggan p                      '+
                     '     LEFT JOIN jenispelanggan jp      '+
                     '       ON p.`idjenispelanggan` = jp.`idjenispelanggan` '+
                     '     LEFT JOIN sales s                                 '+
                     '       ON s.idsales=p.idsales                          ';


    { Public declarations }
  end;

var
  FcariPelanggan: TFcariPelanggan;

implementation

{$R *.dfm}

uses uInputPelanggan, uPenjualan, UBayarPiutang, uDtrx, uSalesOrder,
  uReturPenjualannew, uPoPenjualan, uBayarTitip;

procedure TFcariPelanggan.btnBaruClick(Sender: TObject);
begin
    if not Assigned(FinputPelanggan) then
  Application.CreateForm(TFinputPelanggan, FinputPelanggan);

  Finputpelanggan.Show;
  FinputPelanggan.TampilanAwal;
  FinputPelanggan.CanEdit := False;
end;

procedure TFcariPelanggan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFcariPelanggan.cxgGrid1DBTableView1DblClick(Sender: TObject);
var
  Metode  : String;
  Key     : word;
begin
  case isFormPelanggan of
  0 :  begin
          key := 13;
          with FPenjualanbarang do begin

            ExQry(dm.Q1,'SELECT COUNT(*) FROM piutang pt LEFT JOIN penjualan pj '+
            ' ON pt.fakturjual=pj.fakturjual  Where '+
            ' pj.idpelanggan="'+GetVal(dm.QPelanggan,'idpelanggan')+'" AND pt.lunas = False',True);

            Metode := GetVal(dm.QPelanggan,'metodepiutang');


              EScanBarcode.Text :=   GetVal(dm.QPelanggan,'kodepelanggan');
              ENamaCust.Text    := GetVal(dm.QPelanggan,'namapelanggan');
              EkodeCust.Text    := GetVal(dm.QPelanggan,'kodepelanggan');
              M1.Text := GetVal(dm.QPelanggan,'alamat') +#13+
                         GetVal(dm.QPelanggan,'kota')+' Tepl.'+GetVal(dm.QPelanggan,'notelpon');
              ESales.Text       := GetVal(dm.QPelanggan,'namasales');
              E1.Text           := GetVal(dm.QPelanggan,'kodesales');
              Focus;

            EScanBarcode.Text :=   GetVal(dm.QPelanggan,'kodepelanggan');
            EScanBarcodeKeyDown(Sender,key,[]);
          end;
      end;
  1 : begin
        with FbayarPiutang do begin
          Epelanggan.Text     := GetVal(dm.QPelanggan,'namapelanggan');
          Ekodepelanggan.Text := GetVal(dm.QPelanggan,'kodepelanggan');

          ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE namapelanggan="'+GetVal(dm.QPelanggan,'namapelanggan')+'" '+
                                     ' AND lunas=False',True);
          EjumlahPiutang.Text     := GetRupiah(FloatToStr(SumCxGrid));
          Eterbilang.Text        := MyTerbilang(SumCxGrid)
        end;
      end;
  2 :begin
       with FsalesOrder do begin
          ENamaCust.Text    := GetVal(dm.QPelanggan,'namapelanggan');
          EkodeCust.Text    := GetVal(dm.QPelanggan,'kodepelanggan');
          Focus;
       end;
     end;
  3 :  begin
          with FreturJualNew do begin
            ENamaCust.Text    := GetVal(dm.QPelanggan,'namapelanggan');
            EkodeCust.Text    := GetVal(dm.QPelanggan,'kodepelanggan');

          end;
      end;
  4 :  begin
          key := 13;
          with FpoPenjualan do begin

              EScanBarcode.Text :=   GetVal(dm.QPelanggan,'kodepelanggan');
              ENamaCust.Text    := GetVal(dm.QPelanggan,'namapelanggan');
              EkodeCust.Text    := GetVal(dm.QPelanggan,'kodepelanggan');
              M1.Text := GetVal(dm.QPelanggan,'alamat') +#13+
                         GetVal(dm.QPelanggan,'kota')+' Tepl.'+GetVal(dm.QPelanggan,'notelpon');

              Focus;

          end;
      end;
  5 : begin
        with FbayarPiutangTitip do begin
          Epelanggan.Text     := GetVal(dm.QPelanggan,'namapelanggan');
          Ekodepelanggan.Text := GetVal(dm.QPelanggan,'kodepelanggan');

          ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE namapelanggan="'+GetVal(dm.QPelanggan,'namapelanggan')+'" '+
                                     ' AND lunas=False',True);
          EjumlahPiutang.Text     := GetRupiah(FloatToStr(SumCxGrid));
          Eterbilang.Text        := MyTerbilang(SumCxGrid)
        end;
      end;
  end;

  Close;
end;

procedure TFcariPelanggan.cxgGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
     cxgGrid1DBTableView1.OnDblClick(Sender);
end;

procedure TFcariPelanggan.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
   VK_RETURN : ExQry(dm.Qpelanggan,sqlPelanggan+' where namapelanggan like"%'+EPencarian.Text+'%"',True);
   VK_DOWN   : cxgrd1.SetFocus;
  end;


end;

procedure TFcariPelanggan.FormCreate(Sender: TObject);
begin
  EPencarian.isCari := True;
end;

procedure TFcariPelanggan.FormShow(Sender: TObject);
begin
  EPencarian.SetFocus;
  ExQry(dm.Qpelanggan,sqlPelanggan+' where namapelanggan like"%'+EPencarian.Text+'%"',True);
end;

end.
