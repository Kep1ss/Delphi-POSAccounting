unit uTransaksiPengeluaranBiaya;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Blue, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  Vcl.StdCtrls, dxBevel, Vcl.Menus, cxButtons,uOvEdit, uTerbilang, uMainMenu,
  uctrlFrm, dxSkinSharp, dxSkinOffice2016Colorful,DateUtils, dxSkinsDefaultPainters,
  dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFtransaksiPengeluaranBiaya = class(TForm)
    bv1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ENobukti: TcxTextEdit;
    dt1: TcxDateEdit;
    bv2: TdxBevel;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    sg1: TAdvStringGrid;
    Label3: TLabel;
    Label7: TLabel;
    ENominal: TcxTextEdit;
    Eterbilang: TcxTextEdit;
    Label8: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbAkun: TcxComboBox;
    Label11: TLabel;
    Lsaldo: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cbSumaster: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg1GetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTutupClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cbAkunPropertiesCloseUp(Sender: TObject);
  private
    { Private declarations }

    procedure BersihSell;
    procedure GantiData;
  public
    Procedure PrintBukti(nobukti : string);
    procedure tampilanawal;
    procedure BuatGrid;
    { Public declarations }
  end;

var
  FtransaksiPengeluaranBiaya: TFtransaksiPengeluaranBiaya;
  alist : TStringList;

implementation

{$R *.dfm}

uses uComCtrl, uEngine, udm, uCariAkun, uDtrx, uDLaporan;

{ TFtransaksiJurnal }

procedure TFtransaksiPengeluaranBiaya.BersihSell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
  sg1.Cells[1,sg1.RowCount -1] :='';
end;

procedure TFtransaksiPengeluaranBiaya.btnBaruClick(Sender: TObject);
begin
  BuatGrid;
  cbAkun.Text :='';
  Lsaldo.Caption :='';
  cbSumaster.Text :='';
  ENobukti.Text := GetCode(dm.Q1,'pengeluaranbiaya','nobukti','KK');
end;

procedure TFtransaksiPengeluaranBiaya.btnHapusClick(Sender: TObject);
begin
  if (sg1.RowCount >= 2)  then
  begin
    if sg1.Cells[1,sg1.Row] <>'' then
    begin
      try
        Bersihsell;
        GantiData;
        if (sg1.Row <> sg1.RowCount -1) and   (sg1.Cells[1,sg1.RowCount -1] = '') then

        sg1.RowCount :=  sg1.RowCount -1;
        sg1.SetFocus;
        sg1.Col := 0;

      except
        Peringatan('Tidak ada data transaksi');
      end;
    end else
    Peringatan('Data yang dipilih kosong');
  end;
end;

procedure TFtransaksiPengeluaranBiaya.btnSimpanClick(Sender: TObject);
var
  i: Integer;

begin
  if (sg1.RowCount <=2) and (sg1.Cells[2,1] = '') then begin
      MessageBox(Handle,'Belum ada data transaksi','Error',MB_ICONERROR);
      Exit;
  end else
  if StrToFloatDef(nilai(Lsaldo.Caption),0) < StrToFloatDef(nilai(ENominal.Text),0) then begin
     MessageBox(Handle,'Saldo tidak mencukupi','Error',MB_ICONERROR);
     Exit;
  end else
  begin

      addParam('nobukti',ENobukti.Text,alist,'str');
      addParam('tanggal',frmTgl(dt1.Date),alist,'date');
      addParam('noakun',Copy(cbAkun.Text,1,7),alist,'str');
      addParam('nominal',nilai(ENominal.Text),alist,'int');
      addParam('iduser',Fmain.sbr1.Panels[1].Text,alist,'str');

      OpenTable(dm.Q1,['idpengeluaran'],'pengeluaranbiaya WHERE nobukti="'+ENoBUkti.Text+'"');
     if dm.Q1.IsEmpty then
        exeDb(dm.Q3,'pengeluaranbiaya',alist)
     else
        updatedb(dm.Q3,'pengeluaranbiaya',alist,'idpengeluaran','"'+GetVal(dm.Q1,'idpengeluaran')+'"');

    if sg1.Cells[1,sg1.RowCount -1] <> '' then
       sg1.RowCount := sg1.RowCount + 1;
      ExQry(dm.Q4,'DELETE from detailpengeluaranbiaya WHERE nobukti="'+ENoBUkti.Text+'"',False);
      ExQry(dm.Q4,'DELETE from saldoakun WHERE nobukti="'+ENoBUkti.Text+'"',False);
    for I := 1 to sg1.RowCount -1 do begin
      if StrToFloatDef(nilai(sg1.Cells[3,i]),0) <> 0 then
      begin
        addParam('nobukti',ENobukti.Text,alist,'str');
        addParam('noakun',sg1.Cells[0,i],alist,'str');
        addParam('keterangan',sg1.Cells[2,i],alist,'str');
        addParam('nominal',nilai(sg1.Cells[3,i]),alist,'int');

        exeDb(dm.Q1,'detailpengeluaranbiaya',alist);

        PostingJurnal(dm.Q1,Copy(cbAkun.Text,1,Pos('|',cbAkun.Text)-2),ENobukti.Text,sg1.Cells[2,i],
                     dt1.Date,StrToFloatDef(nilai(sg1.Cells[3,i]),0),StrToFloatDef(nilai(sg1.Cells[3,i]),0),StrToFloatDef(nilai(sg1.Cells[3,i]),0),'K');
        PostingJurnal(dm.Q1,sg1.Cells[0,i],ENobukti.Text,sg1.Cells[2,i],
                     dt1.Date,StrToFloatDef(nilai(sg1.Cells[3,i]),0),StrToFloatDef(nilai(sg1.Cells[3,i]),0),StrToFloatDef(nilai(sg1.Cells[3,i]),0),'D');
      end;
      end;

     if MessageDlg('Cetak bukti pengeluaran?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
         PrintBukti('"'+ENobukti.Text+'"');

      btnBaru.Click;
  end;
end;

procedure TFtransaksiPengeluaranBiaya.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFtransaksiPengeluaranBiaya.BuatGrid;
var
  i , x : integer;
begin
  with sg1 do begin
    ColCount := 4;

    for i := 0 to ColCount -1 do
      for x := 0 to RowCount -1 do
        Cells[i,x] := '';

    RowCount := 2;


    Cells[0,0] := 'No Akun';
    Cells[1,0] := 'Nama Akun';
    Cells[2,0] := 'Keterangan';
    Cells[3,0] := 'Nominal';


    ColWidths[0] := 100;
    ColWidths[1] := 200;
    ColWidths[2] := 250;
    ColWidths[3] := 100;
  end;
end;

procedure TFtransaksiPengeluaranBiaya.cbAkunPropertiesCloseUp(Sender: TObject);
begin
  ExQry(dm.Q1,'SELECT SUM(s_awal+debet-kredit) as total FROM saldoakun WHERE '+
  'noakun="'+COpy(cbAkun.Text,1,7)+'" AND month(tgl)="'+IntToStr(MOnthOf(dt1.Date))+'" '+
  ' AND YEAR(tgl)="'+intTOStr(YearOf(dt1.Date))+'"',True);
  Lsaldo.Caption := Format('%.2n',[GetvalF(dm.Q1,'total')]);
end;

procedure TFtransaksiPengeluaranBiaya.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  alist.Free;
end;

procedure TFtransaksiPengeluaranBiaya.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
  BuatGrid;

  ENominal.isRupiah := True;
  dt1.Date := now;

  
end;

procedure TFtransaksiPengeluaranBiaya.FormShow(Sender: TObject);
begin
 
 alist := TStringList.Create;
end;

procedure TFtransaksiPengeluaranBiaya.GantiData;
var
  i:integer;
begin
  for i := sg1.row to sg1.RowCount -1 do
  begin
    sg1.Cells[0,i]:=sg1.Cells[0,i+1];
    sg1.Cells[1,i]:=sg1.Cells[1,i+1];
    sg1.Cells[2,i]:=sg1.Cells[2,i+1];
    sg1.Cells[3,i]:=sg1.Cells[3,i+1];

  end;
end;

procedure TFtransaksiPengeluaranBiaya.PrintBukti(nobukti: string);
const _SQL = ' SELECT                                   '+
             '       pb.nobukti,                        '+
             '       pb.tanggal,                        '+
             '       pb.noakun,                         '+
             '       b.namaakunperkiraan,               '+
             '       pb.nominal,                        '+
             '       pb.keterangan                      '+
             '     FROM                                 '+
             '       pengeluaranbiaya pb                '+
             '       LEFT JOIN m_akunperkiraan b        '+
             '         ON pb.noakun = b.kodeakunperkiraan ';

begin
  ExQry(Dtrx.Qpengeluaran,_SQL+' WHERE pb.nobukti in ('+nobukti+')',True);
  dtrx.QDetailPengeluaran.Active := False;
  dtrx.QDetailPengeluaran.Active := True;
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\rptBuktiPengeluaranBiaya.fr3');
  FMemo(Dlaporan.Fr1,'Lterbilang').Text := MyTerbilang(GetValF(dtrx.Qpengeluaran,'nominal'));
  Dlaporan.Fr1.ShowReport();

end;

procedure TFtransaksiPengeluaranBiaya.sg1GetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
 if ACol in [1] then
    AEditor := edComboList;
end;

procedure TFtransaksiPengeluaranBiaya.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
      if (ACol in [3]) then
      begin
        isFloat := True;
        FloatFormat :='%.0n';
      end
      else
        isFloat := False;
end;

procedure TFtransaksiPengeluaranBiaya.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
     if cbSumaster.ItemIndex <> -1 then begin

       if sg1.Col = 0 then begin
          ExQry(dm.Q1,'select * from m_akunperkiraan where '+
          'kodeakunperkiraan="'+sg1.Cells[0,sg1.Row]+'" AND '+
          'akunsubmaster="'+getidCmb(cbSumaster)+'"',True);

          if dm.Q1.IsEmpty = False then begin
             sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'namaakunperkiraan');
             sg1.Col              := 1;

          end else
          begin
            FcariAkun.Show;
            ExQry(dm.QMasterAkunPerkiraan,'select * from m_akunperkiraan where '+
            ' kodeakunperkiraan like"%'+sg1.Cells[0,sg1.Row]+'%" AND '+
            ' akunsubmaster="'+getIdCmb(cbSumaster)+'"',True);
            isTransaksi := 1;
          end;
       end;
     end else
     begin
       MessageDlg('Error !!, Silahkan pilih sub master terlebi daulu',mtError,[mbYes],0);
     end;

     if (sg1.Row = sg1.RowCount -1) and (sg1.Col = 3 ) then begin
        sg1.RowCount := sg1.RowCount +1 ;
        sg1.Col := 0;
        sg1.Row := sg1.RowCount -1;
     end else
     if sg1.Col in [1,2] then
        sg1.Col := sg1.Col + 1;
     end;
end;

procedure TFtransaksiPengeluaranBiaya.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if sg1.Col = 3 then begin
    ENominal.Text := GetRupiah(SumGrid(sg1,3));
    Eterbilang.Text := MyTerbilang(StrToFloatDef(SumGrid(sg1,3),0));
  end;
end;

procedure TFtransaksiPengeluaranBiaya.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if ACol in [0,2,3] then
     sg1.Options := sg1.Options + [goEditing]
  else
     sg1.Options := sg1.Options - [goEditing];
end;

procedure TFtransaksiPengeluaranBiaya.tampilanawal;
begin
  BuatGrid;
  ENoBUkti.Text  := GetCode(dm.Q1,'pengeluaranbiaya','nobukti','KK');
  setTanggal(Self);
  OpenTable(dm.Q1,['kodeakunperkiraan','namaakunperkiraan'],'m_akunperkiraan where akunsubmaster in("101","102")');

  while Not dm.Q1.Eof do begin
    cbAkun.Properties.Items.AddObject(dm.Q1.Fields[0].AsString+' | '+dm.Q1.Fields[1].AsString,TObject(StrToInt(nilai(dm.Q1.Fields[0].AsString))));
    dm.Q1.Next;
  end;
  OpenTable(dm.Q1,['akunsubmaster','namasubmaster'],'m_subbukubesar where nomasterakun=5');

  while Not dm.Q1.Eof do begin
    cbSumaster.Properties.Items.AddObject(dm.Q1.Fields[0].AsString+' | '+dm.Q1.Fields[1].AsString,TObject(dm.Q1.Fields[0].AsInteger));
    dm.Q1.Next;
  end;
end;

end.
