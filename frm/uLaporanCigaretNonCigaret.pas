unit uLaporanCigaretNonCigaret;

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
  dxSkinXmas2008Blue, Vcl.Menus, frxClass, frxPreview, Vcl.ComCtrls,
  Vcl.StdCtrls, cxButtons, cxCheckBox, cxGroupBox, RzButton, Vcl.ExtCtrls,
  sPanel, Vcl.CheckLst, uEngine, frxExportBaseDialog, frxExportXLS, frxDBSet,
  Data.DB, MemDS, DBAccess, MyAccess, dxSkinTheBezier;

type
  TFLaporanCigaretNonCigaret = class(TForm)
    sPanel6: TsPanel;
    RzBitBtn11: TRzBitBtn;
    RzBitBtn12: TRzBitBtn;
    cxGroupBox6: TcxGroupBox;
    Label5: TLabel;
    cxCheckBox6: TcxCheckBox;
    btn8: TcxButton;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    btn9: TcxButton;
    fr6: TfrxPreview;
    Label1: TLabel;
    rbCigaret: TRadioButton;
    rbnonCigaret: TRadioButton;
    Cpelanggan: TcxCheckBox;
    Lsls: TCheckListBox;
    C1: TcxCheckBox;
    QProfitCigaret: TMyQuery;
    frProfitCigaret: TfrxDBDataset;
    frxrprt1: TfrxReport;
    frxlsxprt1: TfrxXLSExport;
    procedure CpelangganClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure LslsClickCheck(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure RzBitBtn11Click(Sender: TObject);
    procedure RzBitBtn12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLaporanCigaretNonCigaret: TFLaporanCigaretNonCigaret;
  str : String;

implementation

{$R *.dfm}

uses uComCtrl, udm;

procedure TFLaporanCigaretNonCigaret.btn9Click(Sender: TObject);
begin
  if str = '' then  begin

        if rbCigaret.Checked = True then

              ExQry(QProfitCigaret,
              ' SELECT                                                                             '+
              '                  p.idpelanggan,                                                    '+
              '                  p.tgljual,                                                        '+
              '                  pl.namapelanggan,                                                 '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                      '+
              '                      THEN dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)                                   '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS totalrokok,                                                  '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                      '+
              '                      THEN dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur))                                     '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS Hpprokok,                                                    '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                    '+
              '                      THEN (dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)) - (dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur)))        '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS profitrokok,                                                 '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)                                   '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS totalnonrokok,                                               '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur))                                     '+
              '                      ELSE 0                                                        '+
              '                   END                                                              '+
              '                 ) AS Hppnonrokok,                                                  '+
              '                 SUM(                                                               '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN (dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)) - (dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur)))        '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS profitnonrokok                                               '+
              '                FROM                                                                '+
              '                  penjualandetil dj                                                 '+
              '                  LEFT JOIN penjualan p                                             '+
              '                    ON p.`fakturjual` = dj.`fakturjual`                             '+
              '                  LEFT JOIN pelanggan pl                                            '+
              '                    ON pl.idpelanggan = p.idpelanggan                               '+
              '                  LEFT JOIN barang b                                                '+
              '                    ON b.`kodebarang` = dj.`kodebarang`       '+
              '                  LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
              '                WHERE p.tgljual>="'+FormatDateTime('yyyy-mm-dd',dt1.Date)+'" '+
              '                     AND p.tgljual<="'+FormatDateTime('yyyy-mm-dd',dt2.Date)+'"  GROUP BY pl.namapelanggan '+
              '                     ORDER BY totalrokok DESC ',True)
        else
            ExQry(QProfitCigaret,
              ' SELECT                                                                             '+
              '                  p.idpelanggan,                                                    '+
              '                  p.tgljual,                                                        '+
              '                  pl.namapelanggan,                                                 '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                     '+
              '                      THEN dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)                                   '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS totalrokok,                                                  '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                     '+
              '                      THEN dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur))                                     '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS Hpprokok,                                                    '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                     '+
              '                      THEN (dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)) - (dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur)))        '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS profitrokok,                                                 '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)                                   '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS totalnonrokok,                                               '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur))                                      '+
              '                      ELSE 0                                                        '+
              '                   END                                                              '+
              '                 ) AS Hppnonrokok,                                                  '+
              '                 SUM(                                                               '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN (dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)) - (dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur)))        '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS profitnonrokok                                               '+
              '                FROM                                                                '+
              '                  penjualandetil dj                                                 '+
              '                  LEFT JOIN penjualan p                                             '+
              '                    ON p.`fakturjual` = dj.`fakturjual`                             '+
              '                  LEFT JOIN pelanggan pl                                            '+
              '                    ON pl.idpelanggan = p.idpelanggan                               '+
              '                  LEFT JOIN barang b                                                '+
              '                    ON b.`kodebarang` = dj.`kodebarang`                            '+
              '                  LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
              '                WHERE p.tgljual>="'+FormatDateTime('yyyy-mm-dd',dt1.Date)+'" '+
              '                     AND p.tgljual<="'+FormatDateTime('yyyy-mm-dd',dt2.Date)+'"  GROUP BY pl.namapelanggan '+
              '                     ORDER BY totalnonrokok DESC ',True)



  end else  begin
    if rbCigaret.Checked = True then
          ExQry(QProfitCigaret,
              ' SELECT                                                                             '+
              '                  p.idpelanggan,                                                    '+
              '                  p.tgljual,                                                        '+
              '                  pl.namapelanggan,                                                 '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                      '+
              '                      THEN dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)                                   '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS totalrokok,                                                  '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                      '+
              '                      THEN dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur))                                     '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS Hpprokok,                                                    '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                    '+
              '                      THEN (dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)) - (dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur)))        '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS profitrokok,                                                 '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)                                   '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS totalnonrokok,                                               '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur))                                     '+
              '                      ELSE 0                                                        '+
              '                   END                                                              '+
              '                 ) AS Hppnonrokok,                                                  '+
              '                 SUM(                                                               '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN (dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)) - (dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur)))        '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS profitnonrokok                                               '+
              '                FROM                                                                '+
              '                  penjualandetil dj                                                 '+
              '                  LEFT JOIN penjualan p                                             '+
              '                    ON p.`fakturjual` = dj.`fakturjual`                             '+
              '                  LEFT JOIN pelanggan pl                                            '+
              '                    ON pl.idpelanggan = p.idpelanggan                               '+
              '                  LEFT JOIN barang b                                                '+
              '                    ON b.`kodebarang` = dj.`kodebarang`       '+
              '                  LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
          '                WHERE p.tgljual>="'+FormatDateTime('yyyy-mm-dd',dt1.Date)+'" '+
          '                     AND p.tgljual<="'+FormatDateTime('yyyy-mm-dd',dt2.Date)+'"     '+
          '                     AND pl.namapelanggan IN('+str+') GROUP BY pl.namapelanggan '+
          '                     ORDER BY totalrokok ASC ',True)
     else
         ExQry(QProfitCigaret,
              ' SELECT                                                                             '+
              '                  p.idpelanggan,                                                    '+
              '                  p.tgljual,                                                        '+
              '                  pl.namapelanggan,                                                 '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                      '+
              '                      THEN dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)                                   '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS totalrokok,                                                  '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                      '+
              '                      THEN dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur))                                     '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS Hpprokok,                                                    '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori = "ROKOK"                                    '+
              '                      THEN (dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)) - (dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur)))        '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS profitrokok,                                                 '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)                                   '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS totalnonrokok,                                               '+
              '                  SUM(                                                              '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur))                                     '+
              '                      ELSE 0                                                        '+
              '                   END                                                              '+
              '                 ) AS Hppnonrokok,                                                  '+
              '                 SUM(                                                               '+
              '                    CASE                                                            '+
              '                      WHEN k.namakategori <> "ROKOK"                                    '+
              '                      THEN (dj.subtotal - ((dj.subtotal/dj.jumlah) * dj.jumlahretur)) - (dj.hpp * (dj.`isi` - ((dj.isi / dj.jumlah) * dj.jumlahretur)))        '+
              '                      ELSE 0                                                        '+
              '                    END                                                             '+
              '                  ) AS profitnonrokok                                               '+
              '                FROM                                                                '+
              '                  penjualandetil dj                                                 '+
              '                  LEFT JOIN penjualan p                                             '+
              '                    ON p.`fakturjual` = dj.`fakturjual`                             '+
              '                  LEFT JOIN pelanggan pl                                            '+
              '                    ON pl.idpelanggan = p.idpelanggan                               '+
              '                  LEFT JOIN barang b                                                '+
              '                    ON b.`kodebarang` = dj.`kodebarang`       '+
              '                  LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
          '                WHERE p.tgljual>="'+FormatDateTime('yyyy-mm-dd',dt1.Date)+'" '+
          '                     AND p.tgljual<="'+FormatDateTime('yyyy-mm-dd',dt2.Date)+'"     '+
          '                     AND pl.namapelanggan IN('+str+') GROUP BY pl.namapelanggan '+
          '                     ORDER BY totalnonrokok DESC ',True);



  end;

  frxrprt1.LoadFromFile(ExtractFilePath(Application.ExeName)+'rpt\lapprofitcigaret.fr3');
  FMemo(frxrprt1,'Lperiode').Text := FormatDateTime('dd mmmm yyyy',dt1.Date)+' s/d '+FormatDateTime('dd mmmm yyyy',dt2.Date);
  frxrprt1.Preview := fr6;
  frxrprt1.ShowReport(True);
end;

procedure TFLaporanCigaretNonCigaret.C1Click(Sender: TObject);
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


procedure TFLaporanCigaretNonCigaret.CpelangganClick(Sender: TObject);
begin
  Lsls.Enabled := Cpelanggan.Checked;
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

procedure TFLaporanCigaretNonCigaret.FormShow(Sender: TObject);
begin
  dt1.Date := Now;
  dt2.Date := now;
  str := '';
end;

procedure TFLaporanCigaretNonCigaret.LslsClickCheck(Sender: TObject);
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

procedure TFLaporanCigaretNonCigaret.RzBitBtn11Click(Sender: TObject);
begin
  frxrprt1.PrepareReport(True);
  frxrprt1.PrintOptions.ShowDialog := True;
  frxrprt1.Print;
end;

procedure TFLaporanCigaretNonCigaret.RzBitBtn12Click(Sender: TObject);
begin
  frxrprt1.PrepareReport(True);
  frxrprt1.Export(frxlsxprt1);
end;

end.
