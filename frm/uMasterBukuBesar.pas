unit uMasterBukuBesar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Light, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, cxGroupBox, uEngine, tmsAdvGridExcel, uctrlFrm,
  dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier;

type
  TFmasterBukubesar = class(TForm)
    G1: TcxGroupBox;
    g2: TcxGroupBox;
    sg1: TAdvStringGrid;
    btnSetting: TcxButton;
    btnPrint: TcxButton;
    btnTutup: TcxButton;
    Oxl1: TAdvGridExcelIO;
    cxlbl1: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
    procedure sg1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure btnPrintClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BuatGrid;
    procedure isiMaster;
    { Public declarations }
  end;

var
  FmasterBukubesar: TFmasterBukubesar;

implementation

{$R *.dfm}

uses UinputMasterBukuBesar, udm;

{ TFmasterBukubesar }

procedure TFmasterBukubesar.btnPrintClick(Sender: TObject);
begin
  Oxl1.XLSExport(apathExe+'template\bukubesar.xls','Sheet1');
end;

procedure TFmasterBukubesar.btnSettingClick(Sender: TObject);
begin
  if not Assigned(FinputMasterBukuBesar) then
  Application.CreateForm(TFinputMasterBukuBesar, FinputMasterBukuBesar);

  FinputMasterBukuBesar.Show;
end;

procedure TFmasterBukubesar.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFmasterBukubesar.BuatGrid;
begin
  with sg1 do begin
    sg1.ColCount := 5;
    sg1.RowCount := 2;

    Cells[0,0]   := 'No';
    Cells[1,0]   := 'Master';
    Cells[2,0]   := 'Sub Master';
    Cells[3,0]   := 'Akun Perkiraan';
    Cells[4,0]   := 'Jenis';

    ColWidths[0] := 50;
    ColWidths[1] := 150;
    ColWidths[2] := 200;
    ColWidths[3] := 250;
    ColWidths[4] := 100;
   

  end;
end;

procedure TFmasterBukubesar.FormShow(Sender: TObject);
begin
  BuatGrid;
  isiMaster;
end;

procedure TFmasterBukubesar.isiMaster;
var
  i,c,r : integer;
begin
  ExQry(dm.Q1,'select * from m_bukubesar',True);
  i := 1;
  while dm.Q1.Eof = False do begin
      sg1.Cells[0,i] := GetVal(dm.Q1,'nomasterakun');
      sg1.Cells[1,i] := Getval(dm.Q1,'namamasterakun');
      c := i+1;
      ExQry(dm.Q2,'select * from m_subbukubesar where nomasterakun="'+GetVal(dm.Q1,'nomasterakun')+'"',True);
      while not dm.Q2.Eof do begin
        sg1.Cells[2,c] := Getval(dm.Q2,'akunsubmaster')+'. '+ Getval(dm.Q2,'namasubmaster');
        ExQry(dm.Q3,' SELECT ap.kodeakunperkiraan, ap.namaakunperkiraan,m.jenisakun '+
                    ' FROM m_akunperkiraan ap LEFT JOIN m_subbukubesar sa ON '+
                    ' ap.akunsubmaster=sa.akunsubmaster LEFT JOIN m_bukubesar m '+
                    ' ON m.nomasterakun=sa.nomasterakun WHERE '+
                    ' sa.`akunsubmaster`="'+Getval(dm.Q2,'akunsubmaster')+'"',True);
        r := c +1;
        while not dm.Q3.Eof do begin
          sg1.Cells[3,r] := Getval(dm.Q3,'kodeakunperkiraan')+'. '+ Getval(dm.Q3,'namaakunperkiraan');
          if GetVal(dm.Q3,'jenisakun') ='A' then
             sg1.Cells[4,r] := 'AKTIVA'
          else
             sg1.Cells[4,r] := 'PASIVA';
          Inc(r);
          dm.Q3.Next;
          sg1.RowCount := sg1.RowCount +1;
        end;
        dm.Q2.Next;
        c := r ;
        sg1.RowCount := sg1.RowCount +1;
      end;
      i := r ;
      dm.Q1.Next;
      sg1.RowCount := sg1.RowCount +1;
  end;
end;

procedure TFmasterBukubesar.sg1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if  (ACOL in [1]) and (arow > 0)then
  begin
    with TStringGrid(Sender) do
    begin
      //paint the background Green
      Canvas.Font.Style   := [fsBold];
      Canvas.Brush.Color  := clWhite;
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol, ARow]);
    end;
  end;
  if  (ACOL in [2]) and (arow > 0)then
  begin
    with TStringGrid(Sender) do
    begin
      //paint the background Green
      Canvas.Font.Style   := [fsBold];
      Canvas.Brush.Color  := clWhite;
      Canvas.Font.Color   := $00555555;
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol, ARow]);
    end;
  end;
  if  (ACOL in [3]) and (arow > 0)then
  begin
    with TStringGrid(Sender) do
    begin
      //paint the background Green
      Canvas.Font.Style   := [fsBold];
      Canvas.Brush.Color  := clWhite;
      Canvas.Font.Color   := $00646464;
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol, ARow]);
    end;
  end;
end;

end.
