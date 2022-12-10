unit uDataLokasi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,uComCtrl,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,DateUtils,
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
  TFdataLokasi = class(TForm)
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
    cxGrid1DBTableView1namalokasi: TcxGridDBColumn;
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
    _SQLlokasi = 'SELECT * from lokasi';

var
  FdataLokasi: TFdataLokasi;

implementation

{$R *.dfm}

uses uInputlokasi, udm, uSettingAkes;

procedure TFdataLokasi.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FinputLokasi) then
  Application.CreateForm(TFinputLokasi, FinputLokasi);
  FInputlokasi.Show;
  CanEdit := False;
end;

procedure TFdataLokasi.btnHapusClick(Sender: TObject);
begin

  ExQry(dm.Q1,'SELECT SUM(saldoawal+masuk-keluar) as stok FROM kartustok '+
  ' WHERE idgudang="'+GetVal(dm.QLokasi,'idlokasi')+'" '+
  ' AND MONTH(tgl)="'+IntToStr(MonthOf(now))+'" '+
  ' AND YEAR(tgl)="'+IntToStr(YearOf(now))+'"',True);

  if GetValInt(dm.Q1,'stok') > 0 then begin
     Error('Gudang tidak bisa dihapus, silahkan kosongkan stok terlebih dahulu');
     Exit;
  end else begin

    DelDb(
          dm.Q1,'lokasi',
          GetVal(dm.Qlokasi,'namalokasi'),
          'idlokasi',GetVal(dm.Qlokasi,'idlokasi')
    );

   LoadData;
  end;
end;

procedure TFdataLokasi.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataLokasi.btnUbahClick(Sender: TObject);
begin
  CanEdit := True;
  if not Assigned(FinputLokasi) then
  Application.CreateForm(TFinputLokasi, FinputLokasi);
  with FInputlokasi do  begin
    Enamalokasi.Text      := GetVal(dm.Qlokasi,'namalokasi');
    idLokasi              := GetVal(dm.QLokasi,'idlokasi');

    Show;
  end;
end;

procedure TFdataLokasi.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
  EPencarian.Style.Font.Color := clBlack;
end;

procedure TFdataLokasi.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text := 'Ketikan Nama lokasi';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
  EPencarian.Style.Font.Color := clGray;
end;

procedure TFdataLokasi.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.Qlokasi,_SQLlokasi+' WHERE namalokasi like"%'+EPencarian.Text+'%"',True);
end;

procedure TFdataLokasi.F2Click(Sender: TObject);
begin
  LoadData;
  
end;

procedure TFdataLokasi.F3Click(Sender: TObject);
begin
  LoadData;

end;

procedure TFdataLokasi.FormCreate(Sender: TObject);
begin
  FDatalokasi := Self;
end;

procedure TFdataLokasi.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFdataLokasi.LoadData;
begin
  ExQry(dm.Qlokasi,_SQLlokasi,True);
  sbr1.Panels[1].Text := IntToStr(dm.Qlokasi.RecordCount)+' Data';
end;

end.
