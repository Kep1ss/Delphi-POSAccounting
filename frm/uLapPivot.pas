unit uLapPivot;

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
  uComCtrl, uEngine,MyAccess,cxGridExportLink, uctrlFrm, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFlapPivot = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet5: TcxTabSheet;
    cxPageControl3: TcxPageControl;
    cxTabSheet6: TcxTabSheet;
    cxGroupBox4: TcxGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dt5: TDateTimePicker;
    dt6: TDateTimePicker;
    btn3: TcxButton;
    cxTabSheet7: TcxTabSheet;
    cxGroupBox5: TcxGroupBox;
    Label7: TLabel;
    dt7: TDateTimePicker;
    btn4: TcxButton;
    cxdata: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2: TcxGrid;
    cxdata2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DBCrossPivotPediode: TDBCrossTabSource;
    DBCrossPivotBulan: TDBCrossTabSource;
    CxPivotPenjualanBarang: TcxTabSheet;
    cxPageControl4: TcxPageControl;
    cxTabSheet8: TcxTabSheet;
    cxGroupBox6: TcxGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dt8: TDateTimePicker;
    dt9: TDateTimePicker;
    btn5: TcxButton;
    cxGrid3: TcxGrid;
    cxData3: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxTabSheet9: TcxTabSheet;
    cxGroupBox7: TcxGroupBox;
    Label10: TLabel;
    dt10: TDateTimePicker;
    btn6: TcxButton;
    cxGrid4: TcxGrid;
    cxData4: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxtbsht1: TcxTabSheet;
    cxtbsht2: TcxTabSheet;
    cxgrpbx1: TcxGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    dt11: TDateTimePicker;
    dt12: TDateTimePicker;
    btn7: TcxButton;
    cxgrd1: TcxGrid;
    cxdata5: TcxGridDBTableView;
    cxgrdlvl1: TcxGridLevel;
    cxgrpbx2: TcxGroupBox;
    Label13: TLabel;
    dt13: TDateTimePicker;
    btn8: TcxButton;
    cxgrd2: TcxGrid;
    cxdata6: TcxGridDBTableView;
    cxgrdlvl2: TcxGridLevel;
    cxgrpbx3: TcxGroupBox;
    btn9: TcxButton;
    cxgrpbx4: TcxGroupBox;
    btn10: TcxButton;
    cxgrpbx5: TcxGroupBox;
    btn11: TcxButton;
    cxgrpbx6: TcxGroupBox;
    btn12: TcxButton;
    cxgrpbx7: TcxGroupBox;
    btn13: TcxButton;
    cxgrpbx8: TcxGroupBox;
    btn14: TcxButton;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxGrid5: TcxGrid;
    cxDataTahunan: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlapPivot: TFlapPivot;

implementation

{$R *.dfm}

uses uDlaporan, udm;

procedure TFlapPivot.btn10Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\PivotPenjualanTahun_'+FormatDateTime('yyyy',dt7.Date)+'.xls',
  cxgrid2,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\PivotPenjualanTahun_'+FormatDateTime('yyyy',dt7.Date)+'.xls'),nil,nil, SW_NORMAL);
end;

procedure TFlapPivot.btn11Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\PivotPenjualanBarangQTY_'+Tanggal(dt8.Date)+'_'+Tanggal(dt9.Date)+'.xls',
  cxgrid3,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\PivotPenjualanBarangQTY_'+Tanggal(dt8.Date)+'_'+Tanggal(dt9.Date)+'.xls'),nil,nil, SW_NORMAL);
end;

procedure TFlapPivot.btn12Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\PivotPenjualanBarangQtyTahun_'+FormatDateTime('yyyy',dt10.Date)+'.xls',
  cxgrid4,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\PivotPenjualanBarangQtyTahun_'+FormatDateTime('yyyy',dt10.Date)+'.xls'),nil,nil, SW_NORMAL);
end;

procedure TFlapPivot.btn13Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\PivotPenjualanBarangNOMINAL_'+Tanggal(dt11.Date)+'_'+Tanggal(dt12.Date)+'.xls',
  cxgrd1,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\PivotPenjualanBarangNOMINAL_'+Tanggal(dt11.Date)+'_'+Tanggal(dt12.Date)+'.xls'),nil,nil, SW_NORMAL);
end;

procedure TFlapPivot.btn14Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\PivotPenjualanBarangNOMINALTahun_'+FormatDateTime('yyyy',dt13.Date)+'.xls',
  cxgrd2,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\PivotPenjualanBarangNOMINALTahun_'+FormatDateTime('yyyy',dt13.Date)+'.xls'),nil,nil, SW_NORMAL);
end;

procedure TFlapPivot.btn3Click(Sender: TObject);
var
 tgl1,tgl2 : string;
 i : Integer;
 index : integer;
begin
  tgl1 := Tanggal(dt5.Date);
  tgl2 := Tanggal(dt6.Date);
  ExQry(dm.Q1,'CALL sp_lapbulan("'+tgl1+'","'+tgl2+'")',True);
  dm.D1.DataSet := dm.Q1;
  cxdata.DataController.DataSource := DM.D1;
  cxdata.ClearItems;
  cxdata.DataController.CreateAllItems(false);
  for I := 0 to cxdata.ColumnCount -1 do begin
    if cxdata.Columns[i].Index >= 3 then
    begin
      cxdata.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxdata.Columns[i].Properties).DisplayFormat := '#,###';
    end;


  end;
  index := cxData.GetColumnByFieldName('TOTAL').Index;
  cxdata.Columns[index].Summary.GroupFooterKind       := skSum;
  cxdata.Columns[index].Summary.GroupFooterFormat     := 'TOTAL OMSET = #,###';
  cxdata.Columns[index].Width := 200;


end;

procedure TFlapPivot.btn4Click(Sender: TObject);
var
 tgl1,tgl2 : string;
 i : Integer;
 index : integer;
begin
  tgl1 := FormatDateTime('yyyy',dt7.Date);
  ExQry(dm.Q1,'CALL sp_lapTahun("'+tgl1+'")',True);
  dm.D1.DataSet := dm.Q1;
  cxdata2.DataController.DataSource := DM.D1;
  cxdata2.ClearItems;
  cxdata2.DataController.CreateAllItems(false);
  for I := 0 to cxdata2.ColumnCount -1 do begin
    if cxdata2.Columns[i].Index >= 3 then
    begin
      cxdata2.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxdata2.Columns[i].Properties).DisplayFormat := '#,###';
    end;


  end;
  index := cxData2.GetColumnByFieldName('TOTAL').Index;
  cxdata2.Columns[index].Summary.FooterKind       := skSum;
  cxdata2.Columns[index].Summary.FooterFormat     := 'TOTAL OMSET = #,###';
  cxdata2.Columns[index].Width := 200;


end;

procedure TFlapPivot.btn5Click(Sender: TObject);
var
 tgl1,tgl2 : string;
 i : Integer;
 index : integer;
begin
  tgl1 := Tanggal(dt8.Date);
  tgl2 := Tanggal(dt9.Date);
  ExQry(dm.Q1,'CALL sp_PivotBarangHari("'+tgl1+'","'+tgl2+'")',True);
  dm.D1.DataSet := dm.Q1;
  cxdata3.DataController.DataSource := DM.D1;
  cxdata3.ClearItems;
  cxdata3.DataController.CreateAllItems(false);
  for I := 0 to cxdata3.ColumnCount -1 do begin
    if cxdata3.Columns[i].Index >= 4 then
    begin
      cxdata3.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxdata3.Columns[i].Properties).DisplayFormat := '#,###';
    end;


  end;
  index := cxdata3.GetColumnByFieldName('TOTAL').Index;
  cxdata3.Columns[index].Summary.GroupFooterKind       := skSum;
  cxdata3.Columns[index].Summary.GroupFooterFormat     := 'TOTAL QTY = #,###';
  cxdata3.Columns[index].Width := 200;


end;


procedure TFlapPivot.btn6Click(Sender: TObject);
var
 tgl1 : string;
 i : Integer;
 index : integer;
begin
  tgl1 := FormatDateTime('yyyy',dt10.Date);
  ExQry(dm.Q1,'CALL sp_PivotBarangBulan("'+tgl1+'")',True);
  dm.D1.DataSet := dm.Q1;
  cxData4.DataController.DataSource := DM.D1;
  cxData4.ClearItems;
  cxData4.DataController.CreateAllItems(false);
  for I := 0 to cxData4.ColumnCount -1 do begin
    if cxData4.Columns[i].Index >= 4 then
    begin
      cxData4.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxData4.Columns[i].Properties).DisplayFormat := '#,###';
    end;


  end;
  index := cxData4.GetColumnByFieldName('TOTAL').Index;
  cxData4.Columns[index].Summary.GroupFooterKind       := skSum;
  cxData4.Columns[index].Summary.GroupFooterFormat     := 'TOTAL QTY = #,###';
  cxData4.Columns[index].Width := 200;

end;

procedure TFlapPivot.btn7Click(Sender: TObject);
var
 tgl1,tgl2 : string;
 i : Integer;
 index : integer;
begin
  tgl1 := Tanggal(dt11.Date);
  tgl2 := Tanggal(dt12.Date);
  ExQry(dm.Q1,'CALL sp_PivotNominalHari("'+tgl1+'","'+tgl2+'")',True);
  dm.D1.DataSet := dm.Q1;
  cxdata5.DataController.DataSource := DM.D1;
  cxdata5.ClearItems;
  cxdata5.DataController.CreateAllItems(false);
  for I := 0 to cxdata5.ColumnCount -1 do begin
    if cxdata5.Columns[i].Index >= 4 then
    begin
      cxdata5.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxdata5.Columns[i].Properties).DisplayFormat := '#,###';
    end;


  end;
  index := cxdata5.GetColumnByFieldName('TOTAL').Index;
  cxdata5.Columns[index].Summary.GroupFooterKind       := skSum;
  cxdata5.Columns[index].Summary.GroupFooterFormat     := 'TOTAL NOMINAL = #,###';
  cxdata5.Columns[index].Width := 200;


end;



procedure TFlapPivot.btn8Click(Sender: TObject);
var
 tgl1 : string;
 i : Integer;
 index : integer;
begin
  tgl1 := FormatDateTime('yyyy',dt13.Date);
  ExQry(dm.Q1,'CALL sp_PivotNominalBulan("'+tgl1+'")',True);
  dm.D1.DataSet := dm.Q1;
  cxData6.DataController.DataSource := DM.D1;
  cxData6.ClearItems;
  cxData6.DataController.CreateAllItems(false);
  for I := 0 to cxData6.ColumnCount -1 do begin
    if cxData6.Columns[i].Index >= 4 then
    begin
      cxData6.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxData6.Columns[i].Properties).DisplayFormat := '#,###';
    end;


  end;
  index := cxData6.GetColumnByFieldName('TOTAL').Index;
  cxData6.Columns[index].Summary.GroupFooterKind       := skSum;
  cxData6.Columns[index].Summary.GroupFooterFormat     := 'TOTAL QTY = #,###';
  cxData6.Columns[index].Width := 200;

end;

procedure TFlapPivot.btn9Click(Sender: TObject);
begin
 ExportGridToExcel(apathExe+'template\PivotPenjualan_'+Tanggal(dt5.Date)+'_'+Tanggal(dt6.Date)+'.xls',
  cxgrid1,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\PivotPenjualan_'+Tanggal(dt5.Date)+'_'+Tanggal(dt6.Date)+'.xls'),nil,nil, SW_NORMAL);
end;

procedure TFlapPivot.cxButton1Click(Sender: TObject);
var
 tgl1,tgl2 : string;
 i : Integer;
 index : integer;
begin

  ExQry(dm.Q1,'SELECT                      '+
  ' YEAR(`penjualan`.`tgljual`) AS `Tahun`,  '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "01" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `Januari`, '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "02" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `Feberuari`,'+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "03" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `Maret`,   '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "04" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `April`,   '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "05" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `Mei`,     '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "06" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `Juni`,    '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "07" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `Juli`,    '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "08" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `Agustus`, '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "09" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `September`,'+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "10" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `Oktober`,  '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "11" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `November`, '+
  ' SUM((CASE MONTH(`penjualan`.`tgljual`) WHEN "12" THEN `penjualan`.`grandtotal` ELSE 0 END)) AS `Desember`,  '+
  ' SUM(penjualan.grandtotal) as "Total" '+
  ' FROM `penjualan`                                                                                            '+
  ' GROUP BY YEAR(`penjualan`.`tgljual`)',True);
  dm.D1.DataSet := dm.Q1;
  cxDataTahunan.DataController.DataSource := DM.D1;
  cxDataTahunan.ClearItems;
  cxDataTahunan.DataController.CreateAllItems(false);
  for I := 0 to cxDataTahunan.ColumnCount -1 do begin
      if i > 0 then begin

      cxDataTahunan.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxDataTahunan.Columns[i].Properties).DisplayFormat := '#,###';

      cxDataTahunan.Columns[i].Summary.FooterKind := skSum;
      cxDataTahunan.Columns[i].Summary.FooterFormat := '#,###';
      end;


  end;
//  index := cxData2.GetColumnByFieldName('TOTAL').Index;
//  cxdata2.Columns[index].Summary.GroupFooterKind       := skSum;
//  cxdata2.Columns[index].Summary.GroupFooterFormat     := 'TOTAL OMSET = #,###';
//  cxdata2.Columns[index].Width := 200;


end;

procedure TFlapPivot.FormCreate(Sender: TObject);
var
  i : integer;
begin
   for i := 0 to Self.ComponentCount -1 do begin
      if Self.Components[i] is TDateTimePicker then
         TDateTimePicker(Self.Components[i]).DateTime := now;

   end;
end;

procedure TFlapPivot.FormShow(Sender: TObject);
begin
  Dlaporan.QpivotHari.Active := False;
end;

end.
