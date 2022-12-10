unit uDataHutang;

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
  dxSkinOffice2010Blue,cxGridExportLink,ShellApi, dxSkinOffice2016Colorful, dxSkinMoneyTwins,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFdataHutang = class(TForm)
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
    cxgrd1DBTableView2nobukti: TcxGridDBColumn;
    cxgrd1DBTableView2tglinput: TcxGridDBColumn;
    cxgrd1DBTableView2hutang: TcxGridDBColumn;
    cxgrd1DBTableView2dibayar: TcxGridDBColumn;
    cxgrd1DBTableView2kekurangan: TcxGridDBColumn;
    cxgrd1DBTableView2namasupplier: TcxGridDBColumn;
    c1: TCheckBox;
    cxgrd1DBTableView3: TcxGridDBTableView;
    cxgrd1DBTableView3kodebarang: TcxGridDBColumn;
    cxgrd1DBTableView3namabarang: TcxGridDBColumn;
    cxgrd1DBTableView3satuan: TcxGridDBColumn;
    cxgrd1DBTableView3harga: TcxGridDBColumn;
    cxgrd1DBTableView3jumlah: TcxGridDBColumn;
    cxgrd1DBTableView3diskonpersen: TcxGridDBColumn;
    cxgrd1DBTableView3diskon2: TcxGridDBColumn;
    cxgrd1DBTableView3diskon3: TcxGridDBColumn;
    cxgrd1DBTableView3subtotal: TcxGridDBColumn;
    cxgrd1DBTableView2tgltempo: TcxGridDBColumn;
    CheckBox1: TCheckBox;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLHUTang = ' SELECT                                     '+
                     '   h.nobukti,                               '+
                     '   h.tglinput,                              '+
                     '   h.tgltempo,                              '+
                     '   h.hutang,                                '+
                     '   h.dibayar,                               '+
                     '   h.kekurangan,                            '+
                     '   h.nominalbkp,                            '+
                     '   h.nominalnonbkp,                            '+
                     '   h.lunas,                                 '+
                     '   s.namasupplier                           '+
                     ' FROM                                       '+
                     '   hutang h                                 '+
                     '   LEFT JOIN pembelian p                    '+
                     '     ON p.`nobukti` = h.`nobukti`           '+
                     '   LEFT JOIN m_supplier s                   '+
                     '     ON s.`idsupplier` = p.`idsupplier` ';


    { Public declarations }
  end;

var
  FdataHutang: TFdataHutang;

implementation

{$R *.dfm}

uses uDtrx, udm;

procedure TFdataHutang.btnPrintClick(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\Data Hutang.xls',
  cxgrd1,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\Data Hutang.xls'),nil,nil, SW_NORMAL);
end;

procedure TFdataHutang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataHutang.c1Click(Sender: TObject);
begin
  if c1.Checked then
     ExQry(dtrx.Qhutang,SQLHUTang+' WHERE lunas=False',True) else
     ExQry(dtrx.Qhutang,SQLHUTang+' WHERE tgl>="'+Tanggal(dt1.Date)+'" AND tgl<="'+Tanggal(dt2.Date)+'"',True);

end;

procedure TFdataHutang.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     ExQry(dtrx.Qhutang,SQLHUTang+' WHERE lunas=False AND tgltempo<="'+Tanggal(now)+'"',True) else
     ExQry(dtrx.Qhutang,SQLHUTang+' WHERE tgl>="'+Tanggal(dt1.Date)+'" AND tgl<="'+Tanggal(dt2.Date)+'"',True);

end;

procedure TFdataHutang.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;

end;

procedure TFdataHutang.Dt1PropertiesCloseUp(Sender: TObject);
begin
  ExQry(dtrx.Qhutang,SQLHUTang+' WHERE tgl>="'+Tanggal(dt1.Date)+'" AND tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataHutang.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

    ExQry(dtrx.Qhutang,SQLHUtang+' WHERE namasupplier like "%'+EPencarian.Text+'%"',True);
  end;
end;

procedure TFdataHutang.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

procedure TFdataHutang.FormShow(Sender: TObject);
begin
  c1.OnClick(Sender);
end;

end.

