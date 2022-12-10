unit UlapPelanggan;

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
  Vcl.CheckLst, dxSkinMcSkin, uctrlFrm, dxSkiniMaginary, dxSkinMoneyTwins,
  dxSkinOffice2016Colorful, uEngine, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, frxExportBaseDialog;

type
  TFlapPelanggan = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Cmember: TcxCheckBox;
    cbb1: TcxComboBox;
    Cpelanggan: TcxCheckBox;
    btn1: TcxButton;
    frxPreview1: TfrxPreview;
    frxXLSExport1: TfrxXLSExport;
    Pn1: TsPanel;
    btn: TRzBitBtn;
    btn2: TRzBitBtn;
    ls: TCheckListBox;
    C1: TcxCheckBox;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmemberClick(Sender: TObject);
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
  FlapPelanggan: TFlapPelanggan;
  stk1,stk2 : string;
  str : string;

implementation

{$R *.dfm}

uses UDlaporan, udm;

procedure TFlapPelanggan.btn1Click(Sender: TObject);
const
 _SQL =' SELECT                     '+
      ' p.idpelanggan,              '+
      ' p.kodepelanggan,            '+
      ' p.namapelanggan,            '+
      ' p.alamat,                   '+
      ' p.kota,                     '+
      ' p.notelpon,                 '+
      ' jp.jenis,                   '+
      ' p.maxpiutang,               '+
      ' p.top ,                     '+
      ' p.poin                      '+
      '  FROM                       '+
      '  pelanggan p                '+
      '  LEFT JOIN jenispelanggan jp '+
      '  ON p.`idjenispelanggan` = jp.`idjenispelanggan`';
begin
  with Dlaporan.QlaporanPelanggan do begin
    Close;
    SQL.Text :=_SQL+' where idpelanggan > 0 ';

    if Cmember.Checked then
       SQL.Add(' AND jenis="'+cbb1.Text+'" ');
    if (Cpelanggan.Checked) and (str <> '') then
       SQL.Add(' AND kodepelanggan in ('+str+') ');
    Open;
  end;
//ShowMessage(apath);
Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapPelanggan.fr3');
Dlaporan.Fr1.Preview := frxPreview1;
Dlaporan.Fr1.ShowReport();
end;

procedure TFlapPelanggan.btn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(TRue);
  Dlaporan.Fr1.Export(frxXLSExport1);
end;

procedure TFlapPelanggan.btnClick(Sender: TObject);
begin

  frxPreview1.Print;
end;

procedure TFlapPelanggan.C1Click(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to ls.Items.Count -1 do begin
    ls.Checked[i] := C1.Checked;
    if ls.Checked[i] then begin
      x := Copy(ls.Items[i],POS('|',ls.Items[i])+2,Length(ls.Items[i]));
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);
end;

procedure TFlapPelanggan.CpelangganClick(Sender: TObject);
begin
  ls.Enabled := Cpelanggan.Checked;
end;

procedure TFlapPelanggan.CmemberClick(Sender: TObject);
begin
  cbb1.Enabled := Cmember.Checked;
end;

procedure TFlapPelanggan.FormShow(Sender: TObject);


begin


  with dm.Q1 do begin
    CLose;
    SQL.Text :=' SELECT kodepelanggan,namapelanggan from pelanggan ';
    Open;
    ls.Items.Clear;

    while not Eof do begin
      ls.Items.Add(Fields[1].AsString+ ' | '+Fields[0].AsString);
      Next;
    end;
  end;

  isiCmb(dm.Q1,'jenispelanggan',['idjenispelanggan','jenis'],cbb1);
end;

procedure TFlapPelanggan.lsClickCheck(Sender: TObject);
var
  i : integer;
  x : string;
begin
  str :='';
  for i := 0 to ls.Items.Count -1 do begin
    if ls.Checked[i] then begin
      x := Copy(ls.Items[i],POS('|',ls.Items[i])+2,Length(ls.Items[i]));
      str := str +'"'+x+'",';
    end;
  end;
  Delete(str,Length(str),1);

end;

end.
