unit uLapLabaPelanggan;

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
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.CheckLst,
  cxButtons, cxCheckBox, cxGroupBox, frxClass, frxPreview, sComboBox, RzButton,
  sLabel, Vcl.ExtCtrls, sPanel, uctrlFrm, frxExportBaseDialog, frxExportXLS,
  dxSkinTheBezier, cxRadioGroup;

type
  TFLaporanLabaPelanggan = class(TForm)
    spnlPn1: TsPanel;
    lblL2: TsLabel;
    rzbtbtnbtn: TRzBitBtn;
    rzbtbtnbtn2: TRzBitBtn;
    rzbtbtn1: TRzBitBtn;
    cbbcb3: TsComboBox;
    frxPreview1: TfrxPreview;
    cxGroupBox1: TcxGroupBox;
    Llbl1: TLabel;
    Cperiode: TcxCheckBox;
    Cpelanggan: TcxCheckBox;
    btn1: TcxButton;
    Lsls: TCheckListBox;
    C1: TcxCheckBox;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    frxlsxprt1: TfrxXLSExport;
    rdOmset: TcxRadioButton;
    RdLaba: TcxRadioButton;
    procedure rzbtbtn1Click(Sender: TObject);
    procedure CpelangganClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure CperiodeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rzbtbtnbtnClick(Sender: TObject);
    procedure rzbtbtnbtn2Click(Sender: TObject);
    procedure LslsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLaporanLabaPelanggan: TFLaporanLabaPelanggan;
  str : String;

implementation

{$R *.dfm}

uses uDlaporan, uComCtrl, udm;

procedure TFLaporanLabaPelanggan.btn1Click(Sender: TObject);
begin
  with Dlaporan.QLabPelanggan do begin
    Close;
    SQL.Text :=' SELECT                                                                 '+
               '       pl.kodepelanggan,                                                '+
               '       pl.namapelanggan,                                                '+
               '       IFNULL(SUM(                                                             '+
               '         (d.subtotal/d.jumlah) * (d.jumlah - d.jumlahretur)        '+
               '       ),0) AS totalomset,                                                 '+
               '       IFNULL(SUM(d.hpp * ( (d.isi / d.jumlah) * (d.jumlah -d.jumlahretur))),0) AS totalhpp,             '+
               '       IFNULL(SUM(                                                             '+
               '         (d.subtotal - (d.harga * d.jumlahretur)) - (d.hpp * ( d.isi / d.jumlah) * (d.jumlah-d.jumlahretur))  '+
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

    if RdLaba.Checked then
    SQL.Add('GROUP BY p.`idpelanggan` ORDER BY totalprofit DESC')
    else if rdOmset.Checked then
    SQL.Add('GROUP BY p.`idpelanggan` ORDER BY totalomset DESC');
    Open;
  end;


  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLabaPerPelanggan.fr3');
  FMemo(Dlaporan.Fr1,'Lperiode').Text := 'Periode : '+FormatDateTime('dd-mm-yyyy',dt1.Date)+' s/d '+FormatDateTime('dd-mm-yyyy',dt2.Date);


  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFLaporanLabaPelanggan.C1Click(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to lsls.Items.Count -1 do begin
    lsls.Checked[i] := C1.Checked;
    if lsls.Checked[i] then begin
      x   := lsls.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);
end;

procedure TFLaporanLabaPelanggan.CpelangganClick(Sender: TObject);
begin
    lsls.Enabled := Cpelanggan.Checked;
  with dm.Q1 do begin
    CLose;
    SQL.Text :=' SELECT idpelanggan,namapelanggan from pelanggan order by namapelanggan asc ';
    Open;
    lsls.Items.Clear;

    while not Eof do begin
      lsls.Items.Add(Fields[1].AsString);
      Next;
    end;
  end;
end;

procedure TFLaporanLabaPelanggan.CperiodeClick(Sender: TObject);
begin
  dt1.Enabled := Cperiode.Checked;
  dt2.Enabled := Dt1.Enabled;
end;

procedure TFLaporanLabaPelanggan.FormShow(Sender: TObject);
begin
  dt1.Date := now ;
  dt2.Date := now ;
end;

procedure TFLaporanLabaPelanggan.LslsClick(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to lsls.Items.Count -1 do begin
    if lsls.Checked[i] then begin
      x   := lsls.Items[i];
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);

end;

procedure TFLaporanLabaPelanggan.rzbtbtn1Click(Sender: TObject);
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
                ' LIMIT '+cbbcb3.Text+' ';
    Open;

  end;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\lapGrafikPenjualan.fr3');
  Dlaporan.Fr1.Preview := frxPreview1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFLaporanLabaPelanggan.rzbtbtnbtn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.Export(frxlsxprt1);
end;

procedure TFLaporanLabaPelanggan.rzbtbtnbtnClick(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

end.
