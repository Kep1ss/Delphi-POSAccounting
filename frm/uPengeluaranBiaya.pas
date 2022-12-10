unit uPengeluaranBiaya;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Light, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, cxGroupBox, uEngine, tmsAdvGridExcel, uctrlFrm,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,uTerbilang, cxTextEdit,
  Vcl.ComCtrls, dxBevel, dxSkinSharp, cxLabel,dateutils,
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
  TFpengeluaranBiaya = class(TForm)
    G1: TcxGroupBox;
    g2: TcxGroupBox;
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
    sg1: TAdvStringGrid;
    btnHapus: TcxButton;
    btnEdit: TcxButton;
    cxlbl1: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
    procedure sg1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure btnPrintClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnPeriksaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BuatGrid;
    procedure isiMaster(str:string);
    { Public declarations }
  end;

var
  FpengeluaranBiaya: TFpengeluaranBiaya;

implementation

{$R *.dfm}

uses  udm, uComCtrl, uTransaksiPengeluaranBiaya, UinputMasterBukuBesar,
  uMainMenu;

{ TFmasterBukubesar }

procedure TFpengeluaranBiaya.btn1Click(Sender: TObject);
var
  i : Integer;
  sss : string;
  Check : Boolean;
begin
    if sg1.Cells[2,sg1.Row] <> '' then  begin
     sss := '';
    for i := 1 to sg1.RowCount -1  do begin
       sg1.GetCheckBoxState(1,i,Check);

       if (Check = True) and (sg1.Cells[2,i] <> '') then begin
         sss := sss + '"'+sg1.Cells[2,i]+'",';

       end;

    end;
     Delete(sss,length(sss),1);

     if sss <> '' then

     FtransaksiPengeluaranBiaya.PrintBukti(sss)
    else
      Error('Belum ada data terpilih');
    end
  else
  begin
    MessageBox(Handle,'Silahkan pilih nobukti dengan benar!','Warning',MB_ICONWARNING);
    Exit;
  end;
end;

procedure TFpengeluaranBiaya.btnBaruClick(Sender: TObject);
begin
  FtransaksiPengeluaranBiaya.Show;
  FtransaksiPengeluaranBiaya.TampilanAwal;
  FtransaksiPengeluaranBiaya.btnSimpan.Caption := 'Simpan [ Ctrl + S ]';
end;

procedure TFpengeluaranBiaya.btnEditClick(Sender: TObject);
var
  i : integer;
  const
  iMaster = ' select p.nobukti,p.tanggal,p.noakun,a.namaakunperkiraan,'+
            ' p.nominal,p.keterangan,p.stts from pengeluaranbiaya p Left Join m_akunperkiraan a '+
            ' ON p.noakun=a.kodeakunperkiraan ';

begin
   ExQry(dm.Q1,iMaster+' WHERE p.nobukti="'+sg1.Cells[2,sg1.Row]+'"',True);
  FtransaksiPengeluaranBiaya.BuatGrid;
  FtransaksiPengeluaranBiaya.ENoBUkti.Text     := GetVal(dm.Q1,'nobukti');
  FtransaksiPengeluaranBiaya.dt1.Date          := GetValDate(dm.Q1,'tanggal');
  FtransaksiPengeluaranBiaya.cbAkun.ItemIndex  := idxCmb(FtransaksiPengeluaranBiaya.cbAkun,StrToInt(nilai(GetVal(dm.Q1,'noakun'))));

  i := 1;
  ExQry(dm.Q2,'select d.*,a.* from detailpengeluaranbiaya d,m_akunperkiraan a '+
      ' where d.noakun=a.kodeakunperkiraan AND  nobukti="'+GetVal(dm.Q1,'nobukti')+'"',True);


  while dm.Q2.Eof = False do begin

  with FtransaksiPengeluaranBiaya.sg1 do begin
        RowCount   := RowCount +1;
        Cells[0,i] := Getval(dm.Q2,'noakun');
        Cells[1,i] := Getval(dm.Q2,'namaakunperkiraan');
        Cells[2,i] := Getval(dm.Q2,'keterangan');
        Cells[3,i] := GetRupiah(Getval(dm.Q2,'nominal'));

        dm.Q2.Next;
        Inc(i);
  end;
  end;
  FtransaksiPengeluaranBiaya.ENominal.Text := GetRupiah(SumGrid(FtransaksiPengeluaranBiaya.sg1,3));
  FtransaksiPengeluaranBiaya.Eterbilang.Text := MyTerbilang(StrToFloatDef(nilai(FtransaksiPengeluaranBiaya.Enominal.Text),0));
  FtransaksiPengeluaranBiaya.Show;
  FtransaksiPengeluaranBiaya.cbAkunPropertiesCloseUp(Sender);
  FtransaksiPengeluaranBiaya.Lsaldo.Caption := GetRupiah(FloatToStr(StrToFloat(nilai(FtransaksiPengeluaranBiaya.Lsaldo.Caption))+ StrToFloat(nilai(FtransaksiPengeluaranBiaya.ENominal.Text))));
end;

procedure TFpengeluaranBiaya.btnHapusClick(Sender: TObject);
var
  sss : string;
  i   : integer;
  Check : Boolean;
begin

    if MessageDlg('Yakin data akan dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin


     sss := '';
      for i := 1 to sg1.RowCount -1  do begin
       sg1.GetCheckBoxState(1,i,Check);

       if (Check = True) and (sg1.Cells[2,i] <> '') then begin
         sss := sss + '"'+sg1.Cells[2,i]+'",';

       end;
      end;

      Delete(sss,length(sss),1);
      ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti IN ('+sss+')',False);
      ExQry(dm.Q1,'DELETE FROM detailpengeluaranbiaya WHERE nobukti IN ('+sss+')',False);
      ExQry(dm.Q1,'DELETE FROM pengeluaranbiaya WHERE nobukti IN ('+sss+')',False);
      onSHow(Sender);
    end;

end;

procedure TFpengeluaranBiaya.btnPeriksaClick(Sender: TObject);
var
  i : integer;

const
  iMaster = ' select p.nobukti,p.tanggal,p.noakun,a.namaakunperkiraan,'+
            ' p.nominal,p.keterangan, from pengeluaranbiaya p Left Join m_akunperkiraan a '+
            ' ON p.noakun=a.kodeakunperkiraan ';

begin
  FtransaksiPengeluaranBiaya.btnSimpan.Caption := 'Simpan [ Ctrl + S ]';
  ExQry(dm.Q1,iMaster+' WHERE p.nobukti="'+sg1.Cells[2,sg1.Row]+'"',True);
  FtransaksiPengeluaranBiaya.BuatGrid;
  FtransaksiPengeluaranBiaya.ENoBUkti.Text     := GetVal(dm.Q1,'nobukti');
  FtransaksiPengeluaranBiaya.dt1.Date          := GetValDate(dm.Q1,'tanggal');
  FtransaksiPengeluaranBiaya.cbAkun.ItemIndex  := idxCmb(FtransaksiPengeluaranBiaya.cbAkun,StrToInt(nilai(GetVal(dm.Q1,'noakun'))));

  i := 1;
  ExQry(dm.Q2,'select d.*,a.* from detailpengeluaranbiaya d,m_akunperkiraan a '+
      ' where d.noakun=a.kodeakunperkiraan AND  nobukti="'+GetVal(dm.Q1,'nobukti')+'"',True);


  while dm.Q2.Eof = False do begin

  with FtransaksiPengeluaranBiaya.sg1 do begin
        RowCount   := RowCount +1;
        Cells[0,i] := Getval(dm.Q2,'noakun');
        Cells[1,i] := Getval(dm.Q2,'namaakunperkiraan');
        Cells[2,i] := Getval(dm.Q2,'keterangan');
        Cells[3,i] := GetRupiah(Getval(dm.Q2,'nominal'));

        dm.Q2.Next;
        Inc(i);
  end;
  end;
  FtransaksiPengeluaranBiaya.ENominal.Text   := GetRupiah(SumGrid(FtransaksiPengeluaranBiaya.sg1,3));
  FtransaksiPengeluaranBiaya.Eterbilang.Text := MyTerbilang(StrToFloatDef(nilai(FtransaksiPengeluaranBiaya.Enominal.Text),0));
  FtransaksiPengeluaranBiaya.Show;
  FtransaksiPengeluaranBiaya.cbAkunPropertiesCloseUp(Sender);
  FtransaksiPengeluaranBiaya.Lsaldo.Caption := GetRupiah(FloatToStr(StrToFloat(nilai(FtransaksiPengeluaranBiaya.Lsaldo.Caption))+ StrToFloat(nilai(FtransaksiPengeluaranBiaya.ENominal.Text))));
end;


procedure TFpengeluaranBiaya.btnPrintClick(Sender: TObject);
begin
  Oxl1.XLSExport(apathExe+'template\pengeluarankas.xls','Sheet1');
end;

procedure TFpengeluaranBiaya.btnSettingClick(Sender: TObject);
begin
  FinputMasterBukuBesar.Show;
end;

procedure TFpengeluaranBiaya.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFpengeluaranBiaya.BuatGrid;
var
  c, r : Integer;
begin
  with sg1 do begin
    for c := 0 to ColCount -1 do
    for r := 0 to RowCount -1 do
        Cells[c,r] := '';
    sg1.ColCount := 7;
    sg1.RowCount := 2;

    Cells[0,0]   := 'No';
    Cells[1,0]   := '';
    Cells[2,0]   := 'No Bukti';
    Cells[3,0]   := 'Tanggal';
    Cells[4,0]   := 'No Akun';
    Cells[5,0]   := 'Nominal';
    Cells[6,0]   := 'Keterangan';



    ColWidths[0] := 50;
    ColWidths[1] := 50;
    ColWidths[2] := 200;
    ColWidths[3] := 250;
    ColWidths[4] := 100;
    ColWidths[5] := 100;
    ColWidths[6] := 300;
    StretchRightColumn;


  end;
end;

procedure TFpengeluaranBiaya.dt1Change(Sender: TObject);
begin
  BuatGrid;
  isiMaster('p.tanggal >= "'+Tanggal(dt1.Date)+'" and p.tanggal <= "'+Tanggal(dt2.Date)+'"');
end;

procedure TFpengeluaranBiaya.FormActivate(Sender: TObject);
begin
  onSHow(Sender);
end;

procedure TFpengeluaranBiaya.FormShow(Sender: TObject);
begin
  BuatGrid;
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  isiMaster('p.tanggal >= "'+Tanggal(dt1.Date)+'" and p.tanggal <= "'+Tanggal(dt2.Date)+'"');
end;

procedure TFpengeluaranBiaya.isiMaster(str:string);
var
  i,c : integer;
begin
  ExQry(dm.Q1,' select p.nobukti,p.tanggal,p.noakun,a.namaakunperkiraan,'+
              ' p.nominal,p.keterangan from pengeluaranbiaya p Left Join m_akunperkiraan a '+
              ' ON p.noakun=a.kodeakunperkiraan where '+str+'',True);
  i := 1;
  sg1.Options := sg1.Options + [goRowSelect, goEditing];

  while dm.Q1.Eof = False do begin
      sg1.Cells[0,i] := IntToStr(dm.Q1.RecNo);
      sg1.AddCheckBox(1, i, false, false);
      sg1.Cells[2,i] := Getval(dm.Q1,'nobukti');
      sg1.Cells[3,i] := Getval(dm.Q1,'tanggal');
      sg1.Cells[4,i] := Getval(dm.Q1,'noakun') +' | '+ Getval(dm.Q1,'namaakunperkiraan') + '[ K ] ';
      sg1.Cells[5,i] := Format('%.2n',[GetvalF(dm.Q1,'nominal')]);
      sg1.Cells[6,i] := Getval(dm.Q1,'keterangan');

      c := i;
      ExQry(dm.Q2,'select d.*,a.* from detailpengeluaranbiaya d,m_akunperkiraan a '+
      ' where d.noakun=a.kodeakunperkiraan AND  nobukti="'+GetVal(dm.Q1,'nobukti')+'"',True);
      while not dm.Q2.Eof do begin
        sg1.Cells[4,c+1] := Getval(dm.Q2,'noakun')+' | '+Getval(dm.Q2,'namaakunperkiraan') + ' [ D ] ';
        sg1.Cells[5,c+1] := Format('%.2n',[GetvalF(dm.Q2,'nominal')]);
        sg1.Cells[6,c+1] := Getval(dm.Q2,'keterangan');
        Inc(c);
        dm.Q2.Next;
        sg1.RowCount := sg1.RowCount +1;
      end;
      i := c +1 ;
      dm.Q1.Next;
      sg1.RowCount := sg1.RowCount +1;
  end;
end;

procedure TFpengeluaranBiaya.sg1DrawCell(Sender: TObject; ACol, ARow: Integer;
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
  if  (ACOL in [3]) and (arow > 0)then
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
  if  (ACOL in [4]) and (arow > 0)then
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
