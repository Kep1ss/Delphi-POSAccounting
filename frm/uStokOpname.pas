unit uStokOpname;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, ShellAPi,System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  cxGroupBox, uComCtrl, uctrlFrm, uEngine, uOvEdit, cxStyles,
  dxSkinscxPCPainter, Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxDropDownEdit,
  cxCalendar, Vcl.StdCtrls, cxButtons, cxClasses, cxGridLevel, cxGrid,
  cxTextEdit, cxMaskEdit, dxSkinSharp,cxGridDBTableView,cxVariants,cxCurrencyEdit,
  dxSkiniMaginary, tmsAdvGridExcel, Vcl.Grids, AdvObj, BaseGrid,dateUtils, AdvGrid,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinMoneyTwins, Vcl.ExtCtrls,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier;

type
  TFStokOpname = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbKategori: TcxComboBox;
    Enamabarang: TcxTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    cbGudang: TcxComboBox;
    cxGroupBox2: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    Label9: TLabel;
    EnoBukti: TcxTextEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dt1: TcxDateEdit;
    Label13: TLabel;
    Label14: TLabel;
    Eketerangan: TcxTextEdit;
    Label15: TLabel;
    Label16: TLabel;
    cbPetugas: TcxComboBox;
    sg1: TAdvStringGrid;
    Xlio1: TAdvGridExcelIO;
    cxButton4: TcxButton;
    Label3: TLabel;
    btnCari: TcxButton;
    pg1: TPanel;
    Label6: TLabel;
    Label17: TLabel;
    LselisihQty: TLabel;
    LselisihCost: TLabel;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbGudangPropertiesCloseUp(Sender: TObject);
    procedure EnamabarangKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton4Click(Sender: TObject);
    procedure EnamabarangEnter(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnCariClick(Sender: TObject);
  private
    alst : TStringList;
    { Private declarations }
    procedure InSertKartuStok(KodeBarang:string;idgudang:string;satuan:string;jml:Real;hrgBeli : Real);
    procedure PostingJurnalStok(nominal:Real;jml : Real;HargaJual:Real;nominalbkp:real;nominalnonbkp:real);
  public
    { Public declarations }
    procedure TampilanAwal;
    procedure LoadBarang;
    procedure BuatGrid;
    procedure bersihsell(Arow : integer);
  end;

var
  FStokOpname: TFStokOpname;

implementation

{$R *.dfm}

uses udm, uMainMenu, uDlaporan, uCariDataStokOpname;

{ TFStokOpname }


procedure TFStokOpname.bersihsell(Arow: integer);
var i : integer;
begin
  for i := 0 to sg1.ColCOunt -1 do begin
    sg1.Cells[i,Arow] := '';

  end;
end;

procedure TFStokOpname.btnCariClick(Sender: TObject);
begin
  FCariDataStokOpname.QTempStokOpname.Close;
  FCariDataStokOpname.QTempStokOpname.SQL.Text :=
  ' SELECT     so.nobukti,  so.tanggal, so.kodebarang,b.kodebarcode,       '+
  ' b.namabarang,so.stokkomp, so.stoknyata, so.selisih, so.keterangan,     '+
  ' k.namalokasi, u.namalengkap, ab.username  FROM temp_stokopname so      '+
  ' LEFT JOIN barang b                                                     '+
  '  ON so.`kodebarang` = b.`kodebarang`                                   '+
  ' left join lokasi k on k.idlokasi=so.idgudang                           '+
  ' left join m_user u on u.iduser=so.lastuser                             '+
  ' LEFT JOIN m_user ab on ab.iduser=so.petugascheck                       '+
  ' WHERE so.sudahdiproses=FALSE GROUP BY so.nobukti';
  FCariDataStokOpname.QTempStokOpname.Open;
  FCariDataStokOpname.ShowModal;

end;

procedure TFStokOpname.BuatGrid;
var
  i : integer;
  x : integer;
begin
  with sg1 do begin
    for x := 0 to ColCount -1 do
    for i := 0 to RowCount -1 do
       Cells[x,i] :='';

    ColCount := 11;
    RowCount := 2;

    Cells[0,0] := 'KODE BARCODE';
    Cells[1,0] := 'NAMA BARANG';
    Cells[2,0] := 'KATEGORI';
    Cells[3,0] := 'SATUAN';
    Cells[4,0] := 'HARGA BELI';
    Cells[5,0] := 'STOK KOMPUTER';
    Cells[6,0] := 'STOK NYATA';
    Cells[7,0] := 'SELISIH QTY';
    Cells[8,0] := 'SELISIH COST';
    Cells[9,0] := 'KETERANGAN';
    Cells[10,0] := 'isBkp';

    ColWidths[0] := 150;
    ColWidths[1] := 250;
    ColWidths[2] := 100;
    ColWidths[3] := 70;
    ColWidths[4] := 100;
    ColWidths[5] := 100;
    ColWidths[6] := 100;
    ColWidths[7] := 100;
    ColWidths[8] := 100;
    ColWidths[9] := 100;
    ColWidths[10] := 0;

    ColumnSize.StretchColumn  :=  1;
    ColumnSize.Stretch        := TRue;


  end;
end;

procedure TFStokOpname.cbGudangPropertiesCloseUp(Sender: TObject);
begin
  LoadBarang;
end;

procedure TFStokOpname.cxButton1Click(Sender: TObject);
var
  i : integer;
  hargabeli : Real;
begin
  if not CheckEdit(Self) then begin

    with sg1 do begin

        for I := 1 to RowCOunt -1 do  begin
            if (Cells[1,i] <> '')  then begin

              addParam('nobukti',   EnoBukti.Text,alst,'str');
              addParam('tanggal',   frmTgl(dt1.Date),alst,'date');
              addParam('kodebarang',Cells[0,i],alst,'str');
              addParam('satuan',    Cells[3,i],alst,'str');
              addParam('stokkomp',  FloatToStr(CellF(Cells[4,i])),alst,'str');
              addParam('stoknyata', FloatToStr(CellF(Cells[5,i])),alst,'str');
              addParam('selisih',   FloatToStr(CellF(Cells[6,i])),alst,'str');
              addParam('keterangan',Cells[7,i],alst,'str');
              addParam('lastuser',  Fmain.sbr1.Panels[1].Text,alst,'str');
              addParam('idgudang',  GetIdcmb(cbGudang),alst,'str');
              addParam('petugascheck',  GetIdcmb(cbPetugas),alst,'str');

              exeDb(dm.Q1,'temp_stokopname',alst);

            end;

        end;
        ExQry(Dlaporan.QTempStokOpanme,'SELECT                                             '+
                                       '     so.nobukti,                                   '+
                                       '     so.tanggal,                                   '+
                                       '     so.kodebarang,                                '+
                                       '     b.kodebarcode,                                '+
                                       '     b.namabarang,                                 '+
                                       '     so.stokkomp,                                  '+
                                       '     so.stoknyata,                                 '+
                                       '     so.selisih,                                   '+
                                       '     so.keterangan,                                '+
                                       '     k.namalokasi,                                 '+
                                       '     u.namalengkap,                                '+
                                       '     ab.username                                   '+
                                       '   FROM                                            '+
                                       '     temp_stokopname so                                 '+
                                       '     LEFT JOIN barang b                            '+
                                       '       ON so.`kodebarang` = b.`kodebarang`          '+
                                       '     left join lokasi k on k.idlokasi=so.idgudang   '+
                                       '     left join m_user u on u.iduser=so.lastuser      '+
                                       '     LEFT JOIN m_user ab on ab.iduser=so.petugascheck '+
                                       ' WHERE nobukti="'+EnoBukti.Text+'"',True);
        Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frTempStokOpname.fr3');
        Dlaporan.Fr1.ShowReport;

        EnoBukti.Text := GetCode(dm.Q1,'temp_stokopname','nobukti','SO');
    end;
    TampilanAwal;
  end;
end;

procedure TFStokOpname.cxButton2Click(Sender: TObject);
var
  i : integer;
  hargabeli , HargaJual: Real;
  NominalBkp : Real;
  NominalNOnbKp : Real;
begin
  if not CheckEdit(Self) then begin
    EnoBukti.Text := GetCode(dm.Q1,'stokopname','nobukti','SO');
    with sg1 do begin

        for I := 1 to RowCOunt -1 do  begin
            if (Cells[5,i] <> '') AND (CellF(Cells[4,i]) <> CellF(Cells[5,i])) then begin
              hargabeli := StrToFloatdEF(getData(dm.Q1,'hargabelirata WHERE '+
                                      'kodebarang="'+Cells[0,i]+'" ','hargabeli'),0);
              HargaJual := StrToFloatdEF(getData(dm.Q1,'barang WHERE '+
                                      'kodebarang="'+Cells[0,i]+'" ','hargapartai'),0);
              addParam('nobukti',   EnoBukti.Text,alst,'str');
              addParam('tanggal',   frmTgl(dt1.Date),alst,'date');
              addParam('kodebarang',Cells[0,i],alst,'str');
              addParam('satuan',    Cells[3,i],alst,'str');
              addParam('hargabeli', StrToDecimal(Cells[4,i]),alst,'str');
              addParam('stokkomp',  FloatToStr(CellF(Cells[5,i])),alst,'str');
              addParam('stoknyata', FloatToStr(CellF(Cells[6,i])),alst,'str');
              addParam('selisih',   FloatToStr(CellF(Cells[7,i])),alst,'str');
              addParam('selisihcost',   FloatToStr(CellF(Cells[8,i])),alst,'str');
              addParam('keterangan',Cells[9,i],alst,'str');
              addParam('lastuser',  Fmain.sbr1.Panels[1].Text,alst,'str');
              addParam('idgudang',  GetIdcmb(cbGudang),alst,'str');
              addParam('petugascheck',  GetIdcmb(cbPetugas),alst,'str');

               exeDb(dm.Q1,'stokopname',alst);

               if (UPPERCASE(sg1.Cells[10,i]) ='TRUE') and (sg1.Cells[6,i] <> '')  then begin
                 NominalBkp := StrToFloatDef(nilai(sg1.Cells[8,i]),0) ;
                 NominalNOnbKp := 0;
               end else begin
                 NominalNOnbKp := StrToFloatDef(nilai(sg1.Cells[8,i]),0);
                 NominalBkp    := 0;
               end;



               ExQry(dm.Q2,'UPDATE temp_stokopname SET sudahdiproses=TRUE where nobukti="'+EnoBukti.Text+'"',False);

              InSertKartuStok(Cells[0,i],GetIdcmb(cbGudang),Cells[3,i],CellF(Cells[6,i]) - CellF(Cells[5,i]),Round(hargabeli));
              if CellF(Cells[7,i]) <> 0 then
              PostingJurnalStok(hargabeli,CellF(Cells[7,i]),HargaJual,NominalBkp,NominalNOnbKp);

            end;

        end;
        Informasi('Data berasil disimpan');
        EnoBukti.Text := GetCode(dm.Q1,'stokopname','nobukti','SO');
    end;
    TampilanAwal;
  end;
end;

procedure TFStokOpname.cxButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TFStokOpname.cxButton4Click(Sender: TObject);
begin
  BuatGrid;
end;

procedure TFStokOpname.EnamabarangEnter(Sender: TObject);
begin
  BuatGrid;
end;

procedure TFStokOpname.EnamabarangKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

    LoadBarang;
  end;
end;

procedure TFStokOpname.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  alst.Free;
end;

procedure TFStokOpname.FormCreate(Sender: TObject);
begin
  setTanggal(Self);
  FStokOpname := Self;

end;

procedure TFStokOpname.FormShow(Sender: TObject);
begin
  TampilanAwal;
  alst := TStringList.Create;
end;

procedure TFStokOpname.InSertKartuStok(KodeBarang, idgudang, satuan: string;
  jml, hrgBeli: Real);
  var
    s_akhir : Real;
begin
  ExQry(dm.Q3,' SELECT                                    '+
              '    SUM(saldoawal+masuk-keluar) as saldoakhir '+
              '  FROM                                     '+
              '    kartustok                              '+
              '  WHERE kodebarang ="'+KodeBarang+'"       '+
              ' AND idgudang="'+GetIdcmb(cbGudang)+'"  '+
              ' AND month(tgl)="'+inttoStr(MonthOf(dt1.Date))+'"',True);

  if jml < 0 then
    s_akhir := GetValF(dm.Q3,'saldoakhir') - Abs(jml)
  else
    s_akhir := GetValF(dm.Q3,'saldoakhir') + Abs(jml);

  addParam('nobukti',   Enobukti.Text,            aLst,'str');
  addParam('tgl',       frmTgl(dt1.Date),         aLst,'date');
  addParam('kodebarang',KodeBarang,               aLst,'str');
  addParam('satuan',    Satuan,                   aLst,'str');
  addParam('hargabeli', KomaDatabase(FloatToStr(hrgBeli)),aLst,'str');
  addParam('idgudang',  idgudang             ,    aLst,'str');
  if jml < 0 then
  addParam('keluar',    FLoatToStr(Abs(jml)),     aLst,'str')
  else
  addParam('masuk',    FLoatToStr(jml),          aLst,'str');
  addParam('saldoakhir',FloatToStr(s_akhir),      aLst,'str');
  addParam('keterangan','STOK OPNAME NO BUKTI ['+Enobukti.Text+']',aLst,'str');

  exeDb(dm.Q4,'kartustok',aLst);
end;


procedure TFStokOpname.LoadBarang;
var
  i : Integer;
begin
  with dm.Q1 do begin
        Close;
        SQL.Text := ' SELECT b.kodebarang,b.namabarang,b.bkp,b.satuanjual,k.namakategori, '+
                    ' h.hargabeli,SUM(ks.saldoawal + ks.masuk - ks.keluar) as stok '+
                    ' FROM barang b LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
                    ' LEFT JOIN kartustok ks ON ks.kodebarang=b.kodebarang '+
                    ' LEFT JOIN hargabelirata h ON h.kodebarang=b.kodebarang WHERE b.idbarang > 0';
        if cbKategori.Text <>'' then
           SQL.Add(' AND k.namakategori="'+cbKategori.Text+'"');
        if Enamabarang.Text <> '' then
           SQL.Add(' AND (b.namabarang like "%'+Enamabarang.Text+'%" OR b.kodebarang="'+Enamabarang.Text+'") ');
        SQL.Add(' AND ks.idgudang="'+GetIdcmb(cbGudang)+'" ');
        SQL.Add(' AND month(ks.tgl)="'+IntToStr(MonthOf(now))+'" AND Year(ks.tgl)="'+IntToStr(YearOf(Now))+'"');
        SQL.Add(' GROUP BY b.kodebarang');
        Open;
      if IsEmpty = False then begin

        with sg1 do begin
          i:=1;
          RowCount := dm.Q1.RecordCount +1;
          Cursor := crHourGlass;
          while not dm.Q1.Eof do begin
             Cells[0,i] := GetVal(dm.Q1,'kodebarang');
             Cells[1,i] := GetVal(dm.Q1,'namabarang');
             Cells[2,i] := GetVal(dm.Q1,'namakategori');
             Cells[3,i] := GetVal(dm.Q1,'satuanjual');
             Cells[4,i] := Format('%.2n',[GetValF(dm.Q1,'hargabeli')]);
             Cells[5,i] := GetVal(dm.Q1,'stok');
             Cells[6,i] := '';
             Cells[7,i] := '';
             Cells[8,i] := '';
             Cells[9,i] := '';
             Cells[10,i] := GetVal(dm.Q1,'bkp');
             Inc(i);
             dm.Q1.Next;
           //  Application.ProcessMessages;

          end;
          Cursor := crArrow;
        end;

      end else
      begin
        Close;
        SQL.Text := ' SELECT b.kodebarang,b.namabarang,b.bkp,h.hargabeli,k.namakategori,b.satuanjual '+
                ' FROM barang b LEFT JOIN kategori k ON k.idkategori=b.idkategori '+
                ' LEFT JOIN hargabelirata h ON h.kodebarang=b.kodebarang WHERE b.idbarang > 0';
        if cbKategori.Text <>'' then
           SQL.Add(' AND k.namakategori="'+cbKategori.Text+'"');
        if Enamabarang.Text <> '' then
           SQL.Add(' AND b.namabarang="'+Enamabarang.Text+'" OR b.kodebarang="'+Enamabarang.Text+'"');

           SQL.Add(' GROUP BY b.kodebarang');

        Open;

        with sg1 do begin
          i:=1;
          RowCount := dm.Q1.RecordCount +1;
          Cursor := crHourGlass;
          while not dm.Q1.Eof do begin
             Cells[0,i] := GetVal(dm.Q1,'kodebarang');
             Cells[1,i] := GetVal(dm.Q1,'namabarang');
             Cells[2,i] := GetVal(dm.Q1,'namakategori');
             Cells[3,i] := GetVal(dm.Q1,'satuanjual');
             Cells[4,i] := Format('%.2n',[GetValF(dm.Q1,'hargabeli')]);
             Cells[5,i] := '';
             Cells[6,i] := '';
             Cells[7,i] := '';
             Cells[8,i] := '';
             Cells[9,i] := '';
             Cells[10,i] := GetVal(dm.Q1,'bkp');;
             Inc(i);
             dm.Q1.Next;
             Application.ProcessMessages;

          end;
          Cursor := crArrow;
        end;

      end;
      Informasi('Load Data Selesai');
  end;
end;

procedure TFStokOpname.PostingJurnalStok(nominal, jml: Real;HargaJual:Real;nominalbkp:real;nominalnonbkp:real);
var
  s_akhir : real;
begin
     if jml < 0 then   begin

         // ------------- POSTING JURNAL PERSEDIAN BARANG
         ExQry(dm.Q1,' SELECT s_akhir FROM saldoakun '+
                     ' WHERE noakun="103.001" '+
                     ' ORDER BY idsaldo DESC ',True);

         s_akhir := Round(GetValF(dm.Q1,'s_akhir')) - (nominal * Abs(jml));

         addParam('noakun',     '103.001',                aLst,'str');
         addParam('nobukti',    ENobukti.Text,            aLst,'str');
         addParam('tgl',        frmTgl(dt1.Date), aLst,'date');
         addParam('kredit',     nilai(FloatToStr(nominal * Abs(jml))),      aLst,'str');
         addParam('s_akhir',    StrToDecimal(FloatToStr(s_akhir)),      aLst,'str');
         addParam('keterangan', 'SELISIH - STOK OPNAME ['+ENobukti.Text+']',    aLst,'str');
         addParam('iduser',setIdUser,    aLst,'str');
         addParam('nominalbkp',  StrToDecimal(FloatToStr(NominalBkp)),    aLst,'str');
         addParam('nominalnonbkp',StrToDecimal(FloatToStr(NominalNonBkp)),    aLst,'str');

         exeDb(dm.Q1,'saldoakun',aLst);

         ExQry(dm.Q1,' SELECT s_akhir FROM saldoakun '+
                     ' WHERE noakun="501.001" '+
                     ' ORDER BY idsaldo DESC ',True);

         s_akhir := Round(GetValF(dm.Q1,'s_akhir')) - (nominal * Abs(jml));

         addParam('noakun',     '502.035',                aLst,'str');
         addParam('nobukti',    ENobukti.Text,            aLst,'str');
         addParam('tgl',        frmTgl(dt1.Date), aLst,'date');
         addParam('debet',      StrToDecimal(FloatToStr(nominal * Abs(jml))),      aLst,'str');
         addParam('s_akhir',    StrToDecimal(FloatToStr(s_akhir)),      aLst,'str');
         addParam('keterangan', 'SELISIH - STOK OPNAME ['+ENobukti.Text+']',    aLst,'str');
         addParam('nominalbkp',  StrToDecimal(FloatToStr(NominalBkp)),    aLst,'str');
         addParam('nominalnonbkp',StrToDecimal(FloatToStr(NominalNonBkp)),    aLst,'str');

         addParam('iduser',setIdUser,    aLst,'str');
         exeDb(dm.Q1,'saldoakun',aLst);

     end else begin

         ExQry(dm.Q1,' SELECT s_akhir FROM saldoakun '+
                     ' WHERE noakun="103.001" '+
                     ' ORDER BY idsaldo DESC ',True);

         s_akhir := Round(GetValF(dm.Q1,'s_akhir')) + (nominal * Abs(jml));

         addParam('noakun',     '103.001',                aLst,'str');
         addParam('nobukti',    ENobukti.Text,            aLst,'str');
         addParam('tgl',        frmTgl(dt1.Date), aLst,'date');
         addParam('debet',      StrToDecimal(FloatToStr(nominal * Abs(jml))),      aLst,'str');
         addParam('s_akhir',    StrToDecimal(FloatToStr(s_akhir)),      aLst,'str');
         addParam('keterangan', 'SELISIH (+) STOK OPNAME ['+ENobukti.Text+']',    aLst,'str');
         addParam('iduser',setIdUser,    aLst,'str');
         addParam('nominalbkp',  StrToDecimal(FloatToStr(NominalBkp)),    aLst,'str');
         addParam('nominalnonbkp',StrToDecimal(FloatToStr(NominalNonBkp)),    aLst,'str');

         exeDb(dm.Q1,'saldoakun',aLst);


         ExQry(dm.Q1,' SELECT s_akhir FROM saldoakun '+
                     ' WHERE noakun="402.001" '+
                     ' ORDER BY idsaldo DESC ',True);

         s_akhir := Round(GetValF(dm.Q1,'s_akhir')) + (nominal * Abs(jml));

         addParam('noakun',     '402.001',                aLst,'str');
         addParam('nobukti',    ENobukti.Text,            aLst,'str');
         addParam('tgl',        frmTgl(dt1.Date), aLst,'date');
         addParam('kredit',     StrToDecimal(FloatToStr(nominal * Abs(jml))),      aLst,'str');
         addParam('s_akhir',    StrToDecimal(FloatToStr(s_akhir)),      aLst,'str');
         addParam('keterangan', 'SELISIH (+) STOK OPNAME ['+ENobukti.Text+']',    aLst,'str');
         addParam('nominalbkp',  StrToDecimal(FloatToStr(NominalBkp)),    aLst,'str');
         addParam('nominalnonbkp',StrToDecimal(FloatToStr(NominalNonBkp)),    aLst,'str');

         addParam('iduser',setIdUser,    aLst,'str');
         exeDb(dm.Q1,'saldoakun',aLst);

     end;
end;

procedure TFStokOpname.sg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    hargabeli , TotalSelisih   : Real;
    StokKomputer : Real;
    StokNyata   : Real;
    Selisih     : Real;
begin
  if sg1.Col in [6]  then begin
    if sg1.Cells[6,sg1.Row] <> '' then begin

      hargabeli    := StrToFloatDef(nilai(sg1.Cells[4,sg1.Row]),0);
      StokKomputer := StrToFloatDef(nilai(sg1.Cells[5,sg1.Row]),0);
      StokNyata    := StrToFloatDef(nilai(sg1.Cells[6,sg1.Row]),0);

      Selisih      := StokNyata - StokKomputer;
      TotalSelisih := hargabeli * Selisih;

      sg1.Cells[7,sg1.Row]  := FloatToStr(selisih);
      sg1.Cells[8,sg1.Row]  := Format('%.2n',[TotalSelisih]);

      LselisihQty.Caption := GetRupiah(SumGrid(sg1,7));
      LselisihCost.Caption:= GetRupiah(SumGrid(sg1,8));
    end;
  end;
end;

procedure TFStokOpname.sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   if ACol in [6,9] then
    sg1.Options := sg1.Options +[GoEditing]
  else
    sg1.Options := sg1.Options -[goEditing];
end;


procedure TFStokOpname.TampilanAwal;
begin
  ClearText(Self);
  isiCmb(dm.Q1,'kategori',['idkategori','namakategori'],cbKategori);
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
  cbGudang.ItemIndex := 0;
  isiCmb(dm.Q1,'m_user',['iduser','namalengkap'],cbPetugas);
  EnoBukti.Text := GetCode(dm.Q1,'temp_stokopname','nobukti','SO');
  dt1.Date := now;
  BuatGrid;
end;

end.
