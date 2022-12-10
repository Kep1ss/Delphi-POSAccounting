unit uDataSalesOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, uComCtrl, uctrlFrm,
  dxSkiniMaginary, cxCurrencyEdit, uEngine, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
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
  TFdataSalesOrder = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Dt1: TcxDateEdit;
    Label2: TLabel;
    dt2: TcxDateEdit;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnTutup: TcxButton;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1harga: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    cxgrd1DBTableView1diskonpersen: TcxGridDBColumn;
    cxgrd1DBTableView1diskonrupiah: TcxGridDBColumn;
    cxgrd1DBTableView1subtotal: TcxGridDBColumn;
    cxgGrid1DBTableView1nosalesorder: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1namasales: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxgGrid1DBTableView1pembayaran: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLsalesorder = ' SELECT                                      '+
                      '      so.idsalesorder,                       '+
                      '      so.nosalesorder,                       '+
                      '      so.tgl,                                '+
                      '      s.namasales,                           '+
                      '      pl.namapelanggan,                      '+
                      '      so.pembayaran                          '+
                      '    FROM                                     '+
                      '      salesorder so                          '+
                      '      LEFT JOIN sales s                      '+
                      '        ON so.`idsales` = s.`idsales`        '+
                      '      LEFT JOIN pelanggan pl                 '+
                      '        ON pl.`idpelanggan` = so.`idpelanggan` ';


    _SQLdetailSalesOrder = ' SELECT                                       '+
                           '       ds.iddetailsales,                      '+
                           '       ds.nosalesorder,                       '+
                           '       ds.kodebarang,                         '+
                           '       b.namabarang,                          '+
                           '       ds.satuan,                             '+
                           '       ds.jumlah,                             '+
                           '       ds.isi,                                '+
                           '       ds.idgudang                            '+
                           '     FROM                                     '+
                           '       detailsalesorder ds                    '+
                           '       LEFT JOIN barang b                     '+
                           '         ON b.`kodebarang` = ds.`kodebarang`  ';

    { Public declarations }
  end;

var
  FdataSalesOrder: TFdataSalesOrder;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm, uMainMenu;

procedure TFdataSalesOrder.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFdataSalesOrder.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  dtrx.QSalesOrderDetail.Active := False;
  dtrx.QSalesOrderDetail.Active := True;
end;

procedure TFdataSalesOrder.Dt1PropertiesCloseUp(Sender: TObject);

begin

  ExQry(dtrx.Qsalesorder,SQLsalesorder+' WHERE so.tgl>="'+Tanggal(dt1.Date)+'" '+
                      ' AND so.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataSalesOrder.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  ExQry(dtrx.Qsalesorder,SQLsalesorder+' WHERE so.tgl like"%'+EPencarian.Text+'%" '+
                                     ' or so.namapelanggan like"%'+EPencarian.Text+'%"',True);
end;

procedure TFdataSalesOrder.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

end.
