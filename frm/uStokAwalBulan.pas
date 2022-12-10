unit uStokAwalBulan;

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
  uEngine, uOvEdit, cxCalc, cxCurrencyEdit, dxSkiniMaginary, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, tmsAdvGridExcel,System.DateUtils, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFprosesStokAwal = class(TForm)
    G1: TcxGroupBox;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnTutup: TcxButton;
    AdvGridUndoRedo1: TAdvGridUndoRedo;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    cbgudang: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure LoadStok(tgl1:TDateTime;tgl2:TDateTime;Cari:String);

    { Public declarations }
  end;

var
  FprosesStokAwal: TFprosesStokAwal;

implementation

{$R *.dfm}

uses uDtrx, udm;

procedure TFprosesStokAwal.btnBaruClick(Sender: TObject);
var
  i : integer;
  alst : TStringList;
begin
   ExQry(dm.Q1,'select kodebarang from barang',True);
   alst := TStringList.Create;
   ProgressBar1.Max := dm.Q1.RecordCount;
   i := 0;
   while not dm.Q1.Eof do begin
     ExQry(dm.Q2,'SELECT satuan,saldoakhir '+
     ' from kartustok where kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" '+
     ' AND idgudang="'+GetIdcmb(cbgudang)+'" ORDER BY idkartustok DESC limit 1',TRUE);
     if not dm.Q2.IsEmpty then begin
       addParam('kodebarang',GetVal(dm.Q1,'kodebarang'),alst,'str');
       addParam('satuan',GetVal(dm.Q2,'satuan'),alst,'str');
       addParam('stok',GetVal(dm.Q2,'saldoakhir'),alst,'str');
       addParam('idgudang',GetIdcmb(cbgudang),alst,'str');

       exeDb(dm.Q3,'stokis',alst);

     end;

     ProgressBar1.Position := i;
     inc(i);
     dm.Q1.Next;
   end;
end;

procedure TFprosesStokAwal.FormCreate(Sender: TObject);

begin
  SetTanggal(Self);
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbgudang);

end;

procedure TFprosesStokAwal.LoadStok(tgl1, tgl2: TDateTime;cari:string);

begin

end;

end.
