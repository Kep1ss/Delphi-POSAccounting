unit uLapBukuBesar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Light, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, cxGroupBox, uEngine, tmsAdvGridExcel,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, cxTextEdit,
  Vcl.ComCtrls, dxBevel, uDLaporan, dxSkinMcSkin, dxSkinSharp,System.DateUtils,
  Vcl.ExtCtrls, dxSkinOffice2016Colorful,uComCtrl, dxSkinsDefaultPainters, uctrlFrm,
  dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFlapBukuBesar = class(TForm)
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
    btnBaru: TcxButton;
    btn1: TcxButton;
    sg2: TAdvStringGrid;
    EPencarian: TcxTextEdit;
    lbl1: TLabel;
    Llbl2: TLabel;
    LnamaAkun: TLabel;
    Label4: TLabel;
    LtotalDebet: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LsaldoAwal: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Lsaldo: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    LtotalKredit: TLabel;
    btnHapus: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg2ClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sg1GetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BuatGrid;
    procedure GridAkun;
    procedure IsiAkun(Str:string);
    procedure isiMaster(str:string);
    { Public declarations }
  end;

  const
  _SQL = 'SELECT                      '+
         '   sd.tgl,                  '+
         '   sd.noakun,               '+
         '   sd.nobukti,              '+
         '   mk.namaakunperkiraan,    '+
         '   sd.keterangan,           '+
         '   sd.s_awal,               '+
         '   sd.debet,                '+
         '   sd.kredit                '+
         ' FROM                       '+
         '   saldoakun sd             '+
         '   LEFT JOIN m_akunperkiraan '+
         '   mk ON mk.`kodeakunperkiraan`=sd.`noakun`';
var
  FlapBukuBesar: TFlapBukuBesar;

implementation

{$R *.dfm}

uses UinputMasterBukuBesar, udm, uTransaksiJurnalMemorial, uMainMenu;

{ TFmasterBukubesar }

procedure TFlapBukuBesar.btn1Click(Sender: TObject);
var

  sAkhir : Real;
  tgl1 , tgl2 : TDate;
begin
  aPathRpt := ExtractFilePath(ParamStr(0))+'rpt';
  tgl1     := dt1.Date;
  tgl2     := dt2.Date;
   // LoadData;
  ExQry(dm.Q2,' SELECT                                             '+
                    '  (                                                 '+
                    '    CASE                                            '+
                    '      WHEN bb.jenisakun = "A"                       '+
                    '      THEN SUM(s.s_awal) + SUM(s.debet) - SUM(s.kredit)   '+
                    '      ELSE SUM(s.s_awal) + SUM(s.kredit) - SUM(s.debet)   '+
                    '    END                                                   '+
                    '  ) AS saldoakhir                                         '+
                    '                                                          '+
                    ' FROM                                                     '+
                    '  m_akunperkiraan ak                                      '+
                    '  LEFT JOIN saldoakun s                                   '+
                    '    ON s.`noakun` = ak.`kodeakunperkiraan`                '+
                    '  LEFT JOIN m_subbukubesar ms                             '+
                    '    ON ms.akunsubmaster = ak.`akunsubmaster`              '+
                    '  LEFT JOIN m_bukubesar bb                                '+
                    '    ON bb.`nomasterakun` = ms.`nomasterakun`              '+
                    ' WHERE s.noakun="'+COPY(sg2.Cells[0,sg2.Row],1,7)+'" '+
                    ' AND s.tgl >= "'+Tanggal(tgl1)+'" and '+
                    ' s.tgl <= "'+Tanggal(dt2.Date)+'" ORDER BY s.tgl ASC',True);
  sAkhir := GetValF(dm.Q2,'saldoakhir');
  Lsaldo.Caption        := GetRupiah(FloatToStr(sAkhir));
  ExQry(Dlaporan.QLapBukuBesar,
   'CALL sp_bukubesar("'+Tanggal(tgl1)+'","'+Tanggal(tgl2)+'","'+COPY(LnamaAkun.Caption,1,7)+'") ',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\rptLapBukuBesar.fr3');
  FMemo(Dlaporan.Fr1,'LsaldoAkhir').Text := Lsaldo.Caption;
  Dlaporan.Fr1.PrepareReport(TRue);
  Dlaporan.Fr1.ShowReport();
end;

procedure TFlapBukuBesar.btnBaruClick(Sender: TObject);
begin
  FtransaksiJurnal.Show;
  FtransaksiJurnal.ENobukti.Text := GetCode(dm.Q1,'jurnalmemorial','nobukti','TJ');
end;

procedure TFlapBukuBesar.btnHapusClick(Sender: TObject);
begin
  if MessageDlg('Apakah yakin data akan dihapus',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
     ExQry(dm.Q1,'DELETE FROM saldoakun WHERE nobukti="'+sg1.Cells[2,sg1.Row]+'"',False);
    dt1Change(Sender);

  end;
end;

procedure TFlapBukuBesar.btnPrintClick(Sender: TObject);
var

  sAkhir : Real;
  tgl1 , tgl2 : TDate;
begin
  aPathRpt := ExtractFilePath(ParamStr(0))+'rpt';
  tgl1     := dt1.Date;
  tgl2     := dt2.Date;
   // LoadData;
  ExQry(dm.Q2,' SELECT                                             '+
                    '  (                                                 '+
                    '    CASE                                            '+
                    '      WHEN bb.jenisakun = "A"                       '+
                    '      THEN SUM(s.s_awal) + SUM(s.debet) - SUM(s.kredit)   '+
                    '      ELSE SUM(s.s_awal) + SUM(s.kredit) - SUM(s.debet)   '+
                    '    END                                                   '+
                    '  ) AS saldoakhir                                         '+
                    '                                                          '+
                    ' FROM                                                     '+
                    '  m_akunperkiraan ak                                      '+
                    '  LEFT JOIN saldoakun s                                   '+
                    '    ON s.`noakun` = ak.`kodeakunperkiraan`                '+
                    '  LEFT JOIN m_subbukubesar ms                             '+
                    '    ON ms.akunsubmaster = ak.`akunsubmaster`              '+
                    '  LEFT JOIN m_bukubesar bb                                '+
                    '    ON bb.`nomasterakun` = ms.`nomasterakun`              '+
                    ' WHERE s.noakun="'+COPY(sg2.Cells[0,sg2.Row],1,7)+'" '+
                    ' AND s.tgl >= "'+Tanggal(tgl1)+'" and '+
                    ' s.tgl <= "'+Tanggal(dt2.Date)+'" ORDER BY s.tgl ASC',True);
  sAkhir := GetValF(dm.Q2,'saldoakhir');
  Lsaldo.Caption        := GetRupiah(FloatToStr(sAkhir));
  ExQry(Dlaporan.QLapBukuBesar,
   'CALL sp_bukubesar("'+Tanggal(tgl1)+'","'+Tanggal(tgl2)+'","'+COPY(LnamaAkun.Caption,1,7)+'") ',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\rptLapBukuBesar.fr3');
  FMemo(Dlaporan.Fr1,'LsaldoAkhir').Text := Lsaldo.Caption;
  Dlaporan.Fr1.PrepareReport(TRue);
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;
procedure TFlapBukuBesar.btnSettingClick(Sender: TObject);
begin
  FinputMasterBukuBesar.Show;
end;

procedure TFlapBukuBesar.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFlapBukuBesar.BuatGrid;
var
  x ,C : integer;
begin
  with sg1 do begin
    for x := 0 to ColCOunt -1 do
      for c := 0 to RowCount -1 do
        Cells[x,c] :='';
    sg1.ColCount := 6;
    sg1.RowCount := 2;
    FixedRows    := 1;

    Cells[0,0]   := 'Tanggal';
    Cells[1,0]   := 'Keterangan';
    Cells[2,0]   := 'No Bukti';
    Cells[3,0]   := 'Debit';
    Cells[4,0]   := 'Kredit';
    Cells[5,0]   := 'Saldo';

    ColWidths[0] := 100;
    ColWidths[1] := 400;
    ColWidths[2] := 100;
    ColWidths[3] := 150;
    ColWidths[4] := 150;
    ColWidths[5] := 150;



  end;
end;
procedure TFlapBukuBesar.dt1Change(Sender: TObject);
var
  tgl1 , tgl2 : TDate;
begin
  aPathRpt := ExtractFilePath(ParamStr(0))+'rpt';
  tgl1     := dt1.Date;
  tgl2     := dt2.Date;
  BuatGrid;
  isiMaster('"'+Tanggal(tgl1)+'","'+Tanggal(tgl2)+'","'+COPY(LnamaAkun.Caption,1,7)+'"');
end;
procedure TFlapBukuBesar.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Case Key of
 VK_RETURN : IsiAkun(EPencarian.Text);
 End;
end;

procedure TFlapBukuBesar.FormShow(Sender: TObject);
begin
  BuatGrid;
  IsiAkun('');
  dt1.Date := EncodeDate(YearOf(now),MonthOf(now),1);
  dt2.Date := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));

end;

procedure TFlapBukuBesar.GridAkun;
var
  x,c : integer;
begin
   with sg2 do begin
      for x := 0 to ColCOunt -1 do
      for c := 0 to RowCount -1 do
        Cells[x,c] :='';

      ColCount := 1;
      RowCount := 2;

      Cells[0,0] := 'Akun';


   end;
end;

procedure TFlapBukuBesar.IsiAkun(Str: string);
var
  i : integer;
begin
  GridAkun;
  OpenTable(dm.Q1,['kodeakunperkiraan','namaakunperkiraan'],'m_akunperkiraan '+
  'WHERE kodeakunperkiraan like"%'+Str+'%" OR namaakunperkiraan like"%'+str+'%"');

  i:=1;
  sg2.RowCount := dm.Q1.RecordCount +1;
  while dm.Q1.Eof = False do begin
    sg2.Cells[0,i] := GetVal(dm.Q1,'kodeakunperkiraan') +' | '+GetVal(dm.Q1,'namaakunperkiraan');
    dm.Q1.Next;
    Inc(i);
 //   Application.ProcessMessages;
  end;

end;

procedure TFlapBukuBesar.isiMaster(str:string);
var
  i,c,r : integer;
  SalDoakhir : Real;
begin
  BuatGrid;
  ExQry(dm.Q1,'CALL sp_bukubesar('+str+')',True);
  i := 1;
  sg1.RowCount := dm.Q1.RecordCount +1;
  SalDoakhir :=  0;
  if Dm.Q1.IsEmpty = False then begin

        while dm.Q1.Eof = False do begin
            sg1.Cells[0,i] := Getval(dm.Q1,'tgl');
            sg1.Cells[1,i] := Getval(dm.Q1,'keterangan');
            sg1.Cells[2,i] := Getval(dm.Q1,'nobukti');
            sg1.Cells[3,i] := Format('%.2n',[GetvalF(dm.Q1,'debet')]);
            sg1.Cells[4,i] := Format('%.2n',[GetvalF(dm.Q1,'kredit')]);

            if GetVal(dm.Q1,'jenisakun') = 'A' then begin
              SalDoakhir     := SalDoakhir + GetValF(dm.Q1,'s_awal') + GetValF(dm.Q1,'debet') - GetValF(dm.Q1,'kredit') ;
              sg1.Cells[5,i] := Format('%.2n',[SaldoAkhir]);
            end else
            begin
              SalDoakhir     := SalDoakhir + GetValF(dm.Q1,'s_awal') - GetValF(dm.Q1,'debet') + GetValF(dm.Q1,'kredit') ;
              sg1.Cells[5,i] := Format('%.2n',[SaldoAkhir]);
            end;
            inc(i) ;
            dm.Q1.Next;

        end;
  end else
    BuatGrid;
end;

procedure TFlapBukuBesar.sg1GetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if Acol in [ 3,4] then
  HAlign := taRightJustify;
end;

procedure TFlapBukuBesar.sg2ClickCell(Sender: TObject; ARow, ACol: Integer);
var
  sAkhir : Real;
  tgl1 , tgl2 : TDate;
begin
  aPathRpt := ExtractFilePath(ParamStr(0))+'rpt';
  tgl1     := dt1.Date;
  tgl2     := dt2.Date;
  LnamaAkun.Caption     := sg2.Cells[ACol,Arow];
  ExQry(dm.Q2,' SELECT                                             '+
                    '  (                                                 '+
                    '    CASE                                            '+
                    '      WHEN bb.jenisakun = "A"                       '+
                    '      THEN SUM(s.s_awal) + SUM(s.debet) - SUM(s.kredit)   '+
                    '      ELSE SUM(s.s_awal) + SUM(s.kredit) - SUM(s.debet)   '+
                    '    END                                                   '+
                    '  ) AS saldoakhir                                         '+
                    '                                                          '+
                    ' FROM                                                     '+
                    '  m_akunperkiraan ak                                      '+
                    '  LEFT JOIN saldoakun s                                   '+
                    '    ON s.`noakun` = ak.`kodeakunperkiraan`                '+
                    '  LEFT JOIN m_subbukubesar ms                             '+
                    '    ON ms.akunsubmaster = ak.`akunsubmaster`              '+
                    '  LEFT JOIN m_bukubesar bb                                '+
                    '    ON bb.`nomasterakun` = ms.`nomasterakun`              '+
                    ' WHERE s.noakun="'+COPY(sg2.Cells[0,ARow],1,7)+'" '+
                    ' AND s.tgl >= "'+Tanggal(tgl1)+'" and '+
                    ' s.tgl <= "'+Tanggal(tgl2)+'" ORDER BY s.tgl ASC',True);
  sAkhir := GetValF(dm.Q2,'saldoakhir');
  Lsaldo.Caption        := GetRupiah(FloatToStr(sAkhir));
  isiMaster('"'+Tanggal(tgl1)+'","'+Tanggal(tgl2)+'","'+COPY(LnamaAkun.Caption,1,7)+'"');
  LtotalDebet.Caption   := GetRupiah(SumGrid(sg1,3));
  LtotalKredit.Caption  := GetRupiah(SumGrid(sg1,4));
end;


end.
