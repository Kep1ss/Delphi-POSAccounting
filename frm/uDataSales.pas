unit uDataSales;

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
  dxSkinMoneyTwins, cxCurrencyEdit, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageList;

type
  TFdataSales = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
    G3: TcxGroupBox;
    btnBaru: TcxButton;
    btnUbah: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    btnPrint: TcxButton;
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
    cxgcGrid1DBTableView1kodesales: TcxGridDBColumn;
    cxgcGrid1DBTableView1namasales: TcxGridDBColumn;
    cxgcGrid1DBTableView1alamat: TcxGridDBColumn;
    cxgcGrid1DBTableView1kota: TcxGridDBColumn;
    cxgcGrid1DBTableView1notelpon: TcxGridDBColumn;
    cxGrid1DBTableView1target: TcxGridDBColumn;
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
    procedure R1Click(Sender: TObject);
  private
    { Private declarations }
  public
    CanEdit : Boolean;
    procedure LoadData;
    { Public declarations }
  end;
  const
    _SQLsales = ' SELECT * FROM sales';
var
  FdataSales: TFdataSales;

implementation

{$R *.dfm}

uses uinputsales, uDlaporan;

procedure TFdataSales.btnBaruClick(Sender: TObject);
begin
  if not Assigned(Finputsales) then
  Application.CreateForm(TFinputsales, Finputsales);
  Finputsales.Show;
  Finputsales.Ekodesales.Text := GetCode(dm.Q2,'sales','kodesales','SP');
  CanEdit := False;
end;

procedure TFdataSales.btnHapusClick(Sender: TObject);
begin
  DelDb(
        dm.Q1,'sales',
        GetVal(dm.Qsales,'namasales'),
        'idsales',GetVal(dm.Qsales,'idsales')
  );

  LoadData;
end;

procedure TFdataSales.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataSales.btnUbahClick(Sender: TObject);
begin
  CanEdit := True;
  if not Assigned(Finputsales) then
  Application.CreateForm(TFinputsales, Finputsales);
  with Finputsales do  begin

     idsales           := GetVal(dm.Qsales,'idsales');
     Ekodesales.Text   := GetVal(dm.Qsales,'kodesales');
     Enamasales.Text   := GetVal(dm.Qsales,'namasales');
     EAlamat.Text         := GetVal(dm.Qsales,'alamat');
     Ekota.Text           := GetVal(dm.Qsales,'kota');
     Enotelpon.Text       := GetVal(dm.Qsales,'notelpon');


     Show;
  end;
end;

procedure TFdataSales.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Color := clBlack;
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
end;

procedure TFdataSales.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text := 'Pencarian Nama sales atau kota';
  EPencarian.Style.Font.Color := clGray;
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
end;

procedure TFdataSales.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.Qsales,_SQLsales+' WHERE namasales like "%'+EPencarian.Text+'%"',True);
end;

procedure TFdataSales.F2Click(Sender: TObject);
begin
  LoadData;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frsales.fr3');
  Dlaporan.Fr1.ShowReport();
end;

procedure TFdataSales.F3Click(Sender: TObject);
begin
  LoadData;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frsales.fr3');
  Dlaporan.Fr1.PrepareReport(TRue);
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFdataSales.FormCreate(Sender: TObject);
begin
  Fdatasales := Self;
end;

procedure TFdataSales.FormShow(Sender: TObject);

begin
  LoadData;
end;

procedure TFdataSales.LoadData;
begin
  ExQry(dm.Qsales,_SQLsales,True);
  sbr1.Panels[1].Text := IntToStr(dm.Qsales.RecordCount)+' Data';
end;

procedure TFdataSales.R1Click(Sender: TObject);
begin
  LoadData;
end;

end.
