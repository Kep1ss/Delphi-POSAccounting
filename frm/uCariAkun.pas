unit uCariAkun;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uctrlFrm, uEngine, uComCtrl, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinVisualStudio2013Blue, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxContainer, cxTextEdit,
  dxSkiniMaginary, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFcariAkun = class(TForm)
    cxgrd1DBTableView1: TcxGridDBTableView;
    GGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    cxgrd1DBTableView1kodeakunperkiraan: TcxGridDBColumn;
    cxgrd1DBTableView1namaakunperkiraan: TcxGridDBColumn;
    EPencarian: TcxTextEdit;
    procedure EPencarianEnter(Sender: TObject);
    procedure EPencarianExit(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgrd1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgrd1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FcariAkun: TFcariAkun;
  isTransaksi : Integer;

implementation

{$R *.dfm}

uses udm, uTransaksiJurnalMemorial, uTransaksiPengeluaranBiaya;

procedure TFcariAkun.cxgrd1DBTableView1DblClick(Sender: TObject);
begin

  case isTransaksi of
  0: begin  with FtransaksiJurnal do begin
        sg1.Cells[0,sg1.Row] := GetVal(dm.QMasterAkunPerkiraan,'kodeakunperkiraan');
        sg1.Cells[1,sg1.Row] := GetVal(dm.QMasterAkunPerkiraan,'namaakunperkiraan');

        end;
    end;
  1: begin  with FtransaksiPengeluaranBiaya do begin
        sg1.Cells[0,sg1.Row] := GetVal(dm.QMasterAkunPerkiraan,'kodeakunperkiraan');
        sg1.Cells[1,sg1.Row] := GetVal(dm.QMasterAkunPerkiraan,'namaakunperkiraan');

        end;
    end;
  end;

  Close;
end;

procedure TFcariAkun.cxgrd1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     cxgrd1DBTableView1.OnDblClick(Sender);
end;

procedure TFcariAkun.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
  EPencarian.Style.Font.Color := clBlack;
end;

procedure TFcariAkun.EPencarianExit(Sender: TObject);
begin
  EPencarian.Text := 'Ketikan Nama Akun atau Nomer akun';
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style + [fsItalic];
  EPencarian.Style.Font.Color := clGray;
end;

procedure TFcariAkun.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case isTransaksi of
  0 : ExQry(dm.QMasterAkunPerkiraan,'select * from m_akunperkiraan where '+
      ' kodeakunperkiraan like"%'+EPencarian.Text+'%" or '+
      ' namaakunperkiraan like"%'+FtransaksiJurnal.ENobukti.Text+'%" ',True );
  1 : ExQry(dm.QMasterAkunPerkiraan,'select * from m_akunperkiraan where '+
      ' kodeakunperkiraan like"%'+EPencarian.Text+'%" or '+
      ' namaakunperkiraan like"%'+EPencarian.Text+'%" ',True );
  end;

end;

end.
