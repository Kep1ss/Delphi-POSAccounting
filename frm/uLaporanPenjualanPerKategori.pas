unit uLaporanPenjualanPerKategori;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.Menus,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, Vcl.ComCtrls, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,cxCurrencyEdit,
  cxGridDBTableView, cxGrid, cxButtons, cxGroupBox, uEngine, uComCtrl,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010,cxGridExportLink,ShellApi, dxSkinWhiteprint,
  dxSkinXmas2008Blue, uctrlFrm, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFLapPenjualanKategori = class(TForm)
    cxgrpbx2: TcxGroupBox;
    btn8: TcxButton;
    cxgrd2: TcxGrid;
    cxdata6: TcxGridDBTableView;
    cxgrdlvl2: TcxGridLevel;
    cxgrpbx8: TcxGroupBox;
    btn14: TcxButton;
    Label8: TLabel;
    Label9: TLabel;
    dt8: TDateTimePicker;
    dt9: TDateTimePicker;
    Label1: TLabel;
    cbKategori: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLapPenjualanKategori: TFLapPenjualanKategori;

implementation

{$R *.dfm}

uses udm;

procedure TFLapPenjualanKategori.btn14Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\Laporan Proft Per Item.xls',
  cxgrd2,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\Laporan Proft Per Item.xls'),nil,nil, SW_NORMAL);
end;

procedure TFLapPenjualanKategori.btn8Click(Sender: TObject);
var
  i : Integer;
  index1,Index2,Index3 : Integer;
  Kategori : String;
begin

  if (cbKategori.ItemIndex = 0) or (cbKategori.ItemIndex = -1) then
     Kategori := '' else
     Kategori := ' AND k.namakategori="'+cbKategori.Text+'" ';
  ExQry(dm.Q1,' SELECT                                                      '+
              '    d.fakturjual AS "FAKTUR JUAL",                           '+
              '    d.kodebarang AS "KODE BARANG",                           '+
              '    b.namabarang AS "NAMA BARANG",                           '+
              '    k.namakategori AS "KATEGORI",                           '+
              '    d.satuan AS "SATUAN",                                    '+
              '    IFNULL(                                                        '+
              '      d.isi - (                                              '+
              '        (d.isi / d.jumlah) * d.jumlahretur      '+
              '      )                                                      '+
              '    ,0) AS "ISI",                                              '+
              '    IFNULL(                                                        '+
              '      d.subtotal - (d.harga * d.jumlahretur)                 '+
              '    ,0) AS "HARGA",                                            '+
              '    IFNULL(                                                        '+
              '      d.hpp * (                                              '+
              '        d.isi - (                                            '+
              '          (d.isi / d.jumlah) * d.jumlahretur    '+
              '        )                                                    '+
              '      )                                                      '+
              '    ,0) AS "HPP",                                              '+
              '    IFNULL((                                                        '+
              '      d.subtotal - (d.harga * d.jumlahretur)                 '+
              '    ) - (                                                    '+
              '      d.hpp * (                                              '+
              '        d.isi - (                                            '+
              '          (d.isi / d.jumlah) * d.jumlahretur    '+
              '        )                                                    '+
              '      )                                                      '+
              '    ),0) AS "MARGIN (Rp)",                                      '+
              '   IFNULL(((                                                        '+
              '      d.subtotal - (d.harga * d.jumlahretur)                 '+
              '    ) - (                                                    '+
              '      d.hpp * (                                              '+
              '        d.isi - (                                            '+
              '          (d.isi / d.jumlah) * d.jumlahretur    '+
              '        )                                                    '+
              '      )                                                      '+
              '    )) / ((                                                  '+
              '      d.hpp * (                                              '+
              '        d.isi - (                                            '+
              '          (d.isi / d.jumlah) * d.jumlahretur    '+
              '        )                                                    '+
              '      )                                                      '+
              '    )) * 100,0) AS "MARGIN(%)" FROM penjualandetil d LEFT JOIN penjualan p ON p.fakturjual=d.fakturjual '+
              ' LEFT JOIN barang b ON b.kodebarang=d.kodebarang '+
              ' LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
              ' WHERE p.tgljual>="'+Tanggal(Dt8.Date)+'" AND '+
              ' p.tgljual<="'+Tanggal(dt9.Date)+'" '+Kategori+' '+
              ' GROUP BY d.kodebarang,p.fakturjual',True);
  dm.D1.DataSet := dm.Q1;
  cxdata6.DataController.DataSource := DM.D1;
  cxdata6.ClearItems;
  cxdata6.DataController.CreateAllItems(false);
  for I := 0 to cxdata6.ColumnCount -1 do begin
    if cxdata6.Columns[i].Index >= 5 then
    begin
      cxdata6.Columns[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(cxdata6.Columns[i].Properties).DisplayFormat := '#,###.00';
    end;


  end;
  index1 := cxdata6.GetColumnByFieldName('HARGA').Index;
  cxdata6.Columns[index1].Summary.FooterKind       := skSum;
  cxdata6.Columns[index1].Summary.FooterFormat     := '#,###.00';
  cxdata6.Columns[index1].Width := 200;

  index1 := cxdata6.GetColumnByFieldName('HPP').Index;
  cxdata6.Columns[index1].Summary.FooterKind       := skSum;
  cxdata6.Columns[index1].Summary.FooterFormat     := '#,###.00';
  cxdata6.Columns[index1].Width := 200;

  index1 := cxdata6.GetColumnByFieldName('MARGIN (Rp)').Index;
  cxdata6.Columns[index1].Summary.FooterKind       := skSum;
  cxdata6.Columns[index1].Summary.FooterFormat     := '#,###.00';
  cxdata6.Columns[index1].Width := 200;
end;

procedure TFLapPenjualanKategori.FormShow(Sender: TObject);
begin
  dt8.Date := Now;
  dt9.Date := Now;
  ExQry(dm.Q1,'SELECT namakategori,idkategori FROM kategori',True);
  cbKategori.Items.Clear;
  cbKategori.Items.Add('--- ALL ---');

  while not dm.Q1.Eof do begin
    cbKategori.Items.Add(GetVal(dm.Q1,'namakategori'));
    dm.Q1.Next;
  end;
end;

end.
