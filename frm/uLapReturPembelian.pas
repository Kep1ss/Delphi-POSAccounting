unit uLapReturPembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2007Blue,
  dxSkinOffice2010Blue, dxSkinTheAsphaltWorld, Vcl.Menus, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, dxRibbonSkins, dxSkinsdxRibbonPainter, cxClasses,
  dxRibbon, dxBar, dxRibbonMiniToolbar, frxClass, frxExportXLS, frxPreview,
  cxPC, Vcl.StdCtrls, cxButtons, cxCheckListBox,DateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, cxGroupBox, RzButton, Vcl.ExtCtrls, sPanel,
  Vcl.CheckLst, Vcl.ComCtrls, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinMcSkin, uComCtrl, uctrlFrm,
  dxSkiniMaginary, uEngine, dxSkinMoneyTwins, dxSkinOffice2016Colorful,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  frxExportBaseDialog, dxSkinTheBezier;

type
  TFlapReturPembelian = class(TForm)
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
  FlapReturPembelian: TFlapReturPembelian;
  stk1,stk2 : string;
  str : string;

implementation

{$R *.dfm}

uses UDlaporan, udm, uMainMenu;

procedure TFlapReturPembelian.btn1Click(Sender: TObject);
begin


  with Dlaporan.Qreturjual do begin
    Close;
    SQL.Text :=  ' SELECT                                     '+
                 '       rb.nobukti,                          '+
                 '       rb.tgl,                              '+
                 '       rb.nobuktibeli,                      '+
                 '       s.namasupplier,                      '+
                 '       rb.total,                            '+
                 '       rb.keterangan                        '+
                 '     FROM                                   '+
                 '       returpembelian rb                    '+
                 '       LEFT JOIN pembelian p                '+
                 '         ON p.`nobukti` = rb.`nobuktibeli`  '+
                 '       LEFT JOIN m_supplier s               '+
                 '         ON s.`idsupplier` = p.`idsupplier` ';


    if Cperiode.Checked then
       SQL.Add(' AND tgl between "'+Tanggal(dt1.DateTime)+'" '+
       ' and "'+Tanggal(dt2.DateTime)+'" ');
    if (Cpelanggan.Checked) and (str <> '') then
       SQL.Add(' AND namasupplier in ('+str+') ');
    Open;
  end;

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frReturPembelian.fr3') ;
  Dlaporan.Fr1.Preview := frxPreview1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapReturPembelian.btn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapReturPembelian.btnClick(Sender: TObject);
begin
  frxPreview1.Print;
end;

procedure TFlapReturPembelian.C1Click(Sender: TObject);
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

procedure TFlapReturPembelian.CpelangganClick(Sender: TObject);
begin
  ls.Enabled := Cpelanggan.Checked;
end;

procedure TFlapReturPembelian.CperiodeClick(Sender: TObject);
begin
  dt1.Enabled := Cperiode.Checked;
  dt2.Enabled := Dt1.Enabled;
end;

procedure TFlapReturPembelian.FormShow(Sender: TObject);
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

procedure TFlapReturPembelian.lsClickCheck(Sender: TObject);
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
