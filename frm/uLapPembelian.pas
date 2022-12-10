unit uLapPembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,DateUtils, dxSkinOffice2007Blue,
  dxSkinOffice2010Blue, dxSkinTheAsphaltWorld, Vcl.Menus, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, dxRibbonSkins, dxSkinsdxRibbonPainter, cxClasses,
  dxRibbon, dxBar, dxRibbonMiniToolbar, frxClass, frxExportXLS, frxPreview,
  cxPC, Vcl.StdCtrls, cxButtons, cxCheckListBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxGroupBox, RzButton, Vcl.ExtCtrls, sPanel,
  Vcl.CheckLst, Vcl.ComCtrls, dxSkinMcSkin, uctrlFrm, dxSkiniMaginary,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, frxExportBaseDialog, dxSkinTheBezier;

type
  TFlapPembelian = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Cperiode: TcxCheckBox;
    Cpelanggan: TcxCheckBox;
    btn1: TcxButton;
    frxPreview1: TfrxPreview;
    frxXLSExport1: TfrxXLSExport;
    Pn1: TsPanel;
    btn: TRzBitBtn;
    btn2: TRzBitBtn;
    ls: TCheckListBox;
    C1: TcxCheckBox;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    lbl1: TLabel;
    C2: TcxCheckBox;
    C12: TcxCheckBox;
    cbPembayaran: TComboBox;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CperiodeClick(Sender: TObject);
    procedure CpelangganClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure lsClickCheck(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlapPembelian: TFlapPembelian;
  stk1,stk2 : string;
  str : string;

implementation

{$R *.dfm}

uses UDlaporan, udm, uComCtrl;

procedure TFlapPembelian.btn1Click(Sender: TObject);
const
  SQLA = ' SELECT                            '+
         '     p.nobukti,                    '+
         '     p.tgl AS tglbeli,             '+
         '     p.pembayaran,                 '+
         '     s.namasupplier AS namasupplier,'+
         '     p.refnota AS refnota,          '+
         '     p.total AS total,              '+
         '     p.diskon as diskon,            '+
         '     p.ppn as ppn,                  '+
         '     p.grandtotal as grandtotal,    '+
         '     u.namalengkap AS namapegawai   '+
         '   FROM                             '+
         '     pembelian p                    '+
         '     LEFT JOIN m_supplier s         '+
         '       ON s.`idsupplier` = p.`idsupplier` '+
         '     LEFT JOIN m_user u                   '+
         '       ON u.`iduser` = p.`iduser` ';
begin
  with Dlaporan.QLapPembelian do begin
    Close;
    SQL.Text :=SQLA+' where idpembelian > 0 ';

    if Cperiode.Checked then
       SQL.Add(' AND tgl>="'+Tanggal(dt1.DateTime)+'" '+
       ' and  tgl<="'+Tanggal(dt2.DateTime)+'" ');
    if (Cpelanggan.Checked) and (str <> '') then
       SQL.Add(' AND namasupplier in ('+str+') ');

    if (C12.Checked) then begin
       if cbPembayaran.ItemIndex = 0 then
         SQL.Add(' AND p.pembayaran in ("CASH","KREDIT") ') else
         SQL.Add(' AND p.pembayaran="'+cbPembayaran.Text+'" ')
    end;
    Open;
  end;
//ShowMessage(apath);
if C2.Checked then
Dlaporan.fr1.LoadFromFile(aPathRpt+'\lappembelian.fr3') else
Dlaporan.fr1.LoadFromFile(aPathRpt+'\lappembelian2.fr3');
Dlaporan.fr1.Preview := frxPreview1;
Dlaporan.fr1.ShowReport();


end;

procedure TFlapPembelian.btn2Click(Sender: TObject);
begin

  Dlaporan.Fr1.PrepareReport();
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapPembelian.btnClick(Sender: TObject);
begin
  frxPreview1.Print;
end;

procedure TFlapPembelian.C1Click(Sender: TObject);
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

procedure TFlapPembelian.CpelangganClick(Sender: TObject);
begin
  ls.Enabled := Cpelanggan.Checked;
end;

procedure TFlapPembelian.CperiodeClick(Sender: TObject);
begin
  dt1.Enabled := Cperiode.Checked;
  dt2.Enabled := Dt1.Enabled;
end;

procedure TFlapPembelian.FormShow(Sender: TObject);


begin

  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  with dm.Q1 do begin
    CLose;
    SQL.Text :=' SELECT idsupplier,namasupplier from m_supplier order by namasupplier asc ';
    Open;
    ls.Items.Clear;

    while not Eof do begin
      ls.Items.Add(Fields[1].AsString);
      Next;
    end;
  end;
end;

procedure TFlapPembelian.lsClickCheck(Sender: TObject);
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

end.

