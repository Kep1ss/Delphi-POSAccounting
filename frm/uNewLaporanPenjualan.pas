unit uNewLaporanPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, cxButtons,
  cxCheckBox, cxGroupBox, frxClass, frxPreview, RzButton, Vcl.ExtCtrls, sPanel,
  uComCtrl, udm, uDlaporan, uctrlFrm, dxSkinTheBezier;

type
  TFNewLaporanPenjualan = class(TForm)
    sPanel3: TsPanel;
    RzBitBtn5: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    frxPreview4: TfrxPreview;
    cxGroupBox3: TcxGroupBox;
    Label2: TLabel;
    C7: TcxCheckBox;
    btn4: TcxButton;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btn5: TcxButton;
    C12: TcxCheckBox;
    cbPembayaran: TComboBox;
    C1: TcxCheckBox;
    procedure btn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNewLaporanPenjualan: TFNewLaporanPenjualan;

implementation

{$R *.dfm}

procedure TFNewLaporanPenjualan.btn5Click(Sender: TObject);
begin
  with Dlaporan.QlapPenjualan do begin
      Close;
      SQL.Text :=' SELECT                                       '+
                 '     p.fakturjual AS fakturjual,              '+
                 '     p.tgljual AS tgljual,                    '+
                 '     pl.namapelanggan AS namapelanggan,       '+
                 '     (CASE WHEN p.pembayaran=0 THEN "CASH" ELSE "KREDIT" END) AS pembayaran,'+
                 '     p.diskon AS diskon,                                                    '+
                 '     p.ppn as ppn,                                                          '+
                 '     SUM((d.harga * (d.jumlah - d.jumlahretur)) -d.diskonrupiah) as total,'+
                 '     SUM((d.harga * (d.jumlah - d.jumlahretur)) -d.diskonrupiah) as grantotal,'+
                 '     u.namalengkap AS namapegawai,                                          '+
                 '     (CASE WHEN p.bayar>=p.grandtotal THEN 0 ELSE p.bayar END)  AS bayar,   '+
                 '     (CASE WHEN p.pembayaran=1 THEN p.grandtotal-p.bayar ELSE 0 END) as piutang, '+
                 '     p.kembali AS kembali,                                                       '+
                 '     s.namasales as namasales                                                    '+
                 '   FROM                                                                          '+
                 '     penjualan p   LEFT JOIN penjualandetil d ON d.fakturjual=p.fakturjual       '+
                 '     LEFT JOIN pelanggan pl                                                      '+
                 '       ON pl.`idpelanggan` = p.`idpelanggan`                                     '+
                 '     LEFT JOIN m_user u                                                          '+
                 '       ON u.`iduser` = p.`iduser`                                              '+
                 '   LEFT JOIN sales s ON s.idsales=p.idsales where idjual > 0 ';

      if C7.Checked then
         SQL.Add(' AND p.tgljual>= "'+Tanggal(dtp1.DateTime)+'" '+
         ' and p.tgljual<="'+Tanggal(dtp2.DateTime)+'" ') else
         SQL.Add(' AND p.tgljual>= "'+Tanggal(now)+'" ');
      if (C12.Checked) then begin
         if cbPembayaran.ItemIndex = 0 then
           SQL.Add(' AND p.pembayaran in (0,1) ') else
           SQL.Add(' AND p.pembayaran='+intToStr(cbPembayaran.ItemIndex -1)+' ')
      end;
      SQL.Add(' GROUP BY p.fakturjual ');
      Open;
  end;
  if C1.Checked then
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\lappenjualan.fr3') else begin
    Dlaporan.Fr1.LoadFromFile(aPathRpt+'\lappenjualankasir.fr3');
    FMemo(Dlaporan.Fr1,'Ljudul').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dtp1.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dtp2.Date);
  end;


  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview4;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFNewLaporanPenjualan.FormCreate(Sender: TObject);
begin
  FNewLaporanPenjualan := Self;
end;

procedure TFNewLaporanPenjualan.FormShow(Sender: TObject);
begin
  dtp1.Date := now;
  dtp2.Date := now;
end;

procedure TFNewLaporanPenjualan.RzBitBtn5Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(true);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  frxPreview4.Print;
end;

procedure TFNewLaporanPenjualan.RzBitBtn6Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(true);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  frxPreview4.Export(Dlaporan.frxls1);
end;

end.
