unit uMasterEDC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, Vcl.StdCtrls, cxButtons, cxTextEdit, cxGroupBox, dxSkinsCore,
  Vcl.Menus, dxSkinsdxStatusBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, Vcl.ImgList, udm, uEngine,IniFiles, uctrlFrm,
  dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,
  dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageList;

type
  TFmasterEDC = class(TForm)
    G3: TcxGroupBox;
    btnBaru: TcxButton;
    btnUbah: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    T1: TMenuItem;
    U1: TMenuItem;
    H1: TMenuItem;
    N1: TMenuItem;
    C1: TMenuItem;
    T2: TMenuItem;
    F1: TMenuItem;
    img1: TcxImageList;
    F2: TMenuItem;
    F3: TMenuItem;
    N2: TMenuItem;
    G5: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    sbr1: TdxStatusBar;
    R1: TMenuItem;
    cxGrid1DBTableView1namamesin: TcxGridDBColumn;
    cxGrid1DBTableView1kartudebet: TcxGridDBColumn;
    cxGrid1DBTableView1sucharge: TcxGridDBColumn;
    cxlbl1: TcxLabel;
    procedure btnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure F3Click(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public

    procedure LoadData;
    { Public declarations }
  end;
  const
    SQLEdc = ' SELECT * FROM masteredc';
var
  FmasterEDC: TFmasterEDC;

implementation

{$R *.dfm}

uses uInputMasterEDC;

procedure TFmasterEDC.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FinputMasterEDC) then
  Application.CreateForm(TFinputMasterEDC, FinputMasterEDC);
  FinputMasterEDC.Show;
  FinputMasterEDC.idEdc := '';
end;

procedure TFmasterEDC.btnHapusClick(Sender: TObject);
begin
  DelDb(
        dm.Q1,'masteredc',
        GetVal(dm.QEDC,'namamesin'),
        'idedc',GetVal(dm.QEDC,'idedc')
  );

  LoadData;
end;

procedure TFmasterEDC.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFmasterEDC.btnUbahClick(Sender: TObject);
begin
  if not Assigned(FinputMasterEDC) then
  Application.CreateForm(TFinputMasterEDC, FinputMasterEDC);
  with FinputMasterEDC do  begin

     idEdc                := GetVal(dm.QEDC,'idedc');
     EMesin.Text          := GetVal(dm.QEDC,'namamesin');
     EKartuDebet.Text     := GetVal(dm.QEDC,'kartudebet');
     ESucharge.Text       := GetVal(dm.QEDC,'sucharge');

     Show;
  end;
end;

procedure TFmasterEDC.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = 13  then
  begin
    btnUbah.Click;
  end;
end;

procedure TFmasterEDC.F2Click(Sender: TObject);
begin
  LoadData;

end;

procedure TFmasterEDC.F3Click(Sender: TObject);
begin
  LoadData;

end;

procedure TFmasterEDC.FormCreate(Sender: TObject);
begin
  FmasterEDC := Self;
end;

procedure TFmasterEDC.FormShow(Sender: TObject);

begin
  LoadData;
end;

procedure TFmasterEDC.LoadData;
begin
  ExQry(dm.QEDC,SQLEdc,True);
  sbr1.Panels[1].Text := IntToStr(dm.QEDC.RecordCount)+' Data';
end;

procedure TFmasterEDC.R1Click(Sender: TObject);
begin
  LoadData;
end;

end.
