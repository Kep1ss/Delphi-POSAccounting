unit uTransaksiJurnalMemorial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Blue, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  Vcl.StdCtrls, dxBevel, Vcl.Menus, cxButtons,uOvEdit, uTerbilang, uctrlFrm,uComCtrl, uEngine,
  dxSkinSharp, dxSkinOffice2016Colorful, dxSkinsDefaultPainters,System.DateUtils,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFtransaksiJurnal = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg1GetEditorProp(Sender: TObject; ACol, ARow: Integer;
      AEditLink: TEditLink);
    procedure sg1GetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1ComboChange(Sender: TObject; ACol, ARow, AItemIndex: Integer;
      ASelection: string);
    procedure sg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sg1GetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure sg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTutupClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }

    procedure BersihSell;
    procedure GantiData;

  public
    { Public declarations }
    procedure PrintJurnal(ENoBUkti : string);
    procedure tampilanawal;
    procedure BuatGrid;
  end;

var
  FtransaksiJurnal: TFtransaksiJurnal;
  alist : TStringList;

implementation

{$R *.dfm}

uses  udm, uCariAkun, uDtrx,uMainMenu, uDLaporan;

{ TFtransaksiJurnal }

function sumG(sg:TStringGrid;ACOl:Integer;AKon:string):Extended;
var
    Debit  : Real;
    Kredit : Real;
    i      : Integer;

begin
    Debit  := 0;
    Kredit := 0;
    for i := 1 to sg.RowCount -1 do begin
      if StrToFloatDef(nilai(sg.Cells[ACOl,i]),0) <> 0 then begin
         if sg.Cells[3,i] = 'D' then
            Debit := Debit + StrToFloatDef(nilai(sg.Cells[ACOl,i]),0)
        else
            Kredit:= Kredit + StrToFloatDef(nilai(sg.Cells[ACOl,i]),0);
      end;
      end;
     if AKon = 'D' then
        Result := Debit
     else
        Result := Kredit;
  end;

procedure TFtransaksiJurnal.BersihSell;
var
  c:integer;
begin
  for c := 0 to sg1.ColCount -1 do
  sg1.Cells[c,sg1.Row] :='';
  sg1.Cells[1,sg1.RowCount -1] :='';
end;

procedure TFtransaksiJurnal.btnBaruClick(Sender: TObject);
begin
  BuatGrid;
  ENobukti.Text := GetCode(dm.Q1,'jurnalmemorial','nobukti','JM');
end;

procedure TFtransaksiJurnal.btnHapusClick(Sender: TObject);
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

procedure TFtransaksiJurnal.btnSimpanClick(Sender: TObject);
var
  i: Integer;
  sAkhir : Real;
  jenis  : String;

  function CheckBalance:Boolean;
  var
    Debit  : Real;
    Kredit : Real;
    i      : Integer;

  begin

    Result := False;
    Debit  := 0;
    Kredit := 0;
    for i := 1 to sg1.RowCount -1 do begin
      if StrToFloatDef(nilai(sg1.Cells[4,i]),0) <> 0 then begin
         if sg1.Cells[3,i] = 'D' then
            Debit := Debit + StrToFloatDef(StrToDecimal(sg1.Cells[4,i]),0)
        else
            Kredit:= Kredit + StrToFloatDef(StrToDecimal(sg1.Cells[4,i]),0);
      end;
      end;

     Result := Debit = Kredit;
  end;
begin
  if (sg1.RowCount <=2) and (sg1.Cells[2,1] = '') then begin
      MessageBox(Handle,'Belum ada data transaksi','Error',MB_ICONERROR);
      Exit;
  end else
  if CheckBalance = False then begin
      MessageBox(Handle,'Transaksi yang dimasukan tidak BALANCE !! '+#13 +
      ' Debit harus sama dengan Kredit','Error',MB_ICONERROR);
      sg1.SetFocus;
      sg1.Row := sg1.RowCount -1;
      sg1.Col := 0;
      Exit;
  end else
  begin
    ExQry(dm.Q4,'DELETE from detailjurnalmemorial WHERE nobukti="'+ENoBUkti.Text+'"',False);
    for I := 1 to sg1.RowCount -1 do begin
      if StrToFloatDef(sg1.Cells[4,i],0) <> 0 then
      begin
        addParam('nobukti',ENobukti.Text,alist,'str');
        addParam('noakun',sg1.Cells[0,i],alist,'str');
        addParam('keterangan',sg1.Cells[2,i],alist,'str');
        addParam('jenistransaksi',sg1.Cells[3,i],alist,'str');
        addParam('nominal',StrToDecimal(sg1.Cells[4,i]),alist,'int');

        exeDb(dm.Q1,'detailjurnalmemorial',alist);


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
                    ' WHERE month(s.tgl)="'+intToStr(MOnthof(dt1.Date))+'" '+
                    ' AND  YEAR(s.tgl)="'+IntToStr(YearOf(dt1.Date))+'" '+
                    ' AND s.noakun="'+sg1.Cells[0,i]+'"',True);

        sAkhir := GetValF(dm.Q2,'saldoakhir');

        ExQry(dm.Q4,'SELECT                                       '+
                    '    b.`namamasterakun`,b.jenisakun           '+
                    '  FROM                                       '+
                    '    m_bukubesar b                            '+
                    '    LEFT JOIN m_subbukubesar s               '+
                    '      ON b.`idmasterakun` = s.`nomasterakun` '+
                    '    LEFT JOIN m_akunperkiraan k              '+
                    '      ON k.`akunsubmaster` = s.`akunsubmaster` '+
                    ' WHERE k.kodeakunperkiraan="'+sg1.Cells[0,i]+'" '+
                    ' GROUP BY b.`idmasterakun`',True);

        jenis := GetVal(dm.Q4,'jenisakun');


        addParam('nobukti',ENobukti.Text,alist,'str');
        addParam('noakun',sg1.Cells[0,i],alist,'str');
        addParam('keterangan',sg1.Cells[2,i],alist,'str');
        if jenis = 'A' then begin

            if sg1.Cells[3,i] = 'D' then begin
               addParam('debet',StrToDecimal(sg1.Cells[4,i]),alist,'int');
               sAkhir := sAkhir + StrToFloatDef(StrToDecimal(sg1.Cells[4,i]),0);
            end else begin
               addParam('kredit',StrToDecimal(sg1.Cells[4,i]),alist,'int');
               sAkhir := sAkhir - StrToFloatDef(StrToDecimal(sg1.Cells[4,i]),0);
            end;
        end else begin
            if sg1.Cells[3,i] = 'D' then begin
               addParam('debet',StrToDecimal(sg1.Cells[4,i]),alist,'int');
               sAkhir := sAkhir - StrToFloatDef(StrToDecimal(sg1.Cells[4,i]),0);
            end else begin
               addParam('kredit',StrToDecimal(sg1.Cells[4,i]),alist,'int');
               sAkhir := sAkhir + StrToFloatDef(StrToDecimal(sg1.Cells[4,i]),0);
            end;

        end;

        addParam('tgl',frmTgl(dt1.Date),alist,'date');
        addParam('s_akhir',StrToDecimal(FloatToStr(sAkhir)),alist,'int');

        exeDb(dm.Q1,'saldoakun',alist);

      end;
      end;

      addParam('nobukti',ENobukti.Text,alist,'str');
      addParam('tanggal',frmTgl(dt1.Date),alist,'date');
      addParam('nominal',StrToDecimal(ENominal.Text),alist,'int');
      addParam('iduser',Fmain.sbr1.Panels[1].Text,alist,'str');


      OpenTable(dm.Q1,['nobukti'],'jurnalmemorial WHERE nobukti="'+ENoBUkti.Text+'"');
     if dm.Q1.IsEmpty then
        exeDb(dm.Q3,'jurnalmemorial',alist)
     else
        updatedb(dm.Q3,'jurnalmemorial',alist,'nobukti','"'+ENoBUkti.Text+'"');

      if MessageDlg('Cetak bukti jurnal?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
         PrintJurnal(ENobukti.Text);
      btnBaru.Click;
  end;
end;

procedure TFtransaksiJurnal.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFtransaksiJurnal.BuatGrid;
var
  i , x : integer;
begin
  with sg1 do begin
    ColCount := 5;

    for i := 0 to ColCount -1 do
      for x := 0 to RowCount -1 do
        Cells[i,x] := '';

    RowCount := 2;


    Cells[0,0] := 'No Akun';
    Cells[1,0] := 'Nama Akun';
    Cells[2,0] := 'Keterangan';
    Cells[3,0] := 'D/K';
    Cells[4,0] := 'Nominal';


    ColWidths[0] := 100;
    ColWidths[1] := 200;
    ColWidths[2] := 250;
    ColWidths[3] := 50;
    ColWidths[4] := 100;
  end;
end;

procedure TFtransaksiJurnal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  alist.Free;
end;

procedure TFtransaksiJurnal.FormCreate(Sender: TObject);
begin
  SetTanggal(Self);
  BuatGrid;
  sg1.ControlLook.DropDownAlwaysVisible := True;
  ENominal.isRupiah := True;
  dt1.Date := now;
end;

procedure TFtransaksiJurnal.FormShow(Sender: TObject);
begin
 // BuatGrid;

 alist := TStringList.Create;
end;

procedure TFtransaksiJurnal.GantiData;
var
  i:integer;
begin
  for i := sg1.row to sg1.RowCount -1 do
  begin
    sg1.Cells[0,i]:=sg1.Cells[0,i+1];
    sg1.Cells[1,i]:=sg1.Cells[1,i+1];
    sg1.Cells[2,i]:=sg1.Cells[2,i+1];
    sg1.Cells[3,i]:=sg1.Cells[3,i+1];
    sg1.Cells[4,i]:=sg1.Cells[4,i+1];

  end;
end;

procedure TFtransaksiJurnal.PrintJurnal(ENoBUkti: string);
begin
  OpenTable(Dtrx.QjurnalMeorial,['*'],'jurnalmemorial WHERE nobukti="'+ENoBUkti+'"');
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frJurnalMemorial.fr3');
  FMemo(Dlaporan.Fr1,'Lterbilang').Text := MyTerbilang(StrToFloatDef(nilai(ENominal.Text),0));
  Dlaporan.Fr1.ShowReport();
end;

procedure TFtransaksiJurnal.sg1ComboChange(Sender: TObject; ACol, ARow,
  AItemIndex: Integer; ASelection: string);
begin

    if ACOL = 1 then begin
      sg1.Cells[0,sg1.Row] := Copy(sg1.Combobox.Items[AItemIndex],1,7);

    end;
end;

procedure TFtransaksiJurnal.sg1GetEditorProp(Sender: TObject; ACol,
  ARow: Integer; AEditLink: TEditLink);
begin
  with sg1 do
    case acol of
    3 : begin
        ClearComboString;
        Combobox.Items.Add('D');
        Combobox.Items.Add('K');
    end;
   end;
end;

procedure TFtransaksiJurnal.sg1GetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
 if ACol in [3] then
    AEditor := edComboList;
end;

procedure TFtransaksiJurnal.sg1GetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: string);
begin
      if (ACol in [4]) then
      begin
        isFloat := True;
        FloatFormat :='%.2n';
      end
      else
        isFloat := False;
end;

procedure TFtransaksiJurnal.sg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
     if sg1.Col = 0 then begin
        ExQry(dm.Q1,'select * from m_akunperkiraan where '+
        'kodeakunperkiraan="'+sg1.Cells[0,sg1.Row]+'"',True);

        if dm.Q1.IsEmpty = False then begin
           sg1.Cells[1,sg1.Row] := GetVal(dm.Q1,'namaakunperkiraan');
           sg1.Col              := 1;

        end else
        begin
          FcariAkun.Show;
          ExQry(dm.QMasterAkunPerkiraan,'select * from m_akunperkiraan where '+
          'kodeakunperkiraan like"%'+sg1.Cells[0,sg1.Row]+'%"',True);
          istransaksi := 0;
        end;
     end;

     if (sg1.Row = sg1.RowCount -1) and (sg1.Col = 4 ) then begin
        sg1.RowCount := sg1.RowCount +1 ;
        sg1.Col := 0;
        sg1.Row := sg1.RowCount -1;
     end else
     if sg1.Col in [1,2,3] then
        sg1.Col := sg1.Col + 1;
     end;
end;

procedure TFtransaksiJurnal.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if sg1.Col = 4 then begin
    ENominal.Text := Format('%.2n',[sumG(sg1,4,'K')]);
    Eterbilang.Text := MyTerbilang(StrToFloatDef(nilai(ENominal.Text),0));
  end;
end;

procedure TFtransaksiJurnal.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if ACol in [0,2,3,4] then
     sg1.Options := sg1.Options + [goEditing]
  else
     sg1.Options := sg1.Options - [goEditing];
end;

procedure TFtransaksiJurnal.tampilanawal;
begin
  BuatGrid;
  ClearText(self);
  ENoBUkti.Text  := GetCode(dm.Q1,'jurnalmemorial','nobukti','JM');
  setTanggal(Self);

end;

end.
