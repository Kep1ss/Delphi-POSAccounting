unit uDataStokBarang;

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
  dxSkinOffice2016Colorful, dxSkinSharp, dxSkinMoneyTwins, AdvUtil, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier;

type
  TFdataStokBarang = class(TForm)
    G1: TcxGroupBox;
    btnBaru: TcxButton;
    btnPrint: TcxButton;
    btnTutup: TcxButton;
    sg1: TAdvStringGrid;
    Xlio1: TAdvGridExcelIO;
    btnCetakStokLimit: TcxButton;
    Label3: TLabel;
    Label4: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    EPencarian: TcxTextEdit;
    cbKategori: TcxComboBox;
    dt1: TcxDateEdit;
    dt2: TcxDateEdit;
    cTampil: TCheckBox;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure Dt1PropertiesCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EPencarianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbKategoriPropertiesCloseUp(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cTampilClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnCetakStokLimitClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure LoadStok(tgl1, tgl2: TDateTime;cari:string;Cari2:String);

    { Public declarations }
  end;

var
  FdataStokBarang: TFdataStokBarang;

implementation

{$R *.dfm}

uses uDtrx, udm, uMainMenu, uCetakStokLimit;

procedure TFdataStokBarang.btnBaruClick(Sender: TObject);
begin
  LoadStok(Dt1.Date,dt2.Date,'" "',' ');
end;

procedure TFdataStokBarang.btnCetakStokLimitClick(Sender: TObject);
begin
  FcetakStokLimit.Show;
end;

procedure TFdataStokBarang.btnPrintClick(Sender: TObject);
begin
  Xlio1.XLSExport(apathExe+'\template\datastok.xls');
end;

procedure TFdataStokBarang.btnTutupClick(Sender: TObject);
begin
  close;
end;

procedure TFdataStokBarang.cbKategoriPropertiesCloseUp(Sender: TObject);
begin
  if cbKategori.Text = 'ALL' then
     LoadStok(Dt1.Date,dt2.Date,' ',' ') else
     LoadStok(Dt1.Date,dt2.Date,' AND k.namakategori="'+cbKategori.Text+'"',' ');
end;

procedure TFdataStokBarang.cTampilClick(Sender: TObject);
begin
  if cTampil.Checked then
     LoadStok(dt1.Date,dt2.Date,'" "',' HAVING SUM(ks.saldoawal+ks.masuk-ks.keluar) > 0 ')
  else LoadStok(Dt1.Date,dt2.Date,'" "',' ');
end;

procedure TFdataStokBarang.Dt1PropertiesCloseUp(Sender: TObject);
begin
  LoadStok(Dt1.Date,dt2.Date,'" "',' ');
end;

procedure TFdataStokBarang.EPencarianKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then begin
    LoadStok(dt1.Date,dt2.Date,' AND (b.namabarang like "%'+Epencarian.Text+'%" '+
    'or b.kodebarcode="'+Epencarian.Text+'")',' ');
  end;

end;

procedure TFdataStokBarang.FormCreate(Sender: TObject);

begin
  SetTanggal(Self);
  isiCmb(dm.Q1,'kategori ORDER BY idkategori DESC',['idkategori','namakategori'],cbKategori);

end;

procedure TFdataStokBarang.FormShow(Sender: TObject);
begin
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  LoadStok(Dt1.Date,dt2.Date,'" "',' ');
end;

procedure TFdataStokBarang.LoadStok(tgl1, tgl2: TDateTime;cari:string;cari2:String);
var
  i,R,x,j : integer;
  tg1,tg2,str : String;
  totalStok : Real;
  ShowHarga : Boolean;
begin
  tg1 := Tanggal(tgl1);
  tg2 := Tanggal(tgl2);

  ExQry(dm.Q1,'SELECT * FROM m_user WHERE username="'+FMain.sbr1.Panels[2].Text+'"',True);

  ShowHarga := GetValBol(dm.Q1,'showHarga');
  with sg1 do begin
      for i := 0 to ColCount do
      for x := 0 to RowCount do
        Cells[i,x] :='';


      FixedRows := 1;

      if ShowHarga then
         exqry(dm.Q1,'Call sp_stokbarang("'+tg1+'","'+tg2+'",'+QuotedStr(Cari)+','+QuotedStr(Cari2)+')',True)
      else
         exqry(dm.Q1,'Call sp_stokbarangx("'+tg1+'","'+tg2+'",'+QuotedStr(Cari)+','+QuotedStr(Cari2)+')',True);

      ColCount := dm.Q1.FieldCount;

    if dm.Q1.IsEmpty = False then begin

      for I := 0 to dm.Q1.Fields.Count -1 do begin
          Cells[i,0]    := UpperCase(dm.Q1.Fields[i].FieldName);
          if UpperCase(dm.Q1.Fields[i].FieldName) ='NAMA BARANG' then
             ColWidths[i] := 350
          else  if UpperCase(dm.Q1.Fields[i].FieldName) ='KODE BARCODE' then
             ColWidths[i] := 150
          else
             ColWidths[i] := 100;
      end;

      ColumnSize.StretchColumn  := 2;
      ColumnSize.Stretch        :=  True;


      RowCount  := dm.Q1.RecordCount + 2;
      Cursor    := crHourGlass;
      r         := 1;
      while dm.Q1.Eof = False do begin
          for x := 0 to ColCount -1do begin
            if (dm.Q1.Fields[x].DataType = ftFloat) and (dm.Q1.Fields[x].FieldName = 'Harga Beli')
            or (dm.Q1.Fields[x].FieldName ='TOTAL HARGA') then
              Cells[x,r]   := Format('%.2n',[dm.Q1.Fields[x].AsFloat])
            else if (dm.Q1.Fields[x].DataType = ftFloat) and (dm.Q1.Fields[x].FieldName <> 'Harga Beli')
             and (dm.Q1.Fields[x].FieldName <>'TOTAL HARGA')  then
             Cells[x,r]   := Format('%.2n',[dm.Q1.Fields[x].AsFloat]) else
             if  (dm.Q1.Fields[x].DataType <> ftFloat) then

             Cells[x,r]   := dm.Q1.Fields[x].AsString;
          end;

            Inc(r);

            dm.Q1.Next;
      end;
      Cursor := crArrow;
    end;

    if ShowHarga then begin
          FloatingFooter.Visible := True;
          FloatFormat            := '%.0n';
          FloatingFooter.ColumnCalc[4] := acSum;
          FloatingFooter.ColumnCalc[5] := acSum;
          FloatingFooter.ColumnCalc[9] := acSum;
          sg1.Cells[0,sg1.RowCount - 1] := 'Total';
          sg1.Cells[1,sg1.RowCount - 1] := ':';
          sg1.Cells[2,sg1.RowCount - 1] := '';
          sg1.Cells[3,sg1.RowCount - 1] := '';
          sg1.Cells[6,sg1.RowCount - 1] := '';
          sg1.Cells[7,sg1.RowCount - 1] := '';
    end;

  end;
end;

end.
