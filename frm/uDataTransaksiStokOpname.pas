unit uDataTransaksiStokOpname;

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
  uEngine, uOvEdit, cxCalc, dxSkiniMaginary, cxCurrencyEdit,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  TFdataStokOpname = class(TForm)
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
    btnPrint: TcxButton;
    btnTutup: TcxButton;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgrd1DBTableView1kodebarang: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1jmlorder: TcxGridDBColumn;
    cxgrd1DBTableView1masuk: TcxGridDBColumn;
    cxgrd1DBTableView1kekurangan: TcxGridDBColumn;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tanggal: TcxGridDBColumn;
    cxgGrid1DBTableView1kodebarcode: TcxGridDBColumn;
    cxgGrid1DBTableView1namabarang: TcxGridDBColumn;
    cxgGrid1DBTableView1stokkomp: TcxGridDBColumn;
    cxgGrid1DBTableView1stoknyata: TcxGridDBColumn;
    cxgGrid1DBTableView1selisih: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxgGrid1DBTableView1namalokasi: TcxGridDBColumn;
    cxgGrid1DBTableView1namalengkap: TcxGridDBColumn;
    cxgGrid1DBTableView1username: TcxGridDBColumn;
    btnHapus: TcxButton;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      stokOpname = ' SELECT                                      '+
                   '     so.nobukti,                             '+
                   '     so.tanggal,                             '+
                   '     so.kodebarang,                          '+
                   '     b.kodebarcode,                          '+
                   '     b.namabarang,                           '+
                   '     so.stokkomp,                            '+
                   '     so.stoknyata,                           '+
                   '     so.selisih,                             '+
                   '     so.keterangan,                          '+
                   '     k.namalokasi,                           '+
                   '     u.namalengkap,                           '+
                   '     ab.username                           '+
                   '   FROM                                      '+
                   '     stokopname so                           '+
                   '     LEFT JOIN barang b                      '+
                   '       ON so.`kodebarang` = b.`kodebarang`   '+
                   '     left join lokasi k on k.idlokasi=so.idgudang '+
                   '     left join m_user u on u.iduser=so.lastuser '+
                   '     LEFT JOIN m_user ab ON ab.iduser=so.petugascheck ';



    { Public declarations }
  end;

var
  FdataStokOpname: TFdataStokOpname;

implementation

{$R *.dfm}

uses uDtrx, udm, uDlaporan, uStokOpname;

procedure TFdataStokOpname.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FStokOpname) then
     Application.CreateForm(TFStokOpname,FStokOpname);
  FStokOpname.ShowModal;
end;

procedure TFdataStokOpname.btnHapusClick(Sender: TObject);
begin
  if MessageDlg('Apakah yakin data akan dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExQry(dm.Q1,'DELETE FROM kartustok WHERE nobukti="'+GetVal(dtrx.Qdatastokopname,'nobukti')+'"',False);
    ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+GetVal(dtrx.Qdatastokopname,'nobukti')+'"',False);
    ExQry(dm.Q1,'DELETE FROM stokopname WHERE nobukti="'+GetVal(dtrx.Qdatastokopname,'nobukti')+'"',False);

    Dt1PropertiesCloseUp(Sender);
  end;
end;

procedure TFdataStokOpname.btnPrintClick(Sender: TObject);
begin
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapStokOpname.fr3');
  Dlaporan.Fr1.ShowReport();
end;

procedure TFdataStokOpname.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFdataStokOpname.Dt1PropertiesCloseUp(Sender: TObject);
begin
  ExQry(dtrx.Qdatastokopname,stokOpname+' WHERE '+
  ' so.tanggal>="'+Tanggal(dt1.Date)+'" AND '+
  ' so.tanggal<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataStokOpname.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

  ExQry(dtrx.Qdatastokopname,stokOpname+
  ' WHERE namabarang like"%'+EPencarian.Text+'%" OR b.kodebarcode="'+Epencarian.TExt+'" '+
  ' AND so.tanggal>="'+Tanggal(dt1.Date)+'" AND '+
  ' so.tanggal<="'+Tanggal(dt2.Date)+'"',True);
  end;
end;

procedure TFdataStokOpname.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

end.
