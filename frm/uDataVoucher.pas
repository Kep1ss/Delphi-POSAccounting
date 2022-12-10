unit uDataVoucher;

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
  dxSkinXmas2008Blue;

type
  TFDataVoucher = class(TForm)
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
    C1: TMenuItem;
    T2: TMenuItem;
    F1: TMenuItem;
    img1: TcxImageList;
    cxGrid1DBTableView1kodevoucher: TcxGridDBColumn;
    cxGrid1DBTableView1namavoucher: TcxGridDBColumn;
    cxGrid1DBTableView1nominal: TcxGridDBColumn;
    cxGrid1DBTableView1tglexpired: TcxGridDBColumn;
    cxGrid1DBTableView1aktif: TcxGridDBColumn;
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
    _SQLvoucher = 'SELECT * from voucher';

var
  FDataVoucher: TFDataVoucher;

implementation

{$R *.dfm}

uses uInputvoucher, udm, uSettingAkes;

procedure TFDataVoucher.btnBaruClick(Sender: TObject);
begin
  FInputvoucher.Show;
  CanEdit := False;
end;

procedure TFDataVoucher.btnHapusClick(Sender: TObject);
begin
  DelDb(
        dm.Q1,'voucher',
        GetVal(dm.Qvoucher,'namavoucher'),
        'idvoucher',GetVal(dm.Qvoucher,'idvoucher')
  );

  LoadData;
end;

procedure TFDataVoucher.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFDataVoucher.btnUbahClick(Sender: TObject);
begin
  CanEdit := True;
  with FinputVoucher do  begin
    Ekodevoucher.Text   := GetVal(dm.Qvoucher,'kodevoucher');
    Enamavoucher.Text   := GetVal(dm.Qvoucher,'namavoucher');
    Enominal.text       := GetValR(dm.Qvoucher,'nominal');
    dt1.Date            := GetValDate(dm.Qvoucher,'tglexpired');
    idVoucher           := GetVal(dm.Qvoucher,'idvoucher');
    Show;
  end;
end;

procedure TFDataVoucher.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
  EPencarian.Style.Font.Color := clBlack;
end;

procedure TFDataVoucher.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text := 'Ketikan Nama voucher';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
  EPencarian.Style.Font.Color := clGray;
end;

procedure TFDataVoucher.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.Qvoucher,_SQLvoucher+' WHERE namavoucher like"%'+EPencarian.Text+'%"',True);
end;

procedure TFDataVoucher.F2Click(Sender: TObject);
begin
  LoadData;
  
end;

procedure TFDataVoucher.F3Click(Sender: TObject);
begin
  LoadData;

end;

procedure TFDataVoucher.FormCreate(Sender: TObject);
begin
  FDatavoucher := Self;
end;

procedure TFDataVoucher.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFDataVoucher.LoadData;
begin
  ExQry(dm.Qvoucher,_SQLvoucher,True);
  sbr1.Panels[1].Text := IntToStr(dm.Qvoucher.RecordCount)+' Data';
end;

end.
