unit uDataPelunasanPiutang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, uComCtrl, uctrlFrm,
  uEngine, uOvEdit, cxCalc, cxCurrencyEdit, dxSkinSharp, dxBevel,System.DateUtils, cxLabel,
  dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
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
  TFdataPelunasanPiutang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    G2: TcxGroupBox;
    btnTutup: TcxButton;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgrd1DBTableView1kodebarang: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1harga: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    cxgrd1DBTableView1diskonpersen: TcxGridDBColumn;
    cxgrd1DBTableView1diskonrupiah: TcxGridDBColumn;
    cxgrd1DBTableView1ppn: TcxGridDBColumn;
    cxgrd1DBTableView1subtotal: TcxGridDBColumn;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    cxLabel1: TcxLabel;
    dxBevel1: TdxBevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxgGrid1DBTableView1nominal: TcxGridDBColumn;
    btnHapus: TcxButton;
    btnBaru: TcxButton;
    cxgGrid1DBTableView1lastupdate: TcxGridDBColumn;
    cxgGrid1DBTableView1namalengkap: TcxGridDBColumn;
    cxgGrid1DBTableView1nobuktijual: TcxGridDBColumn;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtp1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLdataPelunasanPiutang = ' SELECT                                    '+
                               '     h.nobukti,                            '+
                               '     h.tgl,                                '+
                               '     s.namapelanggan,                       '+
                               '     u.namalengkap,                        '+
                               '     h.keterangan,                         '+
                               '     h.nominal,                            '+
                               '     h.lastupdate,                            '+
                               '     h.nominalbkp,                            '+
                               '     h.nominalnonbkp,                            '+
                               '     h.nobuktijual                            '+
                               '   FROM                                    '+
                               '     bayarpiutang h                         '+
                               '     LEFT JOIN pelanggan s                '+
                               '       ON s.`idpelanggan` = h.`idpelanggan`  '+
                               '     LEFT JOIN m_user u                    '+
                               '       ON u.`iduser` = h.iduser            ';




    { Public declarations }
  end;

var
  FdataPelunasanPiutang: TFdataPelunasanPiutang;

implementation

{$R *.dfm}

uses uDtrx, udm, UBayarPiutang, uBayarTitip;

procedure TFdataPelunasanPiutang.btnHapusClick(Sender: TObject);
begin
  if MessageDlg('Apakah yakin akan dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin

      ExQry(dm.Q1,'update piutang SET lunas=False,dibayar=dibayar-"'+GetVal(dtrx.Qpelunasanpiutang,'nominal')+'", '+
      ' kekurangan=kekurangan+"'+GetVal(dtrx.Qpelunasanpiutang,'nominal')+'", '+
      ' nominalbkp=nominalbkp+"'+StrToDecimal(Getval(dtrx.Qpelunasanpiutang,'nominalbkp'))+'",'+
      ' nominalnonbkp=nominalnonbkp+"'+StrToDecimal(GetVal(dtrx.Qpelunasanpiutang,'nominalnonbkp'))+'" '+
      ' WHERE fakturjual="'+GetVal(dtrx.Qpelunasanpiutang,'nobuktijual')+'" ',False);


      ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+GetVal(dtrx.Qpelunasanpiutang,'nobukti')+'" ',False);
      ExQry(dm.Q1,'DELETE FROM bayarpiutang WHERE nobukti="'+GetVal(dtrx.Qpelunasanpiutang,'nobukti')+'" ',False);
      ExQry(dtrx.QpelunasanPiutang,SQLdataPelunasanPiutang+' WHERE h.tgl>="'+Tanggal(dtp1.Date)+'" AND h.tgl<="'+Tanggal(dtp2.Date)+'" ',True);
  end;
end;

procedure TFdataPelunasanPiutang.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FbayarPiutang) then
  Application.CreateForm(TFbayarPiutang,FbayarPiutang);
  FbayarPiutang.TampilanAwal;
  FbayarPiutang.ShowModal;
end;

procedure TFdataPelunasanPiutang.btnTutupClick(Sender: TObject);
begin
    Close;
end;

procedure TFdataPelunasanPiutang.cxButton1Click(Sender: TObject);
begin
if not Assigned(FbayarPiutangTitip) then
     Application.CreateForm(TFbayarPiutangTitip,FbayarPiutangTitip);

     FbayarPiutangTitip.TampilanAwal;
     FbayarPiutangTitip.ShowModal;

end;

procedure TFdataPelunasanPiutang.dtp1Change(Sender: TObject);
begin
  ExQry(dtrx.Qpelunasanpiutang,SQLdataPelunasanPiutang+' WHERE h.tgl>="'+Tanggal(dtp1.Date)+'" AND h.tgl<="'+Tanggal(dtp2.Date)+'"',True);
end;

procedure TFdataPelunasanPiutang.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
      ExQry(dtrx.Qpelunasanpiutang,SQLdataPelunasanPiutang+' WHERE s.namapelanggan Like "%'+Epencarian.Text+'%"',True);

  end;
end;

procedure TFdataPelunasanPiutang.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

procedure TFdataPelunasanPiutang.FormShow(Sender: TObject);
begin
  dtp1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dtp2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  ExQry(dtrx.Qpelunasanpiutang,SQLdataPelunasanPiutang+' WHERE h.tgl="'+Tanggal(now)+'"',True);
end;

end.
