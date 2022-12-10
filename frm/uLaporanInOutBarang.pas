unit uLaporanInOutBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkiniMaginary, dxSkinMoneyTwins,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls, Vcl.StdCtrls, cxGroupBox,
  cxPC, VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, VCLTee.TeeDBCrossTab, VCLTee.Series,ShellAPi, Vcl.Menus, cxButtons,
  uComCtrl, uEngine,MyAccess,cxGridExportLink, uctrlFrm, dxSkinGlassOceans,
  dxSkinLiquidSky, dxSkinSharp, dxSkinTheAsphaltWorld, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinLilian, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFlaporanInoutBarang = class(TForm)
    cxGroupBox5: TcxGroupBox;
    Label7: TLabel;
    dt7: TDateTimePicker;
    btn4: TcxButton;
    cxGrid2: TcxGrid;
    cxdata2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxgrpbx4: TcxGroupBox;
    btn10: TcxButton;
    procedure btn4Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlaporanInoutBarang: TFlaporanInoutBarang;

implementation

{$R *.dfm}

uses uDlaporan, udm;

procedure TFlaporanInoutBarang.btn10Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\LaporanPembelianTahun_'+FormatDateTime('yyyy',dt7.Date)+'.xls',
  cxgrid2,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\LaporanPembelianTahun_'+FormatDateTime('yyyy',dt7.Date)+'.xls'),nil,nil, SW_NORMAL);
end;

procedure TFlaporanInoutBarang.btn4Click(Sender: TObject);
var
 tgl1,tgl2 : string;
 i : Integer;
 index : integer;
begin
  tgl1 := FormatDateTime('yyyy',dt7.Date);
  ExQry(dm.Q1,'CALL sp_rekapBarang("'+tgl1+'")',True);
  dm.D1.DataSet := dm.Q1;
  cxdata2.DataController.DataSource := DM.D1;
  cxdata2.ClearItems;
  cxdata2.DataController.CreateAllItems(false);
  cxdata2.OptionsView.ColumnAutoWidth := true;
  for I := 0 to cxdata2.ColumnCount -1 do begin
    if cxdata2.Columns[i].Index >= 3 then
    begin

      cxdata2.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxdata2.Columns[i].Properties).DisplayFormat := '#,###';
    end;


  end;



end;

procedure TFlaporanInoutBarang.FormCreate(Sender: TObject);
begin
  dt7.Date := now;
end;

end.
