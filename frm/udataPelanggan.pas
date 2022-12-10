unit udataPelanggan;

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
  TFdataPelanggan = class(TForm)
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
    cxGrid1DBTableView1kodepelanggan: TcxGridDBColumn;
    cxGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxGrid1DBTableView1alamat: TcxGridDBColumn;
    cxGrid1DBTableView1kota: TcxGridDBColumn;
    cxGrid1DBTableView1notelpon: TcxGridDBColumn;
    cxGrid1DBTableView1jenis: TcxGridDBColumn;
    cxGrid1DBTableView1maxpiutang: TcxGridDBColumn;
    cxGrid1DBTableView1top: TcxGridDBColumn;
    cxGrid1DBTableView1poin: TcxGridDBColumn;
    cxGrid1DBTableView1namasales: TcxGridDBColumn;
    btngantiSales: TcxButton;
    btnHistoryPoin: TcxButton;
    btnRedemPoin: TcxButton;
    btnHistoryTukarPoin: TcxButton;
    I1: TMenuItem;
    cxlbl1: TcxLabel;
    G2: TMenuItem;
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
    procedure btngantiSalesClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnHistoryPoinClick(Sender: TObject);
    procedure btnRedemPoinClick(Sender: TObject);
    procedure btnHistoryTukarPoinClick(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure G2Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadData;
    { Public declarations }
  end;
  const
    _SQLpelanggan ='SELECT                                '+
                     '     p.idpelanggan,                   '+
                     '     p.kodepelanggan,                 '+
                     '     p.namapelanggan,                 '+
                     '     p.alamat,                        '+
                     '     p.kota,                          '+
                     '     p.notelpon,                      '+
                     '     P.idjenispelanggan,              '+
                     '     jp.jenis,                        '+
                     '     p.maxpiutang,                    '+
                     '     p.metodepiutang,                    '+
                     '     p.top ,                          '+
                     '     p.poin,                          '+
                     '     p.maxjmlinvoice,                 '+
                     '     s.kodesales,                     '+
                     '     s.namasales,                     '+
                     '     p.idsales                        '+
                     '   FROM                               '+
                     '     pelanggan p                      '+
                     '     LEFT JOIN jenispelanggan jp      '+
                     '       ON p.`idjenispelanggan` = jp.`idjenispelanggan` '+
                     '     LEFT JOIN sales s                                 '+
                     '       ON s.idsales=p.idsales                          ';

var
  FdataPelanggan: TFdataPelanggan;

implementation

{$R *.dfm}

uses uinputpelanggan, uDlaporan, uGantiSales, uHistoryPoinPelanggan, uRedemPoin,
  uHistoryPenukaranPoin, uImportPelanggan, uGantiJenisHarga;

procedure TFdataPelanggan.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FinputPelanggan) then
  Application.CreateForm(TFinputPelanggan, FinputPelanggan);

  Finputpelanggan.Show;
  FinputPelanggan.TampilanAwal;
  FinputPelanggan.CanEdit := False;
end;

procedure TFdataPelanggan.btngantiSalesClick(Sender: TObject);
begin
  if not Assigned(FGantiSales) then
  Application.CreateForm(TFGantiSales, FGantiSales);
  FGantiSales.Show;
end;

procedure TFdataPelanggan.btnHapusClick(Sender: TObject);
begin
  ExQry(dm.Q1,'SELECT idpelanggan FROM penjualan WHERE idpelanggan="'+GetVal(dm.QPelanggan,'idpelanggan')+'"',True);

  if not dm.Q1.IsEmpty then begin
     if MessageDlg('Pelanggan sudah melakukan transaksi !!, '+#13+'Jika dihapus di data penjualan kolom pelanggan akan kosong '+#13#13+'Apakah yakin akan menghapus ? ',mtWarning,[mbYes,mbNo],0) = mrYes then
     begin
        DelDb(
        dm.Q1,'pelanggan',
        GetVal(dm.Qpelanggan,'namapelanggan'),
        'idpelanggan',GetVal(dm.Qpelanggan,'idpelanggan')
          );

          LoadData;
     end;

  end else begin
    DelDb(
        dm.Q1,'pelanggan',
        GetVal(dm.Qpelanggan,'namapelanggan'),
        'idpelanggan',GetVal(dm.Qpelanggan,'idpelanggan')
          );

          LoadData;
  end;

end;

procedure TFdataPelanggan.btnHistoryPoinClick(Sender: TObject);
begin
  if not Assigned(FHistoryPoin) then
  Application.CreateForm(TFHistoryPoin, FHistoryPoin);
  FHistoryPoin.LnamaPelanggan.Caption := GetVal(dm.QPelanggan,'namapelanggan')+' | '+GetVal(dm.QPelanggan,'kodepelanggan');
  FHistoryPoin.ShowModal;
end;

procedure TFdataPelanggan.btnHistoryTukarPoinClick(Sender: TObject);
begin
  if not Assigned(FhistoryPenukaranPoin) then
  Application.CreateForm(TFhistoryPenukaranPoin, FhistoryPenukaranPoin);
  FhistoryPenukaranPoin.LnamaPelanggan.Caption := GetVal(dm.QPelanggan,'namapelanggan')+' | '+GetVal(dm.QPelanggan,'kodepelanggan');
  FhistoryPenukaranPoin.ShowModal;
end;

procedure TFdataPelanggan.btnRedemPoinClick(Sender: TObject);
begin
  if not Assigned(FRedemPoin) then
  Application.CreateForm(TFRedemPoin, FRedemPoin);
  FRedemPoin.TampilAwal;
  FRedemPoin.ShowModal;
end;

procedure TFdataPelanggan.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataPelanggan.btnUbahClick(Sender: TObject);
begin
  if not Assigned(FinputPelanggan) then
  Application.CreateForm(TFinputPelanggan, FinputPelanggan);
  with Finputpelanggan do  begin
    CanEdit := True;

     idpelanggan           := GetVal(dm.Qpelanggan,'idpelanggan');
     Ekodepelanggan.Text   := GetVal(dm.Qpelanggan,'kodepelanggan');
     Enamapelanggan.Text   := GetVal(dm.Qpelanggan,'namapelanggan');
     EAlamat.Text          := GetVal(dm.Qpelanggan,'alamat');
     Ekota.Text            := GetVal(dm.Qpelanggan,'kota');
     Enotelpon.Text        := GetVal(dm.Qpelanggan,'notelpon');
     EmaxPiutang.Text      := GetVal(dm.Qpelanggan,'maxpiutang');
     ETOP.Text             := GetVal(dm.Qpelanggan,'top');
     cbSales.ItemIndex     := idxCmb(cbSales,GetValInt(dm.QPelanggan,'idsales'));
     cbJenisPelanggan.ItemIndex := idxCmb(cbJenisPelanggan,GetValInt(dm.QPelanggan,'idjenispelanggan'));


     Show;
  end;
end;

procedure TFdataPelanggan.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13  then
  begin
    btnUbah.Click;
  end;
end;

procedure TFdataPelanggan.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Color := clBlack;
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
end;

procedure TFdataPelanggan.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text := 'Pencarian Nama pelanggan atau kota';
  EPencarian.Style.Font.Color := clGray;
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
end;

procedure TFdataPelanggan.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.Qpelanggan,_SQLpelanggan+' WHERE namapelanggan like "%'+EPencarian.Text+'%"',True);
end;

procedure TFdataPelanggan.F2Click(Sender: TObject);
begin
  LoadData;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frPelanggan.fr3');
  Dlaporan.Fr1.ShowReport();
end;

procedure TFdataPelanggan.F3Click(Sender: TObject);
begin
  LoadData;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frPelanggan.fr3');
  Dlaporan.Fr1.PrepareReport(TRue);
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFdataPelanggan.FormCreate(Sender: TObject);
begin
  Fdatapelanggan := Self;
end;

procedure TFdataPelanggan.FormShow(Sender: TObject);

begin
  LoadData;
end;

procedure TFdataPelanggan.G2Click(Sender: TObject);
begin
  FGantiJenisHarga.ShowModal;
end;

procedure TFdataPelanggan.I1Click(Sender: TObject);
begin
  if not Assigned(FimportDataPelanggan) then
  Application.CreateForm(TFimportDataPelanggan, FimportDataPelanggan);
  FimportDataPelanggan.ShowModal;
end;

procedure TFdataPelanggan.LoadData;
begin
  ExQry(dm.Qpelanggan,_SQLpelanggan,True);
  sbr1.Panels[1].Text := IntToStr(dm.Qpelanggan.RecordCount)+' Data';
end;

procedure TFdataPelanggan.R1Click(Sender: TObject);
begin
  LoadData;
end;

end.
