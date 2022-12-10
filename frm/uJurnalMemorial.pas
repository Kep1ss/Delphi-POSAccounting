unit uJurnalMemorial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Light, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, cxGroupBox, uEngine, tmsAdvGridExcel, uctrlFrm,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,uTerbilang, cxTextEdit,
  Vcl.ComCtrls, dxBevel, dxSkinSharp, System.DateUtils,cxLabel,
  dxSkinOffice2016Colorful, dxSkinsDefaultPainters, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFJurnalMemorial = class(TForm)
    G1: TcxGroupBox;
    g2: TcxGroupBox;
    sg1: TAdvStringGrid;
    btnPrint: TcxButton;
    btnTutup: TcxButton;
    Oxl1: TAdvGridExcelIO;
    bv1: TdxBevel;
    Label1: TLabel;
    dt1: TDateTimePicker;
    Label2: TLabel;
    dt2: TDateTimePicker;
    Label3: TLabel;
    EPencarian: TcxTextEdit;
    btnBaru: TcxButton;
    btn1: TcxButton;
    cxLabel1: TcxLabel;
    dxBevel1: TdxBevel;
    btnHapus: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
    procedure sg1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure btnPrintClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPeriksaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BuatGrid;
    procedure isiMaster(str:string);
    { Public declarations }
  end;

var
  FJurnalMemorial: TFJurnalMemorial;

implementation

{$R *.dfm}

uses UinputMasterBukuBesar, udm, uTransaksiJurnalMemorial, uComCtrl, uMainMenu;

{ TFmasterBukubesar }

procedure TFJurnalMemorial.btn1Click(Sender: TObject);
begin
  if sg1.Cells[1,sg1.Row] <> '' then
     FtransaksiJurnal.PrintJurnal(sg1.Cells[1,sg1.Row])
  else
  begin
    MessageBox(Handle,'Silahkan pilih nobukti dengan benar!','Warning',MB_ICONWARNING);
    Exit;
  end;
end;

procedure TFJurnalMemorial.btnBaruClick(Sender: TObject);
begin
  FtransaksiJurnal.Show;
  FtransaksiJurnal.TampilanAwal;
  FtransaksiJurnal.btnSimpan.Caption := 'Simpan[ Ctrl + S ]'
end;

procedure TFJurnalMemorial.btnHapusClick(Sender: TObject);
begin
  if MessageDlg('Apakah data akan dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if sg1.Cells[1,sg1.Row] <> '' then begin

        ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+sg1.Cells[1,sg1.Row]+'"',False);
        ExQry(dm.Q1,'DELETE FROM detailjurnalmemorial WHERE nobukti="'+sg1.Cells[1,sg1.Row]+'"',False);
        ExQry(dm.Q1,'DELETE FROM jurnalmemorial WHERE nobukti="'+sg1.Cells[1,sg1.Row]+'"',False);
        dt1Change(Sender);
    end else
      Warning('Silahkan pilih nobukti dengan benar');
  end;
end;

procedure TFJurnalMemorial.btnPeriksaClick(Sender: TObject);
var
  i : integer;
begin

    FtransaksiJurnal.btnSimpan.Caption := 'Simpan[ Ctrl + S ]';
    ExQry(dm.Q1,'select * from jurnalmemorial WHERE nobukti="'+sg1.Cells[1,sg1.Row]+'"',True);
    FtransaksiJurnal.dt1.Date := GetValDate(dm.Q1,'tanggal');
    FtransaksiJurnal.ENobukti.Text             := GetVal(dm.Q1,'nobukti');
    i := 1;

      ExQry(dm.Q2,'select d.*,a.* from detailjurnalmemorial d,m_akunperkiraan a '+
      ' where d.noakun=a.kodeakunperkiraan AND  nobukti="'+GetVal(dm.Q1,'nobukti')+'"',True);
      while not dm.Q2.Eof do begin
        FtransaksiJurnal.sg1.Cells[0,i] := Getval(dm.Q2,'noakun');
        FtransaksiJurnal.sg1.Cells[1,i] := Getval(dm.Q2,'namaakunperkiraan');
        FtransaksiJurnal.sg1.Cells[2,i] := Getval(dm.Q2,'keterangan');
        FtransaksiJurnal.sg1.Cells[3,i] := Getval(dm.Q2,'jenistransaksi');
        FtransaksiJurnal.sg1.Cells[4,i] := Format('%.2n',[GetvalF(dm.Q2,'nominal')]);
        Inc(i);
        dm.Q2.Next;
        FtransaksiJurnal.sg1.RowCount := sg1.RowCount +1;
      end;
    FtransaksiJurnal.ENominal.Text    := Format('%.2n',[SumGrid(FtransaksiJurnal.sg1,4)]);
    FtransaksiJurnal.Eterbilang.Text  := MyTerbilang(StrToFloat(nilai(FtransaksiJurnal.ENominal.Text)));
    FtransaksiJurnal.Show;

end;

procedure TFJurnalMemorial.btnPrintClick(Sender: TObject);
begin
  Oxl1.XLSExport(apathExe+'template\bukubesar.xls','Sheet1');
end;

procedure TFJurnalMemorial.btnSettingClick(Sender: TObject);
begin
  FinputMasterBukuBesar.Show;
end;

procedure TFJurnalMemorial.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFJurnalMemorial.BuatGrid;
var
  i , r : Integer;

begin
  with sg1 do begin

    for I := 0 to ColCount -1 do
    for r := 0 to RowCount -1 do
      Cells[i,r] := '';
    sg1.ColCount := 9;
    sg1.RowCount := 2;

    Cells[0,0]   := 'No';
    Cells[1,0]   := 'No Bukti';
    Cells[2,0]   := 'Tanggal';
    Cells[3,0]   := 'Nominal';
    Cells[4,0]   := 'No Akun';
    Cells[5,0]   := 'Nama Akun';
    Cells[6,0]   := 'Keterangan';
    Cells[7,0]   := 'Debet';
    Cells[8,0]   := 'Kredit';


    ColWidths[0] := 50;
    ColWidths[1] := 100;
    ColWidths[2] := 100;
    ColWidths[3] := 100;
    ColWidths[4] := 100;
    ColWidths[5] := 200;
    ColWidths[6] := 250;
    ColWidths[7] := 100;
    ColWidths[8] := 100;

  end;

end;

procedure TFJurnalMemorial.dt1Change(Sender: TObject);
begin
  BuatGrid;
  isiMaster('tanggal >= "'+Tanggal(dt1.Date)+'" and tanggal <= "'+Tanggal(dt2.Date)+'"');
end;

procedure TFJurnalMemorial.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key  of
  VK_RETURN : isiMaster('nobukti like"%'+EPencarian.Text+'%"');
  end;
end;

procedure TFJurnalMemorial.FormActivate(Sender: TObject);
begin
  onShow(Sender);
end;

procedure TFJurnalMemorial.FormShow(Sender: TObject);
begin
  BuatGrid;
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  isiMaster('tanggal >= "'+Tanggal(dt1.Date)+'" and tanggal <= "'+Tanggal(dt2.Date)+'"');
end;

procedure TFJurnalMemorial.isiMaster(str:string);
var
  i,c : integer;
begin
  BuatGrid;
  ExQry(dm.Q1,'select * from jurnalmemorial where '+str+'',True);
  i := 1;
  while dm.Q1.Eof = False do begin
      sg1.Cells[0,i] := IntToStr(dm.Q1.RecNo);
      sg1.Cells[1,i] := Getval(dm.Q1,'nobukti');
      sg1.Cells[2,i] := Getval(dm.Q1,'tanggal');
      sg1.Cells[3,i] := Format('%.2n',[GetvalF(dm.Q1,'nominal')]);
 //     sg1.Cells[9,i] := Getval(dm.Q1,'stts');
      c := i;
      ExQry(dm.Q2,'select d.*,a.* from detailjurnalmemorial d,m_akunperkiraan a '+
      ' where d.noakun=a.kodeakunperkiraan AND  nobukti="'+GetVal(dm.Q1,'nobukti')+'"',True);
      while not dm.Q2.Eof do begin
        sg1.Cells[4,c] := Getval(dm.Q2,'noakun');
        sg1.Cells[5,c] := Getval(dm.Q2,'namaakunperkiraan');
        sg1.Cells[6,c] := Getval(dm.Q2,'keterangan');
        if GetVal(dm.Q2,'jenistransaksi') = 'D' then begin

          sg1.Cells[7,c] := Format('%.2n',[GetvalF(dm.Q2,'nominal')]);
          sg1.Cells[8,c] := '';
        end else
        begin
          sg1.Cells[8,c] := Format('%.2n',[GetvalF(dm.Q2,'nominal')]);
          sg1.Cells[7,c] := '';
          sg1.RowCount := sg1.RowCount +1;
        end;
        Inc(c);
        dm.Q2.Next;

      end;
      i := c ;
      dm.Q1.Next;
      sg1.RowCount := sg1.RowCount +1;
  end;
end;

procedure TFJurnalMemorial.sg1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if  (sg1.Cells[1,ARow] <> '') and (arow > 0)then
  begin
    with TStringGrid(Sender) do
    begin
      //paint the background Green
      Canvas.Font.Style   := [fsBold];
      Canvas.Brush.Color  := $0055AAFF;
   //   Canvas.Brush.Color  := clWhite;
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol, ARow]);
    end;
  end;
end;

end.
