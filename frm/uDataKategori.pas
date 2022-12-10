unit uDataKategori;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,uComCtrl,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, Vcl.StdCtrls, cxButtons, cxTextEdit, cxGroupBox, dxSkinsCore, Vcl.Menus, dxSkinsdxStatusBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, Vcl.ImgList, uEngine, uctrlFrm,
  dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxCalc, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageList;

type
  TFDataKategori = class(TForm)
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
    cxGrid1DBTableView1namakategori: TcxGridDBColumn;
    I1: TMenuItem;
    cxlbl1: TcxLabel;
    cxGrid1DBTableView1margin: TcxGridDBColumn;
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
    procedure I1Click(Sender: TObject);
  private
    { Private declarations }
  public
    CanEdit : Boolean;
    procedure LoadData;
    { Public declarations }
  end;
  const
    _SQLKategori = 'SELECT * from kategori';

var
  FDataKategori: TFDataKategori;

implementation

{$R *.dfm}

uses uInputKategori, udm, uSettingAkes, uImportKategori;

procedure TFDataKategori.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FinputKategori) then
  Application.CreateForm(TFinputKategori, FinputKategori);

  FInputKategori.Show;
  CanEdit := False;
end;

procedure TFDataKategori.btnHapusClick(Sender: TObject);
begin

  ExQry(dm.Q1,' SELECT idkategori FROM barang WHERE idkategori="'+GetVal(dm.QKategori,'idkategori')+'" LIMIT 1',True);

  if not dm.Q1.IsEmpty then begin
     if MessageDlg('Kategori sudah digunakan di data barang !!, '+#13+'Jika dihapus data barang kolom kategori akan kosong. '+#13#13+'Apakah yakin ? ',mtWarning,[mbYes,mbNo],0)=mrYes  then
     begin
        DelDb(
        dm.Q1,'Kategori',
        GetVal(dm.QKategori,'namakategori'),
        'idKategori',GetVal(dm.QKategori,'idKategori')
        );
        LoadData;
     end;
  end else begin
      DelDb(
            dm.Q1,'Kategori',
            GetVal(dm.QKategori,'namakategori'),
            'idKategori',GetVal(dm.QKategori,'idKategori')
      );

      LoadData;
  end;
end;

procedure TFDataKategori.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFDataKategori.btnUbahClick(Sender: TObject);
begin
  CanEdit := True;
  if not Assigned(FinputKategori) then
  Application.CreateForm(TFinputKategori, FinputKategori);
  with FInputKategori do  begin
    EKategoriname.Text      := GetVal(dm.QKategori,'namakategori');
    EMargin.Text            := GetVal(dm.QKategori,'margin');
    idkategori              := GetVal(dm.QKategori,'idkategori');
    Show;
  end;
end;

procedure TFDataKategori.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
  EPencarian.Style.Font.Color := clBlack;
end;

procedure TFDataKategori.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text := 'Ketikan Nama Kategori';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
  EPencarian.Style.Font.Color := clGray;
end;

procedure TFDataKategori.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.Qkategori,_SQLKategori+' WHERE namakategori like"%'+EPencarian.Text+'%"',True);
end;

procedure TFDataKategori.F2Click(Sender: TObject);
begin
  LoadData;
  
end;

procedure TFDataKategori.F3Click(Sender: TObject);
begin
  LoadData;

end;

procedure TFDataKategori.FormCreate(Sender: TObject);
begin
  FDataKategori := Self;
end;

procedure TFDataKategori.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFDataKategori.I1Click(Sender: TObject);
begin
  if not Assigned(FimportKategori) then
  Application.CreateForm(TFimportKategori, FimportKategori);
  FimportKategori.ShowModal;
end;

procedure TFDataKategori.LoadData;
begin
  ExQry(dm.Qkategori,_SQLKategori,True);
  sbr1.Panels[1].Text := IntToStr(dm.QKategori.RecordCount)+' Data';
end;

end.
