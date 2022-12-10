unit uDataMutasiBarang;

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
  dxSkiniMaginary, cxCurrencyEdit, uEngine, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFdataMutasiBarang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnPrint: TcxButton;
    btnTutup: TcxButton;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1namalengkap: TcxGridDBColumn;
    cxgGrid1DBTableView1darigudang: TcxGridDBColumn;
    cxgGrid1DBTableView1kegudang: TcxGridDBColumn;
    cxgGrid1DBTableView1totalbarang: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1kodebarcode: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1jmlmutasi: TcxGridDBColumn;
    btnHapus: TcxButton;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
    procedure PrintBukti(nobukti:string);
  public
    const
      SQLMutasi = ' SELECT                             '+
                     '         mb.nobukti,                '+
                     '         mb.tgl,                    '+
                     '         mb.iduser,                 '+
                     '         u.namalengkap,             '+
                     '         mb.darigudang,             '+
                     '         mb.kegudang,               '+
                     '         mb.totalbarang,            '+
                     '         mb.keterangan              '+
                     '       FROM                         '+
                     '         mutasibarang mb            '+
                     '         LEFT JOIN m_user u         '+
                     '           ON u.`iduser` = mb.`iduser`';

    { Public declarations }
  end;

var
  FdataMutasiBarang: TFdataMutasiBarang;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm, uDlaporan;

procedure TFdataMutasiBarang.btnHapusClick(Sender: TObject);
begin
  if MessageDlg('Yakin data akan dihapus?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    ExQry(dm.Q1,'DELETE FROM kartustok WHERE nobukti="'+GetVal(dtrx.QdatamutasiBarang,'nobukti')+'"',False);
    ExQry(dm.Q1,'DELETE FROM mutasibarang WHERE nobukti="'+GetVal(dtrx.QdatamutasiBarang,'nobukti')+'"',False);

  end;
end;

procedure TFdataMutasiBarang.btnPrintClick(Sender: TObject);
begin
  PrintBukti(GetVal(dtrx.QdatamutasiBarang,'nobukti'));
end;

procedure TFdataMutasiBarang.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFdataMutasiBarang.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  dtrx.QDetailMutasiBarang.Active := False;
  dtrx.QDetailMutasiBarang.Active := True;
end;

procedure TFdataMutasiBarang.Dt1PropertiesCloseUp(Sender: TObject);
begin
  ExQry(dtrx.QdatamutasiBarang,SQLMutasi+' WHERE mb.tgl>="'+Tanggal(dt1.Date)+'" AND mb.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataMutasiBarang.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

procedure TFdataMutasiBarang.PrintBukti(nobukti: string);
const _SQL = '  SELECT                            '+
             '       mb.nobukti,                  '+
             '       mb.tgl,                      '+
             '       mb.iduser,                   '+
             '       u.namalengkap,               '+
             '       mb.darigudang,               '+
             '       mb.kegudang,                 '+
             '       mb.totalbarang,              '+
             '       mb.keterangan                '+
             '     FROM                           '+
             '       mutasibarang mb              '+
             '       LEFT JOIN m_user u           '+
             '         ON u.`iduser` = mb.`iduser`';

begin
  ExQry(Dlaporan.QdatamutasiBarang,_SQL+' WHERE mb.nobukti="'+nobukti+'"',True);
  Dlaporan.QdatamutasiBarang.Active := False;
  Dlaporan.QdatamutasiBarang.Active := True;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frBuktiMutasi.fr3');
  Dlaporan.Fr1.ShowReport();

end;

end.
