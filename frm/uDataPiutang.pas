unit uDataPiutang;

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
  uEngine, uOvEdit, cxCalc, cxCurrencyEdit, dxSkinSharp, dxSkiniMaginary,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFdataPiutang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgrd1: TcxGrid;
    G2: TcxGroupBox;
    btnPrint: TcxButton;
    btnTutup: TcxButton;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1nobuktijual: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxgrd1DBTableView1kodebarcode: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1harga: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    cxgrd1DBTableView1subtotal: TcxGridDBColumn;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView2: TcxGridDBTableView;
    cxgrd1DBTableView2fakturjual: TcxGridDBColumn;
    cxgrd1DBTableView2tglinput: TcxGridDBColumn;
    cxgrd1DBTableView2piutang: TcxGridDBColumn;
    cxgrd1DBTableView2tgltempo: TcxGridDBColumn;
    cxgrd1DBTableView2dibayar: TcxGridDBColumn;
    cxgrd1DBTableView2kekurangan: TcxGridDBColumn;
    cxgrd1DBTableView2lunas: TcxGridDBColumn;
    cxgrd1DBTableView2namapelanggan: TcxGridDBColumn;
    c1: TCheckBox;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintClick(Sender: TObject);
    procedure c1Click(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLpiutang = ' SELECT                                     '+
                     '   h.fakturjual,                          '+
                     '   h.tglinput,                            '+
                     '   h.piutang,                             '+
                     '   h.tgltempo,                            '+
                      '  CONCAT(TO_DAYS(CURDATE())-TO_DAYS(h.tgltempo)," ","Hari") AS umurhutang, '+
                     '   h.dibayar,                             '+
                     '   h.kekurangan,                          '+
                     '   h.lunas,                               '+
                     '   s.namapelanggan                        '+
                     ' FROM                                     '+
                     '   piutang h                              '+
                     '   LEFT JOIN penjualan p                  '+
                     '     ON p.`fakturjual` = h.`fakturjual`   '+
                     '   LEFT JOIN pelanggan s                  '+
                     '     ON s.`idpelanggan` = p.`idpelanggan` ';



    { Public declarations }
  end;

var
  FdataPiutang: TFdataPiutang;

implementation

{$R *.dfm}

uses uDtrx, udm, uDlaporan;

procedure TFdataPiutang.btnPrintClick(Sender: TObject);
begin
   ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE h.tglinput>="'+Tanggal(dt1.Date)+'" '+
   'AND h.tglinput<="'+Tanggal(dt2.Date)+'"',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frPiutang.fr3');
  FMemo(Dlaporan.Fr1,'Ljudul').Text := 'Laporan Piutang Periode : '+ FormatDateTime('dd/mm/yyyy',dt1.Date)+' s/d '+FormatDateTime('dd/mm/yyyy',dt2.Date);
  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.ShowReport();

end;

procedure TFdataPiutang.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFdataPiutang.c1Click(Sender: TObject);
begin
    if c1.Checked then
     ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE h.lunas=False',True) else
     ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE h.tglinput>="'+Tanggal(dt1.Date)+'" AND h.tglinput<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataPiutang.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  dtrx.QDetailReturJual.Active := False;
  dtrx.QDetailReturJual.Active := True;
end;

procedure TFdataPiutang.Dt1PropertiesCloseUp(Sender: TObject);
begin
  ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE h.tglinput>="'+Tanggal(dt1.Date)+'" AND h.tglinput<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataPiutang.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

    ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE s.namapelanggan like "%'+EPencarian.Text+'%"',True);
  end;
end;

procedure TFdataPiutang.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

end.

