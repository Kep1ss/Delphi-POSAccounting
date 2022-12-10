unit uDataPenerimaanBarang;

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
  uEngine, uOvEdit, cxCalc, dxSkiniMaginary, dxSkinOffice2010Blue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFDataPenerimaanBarang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnTutup: TcxButton;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1nobuktibeli: TcxGridDBColumn;
    cxgGrid1DBTableView1nobuktiorder: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxgrd1DBTableView1kodebarang: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1jmlorder: TcxGridDBColumn;
    cxgrd1DBTableView1masuk: TcxGridDBColumn;
    cxgrd1DBTableView1kekurangan: TcxGridDBColumn;
    btnHapus: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnHapusClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLterima = ' SELECT                                       '+
                     '     pb.nobukti,                              '+
                     '     pb.tgl,                                  '+
                     '     pb.nobuktibeli,                          '+
                     '     pb.nobuktiorder,                         '+
                     '     s.namasupplier                           '+
                     '   FROM                                       '+
                     '     penerimaanbarang pb                      '+
                     '     LEFT JOIN pembelian p                    '+
                     '       ON pb.`nobuktibeli` = p.`nobukti`      '+
                     '     LEFT JOIN m_supplier s                   '+
                     '       ON s.`idsupplier` = p.`idsupplier`     ';

    SQLterimaDetail = ' SELECT                                       '+
                     '         pd.nobukti,                          '+
                     '         pd.kodebarang,                       '+
                     '         pd.satuan,                           '+
                     '         pd.jmlorder,                         '+
                     '         pd.masuk,                            '+
                     '         pd.kekurangan,                       '+
                     '         pd.idgudang,                         '+
                     '         pd.isi,                              '+
                     '         b.namabarang                         '+
                     '       FROM                                   '+
                     '         penerimaandetail pd                  '+
                     '         LEFT JOIN barang b                   '+
                     '           ON b.`kodebarang` = pd.`kodebarang`';


    { Public declarations }
  end;

var
  FDataPenerimaanBarang: TFDataPenerimaanBarang;

implementation

{$R *.dfm}

uses uDtrx, udm;

procedure TFDataPenerimaanBarang.btnHapusClick(Sender: TObject);
begin
  if MessageDlg('Apakah data akan dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExQry(dm.Q2,'SELECT * FROM penerimaandetail WHERE nobukti="'+GetVal(dtrx.QpenerimaanBarang,'nobukti')+'" ',True);

    while not dm.Q2.Eof do begin
       ExQry(dm.Q1,'UPDATE detailbeli SET masuk=masuk-"'+getVal(dm.Q2,'masuk')+'" '+
       ' WHERE nobukti="'+GetVal(dtrx.QpenerimaanBarang,'nobuktibeli')+'" '+
       ' AND kodebarang="'+GetVal(dm.Q2,'kodebarang')+'" ',False);

       dm.Q2.Next;

    end;
    ExQry(dm.Q1,'DELETE FROM kartustok WHERE nobukti="'+GetVal(dtrx.QpenerimaanBarang,'nobukti')+'"',False);
    ExQry(dm.Q1,'DELETE FROM penerimaanbarang WHERE nobukti="'+GetVal(dtrx.QpenerimaanBarang,'nobukti')+'" ',False);
    ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+GetVal(dtrx.QpenerimaanBarang,'nobukti')+'" ',False);

    Dt1PropertiesCloseUp(Sender);
  end;
end;

procedure TFDataPenerimaanBarang.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFDataPenerimaanBarang.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  dtrx.QPenerimaanBarangdetail.Active := False;
  dtrx.QPenerimaanBarangdetail.Active := True;
end;

procedure TFDataPenerimaanBarang.Dt1PropertiesCloseUp(Sender: TObject);
begin
  ExQry(dtrx.QpenerimaanBarang,SQLterima+' WHERE p.tgl>="'+Tanggal(dt1.Date)+'" AND p.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFDataPenerimaanBarang.EPencarianKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then

  ExQry(dtrx.QpenerimaanBarang,SQLterima+' WHERE '+
  ' (s.namasupplier LIKE "%'+EPencarian.Text+'%" '+
  ' or pb.nobukti LIKE "%'+EPencarian.Text+'%")',True);
end;

procedure TFDataPenerimaanBarang.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

end.
