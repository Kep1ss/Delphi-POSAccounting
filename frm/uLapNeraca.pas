unit uLapNeraca;

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
  dxSkinSharp,Dateutils, dxSkinMoneyTwins, frxExportBaseDialog, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFlapNeraca = class(TForm)
    pg1: TcxPageControl;
    tbPenjualan: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    lbl1: TLabel;
    btn1: TcxButton;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    frv1: TfrxPreview;
    Pn1: TsPanel;
    btn: TRzBitBtn;
    btn2: TRzBitBtn;
    frxXLSExport1: TfrxXLSExport;
    frxXLSExport2: TfrxXLSExport;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClick(Sender: TObject);
  private
    aList : TStringList;
    { Private declarations }
    const
      SQLPasiva = ' SELECT                           '+
                  '      ak.kodeakunperkiraan,       '+
                  '      ak.namaakunperkiraan,       '+
                  '      ak.akunsubmaster,mb.namasubmaster,          '+
                  '      IFNULL(SUM(s.s_awal) + SUM(s.kredit) - SUM(s.debet),0) AS saldoakhir '+
                  '    FROM                                                         '+
                  '      m_akunperkiraan ak                                         '+
                  '      LEFT JOIN m_subbukubesar mb ON mb.akunsubmaster=ak.akunsubmaster '+
                  '      LEFT JOIN saldoakun s                                      '+
                  '        ON s.`noakun` = ak.`kodeakunperkiraan`                    ';
      SQLaktiva = ' SELECT                           '+
                  '      ak.kodeakunperkiraan,       '+
                  '      ak.namaakunperkiraan,       '+
                  '      ak.akunsubmaster,mb.namasubmaster,           '+
                  '      IFNULL(SUM(s.s_awal) + SUM(s.debet) - SUM(s.kredit),0) AS saldoakhir '+
                  '    FROM                                                         '+
                  '      m_akunperkiraan ak                                         '+
                  '      LEFT JOIN m_subbukubesar mb ON mb.akunsubmaster=ak.akunsubmaster  '+
                  '      LEFT JOIN saldoakun s                                      '+
                  '        ON s.`noakun` = ak.`kodeakunperkiraan`                   ';

  public
    { Public declarations }
  end;

var
  FlapNeraca: TFlapNeraca;
  stk1,stk2 : string;
  str : string;

implementation

{$R *.dfm}

uses UDlaporan, udm, uMainMenu;

procedure TFlapNeraca.btn1Click(Sender: TObject);
var
  LabaRugi : Real;
  Kode     : String;
begin

 // ExQry(dm.Q1,'CALL sp_syncstok(MONTH(CURDATE()),YEAR(CURDATE()))',False);
 //	ExQry(dm.Q1,'CALL sp_sync_belum_kirim(MONTH(CURDATE()),YEAR(CURDATE()))',False);
  ExQry(dm.Q1,' CALL sp_labarugi("'+Tanggal(dt1.Date)+'","'+Tanggal(dt2.Date)+'")',True);

  LabaRugi := GetValF(dm.Q1,'Pendapatan') - GetValF(dm.Q1,'Biaya');

  Kode := GetCode(dm.Q1,'saldoakun','nobukti','');
  ExQry(dm.Q1,'DELETE FROM saldoakun WHERE noakun="302.001" '+
  ' AND YEAR(tgl)="'+IntToStr(YearOf(dt1.Date))+'" '+
  ' AND MONTH(tgl)="'+IntToStr(MOnthOf(dt1.Date))+'"',False);



      addParam('noakun',     '302.001',                aList,'str');
      addParam('nobukti',    kode,                     aList,'str');
      addParam('tgl',        frmTgl(dt2.Date),              aList,'date');
      if LabaRugi < 0 then begin
      addParam('debet',      StrToDecimal(FloatToStr(Abs(LabaRugi))),    aList,'str');
      addParam('kredit',     '0',    aList,'str');
      end else begin
      addParam('debet',      '0',    aList,'str');
      addParam('kredit',     StrToDecimal(FloatToStr(Abs(LabaRugi))),    aList,'str');
      end;
      addParam('s_akhir',    StrToDecimal(FloatToStr(Abs(LabaRugi))),      aList,'str');
      addParam('keterangan', 'Laba / Rugi Berjalan',      aList,'str');

      exeDb(dm.Q2,'saldoakun',aList);



  ExQry(Dlaporan.QAkunPasiva,SQLPasiva+' WHERE '+
        ' s.tgl >="'+Tanggal(dt1.Date)+'" AND '+
        ' s.tgl <="'+Tanggal(dt2.Date)+'" AND '+
        ' mb.nomasterakun IN (2,3) '+
        ' GROUP BY ak.`kodeakunperkiraan` ',True);


  ExQry(Dlaporan.QactivaAkun,SQLaktiva+' WHERE '+
        ' s.tgl >="'+Tanggal(dt1.Date)+'" AND '+
        ' s.tgl <="'+Tanggal(dt2.Date)+'" AND '+
        ' mb.nomasterakun in (1) '+
        ' GROUP BY ak.`kodeakunperkiraan` ',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frNeraca.fr3');
  FMemo(Dlaporan.Fr1,'Ltanggal').Text := 'Periode '+FormatDateTime('dd mmmm yyyy',dt1.Date)+' - '+FormatDateTime('dd mmmm yyyy',dt2.Date);
  Dlaporan.Fr1.Preview := Frv1;
  Dlaporan.Fr1.ShowReport(True);
end;

procedure TFlapNeraca.btn2Click(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFlapNeraca.btnClick(Sender: TObject);
begin
  Dlaporan.Fr1.PrepareReport(True) ;
  Dlaporan.Fr1.PrintOptions.ShowDialog := True;
  Dlaporan.Fr1.Print;
end;

procedure TFlapNeraca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFlapNeraca.FormShow(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
    if Components[i] is TDateTimePicker then
       TDateTimePicker(Components[i]).Date := now;
  aList := TStringList.Create;

  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
end;

end.
