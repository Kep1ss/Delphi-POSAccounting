unit uDataKomputerKasir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, Vcl.StdCtrls, cxButtons, cxTextEdit, cxGroupBox, dxSkinsCore, Vcl.Menus, dxSkinsdxStatusBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, Vcl.ImgList, uEngine, uctrlFrm,
  dxSkiniMaginary, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageList;
type
  TFdataMasterKomputer = class(TForm)
    G2: TcxGroupBox;
    sbr1: TdxStatusBar;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    G3: TcxGroupBox;
    btnBaru: TcxButton;
    btnUbah: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    pm1: TPopupMenu;
    T1: TMenuItem;
    U1: TMenuItem;
    H1: TMenuItem;
    N1: TMenuItem;
    img1: TcxImageList;
    cxGrid1DBTableView1namakomputer: TcxGridDBColumn;
    cxlbl1: TcxLabel;
    procedure btnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure F3Click(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);

  private
    { Private declarations }
  public
    CanEdit : Boolean;
    procedure LoadData;
    { Public declarations }
  end;
  const
    _SQLkomputer = 'SELECT * from komputer';

var
  FdataMasterKomputer: TFdataMasterKomputer;

implementation

{$R *.dfm}

uses  udm, uSettingAkes, uInputKomputer;

procedure TFdataMasterKomputer.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FInputkomputer) then
  Application.CreateForm(TFInputkomputer, FInputkomputer);
  FInputkomputer.Show;
  CanEdit := False;
end;

procedure TFdataMasterKomputer.btnHapusClick(Sender: TObject);
begin
  DelDb(
        dm.Q1,'komputer',
        GetVal(dm.Qkomputer,'namakomputer'),
        'idkomputer',GetVal(dm.Qkomputer,'idkomputer')
  );

  LoadData;
end;

procedure TFdataMasterKomputer.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataMasterKomputer.btnUbahClick(Sender: TObject);
begin
  CanEdit := True;
  if not Assigned(FInputkomputer) then
  Application.CreateForm(TFInputkomputer, FInputkomputer);
  with FInputkomputer do  begin
    EnamaKomputer.Text      := GetVal(dm.Qkomputer,'namakomputer');

    Show;
  end;
end;




procedure TFdataMasterKomputer.F2Click(Sender: TObject);
begin
  LoadData;
  
end;

procedure TFdataMasterKomputer.F3Click(Sender: TObject);
begin
  LoadData;

end;

procedure TFdataMasterKomputer.FormCreate(Sender: TObject);
begin
  FdataMasterKomputer := Self;
end;

procedure TFdataMasterKomputer.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFdataMasterKomputer.LoadData;
begin
  ExQry(dm.Qkomputer,_SQLkomputer,True);
  sbr1.Panels[1].Text := IntToStr(dm.Qkomputer.RecordCount)+' Data';
end;

end.
