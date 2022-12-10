unit uPilihSatuan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkiniMaginary,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCurrencyEdit, uComCtrl, uEngine, uctrlFrm, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxCalc, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFpilihSatuan = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1satuan: TcxGridDBColumn;
    cxGrid1DBTableView1isi: TcxGridDBColumn;
    charga: TcxGridDBColumn;
    cHargabeli: TcxGridDBColumn;
    cPromo1: TcxGridDBColumn;
    cPromo2: TcxGridDBColumn;
    cPromo3: TcxGridDBColumn;
    sx1: TcxStyleRepository;
    cxstyl1: TcxStyle;
    cxstyl2: TcxStyle;
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    isFormSatuan : Integer;
    { Public declarations }
  end;

var
  FpilihSatuan: TFpilihSatuan;

implementation

{$R *.dfm}

uses udm, uPenjualan, uSalesOrder, uPembelian, uReturPenjualan,
  uReturPenjualannew;

procedure TFpilihSatuan.cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    subtotal,Jumlah,harga : real;
begin
  if (Key = VK_UP) or (key =VK_DOWN) then begin
    case isFormSatuan of
    0 : begin
          with FPenjualanBarang do begin
           Jumlah               := StrToFloatDef(nilai(sg1.Cells[4,sg1.Row]),0);
           harga                := getHarga(GetVal(dm.QMultiSatuan,'kodebarang'),GetVal(dm.QMultiSatuan,'satuan'));
           sg1.Cells[3,sg1.Row] := format('%.0n',[Harga]);
           sg1.Cells[7,sg1.Row] := GetVal(dm.QMultiSatuan,'satuan');
           sg1.Cells[9,sg1.Row] := FloatToStr(GetValf(dm.QMultiSatuan,'isi') * Jumlah);

           subtotal             := harga * Jumlah;
           sg1.Cells[8,sg1.Row] := GetRupiah(FloatToStr(subtotal));
           HitungTotal;


          end;

        end;
    1 : begin
          with FsalesOrder do begin
           Jumlah               := StrToFloatDef(nilai(sg1.Cells[4,sg1.Row]),0);
           sg1.Cells[3,sg1.Row] := GetVal(dm.QMultiSatuan,'satuan');
           sg1.Cells[5,sg1.Row] := FloatToStr(GetValf(dm.QMultiSatuan,'isi') * Jumlah);
          end;

        end;
    2 : begin
          with FpembelianBarang do begin
           Jumlah               := StrToFloatDef(nilai(sg1.Cells[4,sg1.Row]),0);
           sg1.Cells[5,sg1.Row] := GetVal(dm.QMultiSatuan,'hargabeli');
           sg1.Cells[7,sg1.Row] := Format('%.2n',[GetValF(dm.QMultiSatuan,'hargabeli') + (GetValF(dm.QMultiSatuan,'hargabeli') * StrToFloatDef(Nilai(Sg1.Cells[6,sg1.Row]),0) / 100)]);
           sg1.Cells[3,sg1.Row] := GetVal(dm.QMultiSatuan,'satuan');
           subtotal             := GetValF(dm.QMultiSatuan,'hargabeli') * Jumlah;
           sg1.Cells[17,sg1.Row] := Format('%.2n',[subtotal]);
           sg1.Cells[18,sg1.Row] := FloatToStr(GetValf(dm.QMultiSatuan,'isi') * Jumlah);
           HitungTotal;
          end;

        end;
    3 : begin
          with FreturJualNew do begin
           Jumlah               := StrToFloatDef(nilai(sg1.Cells[7,sg1.Row]),0);
           sg1.Cells[3,sg1.Row] := GetVal(dm.QMultiSatuan,'harga');
           sg1.Cells[6,sg1.Row] := GetVal(dm.QMultiSatuan,'satuan');
           subtotal             := GetValF(dm.QMultiSatuan,'harga') * Jumlah;
           sg1.Cells[8,sg1.Row] := Format('%.2n',[subtotal]);
           sg1.Cells[10,sg1.Row] := FloatToStr(GetValf(dm.QMultiSatuan,'isi') * Jumlah);
           HitungTotal;
          end;

        end;
    end;


  end;

  if Key = VK_RETURN then begin
      case isFormSatuan of
    0 : begin
          with FPenjualanBarang do begin
           Jumlah               := StrToFloatDef(nilai(sg1.Cells[4,sg1.Row]),0);
           harga                := getHarga(GetVal(dm.QMultiSatuan,'kodebarang'),GetVal(dm.QMultiSatuan,'satuan'));
           sg1.Cells[3,sg1.Row] := format('%.0n',[Harga]);
           sg1.Cells[7,sg1.Row] := GetVal(dm.QMultiSatuan,'satuan');
           sg1.Cells[9,sg1.Row] := FloatToStr(GetValf(dm.QMultiSatuan,'isi') * Jumlah);

           subtotal             := CellF(sg1.Cells[3,sg1.Row]) * Jumlah;
           sg1.Cells[8,sg1.Row] := GetRupiah(FloatToStr(subtotal));
           HitungTotal;

           Focus;
          end;
           Close;
        end;
    1 : begin
          with FsalesOrder do begin
           Jumlah               := StrToFloatDef(nilai(sg1.Cells[4,sg1.Row]),0);
           sg1.Cells[3,sg1.Row] := GetVal(dm.QMultiSatuan,'satuan');
           sg1.Cells[5,sg1.Row] := FloatToStr(GetValf(dm.QMultiSatuan,'isi') * Jumlah);
          end;
           Close;
        end;
    2 : begin
          with FpembelianBarang do begin
           Jumlah               := StrToFloatDef(nilai(sg1.Cells[4,sg1.Row]),0);
           sg1.Cells[5,sg1.Row] := GetVal(dm.QMultiSatuan,'hargabeli');
           sg1.Cells[3,sg1.Row] := GetVal(dm.QMultiSatuan,'satuan');
           subtotal             := GetValF(dm.QMultiSatuan,'hargabeli') * Jumlah;
           sg1.Cells[17,sg1.Row] := Format('%.2n',[subtotal]);
           sg1.Cells[18,sg1.Row] := FloatToStr(GetValf(dm.QMultiSatuan,'isi') * Jumlah);
           HitungTotal;
          end;
           Close;
        end;

    3 : begin
          with FreturJualNew do begin
           Jumlah               := StrToFloatDef(nilai(sg1.Cells[7,sg1.Row]),0);
           sg1.Cells[3,sg1.Row] := GetVal(dm.QMultiSatuan,'harga');
           sg1.Cells[6,sg1.Row] := GetVal(dm.QMultiSatuan,'satuan');
           subtotal             := GetValF(dm.QMultiSatuan,'harga') * Jumlah;
           sg1.Cells[8,sg1.Row] := Format('%.2n',[subtotal]);
           sg1.Cells[10,sg1.Row] := FloatToStr(GetValf(dm.QMultiSatuan,'isi') * Jumlah);
           HitungTotal;
          end;
          Close;
        end;

    end;
  end;
end;

end.
