unit uDataSatuan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, Vcl.StdCtrls, cxButtons, cxTextEdit, cxGroupBox, dxSkinsCore, Vcl.Menus, dxSkinsdxStatusBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, Vcl.ImgList, uEngine, uctrlFrm,
  dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel;
type
  TFdataSatuan = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
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
    cxGrid1DBTableView1namasatuan: TcxGridDBColumn;
    cxlbl1: TcxLabel;
    procedure btnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure F3Click(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPencarianEnter(Sender: TObject);
    procedure EPencarianExit(Sender: TObject);
  private
    { Private declarations }
  public
    CanEdit : Boolean;
    procedure LoadData;
    { Public declarations }
  end;
  const
    _SQLsatuan = 'SELECT * from satuan';

var
  FdataSatuan: TFdataSatuan;

implementation

{$R *.dfm}

uses uInputsatuan, udm, uSettingAkes;

procedure TFdataSatuan.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FinputSatuan) then
  Application.CreateForm(TFinputSatuan, FinputSatuan);
  FInputsatuan.Show;
  CanEdit := False;
end;

procedure TFdataSatuan.btnHapusClick(Sender: TObject);
begin
  DelDb(
        dm.Q1,'satuan',
        GetVal(dm.Qsatuan,'namasatuan'),
        'idsatuan',GetVal(dm.Qsatuan,'idsatuan')
  );

  LoadData;
end;

procedure TFdataSatuan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataSatuan.btnUbahClick(Sender: TObject);
begin
  CanEdit := True;
  if not Assigned(FinputSatuan) then
  Application.CreateForm(TFinputSatuan, FinputSatuan);
  with FInputsatuan do  begin
    Enamasatuan.Text      := GetVal(dm.Qsatuan,'namasatuan');
    idSatuan              := GetVal(dm.Qsatuan,'idsatuan');
    Show;
  end;
end;

procedure TFdataSatuan.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
  EPencarian.Style.Font.Color := clBlack;
end;

procedure TFdataSatuan.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text := 'Ketikan Nama satuan';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
  EPencarian.Style.Font.Color := clGray;
end;

procedure TFdataSatuan.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.Qsatuan,_SQLsatuan+' WHERE namasatuan like"%'+EPencarian.Text+'%"',True);
end;

procedure TFdataSatuan.F2Click(Sender: TObject);
begin
  LoadData;
  
end;

procedure TFdataSatuan.F3Click(Sender: TObject);
begin
  LoadData;

end;

procedure TFdataSatuan.FormCreate(Sender: TObject);
begin
  FDatasatuan := Self;
end;

procedure TFdataSatuan.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFdataSatuan.LoadData;
begin
  ExQry(dm.Qsatuan,_SQLsatuan,True);
  sbr1.Panels[1].Text := IntToStr(dm.Qsatuan.RecordCount)+' Data';
end;

end.
