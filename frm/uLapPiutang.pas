unit uLapPiutang;

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
  dxSkiniMaginary, uEngine, dxSkinOffice2016Colorful, dxSkinMoneyTwins,
  frxExportBaseDialog, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinTheBezier;

type
  TFlapPiutang = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Cperiode: TcxCheckBox;
    CSUpplier: TcxCheckBox;
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
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CperiodeClick(Sender: TObject);
    procedure CSUpplierClick(Sender: TObject);
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
  FlapPiutang: TFlapPiutang;
  stk1,stk2 : string;
  str : string;

implementation

{$R *.dfm}

uses UDlaporan, udm, uDtrx;

procedure TFlapPiutang.btn1Click(Sender: TObject);
COnst
  SQLA = ' SELECT                               '+
         '    h.fakturjual,                     '+
         '    h.tglinput,                       '+
         '    h.piutang,                        '+
         '    h.tgltempo,                       '+
         ' CONCAT(TO_DAYS(CURDATE())-TO_DAYS(h.tgltempo)," ","Hari") AS umurhutang, '+
         '    h.dibayar,                        '+
         '    h.kekurangan,                     '+
         '    h.lunas,                          '+
         '    s.namapelanggan                   '+
         '  FROM                                '+
         '    piutang h                         '+
         '    LEFT JOIN penjualan p             '+
         '    ON p.`fakturjual` = h.`fakturjual`'+
         '    LEFT JOIN pelanggan s             '+
         '    ON s.`idpelanggan` = p.`idpelanggan`';


begin
  with dtrx.Qpiutang do begin
    Close;
    SQL.Text :=SQLA+' where idpiutang > 0 ';

    if Cperiode.Checked then
       SQL.Add(' AND h.tglinput between "'+Tanggal(dt1.DateTime)+'" '+
       ' and "'+Tanggal(dt2.DateTime)+'" ');
    if (CSUpplier.Checked) and (str <> '') then
       SQL.Add(' AND s.namapelanggan in ('+str+') ');
    if C2.Checked then
       SQL.Add(' AND h.tgltempo <="'+Tanggal(Now)+'" ');

    Open;
  end;


  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frPiutang.fr3');
  FMemo(Dlaporan.Fr1,'Ljudul').Text := 'Laporan Piutang Periode : '+ FormatDateTime('dd/mm/yyyy',dt1.Date)+' s/d '+FormatDateTime('dd/mm/yyyy',dt2.Date);
  Dlaporan.Fr1.ShowProgress := True;
  Dlaporan.Fr1.Preview := frxPreview1;
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapPiutang.btn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapPiutang.btnClick(Sender: TObject);
begin
  frxPreview1.Print;
end;

procedure TFlapPiutang.C1Click(Sender: TObject);
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

procedure TFlapPiutang.CSUpplierClick(Sender: TObject);
begin
  ls.Enabled := CSUpplier.Checked;
end;

procedure TFlapPiutang.CperiodeClick(Sender: TObject);
begin
  dt1.Enabled := Cperiode.Checked;
  dt2.Enabled := Dt1.Enabled;
end;

procedure TFlapPiutang.FormShow(Sender: TObject);
begin
  dt1.Date := now;
  dt2.Date := now;
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

procedure TFlapPiutang.lsClickCheck(Sender: TObject);
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
