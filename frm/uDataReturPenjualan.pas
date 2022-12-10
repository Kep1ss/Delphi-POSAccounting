unit uDataReturPenjualan;

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
  TFdataReturPenjualan = class(TForm)
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
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    cxgrd1Level1: TcxGridLevel;
    cxgrd1DBTableView1: TcxGridDBTableView;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1tgl: TcxGridDBColumn;
    cxgGrid1DBTableView1nobuktijual: TcxGridDBColumn;
    cxgGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    cxgGrid1DBTableView1total: TcxGridDBColumn;
    cxgGrid1DBTableView1keterangan: TcxGridDBColumn;
    cxgrd1DBTableView1kodebarcode: TcxGridDBColumn;
    cxgrd1DBTableView1namabarang: TcxGridDBColumn;
    cxgrd1DBTableView1satuan: TcxGridDBColumn;
    cxgrd1DBTableView1harga: TcxGridDBColumn;
    cxgrd1DBTableView1jumlah: TcxGridDBColumn;
    cxgrd1DBTableView1diskonpersen: TcxGridDBColumn;
    cxgrd1DBTableView1diskonrupiah: TcxGridDBColumn;
    cxgrd1DBTableView1subtotal: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    const
      SQLReturJual = ' SELECT                                   '+
                     '     rb.nobukti,                          '+
                     '     rb.tgl,                              '+
                     '     rb.nobuktijual,                      '+
                     '     s.namapelanggan,                     '+
                     '     rb.total,                            '+
                     '     rb.keterangan                        '+
                     '   FROM                                   '+
                     '     returpenjualan rb                    '+
                     '     LEFT JOIN penjualan p                '+
                     '       ON p.`fakturjual` = rb.`nobuktijual` '+
                     '     LEFT JOIN pelanggan s                  '+
                     '       ON s.`idpelanggan` = rb.`idpelanggan` ';

    _SQLDetailReturjUal = ' SELECT                                  '+
                          '      dr.nobukti,                        '+
                          '      dr.kodebarang,                     '+
                          '      b.kodebarcode,                     '+
                          '      b.namabarang,                      '+
                          '      dr.satuan,                         '+
                          '      dr.harga,                          '+
                          '      dr.jumlah,                         '+
                          '      dr.diskonpersen,                   '+
                          '      dr.diskonrupiah,                   '+
                          '      dr.subtotal,                       '+
                          '      dr.isi,                            '+
                          '      dr.idgudang                        '+
                          '    FROM                                 '+
                          '      detailreturjual dr                 '+
                          '      LEFT JOIN barang b                 '+
                          '        ON dr.`kodebarang` = b.`kodebarang`';

    { Public declarations }
  end;

var
  FdataReturPenjualan: TFdataReturPenjualan;

implementation

{$R *.dfm}

uses uDtrx, uPembelian, udm, uDlaporan, uReturPenjualan, uReturPenjualannew;

procedure TFdataReturPenjualan.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FreturJualNew) then
     Application.CreateForm(TFreturJualNew,FreturJualNew);
  FreturJualNew.TampilAwal;
  FreturJualNew.ShowModal;
end;

procedure TFdataReturPenjualan.btnHapusClick(Sender: TObject);
var
  bkp : real;
  NonBkp : Real;
  TotalBatal : Real;
begin
if MessageDlg('Apakah yakin anda akan mengapus data transaksi?',mtWarning,[mbYes,mbNo],0)  =mrYes then
  begin

    ExQry(dm.Q1,'SELECT * FROM detailreturjual WHERE nobukti="'+GetVal(dtrx.QreturJual,'nobukti')+'"',True);
    Bkp := 0;
    nonBkp := 0;
    TotalBatal := 0;
    while dm.Q1.Eof = False do begin

        ExQry(dm.Q2,'UPDATE penjualandetil SET jumlahretur=jumlahretur-'+GetVal(dm.Q1,'jumlah')+' '+
        ' WHERE kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" '+
        ' AND fakturjual="'+GetVal(dtrx.QreturJual,'nobuktijual')+'"',False);


        ExQry(dm.Q3,'SELECT bkp FROM barang WHERE kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" ',True);


        if GetValBol(dm.Q3,'bkp') = True then begin
           Bkp := Bkp + (GetValF(dm.Q1,'subtotal'));

        end else
           nonBkp := nonBkp+ (GetValF(dm.Q1,'subtotal'));
        TotalBatal := TotalBatal + GetValF(dm.Q1,'subtotal');
        dm.Q1.Next;
    end;

    ExQry(dm.Q3,'UPDATE piutang SET piutang.piutang=piutang.piutang+"'+StrToDecimal(FloatToStr(TotalBatal))+'", '+
    ' kekurangan=piutang.piutang-dibayar,'+
    ' nominalbkp=nominalbkp+"'+StrToDecimal(FloatToStr(Bkp))+'",'+
    ' nominalnonbkp=nominalnonbkp+"'+StrToDecimal(FloatToStr(nonBkp ))+'" '+
    ' WHERE fakturjual="'+GetVal(dtrx.QreturJual,'nobuktijual')+'"',False);

    ExQry(dm.Q3,'delete from kartustok where nobukti="'+GetVal(dtrx.QReturjual,'nobukti')+'"',False);
    ExQry(dm.Q3,'delete from detailreturjual where nobukti="'+GetVal(dtrx.QReturjual,'nobukti')+'"',False);
    ExQry(dm.Q3,'delete from returpenjualan where nobukti="'+GetVal(dtrx.QReturjual,'nobukti')+'"',False);
    ExQry(dm.Q3,'delete from rekapjualretur where nobukti="'+GetVal(dtrx.QReturjual,'nobukti')+'"',False);
    ExQry(dm.Q3,'delete from saldoakun where nobukti="'+GetVal(dtrx.QReturjual,'nobukti')+'"',False);
    ExQry(dtrx.QReturjual,SQLReturJual+' WHERE rb.tgl>="'+Tanggal(dt1.Date)+'" AND rb.tgl<="'+Tanggal(dt2.Date)+'"',True);
  end;

end;

procedure TFdataReturPenjualan.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFdataReturPenjualan.cxButton1Click(Sender: TObject);
begin
  ExQry(Dlaporan.QreturJual,' SELECT                                    '+
                                '    rb.nobukti,                            '+
                                '    rb.tgl,                                '+
                                '    rb.nobuktijual,                        '+
                                '    s.namapelanggan,                       '+
                                '    rb.total,                              '+
                                '    rb.keterangan                          '+
                                '  FROM                                     '+
                                '    returpenjualan rb                      '+
                                '    LEFT JOIN penjualan p                  '+
                                '      ON p.`fakturjual` = rb.`nobuktijual` '+
                                '    LEFT JOIN pelanggan s                  '+
                                '      ON s.`idpelanggan` = rb.`idpelanggan` '+
                                ' WHERE rb.nobukti="'+GetVal(Dtrx.Qreturjual,'nobukti')+'"',True);
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\notareturjual.fr3');
   Dlaporan.Fr1.ShowReport();
end;

procedure TFdataReturPenjualan.cxgGrid1DBTableView1DataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  AAllow := True;
  dtrx.Qdetailreturjual.Active := False;
  dtrx.Qdetailreturjual.Active := True;
end;

procedure TFdataReturPenjualan.Dt1PropertiesCloseUp(Sender: TObject);
begin
  ExQry(dtrx.QReturjual,SQLReturJual+' WHERE rb.tgl>="'+Tanggal(dt1.Date)+'" AND rb.tgl<="'+Tanggal(dt2.Date)+'"',True);
end;

procedure TFdataReturPenjualan.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

      ExQry(dtrx.QReturjual,SQLReturJual+' WHERE s.namapelanggan LIKE "%'+Epencarian.Text+'%"',True);
  end;
end;

procedure TFdataReturPenjualan.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
end;

end.
