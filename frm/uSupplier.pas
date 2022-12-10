unit uSupplier;

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
  TFdataSupplier = class(TForm)
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
    cxGrid1DBTableView1kodesupplier: TcxGridDBColumn;
    cxGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxGrid1DBTableView1namapemilik: TcxGridDBColumn;
    cxGrid1DBTableView1alamat: TcxGridDBColumn;
    cxGrid1DBTableView1kota: TcxGridDBColumn;
    cxGrid1DBTableView1notelpon: TcxGridDBColumn;
    cxGrid1DBTableView1norek: TcxGridDBColumn;
    cxGrid1DBTableView1namabank: TcxGridDBColumn;
    I1: TMenuItem;
    cxlbl1: TcxLabel;
    cxGrid1DBTableView1ispajak: TcxGridDBColumn;
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
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure I1Click(Sender: TObject);
  private
    { Private declarations }
  public

    procedure LoadData;
    { Public declarations }
  end;
  const
    _SQLSupplier = ' SELECT * FROM m_supplier';
var
  FdataSupplier: TFdataSupplier;

implementation

{$R *.dfm}

uses uinputSupplier, uDlaporan, uImportSupplier;

procedure TFdataSupplier.btnBaruClick(Sender: TObject);
begin
  if not Assigned(Finputsupplier) then
  Application.CreateForm(TFinputsupplier, Finputsupplier);
  Finputsupplier.Show;
  Finputsupplier.idSupplier := '';
  Finputsupplier.EkodeSupplier.Text := GetCode(dm.Q2,'m_supplier','kodesupplier','SP');
  Finputsupplier.CanEdit := False;
end;

procedure TFdataSupplier.btnHapusClick(Sender: TObject);
begin

  ExQry(dm.Q1,'SELECT idsupplier FROM pembelian WHERE idsupplier="'+GetVal(dm.Qsupplier,'idsupplier')+'" ',True);

  if dm.Q1.IsEmpty = False then begin
      if MessageDlg('Data supplier sudah digunakan untuk transaksi !!,'+#13+'Jika dihapus kolom namabarang di transaksi akan kosong'+#13+#13+'Apakah yakin akan menghapus Barang?',mtWarning,[mbYes,mbNo],0)=mrYes then
      begin

       DelDb(
        dm.Q1,'m_supplier',
        GetVal(dm.QSupplier,'namasupplier'),
        'idsupplier',GetVal(dm.QSupplier,'idsupplier')
        );

        LoadData;

      end;
  end else
  begin
    DelDb(
        dm.Q1,'m_supplier',
        GetVal(dm.QSupplier,'namasupplier'),
        'idsupplier',GetVal(dm.QSupplier,'idsupplier')
    );

    LoadData;
  end;

end;

procedure TFdataSupplier.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataSupplier.btnUbahClick(Sender: TObject);
begin
  if not Assigned(Finputsupplier) then
  Application.CreateForm(TFinputsupplier, Finputsupplier);
  with Finputsupplier do  begin
     CanEdit := True;
     idSupplier           := GetVal(dm.QSupplier,'idsupplier');
     EkodeSupplier.Text   := GetVal(dm.QSupplier,'kodesupplier');
     EnamaSupplier.Text   := GetVal(dm.QSupplier,'namasupplier');
     Enamapemilik.Text    := GetVal(dm.QSupplier,'namapemilik');
     EAlamat.Text         := GetVal(dm.QSupplier,'alamat');
     Ekota.Text           := GetVal(dm.QSupplier,'kota');
     Enotelpon.Text       := GetVal(dm.QSupplier,'notelpon');
     Enorekening.Text     := GetVal(dm.QSupplier,'norek');
     Enamabank.Text       := GetVal(dm.QSupplier,'namabank');
     cPajak.Checked       := GetValBol(dm.QSupplier,'pajak');


     Show;
  end;
end;

procedure TFdataSupplier.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = 13  then
  begin
    btnUbah.Click;
  end;
end;

procedure TFdataSupplier.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Color := clBlack;
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
end;

procedure TFdataSupplier.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text := 'Pencarian Nama supplier atau kota';
  EPencarian.Style.Font.Color := clGray;
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
end;

procedure TFdataSupplier.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dm.QSupplier,_SQLSupplier+' WHERE namasupplier like "%'+EPencarian.Text+'%"',True);
end;

procedure TFdataSupplier.F2Click(Sender: TObject);
begin
  LoadData;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frSupplier.fr3');
  Dlaporan.Fr1.ShowReport();
end;

procedure TFdataSupplier.F3Click(Sender: TObject);
begin
  LoadData;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frSupplier.fr3');
  Dlaporan.Fr1.PrepareReport(TRue);
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFdataSupplier.FormCreate(Sender: TObject);
begin
  FdataSupplier := Self;
end;

procedure TFdataSupplier.FormShow(Sender: TObject);

begin
  LoadData;
end;

procedure TFdataSupplier.I1Click(Sender: TObject);
begin
  if not Assigned(FimportSupplier) then
  Application.CreateForm(TFimportSupplier, FimportSupplier);
  FimportSupplier.Showmodal;
end;

procedure TFdataSupplier.LoadData;
begin
  ExQry(dm.QSupplier,_SQLSupplier,True);
  sbr1.Panels[1].Text := IntToStr(dm.QSupplier.RecordCount)+' Data';
end;

procedure TFdataSupplier.R1Click(Sender: TObject);
begin
  LoadData;
end;

end.
