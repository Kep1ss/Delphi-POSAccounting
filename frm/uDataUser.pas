unit uDataUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, Vcl.StdCtrls, cxButtons, cxTextEdit, cxGroupBox, dxSkinsCore, Vcl.Menus, dxSkinsdxStatusBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, Vcl.ImgList, uEngine, uctrlFrm,
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
  dxSkinXmas2008Blue, cxLabel;

type
  TFDataUser = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
    btnSetting: TcxButton;
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
    cxGrid1DBTableView1username: TcxGridDBColumn;
    cxGrid1DBTableView1namalengkap: TcxGridDBColumn;
    cxGrid1DBTableView1level: TcxGridDBColumn;
    cxGrid1DBTableView1pwd: TcxGridDBColumn;
    cxlbl1: TcxLabel;
    procedure btnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure F3Click(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
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
    _SQLuser = 'SELECT * from m_user';

var
  FDataUser: TFDataUser;

implementation

{$R *.dfm}

uses uInputUser, udm, uSettingAkes, uMainMenu;

procedure TFDataUser.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FInputUser) then
  Application.CreateForm(TFInputUser, FInputUser);
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'], FInputUser.cbGudangbeli);
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],FInputUser.cbgudangjual);
  ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
  ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);
  FInputUser.cbKasPembelian.Properties.Items.Clear;
  FInputUser.cbKasPenjualan.Properties.Items.Clear;
  while not dm.Q2.Eof do begin
    FInputUser.cbKasPembelian.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    FInputUser.cbKasPenjualan.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    dm.Q2.Next;
  end;
  FInputUser.Show;
  CanEdit := False;
end;

procedure TFDataUser.btnHapusClick(Sender: TObject);
begin
  DelDb(
        dm.Q1,'m_user',
        GetVal(dm.Quser,'username'),
        'iduser',GetVal(dm.Quser,'iduser')
  );

  LoadData;
end;

procedure TFDataUser.btnSettingClick(Sender: TObject);
begin
  FsetingAkses.L1.Caption := GetVal(dm.QUser,'username');
  FsetingAkses.CheckBox1.Checked := GetValBol(dm.QUser,'showHarga');
  FsetingAkses.c1.Checked        := GetValBol(dm.QUser,'editharga');
  FsetingAkses.L2.Caption := GetVal(dm.QUser,'level');
  idUser                  := GetVal(dm.QUser,'iduser');
  FsetingAkses.Show;
end;

procedure TFDataUser.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFDataUser.btnUbahClick(Sender: TObject);
begin
  CanEdit := True;
  if not Assigned(FInputUser) then
  Application.CreateForm(TFInputUser, FInputUser);
  with FInputUser do  begin

    FInputUser.idUser  := GetVal(dm.QUser,'iduser');
    isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudangbeli);
    isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbgudangjual);
    ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
    ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);
    cbKasPembelian.Properties.Items.Clear;
    cbKasPenjualan.Properties.Items.Clear;
    while not dm.Q2.Eof do begin
      cbKasPembelian.Properties.Items.Add(
      GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
      GetVal(dm.Q2,'namaakunperkiraan'));
      cbKasPenjualan.Properties.Items.Add(
      GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
      GetVal(dm.Q2,'namaakunperkiraan'));
      dm.Q2.Next;
    end;
    EUsername.Text          := GetVal(dm.QUser,'username');
    EnamaLengkap.Text       := GetVal(dm.QUser,'namalengkap');
    cbLevel.Text            := GetVal(dm.QUser,'level');
    cbgudangbeli.ItemIndex  := idxCmb(cbgudangbeli,GetValInt(dm.QUser,'gudang_beli'));
    cbgudangjual.ItemIndex  := idxCmb(cbgudangjual,GetValInt(dm.QUser,'gudang_jual'));
    cbKasPembelian.ItemIndex := cbKasPembelian.Properties.Items.IndexOf(GetVal(dm.Quser,'kas_pembelian'));
    cbKasPenjualan.ItemIndex := cbKasPenjualan.Properties.Items.IndexOf(GetVal(dm.Quser,'kas_penjualan'));
    C3.Checked               := GetValBol(dm.QUser,'penjualan_only');
    Show;
  end;
end;

procedure TFDataUser.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
  EPencarian.Style.Font.Color := clBlack;
end;

procedure TFDataUser.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text := 'Ketikan Nama User';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
  EPencarian.Style.Font.Color := clGray;
end;

procedure TFDataUser.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.QUser,_SQLuser+' WHERE namalengkap like"%'+EPencarian.Text+'%"',True);
end;

procedure TFDataUser.F2Click(Sender: TObject);
begin
  LoadData;
  
end;

procedure TFDataUser.F3Click(Sender: TObject);
begin
  LoadData;

end;

procedure TFDataUser.FormCreate(Sender: TObject);
begin
  FDataUser := Self;
  if not Assigned(FInputUser) then
     Application.CreateForm(TFInputUser, FInputUser);
end;

procedure TFDataUser.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFDataUser.LoadData;
begin
  if Fmain.sbr1.Panels[4].Text <> 'SUPER ADMIN' then
     ExQry(dm.QUser,_SQLuser+ ' WHERE level not in ("SUPER ADMIN")',True)
  else
     ExQry(dm.QUser,_SQLuser,True);
  sbr1.Panels[1].Text := IntToStr(dm.QUser.RecordCount)+' Data';
end;

end.
