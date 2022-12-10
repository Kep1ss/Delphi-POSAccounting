unit uDataReturPembelian;

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
  uEngine, uOvEdit, cxCalc, cxCurrencyEdit, dxSkiniMaginary,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFdataReturPembelian = class(TForm)
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
    cxgrd1DBTableView1kodebarang: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1harga: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    cxgrd1DBTableView1diskonpersen: TcxGridDBColumn;
    cxgrd1DBTableView1diskonrupiah: TcxGridDBColumn;
    cxgrd1DBTableView1ppn: TcxGridDBColumn;
    cxgrd1DBTableView1subtotal: TcxGridDBColumn;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    btnHapus: TcxButton;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLReturBeli = ' SELECT                                '+
                     '     rb.nobukti,                       '+
                     '     rb.tgl,                           '+
                     '     rb.nobuktibeli,                   '+
                     '     s.namasupplier,                   '+
                     '     rb.total,                         '+
                     '     rb.keterangan                     '+
                     '   FROM                                '+
                     '     returpembelian rb                 '+
                     '     LEFT JOIN pembelian p             '+
                     '       ON p.`nobukti` = rb.`nobuktibeli` '+
                     '     LEFT JOIN m_supplier s              '+
                     '       ON s.`idsupplier` = p.`idsupplier` ';

    _SQLDetailReturBeli = ' SELECT                '+
                          '    dr.nobukti,        '+
                          '    dr.kodebarang,     '+
                          '    b.kodebarcode,     '+
                          '    b.namabarang,      '+
                          '    dr.satuan,         '+
                          '    dr.harga,          '+
                          '    dr.jumlah,         '+
                          '    dr.diskonpersen,   '+
                          '    dr.diskonrupiah,   '+
                          '    dr.ppn,            '+
                          '    dr.subtotal,       '+
                          '    dr.isi,            '+
                          '    dr.idgudang        '+
                          '  FROM                 '+
                          '    detailreturbeli dr '+
                          '    LEFT JOIN barang b '+
                          '      ON dr.`kodebarang` = b.`kodebarang` ';

    { Public declarations }
  end;

var
  FdataReturPembelian: TFdataReturPembelian;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm, uReturBeliNew;

procedure TFdataReturPembelian.btnBaruClick(Sender: TObject);
begin
  Freturbelinew.TampilAwal;
  Freturbelinew.ShowModal;
end;

procedure TFdataReturPembelian.btnHapusClick(Sender: TObject);
var
  Bkp : Real;
  nonBkp : real;
  TotalBatal : Real;
begin
  if MessageDlg('Apakah yakin anda akan mengapus data transaksi?',mtWarning,[mbYes,mbNo],0)  =mrYes then
  begin
    ExQry(dm.Q1,'SELECT * FROM detailreturbeli WHERE nobukti="'+GetVal(dtrx.QReturBeli,'nobukti')+'"',True);
    Bkp := 0;
    nonBkp := 0;
    TotalBatal := 0;
    while dm.Q1.Eof = False do begin

        ExQry(dm.Q2,'UPDATE detailbeli SET retur=retur-'+GetVal(dm.Q1,'jumlah')+' '+
        ' WHERE kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" '+
        ' AND nobukti="'+GetVal(dtrx.QReturBeli,'nobuktibeli')+'"',False);


        ExQry(dm.Q3,'SELECT bkp FROM barang WHERE kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" ',True);


        if GetValBol(dm.Q3,'bkp') = True then begin
           Bkp := Bkp + (GetValF(dm.Q1,'subtotal'));

        end else
           nonBkp := nonBkp+ (GetValF(dm.Q1,'subtotal'));
        TotalBatal := TotalBatal + GetValF(dm.Q1,'subtotal');
        dm.Q1.Next;
    end;


    ExQry(dm.Q3,'UPDATE hutang SET hutang.hutang=hutang.hutang+"'+StrToDecimal(FloatToStr(TotalBatal))+'", '+
    ' kekurangan=hutang.hutang-dibayar,'+
    ' nominalbkp=nominalbkp+"'+StrToDecimal(FloatToStr(Bkp))+'",'+
    ' nominalnonbkp=nominalnonbkp+"'+StrToDecimal(FloatToStr(nonBkp ))+'" '+
    ' WHERE nobukti="'+GetVal(dtrx.QReturBeli,'nobuktibeli')+'"',False);



    ExQry(dm.Q3,'DELETE FROM saldoakun WHERE nobukti="'+GetVal(dtrx.QReturBeli,'nobukti')+'"',False);
    ExQry(dm.Q3,'delete from kartustok where nobukti="'+GetVal(dtrx.QReturBeli,'nobukti')+'"',False);
    ExQry(dm.Q3,'delete from detailreturbeli where nobukti="'+GetVal(dtrx.QReturBeli,'nobukti')+'"',False);
    ExQry(dm.Q3,'delete from returpembelian where nobukti="'+GetVal(dtrx.QReturBeli,'nobukti')+'"',False);
    ExQry(dtrx.QReturBeli,SQLreturbeli+' WHERE rb.tgl>="'+Tanggal(dt1.Date)+'" AND rb.tgl<="'+Tanggal(dt2.Date)+'"',True);
  end;

end;

procedure TFdataReturPembelian.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdataReturPembelian.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  dtrx.Qdetailreturbeli.Active := False;
  dtrx.Qdetailreturbeli.Active := True;
end;

procedure TFdataReturPembelian.Dt1PropertiesCloseUp(Sender: TObject);
begin
  ExQry(dtrx.QReturBeli,SQLreturbeli+' WHERE rb.tgl>="'+Tanggal(dt1.Date)+'" AND rb.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataReturPembelian.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

procedure TFdataReturPembelian.FormShow(Sender: TObject);
begin
  ExQry(dtrx.QReturBeli,SQLreturbeli+' WHERE rb.tgl>="'+Tanggal(dt1.Date)+'" AND rb.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

end.
