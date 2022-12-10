unit uLapPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2007Blue,
  dxSkinOffice2010Blue, dxSkinTheAsphaltWorld, Vcl.Menus, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, dxRibbonSkins, dxSkinsdxRibbonPainter, cxClasses,
  dxRibbon, dxBar, dxRibbonMiniToolbar, frxClass, frxExportXLS, frxPreview,
  cxPC, Vcl.StdCtrls, cxButtons, cxCheckListBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxGroupBox, RzButton, Vcl.ExtCtrls, sPanel,
  Vcl.CheckLst, Vcl.ComCtrls, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinMcSkin, uComCtrl, uctrlFrm,
  dxSkiniMaginary, uEngine, dxBarBuiltInMenu, dxSkinOffice2016Colorful,
  dxSkinSharp, dxSkinMoneyTwins, cxRadioGroup, Vcl.Buttons, sBitBtn, sComboBox,
  sCheckBox, sLabel, sGroupBox, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart, frxExportBaseDialog,DateUtils, frxDBSet,
  Data.DB, MemDS, DBAccess, MyAccess, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFlapPenjualan = class(TForm)
    pg1: TcxPageControl;
    tbPenjualan: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    lbl1: TLabel;
    Cperiode: TcxCheckBox;
    Cpelanggan: TcxCheckBox;
    btn1: TcxButton;
    ls: TCheckListBox;
    C1: TcxCheckBox;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    frxPreview1: TfrxPreview;
    Pn1: TsPanel;
    btn: TRzBitBtn;
    btn2: TRzBitBtn;
    frxXLSExport1: TfrxXLSExport;
    tb1: TcxTabSheet;
    tb3: TcxTabSheet;
    sPanel1: TsPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    cxGroupBox2: TcxGroupBox;
    cxButton1: TcxButton;
    dtTahun: TDateTimePicker;
    Frv1: TfrxPreview;
    frxXLSExport2: TfrxXLSExport;
    sPanel2: TsPanel;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    frxPreview2: TfrxPreview;
    G1: TcxGroupBox;
    lbl2: TLabel;
    C3: TcxCheckBox;
    btn3: TcxButton;
    C5: TcxCheckBox;
    dt3: TDateTimePicker;
    dt4: TDateTimePicker;
    C4: TcxCheckBox;
    CkBox1: TCheckListBox;
    cxTabSheet4: TcxTabSheet;
    sPanel6: TsPanel;
    RzBitBtn11: TRzBitBtn;
    RzBitBtn12: TRzBitBtn;
    fr6: TfrxPreview;
    cxGroupBox6: TcxGroupBox;
    Label5: TLabel;
    cxCheckBox6: TcxCheckBox;
    btn8: TcxButton;
    dtp7: TDateTimePicker;
    dtp8: TDateTimePicker;
    btn9: TcxButton;
    frxXLSExport3: TfrxXLSExport;
    frxXLSExport4: TfrxXLSExport;
    navLapBarangPelanggan: TcxTabSheet;
    sPanel8: TsPanel;
    RzBitBtn15: TRzBitBtn;
    RzBitBtn16: TRzBitBtn;
    cxGroupBox8: TcxGroupBox;
    Label7: TLabel;
    C6: TcxCheckBox;
    btn12: TcxButton;
    dtp11: TDateTimePicker;
    dtp12: TDateTimePicker;
    btn13: TcxButton;
    frxPreview3: TfrxPreview;
    ECariBarangPelanggan: TcxTextEdit;
    CbBarangPelanggan: TCheckListBox;
    navLapOmsetPenjualan: TcxTabSheet;
    navLapJualPelangganBySales: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    Label2: TLabel;
    C7: TcxCheckBox;
    btn4: TcxButton;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btn5: TcxButton;
    frx5: TfrxPreview;
    sPanel4: TsPanel;
    RzBitBtn7: TRzBitBtn;
    RzBitBtn8: TRzBitBtn;
    cxGroupBox4: TcxGroupBox;
    Label3: TLabel;
    C8: TcxCheckBox;
    btn6: TcxButton;
    dtp3: TDateTimePicker;
    dtp4: TDateTimePicker;
    btn7: TcxButton;
    Cb2: TCheckListBox;
    cxTabSheet1: TcxTabSheet;
    C9: TcxCheckBox;
    R1: TcxRadioButton;
    R2: TcxRadioButton;
    C10: TcxCheckBox;
    C11: TcxCheckBox;
    dbcht1: TDBChart;
    Series1: TBarSeries;
    sGroupBox2: TsGroupBox;
    L1: TsLabel;
    L3: TsLabel;
    chk1: TsCheckBox;
    dtp5: TDateTimePicker;
    dtp6: TDateTimePicker;
    cbtop: TsComboBox;
    sBitBtn1: TsBitBtn;
    RzBitBtn9: TRzBitBtn;
    cb3: TsComboBox;
    L2: TsLabel;
    sPanel3: TsPanel;
    RzBitBtn5: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    frxPreview4: TfrxPreview;
    CKasir: TcxCheckBox;
    Cb1: TCheckListBox;
    C12: TcxCheckBox;
    cbPembayaran: TComboBox;
    C13: TcxCheckBox;
    btnPrintLapKasir: TcxButton;
    Label1: TLabel;
    cbBulan: TComboBox;
    Label4: TLabel;
    frxReport1: TfrxReport;
    QOmset: TMyQuery;
    frOmset: TfrxDBDataset;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CperiodeClick(Sender: TObject);
    procedure CpelangganClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure lsClickCheck(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure C5Click(Sender: TObject);
    procedure CkBox1ClickCheck(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure RzBitBtn9Click(Sender: TObject);
    procedure RzBitBtn10Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure RzBitBtn14Click(Sender: TObject);
    procedure CbBarangPelangganClickCheck(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure C10Click(Sender: TObject);
    procedure C11Click(Sender: TObject);
    procedure Cb2ClickCheck(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure cb3Change(Sender: TObject);
    procedure RzBitBtn7Click(Sender: TObject);
    procedure RzBitBtn15Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn11Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure CKasirClick(Sender: TObject);
    procedure pg1Change(Sender: TObject);
    procedure C13Click(Sender: TObject);
    procedure Cb1ClickCheck(Sender: TObject);
    procedure btnPrintLapKasirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlapPenjualan: TFlapPenjualan;
  stk1,stk2 : string;
  str : string;

implementation

{$R *.dfm}

uses UDlaporan, udm, uMainMenu, uDtrx;

procedure TFlapPenjualan.btn13Click(Sender: TObject);
begin

  with Dlaporan.Qlapbarangpelanggan do begin
    Close;
    SQL.Text :=' SELECT                                   '+
               '       p.fakturjual,                      '+
               '       p.tgljual,                         '+
               '       p.idpelanggan,                     '+
               '       pl.namapelanggan,                  '+
               '       dj.kodebarang,                     '+
               '       b.namabarang,                      '+
               '       dj.satuan,                         '+
               '       SUM(dj.jumlah) AS jumlah,          '+
               '       dj.harga,                          '+
               '       SUM(dj.subtotal) AS subtotal       '+
               '     FROM                                 '+
               '       penjualan p                        '+
               '       LEFT JOIN penjualandetil dj        '+
               '         ON dj.`fakturjual` = p.`fakturjual`  '+
               '       LEFT JOIN pelanggan pl                 '+
               '         ON p.`idpelanggan` = pl.`idpelanggan`'+
               '       LEFT JOIN barang b                     '+
               '         ON b.`kodebarang` = dj.`kodebarang` '+
               '   WHERE p.idjual >=1 ';
    if Cperiode.Checked then
       SQL.Add(' AND p.tgljual>= "'+Tanggal(dtp11.DateTime)+'" '+
       ' and p.tgljual<="'+Tanggal(dtp12.DateTime)+'" ');
    if (str <> '') then
       SQL.Add(' AND b.namabarang in ('+str+') ');

    if R1.Checked then
       SQL.Add(' GROUP BY dj.kodebarang ORDER BY SUM(dj.jumlah) DESC  ')
    else
       SQL.Add(' GROUP BY dj.kodebarang ORDER BY SUM(dj.subtotal) DESC  ');
    Open;
  end;

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapBarangPelanggan.fr3');
  FMemo(Dlaporan.Fr1,'Ljudul').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dtp11.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dtp12.Date);

  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview3;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapPenjualan.btn1Click(Sender: TObject);


begin


  with Dlaporan.QLabPelanggan do begin
    Close;
    SQL.Text :=' SELECT                                                                 '+
               '       pl.kodepelanggan,                                                '+
               '       pl.namapelanggan,                                                '+
               '       IFNULL(SUM(                                                             '+
               '         (d.subtotal/d.jumlah) * (d.jumlah - d.jumlahretur)        '+
               '       ),0) AS totalomset,                                                 '+
               '       IFNULL(SUM(d.hpp * (d.jumlah - d.jumlahretur)),0) AS totalhpp,             '+
               '       IFNULL(SUM(                                                             '+
               '         ((d.subtotal/d.jumlah) - d.hpp) * (d.jumlah - d.jumlahretur)  '+
               '       ),0) AS totalprofit                                                     '+
               '       FROM                                                                 '+
               '       penjualan p                                                          '+
               '       LEFT JOIN penjualandetil d                                           '+
               '         ON p.`fakturjual` = d.`fakturjual`                                 '+
               '       LEFT JOIN pelanggan pl                                               '+
               '         ON pl.`idpelanggan` = p.`idpelanggan` ';

    if Cperiode.Checked then
       SQL.Add('WHERE  p.tgljual>= "'+Tanggal(dt1.DateTime)+'" '+
       ' and p.tgljual<="'+Tanggal(dt2.DateTime)+'" ');

    if (Cpelanggan.Checked) and (str <> '') then
       SQL.Add(' AND pl.namapelanggan in ('+str+') ');

    SQL.Add('GROUP BY p.`idpelanggan` ORDER BY totalprofit DESC');
    Open;
  end;


  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLabaPerPelanggan.fr3');
  FMemo(Dlaporan.Fr1,'Lperiode').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dt1.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dt2.Date);


  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapPenjualan.btn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapPenjualan.btn3Click(Sender: TObject);
begin
  with Dlaporan.Qlappenjualansales do begin
    Close;
    SQL.Text :=' SELECT                                              '+
               '       p.tgljual,                                    '+
               '       p.fakturjual,                                 '+
               '       s.namasales,                                  '+
               '       SUM(                                          '+
               '         (pd.subtotal/pd.jumlah) * (pd.jumlah - pd.jumlahretur)     '+
               '       ) AS totalomset,                              '+
               '       SUM(                                          '+
               '         pd.hpp * (pd.jumlah - pd.jumlahretur)       '+
               '       ) AS totalhpp,                                '+
               '       SUM(                                          '+
               '         ((pd.subtotal/pd.jumlah) - pd.hpp) * (pd.jumlah - pd.jumlahretur) '+
               '       ) AS totalprofit                                     '+
               '     FROM                                                   '+
               '       penjualandetil pd                                    '+
               '       LEFT JOIN penjualan p                                '+
               '         ON p.`fakturjual` = pd.`fakturjual`                '+
               '       LEFT JOIN sales s                                    '+
               '         ON s.`idsales` = p.`idsales`                       ';


    SQL.Add(' WHERE p.tgljual>="'+Tanggal(dt3.DateTime)+'" '+
               ' and p.tgljual<="'+Tanggal(dt4.DateTime)+'" ');
    if (C4.Checked) and (str <> '') then
    SQL.Add(' AND s.namasales in ('+str+') ');
    SQL.Add(' GROUP BY p.fakturjual');
    Open;
  end;


  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frlaporansales.fr3');
  FMemo(Dlaporan.Fr1,'Ljudul').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dt3.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dt4.Date);
  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview2;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapPenjualan.btn5Click(Sender: TObject);
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
               '     SUM((d.harga-d.diskonrupiah) * (d.jumlah - d.jumlahretur)) as total,'+
               '     SUM((d.harga-d.diskonrupiah) * (d.jumlah - d.jumlahretur)) as grantotal,'+
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
               '       ON u.`iduser` = p.`lastuser`                                              '+
               '   LEFT JOIN sales s ON s.idsales=p.idsales where idjual > 0 ';

    if C7.Checked then
       SQL.Add(' AND p.tgljual>= "'+Tanggal(dtp1.DateTime)+'" '+
       ' and p.tgljual<="'+Tanggal(dtp2.DateTime)+'" ') else
       SQL.Add(' AND p.tgljual>= "'+Tanggal(now)+'" ');


    if (Ckasir.Checked) and (str <> '') then
       SQL.Add(' AND u.namalengkap in ('+str+') ');
    if (C12.Checked) then begin
       if cbPembayaran.ItemIndex = 0 then
         SQL.Add(' AND p.pembayaran in (0,1) ') else
         SQL.Add(' AND p.pembayaran='+intToStr(cbPembayaran.ItemIndex -1)+' ')
    end;
    SQL.Add(' GROUP BY p.fakturjual ');
    Open;
  end;

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\lappenjualankasir.fr3');
  FMemo(Dlaporan.Fr1,'Ljudul').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dtp1.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dtp2.Date);


  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview4;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapPenjualan.btn7Click(Sender: TObject);
begin

with Dlaporan.Qlappenjualanbysales do begin
      Close;
      SQL.Text := ' SELECT                                                 '+
                  '      s.namasales,                                      '+
                  '      pl.namapelanggan,                                 '+
                  '      pl.kota,                                          '+
                  '      pl.notelpon,                                      '+
                  '      SUM(p.grandtotal) AS grandtotal                   '+
                  '    FROM                                                '+
                  '      pelanggan pl                                      '+
                  '      LEFT JOIN penjualan p                             '+
                  '        ON pl.`idpelanggan` = p.`idpelanggan`           '+
                  '      LEFT JOIN sales s                                 '+
                  '        ON s.idsales = pl.`idsales`                     '+
                  '      WHERE ((p.tgljual>="'+Tanggal(dtp3.Date)+'" '+
                  '     AND p.tgljual<="'+Tanggal(dtp4.Date)+'") OR p.tgljual IS NULL) ';
      if str <> '' then
      SQL.Add(' AND s.namasales in ('+str+') ');
      SQL.Add('    GROUP BY pl.`idpelanggan` ORDER BY pl.idsales asc   ');

      open;
  end;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLappenjualanpelanggansales.fr3');
  FMemo(Dlaporan.Fr1,'Ljudul').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dtp7.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dtp8.Date);

  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frx5;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapPenjualan.btn9Click(Sender: TObject);
begin
  with Dlaporan.Qsalestarget do begin
      Close;
      SQL.Text := ' SELECT                                    '+
                  '      s.kodesales,                         '+
                  '      s.namasales,                         '+
                  '      s.alamat,                            '+
                  '      s.kota,                            '+
                  '      s.notelpon,                            '+
                  '      s.target,                            '+
                  '      SUM(pj.grandtotal) AS totalpenjualan '+
                  '    FROM                                   '+
                  '      sales s                              '+
                  '      LEFT JOIN penjualan pj               '+
                  '        ON pj.`idsales` = s.`idsales`      '+
                  '      WHERE ((pj.tgljual>="'+Tanggal(dtp7.Date)+'" '+
                  '     AND pj.tgljual<="'+Tanggal(dtp8.Date)+'") OR pj.tgljual IS NULL)  '+
                  '     GROUP BY s.idsales                    ';
      open;
  end;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frtargetsales.fr3');
  FMemo(Dlaporan.Fr1,'Lperiode').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dtp7.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dtp8.Date);

  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := fr6;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapPenjualan.btnClick(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFlapPenjualan.btnPrintLapKasirClick(Sender: TObject);
begin
  with Dlaporan.Qrekapkasi2 do begin
      Close;
      SQL.Text :='CALL sp_rekapitulasikasir("'+Tanggal(dtp1.Date)+'","'+Tanggal(dtp2.Date)+'")';
      open;
  end;


  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\rekapitulasikasir.fr3');
  Dlaporan.Fr1.PrepareReport(False);
  Dlaporan.Fr1.Preview := frxPreview4;
  Dlaporan.Fr1.ShowReport;
end;

procedure TFlapPenjualan.C10Click(Sender: TObject);
begin
  ExQry(dm.Q1,'SELECT * FROM sales ',True);

  Cb2.Items.Clear;
  while not dm.Q1.Eof do begin

    Cb2.Items.Add(dm.Q1.FieldByName('namasales').AsString);
    dm.Q1.Next;
  end;
  Cb2.Enabled := TRue;
end;

procedure TFlapPenjualan.C11Click(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to cb2.Items.Count -1 do begin
    cb2.Checked[i] := C11.Checked;
    if cb2.Checked[i] then begin
      x   := cb2.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);
end;

procedure TFlapPenjualan.C13Click(Sender: TObject);

  var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to Cb1.Items.Count -1 do begin
    if Cb1.Checked[i] then begin
      x   := Cb1.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);

end;

procedure TFlapPenjualan.C1Click(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to ls.Items.Count -1 do begin
    ls.Checked[i] := C1.Checked;
    if ls.Checked[i] then begin
      x   := ls.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);
end;

procedure TFlapPenjualan.C4Click(Sender: TObject);
begin
  ExQry(dm.Q1,'SELECT * FROM sales ',True);

  CkBox1.Items.Clear;
  while not dm.Q1.Eof do begin

    CkBox1.Items.Add(dm.Q1.FieldByName('namasales').AsString);
    dm.Q1.Next;
  end;
  CkBox1.Enabled := TRue;
end;

procedure TFlapPenjualan.C5Click(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to CkBox1.Items.Count -1 do begin
    CkBox1.Checked[i] := C5.Checked;
    if CkBox1.Checked[i] then begin
      x   := CkBox1.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);
end;
procedure TFlapPenjualan.Cb1ClickCheck(Sender: TObject);

  var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to Cb1.Items.Count -1 do begin
    if Cb1.Checked[i] then begin
      x   := Cb1.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);

end;

procedure TFlapPenjualan.Cb2ClickCheck(Sender: TObject);
  var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to Cb2.Items.Count -1 do begin
    if Cb2.Checked[i] then begin
      x   := Cb2.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);
end;

procedure TFlapPenjualan.cb3Change(Sender: TObject);
begin
  with Dlaporan.Qgrafikpenjualan do begin
    Close;
    SQL.Text := ' SELECT                                                      '+
                '      pl.namapelanggan,                                      '+
                '      pl.kota,                                               '+
                '      pl.notelpon,                                           '+
                '      SUM(p.grandtotal) AS grandtotal                        '+
                '    FROM                                                     '+
                '      pelanggan pl                                           '+
                '      LEFT JOIN penjualan p                                  '+
                '        ON pl.`idpelanggan` = p.`idpelanggan`                '+
                '  WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" AND               '+
                ' p.tgljual<="'+Tanggal(dt2.Date)+'"                          '+
                '    GROUP BY pl.`idpelanggan` ORDER BY SUM(p.grandtotal) DESC '+
                ' LIMIT '+cb3.Text+' ';
    Open;

  end;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\lapGrafikPenjualan.fr3');
  Dlaporan.Fr1.Preview := frxPreview1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapPenjualan.CbBarangPelangganClickCheck(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to CbBarangPelanggan.Items.Count -1 do begin
    if CbBarangPelanggan.Checked[i] then begin
      x   := CbBarangPelanggan.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);

end;

procedure TFlapPenjualan.CKasirClick(Sender: TObject);
begin
  ExQry(dm.Q1,' SELECT namalengkap from m_user ',True);
  Cb1.Items.Clear;

  while not dm.Q1.Eof do begin
      Cb1.Items.Add(dm.Q1.Fields[0].AsString);
      dm.Q1.Next;
  end;

end;

procedure TFlapPenjualan.CkBox1ClickCheck(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to CkBox1.Items.Count -1 do begin
    if CkBox1.Checked[i] then begin
      x   := CkBox1.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);

end;

procedure TFlapPenjualan.CpelangganClick(Sender: TObject);
begin
  ls.Enabled := Cpelanggan.Checked;
  with dm.Q1 do begin
    CLose;
    SQL.Text :=' SELECT idpelanggan,namapelanggan from pelanggan order by namapelanggan asc ';
    Open;
    ls.Items.Clear;

    while not Eof do begin
      ls.Items.Add(Fields[1].AsString);
      Next;
    end;
  end;
end;

procedure TFlapPenjualan.CperiodeClick(Sender: TObject);
begin
  dt1.Enabled := Cperiode.Checked;
  dt2.Enabled := Dt1.Enabled;
end;

procedure TFlapPenjualan.cxButton1Click(Sender: TObject);
const
  rekap = ' SELECT                                                            '+
          '        p.tgljual,                                                 '+
          '        SUM((d.subtotal/d.jumlah) * (d.jumlah - d.jumlahretur)) AS totalomset,   '+
          '        SUM(d.hpp * (d.jumlah - d.jumlahretur)) AS totalhpp,       '+
          '        SUM(                                                       '+
          '          ((d.subtotal/d.jumlah) - d.hpp) * (d.jumlah - d.jumlahretur)           '+
          '        ) AS totalprofit,                                          '+
          '        fc_margin (                                                '+
          '          SUM(                                                     '+
          '            ((d.subtotal/d.jumlah) - d.hpp) * (d.jumlah - d.jumlahretur)         '+
          '          ),                                                       '+
          '          SUM(d.hpp * (d.jumlah - d.jumlahretur))                  '+
          '        ) AS margin                                                '+
          '      FROM                                                         '+
          '        penjualan p                                                '+
          '        LEFT JOIN penjualandetil d                                 '+
          '          ON p.`fakturjual` = d.`fakturjual`                       ';

begin

  ExQry(QOmset,rekap+
  ' WHERE month(p.tgljual)="'+IntToStr(cbBulan.ItemIndex+1)+'" '+
  ' AND Year(p.tgljual)="'+IntToStr(YearOf(dtTahun.Date))+'" '+
  ' GROUP BY p.`tgljual` HAVING totalomset > 0',True);

  frxReport1.LoadFromFile(aPathRpt+'\frOmsetBulan.fr3');
  FMemo(frxReport1,'Ljudul').Text := 'Bulan : '+cbBulan.Text+' Tahun '+IntToStr(YearOf(dtTahun.Date));
  frxReport1.Preview := Frv1;
  frxReport1.ShowReport();
end;

procedure TFlapPenjualan.FormShow(Sender: TObject);
var
  i : integer;
begin

   pg1.ActivePageIndex := 0;
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TDateTimePicker then
       TDateTimePicker(Components[i]).Date :=  Now;
  end;
  Cperiode.Checked := True;

  cbBulan.ItemIndex := MonthOf(now) - 1;
  dtTahun.Date      := now;
  
end;

procedure TFlapPenjualan.lsClickCheck(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to ls.Items.Count -1 do begin
    if ls.Checked[i] then begin
      x   := ls.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);

end;

procedure TFlapPenjualan.pg1Change(Sender: TObject);
begin
  case pg1.ActivePageIndex of
  5  : begin
          ExQry(dm.Q1,' SELECT kodebarcode,namabarang from barang ',True);
            CbBarangPelanggan.Items.Clear;

            while not dm.Q1.Eof do begin
              CbBarangPelanggan.Items.Add(dm.Q1.Fields[1].AsString);
              dm.Q1.Next;
            end;
       end;
  end;
end;

procedure TFlapPenjualan.RzBitBtn10Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapPenjualan.RzBitBtn11Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFlapPenjualan.RzBitBtn14Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapPenjualan.RzBitBtn15Click(Sender: TObject);
begin
    Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFlapPenjualan.RzBitBtn1Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFlapPenjualan.RzBitBtn3Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFlapPenjualan.RzBitBtn6Click(Sender: TObject);
begin
    Dlaporan.Fr1.PrepareReport(True) ;
    Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapPenjualan.RzBitBtn7Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFlapPenjualan.RzBitBtn9Click(Sender: TObject);
begin
  with Dlaporan.Qgrafikpenjualan do begin
    Close;
    SQL.Text := ' SELECT                                                      '+
                '      pl.namapelanggan,                                      '+
                '      pl.kota,                                               '+
                '      pl.notelpon,                                           '+
                '      SUM(p.grandtotal) AS grandtotal                        '+
                '    FROM                                                     '+
                '      pelanggan pl                                           '+
                '      LEFT JOIN penjualan p                                  '+
                '        ON pl.`idpelanggan` = p.`idpelanggan`                '+
                '  WHERE p.tgljual>="'+Tanggal(dt1.Date)+'" AND               '+
                ' p.tgljual<="'+Tanggal(dt2.Date)+'"                          '+
                '    GROUP BY pl.`idpelanggan` ORDER BY SUM(p.grandtotal) DESC '+
                ' LIMIT '+cb3.Text+' ';
    Open;

  end;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\lapGrafikPenjualan.fr3');
  Dlaporan.Fr1.Preview := frxPreview1;
  Dlaporan.Fr1.ShowReport();

end;

procedure TFlapPenjualan.sBitBtn1Click(Sender: TObject);
begin
  if (chk1.Checked = False) then
  begin
    MessageBox(Handle,'Periode belum di centang','Error',MB_ICONERROR);
    Exit;
  end else
  begin

    with Dlaporan.Qgrafikbarang do begin
      Close;
      SQL.Text := ' select dj.lastupdate,dj.kodebarang,b.namabarang,sum(dj.jumlah) as jml   '+
                ' from penjualandetil dj left join barang b on b.kodebarang=dj.kodebarang '+
                ' where iddetil > 1 ';

      if chk1.Checked then
       SQL.Add(' AND DATE(dj.lastupdate) between "'+FormatDateTime('yyyy-mm-dd',dtP5.DateTime)+'" '+
       ' and "'+FormatDateTime('yyyy-mm-dd',dtp6.DateTime)+'" ');
       SQL.Add(' group by dj.kodebarang '+
                ' ORDER by  jml desc limit '+cbtop.Text+' ');

      Open;

    end;
  end;
end;

end.
