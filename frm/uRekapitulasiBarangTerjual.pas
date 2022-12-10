unit uRekapitulasiBarangTerjual;

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
  uComCtrl, uEngine,MyAccess,cxGridExportLink, uctrlFrm, cxTextEdit,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFrekapitulasiBarangTerjual = class(TForm)
    cxGroupBox6: TcxGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dt8: TDateTimePicker;
    dt9: TDateTimePicker;
    btn5: TcxButton;
    cxGrid3: TcxGrid;
    cxData3: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    btn11: TcxButton;
    Label1: TLabel;
    EFilter: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure EFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrekapitulasiBarangTerjual: TFrekapitulasiBarangTerjual;

implementation

{$R *.dfm}

uses uDlaporan, udm;

procedure TFrekapitulasiBarangTerjual.btn11Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\PivotPenjualanBarangQTY_'+Tanggal(dt8.Date)+'_'+Tanggal(dt9.Date)+'.xls',
  cxgrid3,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\PivotPenjualanBarangQTY_'+Tanggal(dt8.Date)+'_'+Tanggal(dt9.Date)+'.xls'),nil,nil, SW_NORMAL);
end;

procedure TFrekapitulasiBarangTerjual.btn5Click(Sender: TObject);
var
 tgl1,tgl2 : string;
 i : Integer;
 index : integer;
begin
  tgl1 := Tanggal(dt8.Date);
  tgl2 := Tanggal(dt9.Date);
  ExQry(dm.Q1,'CALL sp_barangterjual("'+tgl1+'","'+tgl2+'"," ")',True);
  dm.D1.DataSet := dm.Q1;
  cxdata3.DataController.DataSource := DM.D1;
  cxdata3.ClearItems;
  cxdata3.DataController.CreateAllItems(false);
  cxData3.Columns[0].Width := 120;
  for I := 0 to cxdata3.ColumnCount -1 do begin

    if cxdata3.Columns[i].Index >= 2 then
    begin
      cxdata3.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxdata3.Columns[i].Properties).DisplayFormat := '#,###';
      cxData3.Columns[i].Width := 180;
    end;


  end;


end;


procedure TFrekapitulasiBarangTerjual.EFilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);var
 tgl1,tgl2 : string;
 i : Integer;
 index : integer;
 str : String;
begin
  if Key = 13 then begin

        tgl1 := Tanggal(dt8.Date);
        tgl2 := Tanggal(dt9.Date);
        str  := ' WHERE t.namabarang LIKE "%'+EFilter.Text+'%" ';
        ExQry(dm.Q1,'CALL sp_barangterjual("'+tgl1+'","'+tgl2+'",'+ QuotedStr(str) +')',True);
        dm.D1.DataSet := dm.Q1;
        cxdata3.DataController.DataSource := DM.D1;
        cxdata3.ClearItems;
        cxdata3.DataController.CreateAllItems(false);
        cxData3.Columns[0].Width := 120;
        for I := 0 to cxdata3.ColumnCount -1 do begin

          if cxdata3.Columns[i].Index >= 2 then
          begin
            cxdata3.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
            TcxCurrencyEditProperties(cxdata3.Columns[i].Properties).DisplayFormat := '#,###';
            cxData3.Columns[i].Width := 180;
          end;


        end;
  end;


end;
procedure TFrekapitulasiBarangTerjual.FormShow(Sender: TObject);

begin


  dt8.Date := now;
  dt9.Date  := now;

end;

end.
