unit upendingsalesorder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  Vcl.StdCtrls, cxGroupBox, cxCurrencyEdit, uctrlFrm, uComCtrl, Vcl.Menus,
  cxButtons, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinBlack,
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
  TFpendingSO = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGroupBox1: TcxGroupBox;
    cxg3: TcxGrid;
    cxg1: TcxGridDBTableView;
    cxg2: TcxGridLevel;
    btnOk: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    cxg1nosalesorder: TcxGridDBColumn;
    cxg1tgljual: TcxGridDBColumn;
    cxg1namapelanggan: TcxGridDBColumn;
    cxg1pembayaran: TcxGridDBColumn;
    cxg1namalengkap: TcxGridDBColumn;
    cxg1namasales: TcxGridDBColumn;
    cxgcGrid1DBTableView1kodebarang: TcxGridDBColumn;
    cxgcGrid1DBTableView1namabarang: TcxGridDBColumn;
    cxgcGrid1DBTableView1satuan: TcxGridDBColumn;
    cxgcGrid1DBTableView1jumlah: TcxGridDBColumn;
    cxgcGrid1DBTableView1isi: TcxGridDBColumn;
    procedure cxg1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxg1DblClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxg1CanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure cxg1SelectionChanged(Sender: TcxCustomGridTableView);
    procedure EPencarianEnter(Sender: TObject);
    procedure EPencarianExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FpendingSO: TFpendingSO;

implementation

{$R *.dfm}

uses uDtrx, uEngine, udm, uSalesOrder;

procedure TFpendingSO.btnHapusClick(Sender: TObject);
begin
  ExQry(dm.Q1,'DELETE FROM pendingso',False);
  ExQry(dm.Q1,'DELETE FROM pendingsodetail',False);
  dtrx.QpendingSO.Active := False;
  dtrx.QpendingSO.Active := True;
end;

procedure TFpendingSO.btnOkClick(Sender: TObject);
begin
  cxg1DblClick(Sender);
end;

procedure TFpendingSO.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFpendingSO.cxg1CanSelectRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
  AAllow := TRue;
end;

procedure TFpendingSO.cxg1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ExQry(dtrx.QPendingSoDetail,' SELECT                           '+
                              '        sd.iddetil,               '+
                              '        sd.nosalesorder,          '+
                              '        sd.kodebarang,            '+
                              '        b.namabarang,             '+
                              '        sd.satuan,                '+
                              '        sd.jumlah,                '+
                              '        sd.isi,                   '+
                              '        sd.idgudang               '+
                              '     FROM                         '+
                              '        pendingsodetail sd        '+
                              '        LEFT JOIN barang b        '+
                              '          ON b.`kodebarang` = sd.`kodebarang` '+
                             ' WHERE sd.nosalesorder="'+GetVal(dtrx.QpendingSO,'nosalesorder')+'"',True);

end;

procedure TFpendingSO.cxg1DblClick(Sender: TObject);
var
  i:integer;
  key : Word;
begin
  Key := 13;
  FsalesOrder.bersihkanGrid;
  FsalesOrder.sg1.RowCount :=2;
  ExQry(Dtrx.QPendingSoDetail,' SELECT                           '+
                              '        sd.iddetil,               '+
                              '        sd.nosalesorder,          '+
                              '        sd.kodebarang,            '+
                              '        b.kodebarcode,            '+
                              '        b.namabarang,             '+
                              '        sd.satuan,                '+
                              '        sd.jumlah,                '+
                              '        sd.isi,                   '+
                              '        sd.idgudang               '+
                              '     FROM                         '+
                              '        pendingsodetail sd        '+
                              '        LEFT JOIN barang b        '+
                              '          ON b.`kodebarang` = sd.`kodebarang` '+
                             ' WHERE sd.nosalesorder="'+GetVal(dtrx.QpendingSO,'nosalesorder')+'"',True);
  i:=0;
  FsalesOrder.sg1.RowCount := Dtrx.QPendingSoDetail.RecordCount +2;
  while Dtrx.QPendingSoDetail.Eof = False do
  begin
    with FsalesOrder do
    begin
       sg1.Cells[0,i+1]:= Inttostr(dtrx.QPendingSoDetail.RecNo);
       sg1.Cells[1,i+1]:= GetVal(dtrx.QPendingSoDetail,'kodebarcode');
       sg1.Cells[2,i+1]:= GetVal(dtrx.QPendingSoDetail,'namabarang');
       sg1.Cells[3,i+1]:= GetVal(dtrx.QPendingSoDetail,'satuan');
       sg1.Cells[4,i+1]:= GetValR(dtrx.QPendingSoDetail,'jumlah');
       sg1.Cells[5,i+1]:= GetValR(dtrx.QPendingSoDetail,'isi');
       inc(i);
       Dtrx.QPendingSoDetail.Next;
    end;
  end;
  sNota := GetVal(dtrx.QpendingSO,'nosalesorder');
 // ShowMessage(sNota);
  FsalesOrder.Enobukti.Text   := GetCode(dm.Q1,'salesorder','nosalesorder','SS'+setIdKom);
  FsalesOrder.ENamaCust.Text  := GetVal(dtrx.QpendingSO,'namapelanggan');
  FsalesOrder.EkodeCust.Text  := GetVal(dtrx.QpendingSO,'kodepelanggan');
  FsalesOrder.cbsales.ItemIndex  := idxCmb(FsalesOrder.cbsales,GetValInt(dtrx.QpendingSO,'idsales'));
  FsalesOrder.EscanBarcode.Text := GetVal(dtrx.QpendingSO,'kodepelanggan');
  FsalesOrder.EscanBarcode.OnKeyDown(Sender,Key,[]);
  FsalesOrder.Focus;
  Close;
end;

procedure TFpendingSO.cxg1SelectionChanged(
  Sender: TcxCustomGridTableView);
begin
  ExQry(dtrx.QPendingSoDetail,' SELECT                           '+
                              '        sd.iddetil,               '+
                              '        sd.nosalesorder,          '+
                              '        sd.kodebarang,            '+
                              '        b.namabarang,             '+
                              '        sd.satuan,                '+
                              '        sd.jumlah,                '+
                              '        sd.isi,                   '+
                              '        sd.idgudang               '+
                              '     FROM                         '+
                              '        pendingsodetail sd        '+
                              '        LEFT JOIN barang b        '+
                              '          ON b.`kodebarang` = sd.`kodebarang` '+
                             ' WHERE sd.nosalesorder="'+GetVal(dtrx.QpendingSO,'nosalesorder')+'"',True);
end;

procedure TFpendingSO.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text :='';
  EPencarian.Style.Font.Style :=   EPencarian.Style.Font.Style - [fsItalic];
  EPencarian.Style.Font.Color := clBlack;
end;

procedure TFpendingSO.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text :='NO Faktur atau nama pelanggan';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
  EPencarian.Style.Font.Color := clGrayText;
end;

procedure TFpendingSO.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
     ExQry(dtrx.QpendingSO, ' SELECT                             '+
                             '     po.idjual,                     '+
                             '     po.nosalesorder,               '+
                             '     po.tgljual,                    '+
                             '     po.idpelanggan,                '+
                             '     pl.kodepelanggan,              '+
                             '     pl.namapelanggan,              '+
                             '     po.pembayaran,                 '+
                             '     po.iduser,                     '+
                             '     u.namalengkap,                 '+
                             '     po.komputerid,                 '+
                             '     po.idsales,                    '+
                             '     s.namasales                    '+
                             '   FROM                             '+
                             '     pendingso po                   '+
                             '     LEFT JOIN pelanggan pl         '+
                             '       ON pl.`idpelanggan` = po.`idpelanggan`  '+
                             '     LEFT JOIN m_user u                        '+
                             '       ON u.`iduser` = po.`iduser`             '+
                             '     LEFT JOIN sales s                         '+
                             '       ON s.`idsales` = po.`idsales`'+
                             '  where  pl.namapelanggan LIKE "%'+Epencarian.Text+'%" '+
                       ' OR po.nosalesorder like"%'+Epencarian.Text+'%"',True);

  end;
end;

procedure TFpendingSO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    cxg1DblClick(Sender);
  end;
end;

procedure TFpendingSO.FormShow(Sender: TObject);
begin
  ExQry(dtrx.QpendingSO,'   SELECT                             '+
                             '     po.idjual,                     '+
                             '     po.nosalesorder,               '+
                             '     po.tgljual,                    '+
                             '     po.idpelanggan,                '+
                             '     pl.kodepelanggan,              '+
                             '     pl.namapelanggan,              '+
                             '     po.pembayaran,                 '+
                             '     po.iduser,                     '+
                             '     u.namalengkap,                 '+
                             '     po.komputerid,                 '+
                             '     po.idsales,                    '+
                             '     s.namasales                    '+
                             '   FROM                             '+
                             '     pendingso po                   '+
                             '     LEFT JOIN pelanggan pl         '+
                             '       ON pl.`idpelanggan` = po.`idpelanggan`  '+
                             '     LEFT JOIN m_user u                        '+
                             '       ON u.`iduser` = po.`iduser`             '+
                             '     LEFT JOIN sales s                         '+
                             '       ON s.`idsales` = po.`idsales`'+
                             '  where  '+
                             '    po.tgljual="'+tanggal(Now)+'" ',True);
  dtrx.QPendingSoDetail.Active := False;
  cxg3.SetFocus;
end;

end.
