unit uBayarTitip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  Vcl.StdCtrls, cxGroupBox, uComCtrl, uctrlFrm, uEngine, uOvEdit, uTerbilang,
  cxCurrencyEdit, Vcl.Menus, cxButtons, dxSkiniMaginary, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinSharp, dxBevel, cxLabel,DateUtils,IniFiles,
  dxSkinsDefaultPainters, dxSkinGlassOceans, dxSkinLiquidSky, dxSkinMoneyTwins,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinLilian,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, ujosprint;

type
  TFbayarPiutangTitip = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Enobukti: TcxTextEdit;
    dttanggal: TcxDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Epelanggan: TcxTextEdit;
    Ekodepelanggan: TcxTextEdit;
    Eketerangan: TcxTextEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGroupBox2: TcxGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Ebayar: TcxTextEdit;
    btnTutup: TcxButton;
    btnSimpan: TcxButton;
    Eterbilang: TcxTextEdit;
    btnCariPelanggan: TcxButton;
    cxGrid1DBTableView1fakturjual: TcxGridDBColumn;
    cxGrid1DBTableView1dibayar: TcxGridDBColumn;
    cxGrid1DBTableView1kekurangan: TcxGridDBColumn;
    cxGrid1DBTableView1namapelanggan: TcxGridDBColumn;
    Label15: TLabel;
    Label16: TLabel;
    EjumlahPiutang: TcxTextEdit;
    Label13: TLabel;
    Label14: TLabel;
    Esisapiutang: TcxTextEdit;
    cxLabel5: TcxLabel;
    dxBevel1: TdxBevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1totalpiutang: TcxGridDBColumn;
    Label17: TLabel;
    cbCaraBayar: TcxComboBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    cbAKun: TcxComboBox;
    LNOGIRO: TLabel;
    cxGrid1DBTableView1tglinput: TcxGridDBColumn;
    Label9: TLabel;
    Label10: TLabel;
    EDiskonPiutang: TcxTextEdit;
    cCetak: TCheckBox;
    jprint1: TJPRINTER;
    procedure FormCreate(Sender: TObject);
    procedure btnCariPelangganClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure EbayarPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbCaraBayarPropertiesCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EDiskonPiutangKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTutupClick(Sender: TObject);
  private
    alist : TStringList;
    { Private declarations }
    procedure PrintStruck(Nota : String);
    function Header(txt: string): string;
  public

    { Public declarations }
    procedure TampilanAwal;
    function SumCxGrid:Real;
  end;
  const
      SQLpiutang = ' SELECT                                     '+
                     '   h.fakturjual,                          '+
                     '   h.fakturjual,                          '+
                     '   h.tglinput,                            '+
                     '   h.piutang,                        '+
                     '   h.tgltempo,                            '+
                     '   h.dibayar,                             '+
                     '   h.kekurangan,                          '+
                     '   h.nominalbkp,                          '+
                     '   h.nominalnonbkp,                          '+
                     '   h.lunas,                               '+
                     '   s.namapelanggan,                       '+
                     '   s.kodepelanggan                        '+
                     ' FROM                                     '+
                     '   piutang h                              '+
                     '   LEFT JOIN penjualan p                  '+
                     '     ON p.`fakturjual` = h.`fakturjual`   '+
                     '   LEFT JOIN pelanggan s                  '+
                     '     ON s.`idpelanggan` = p.`idpelanggan` ';
var
  FbayarPiutangTitip: TFbayarPiutangTitip;

implementation

{$R *.dfm}

uses uDtrx, udm, uMainMenu, uCariPelanggan, uInputGiro, uDlaporan;

{ TFbayarpiutang }

procedure TFbayarPiutangTitip.btnSimpanClick(Sender: TObject);
var

  idpelanggan    : string;
  PiutangBkp : real;
  PiutangNonBKp : real;
  nopiutang : String;
  piutang : real;
  bayar : real;
  SelisihBkp : Real;
begin
  if Not CheckEdit(Self) then begin

     if (cbCaraBayar.ItemIndex = 2) and (LNOGIRO.Caption ='')  then  begin
         Error('Giro/Cek belum di masukan');
         FinputGiro.SetAwal;
         FinputGiro.ShowModal;
     end else begin


       if Ebayar.AsFLoat > 0 then begin


          idpelanggan  := getData(dm.Q3,'pelanggan WHERE kodepelanggan="'+Ekodepelanggan.Text+'"','idpelanggan');

          bayar := Ebayar.AsFLoat + EDiskonPiutang.AsFLoat;

          ExQry(dm.Q2,'SELECT * FROM v_piutang WHERE '+
              ' ( kodepelanggan="'+Ekodepelanggan.Text+'") '+
              ' AND kekurangan > 0 ORDER BY fakturjual ASC',True);

          with dm.Q1 do begin
              Close;
              SQL.Text := 'INSERT INTO bayarpiutang (nobukti,tgl,idpelanggan,iduser,'+
                          ' keterangan,nominal,noakun,carabayar) '+
                          'VALUES (:nobukti,:tgl,:idpelanggan,:iduser,'+
                          ':keterangan,:nominal,:noakun,:carabayar) ';
              ParamByName('nobukti').AsString     := Enobukti.Text;
              ParamByName('tgl').AsDate           := dttanggal.Date;
              ParamByName('idpelanggan').AsString := GetVal(dm.Q2,'idpelanggan');
              ParamByName('iduser').AsString      := setIdUser;
              ParamByName('keterangan').AsString  := '' ;
              ParamByName('nominal').AsFloat      := bayar;
              ParamByName('noakun').AsString      := Copy(cbAKun.Text,1,7);
              ParamByName('carabayar').AsString   := cbCaraBayar.Text;
              ExecSQL;
            end;

          repeat
                NoPiutang     := dm.Q2.FieldByName('fakturjual').AsString;
                piutang       := dm.Q2.FieldByName('kekurangan').AsFloat;
                PiutangBkp    := dm.Q2.FieldByName('nominalbkp').AsFloat;
                PiutangNonBKp := dm.Q2.FieldByName('nominalnonbkp').AsFloat;

                if bayar  >= piutang then begin

                   ExQry(dm.Q6,'INSERT INTO detailbayarpiutang (nobukti,nobuktijual,nominal) '+
                   ' VALUES ("'+Enobukti.Text+'","'+nopiutang+'","'+StrToDecimal(FLoatToStr(piutang))+'") ',False);


                    ExQry(dm.Q1,' UPDATE piutang h JOIN penjualan p ON h.fakturjual=p.fakturjual '+
                  ' SET h.kekurangan=0,h.lunas=true,h.dibayar=h.piutang '+
                  ' WHERE h.fakturjual="'+dm.Q2.FieldByName('fakturjual').AsString+'"',False);

                  PostingJurnal(dm.Q1,'104.001',NoPiutang,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+']',
                  dttanggal.Date,piutang,PiutangBkp,piutang - PiutangBkp,'K');
                  PostingJurnal(dm.Q1,Copy(cbAKun.Text,1,7),NoPiutang,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+'] ',
                  dttanggal.Date,piutang,PiutangBkp,piutang - PiutangBkp,'D');

                  Bayar    := Bayar - piutang;
                  dm.Q2.Next;
                end else
                begin
                ExQry(dm.Q6,'INSERT INTO detailbayarpiutang (nobukti,nobuktijual,nominal) '+
                   ' VALUES ("'+Enobukti.Text+'","'+nopiutang+'","'+StrToDecimal(FLoatToStr(Bayar))+'") ',False);

                 ExQry(dm.Q1,' UPDATE piutang h SET h.kekurangan=h.kekurangan - "'+FloatTostr(Bayar)+'",'+
                              ' h.dibayar=h.dibayar+"'+FloatTostr(Bayar)+'" '+
                             ' WHERE fakturjual="'+dm.Q2.FieldByName('fakturjual').AsString+'"',False);

                  PostingJurnal(dm.Q1,'104.001',NoPiutang,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+']',
                  dttanggal.Date,Bayar,PiutangBkp-Bayar,piutang - (PiutangBkp-bayar),'K');
                  PostingJurnal(dm.Q1,Copy(cbAKun.Text,1,7),NoPiutang,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+'] ',
                  dttanggal.Date,Bayar,PiutangBkp-Bayar,piutang - (PiutangBkp-bayar),'D');
                  Bayar := 0;
                end;
            
         until bayar = 0;

       end;
       if  cCetak.Checked then
          PrintStruck(Enobukti.Text);
       ClearText(Self);
       ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE namapelanggan="'+Epelanggan.Text+'" '+
                                     ' AND lunas=False',True);
       EjumlahPiutang.Text     := GetRupiah(FloatToStr(SumCxGrid));
       Eterbilang.Text         := MyTerbilang(SumCxGrid);
       Enobukti.Text           := GetCode(dm.Q1,'bayarpiutang','nobukti','BP');
     end;




    end;
end;

procedure TFbayarPiutangTitip.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFbayarPiutangTitip.cbCaraBayarPropertiesCloseUp(Sender: TObject);
begin
  if cbCaraBayar.ItemIndex = 2 then  begin
     FinputGiro.SetAwal;
     FinputGiro.ENominal.Text := Ebayar.Text ;
     FinputGiro.ShowModal;
  end else
  begin
    LNOGIRO.Caption := '';
  end;
end;

procedure TFbayarPiutangTitip.EbayarPropertiesChange(Sender: TObject);
begin
    if Ebayar.AsFLoat > 0 then begin
       Eterbilang.Text  := MyTerbilang(Ebayar.AsFLoat);

       Esisapiutang.Text := ToGaji(EjumlahPiutang.AsFLoat - Ebayar.AsFLoat - EDiskonPiutang.AsFLoat);

       if Ebayar.AsFLoat > EjumlahPiutang.AsFLoat then begin
          Esisapiutang.Text :='0';
          Ebayar.Text       := EjumlahPiutang.Text;
       end;
     end;
end;

procedure TFbayarPiutangTitip.EDiskonPiutangKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EDiskonPiutang.AsFLoat > 0 then begin
     Esisapiutang.Text  := Format('%.2n',[EjumlahPiutang.AsFLoat - EDiskonPiutang.AsFLoat]);
     Ebayar.Text  := Format('%.2n',[EjumlahPiutang.AsFLoat - EDiskonPiutang.AsFLoat]);

  end;
  if KEy = VK_RETURN then
    Ebayar.SetFocus;
end;

procedure TFbayarPiutangTitip.btnCariPelangganClick(Sender: TObject);
begin
  Fcaripelanggan.Show;
  Fcaripelanggan.isFormPelanggan := 5;
  ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE namapelanggan '+
  ' LIKE "%'+GetVal(dm.QPelanggan,'namapelanggan')+'%" '+
  ' AND lunas=False',True);

end;

procedure TFbayarPiutangTitip.FormCreate(Sender: TObject);
begin
  Ebayar.isRupiah         := True;
  EjumlahPiutang.isRupiah := True;
  EDiskonPiutang.isRupiah := True;
  FbayarPiutangTitip       := Self;
  Esisapiutang.isRupiah   := True;
  alist                   := TStringList.Create;
end;

procedure TFbayarPiutangTitip.FormDestroy(Sender: TObject);
begin
  Alist.Free;
end;

procedure TFbayarPiutangTitip.FormShow(Sender: TObject);
begin
  dttanggal.Date :=now;
end;

function TFbayarPiutangTitip.Header(txt: string): string;
var
  i : integer;
  jmltext : Integer;
  Lebar   : Integer;
  Sisa    : Integer;
  Hasil   : String;

begin
  Lebar   := 40;
  jmltext := Length(txt);


  Sisa := Lebar - jmltext;
  Sisa := Sisa div 2;


  Hasil := '';
  for i:= 1 to Sisa do begin
    Hasil := Hasil +' ';
  end;
  Result := Hasil + txt + Hasil;

end;

function PrinterStruk: String;
var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'SetKasir.ini');
  try
     Result := aIni.ReadString('KOMPUTER','printerstruk','Default Printer');
  finally
    aIni.Free;

  end;
end;

procedure TFbayarPiutangTitip.PrintStruck(Nota: String);

const  Enter = #13+#10;

const SQLdataPelunasanPiutang = ' SELECT                                    '+
                               '     h.nobukti,                            '+
                               '     h.tgl,                                '+
                               '     s.namapelanggan,                       '+
                               '     s.idpelanggan,                       '+
                               '     u.namalengkap,                        '+
                               '     h.keterangan,                         '+
                               '     h.nominal,                            '+
                               '     h.lastupdate,                            '+
                               '     h.nominalbkp,                            '+
                               '     h.nominalnonbkp,                            '+
                               '     h.nobuktijual                            '+
                               '   FROM                                    '+
                               '     bayarpiutang h                         '+
                               '     LEFT JOIN pelanggan s                '+
                               '       ON s.`idpelanggan` = h.`idpelanggan`  '+
                               '     LEFT JOIN m_user u                    '+
                               '       ON u.`iduser` = h.iduser            ';
var
  PiutangSebelumNya : Real;


begin
     jprint1.Bismillah;
     ExQry(dm.Q1,'select * '+
     'from profile where idprofil=1',True);



     Jprint1.WriteLn(Header(dm.Q1.FieldByName('nama').AsString));
     Jprint1.WriteLn(Header(dm.Q1.FieldByName('alamat').AsString));
     Jprint1.WriteLn(Header(dm.Q1.FieldByName('kota').AsString));
     Jprint1.WriteLn(Header(dm.Q1.FieldByName('notelepon').AsString));
     Jprint1.WriteLn(Enter);

     ExQry(dm.Q2,SQLdataPelunasanPiutang+' WHERE nobukti="'+Enobukti.Text+'"',True);


     Jprint1.WriteLn('PEMBAYARAN PIUTANG');


     Jprint1.WriteLn(' No.    : '+dm.Q2.FieldByName('nobukti').AsString);
     Jprint1.WriteLn(' Kasir  : '+dm.Q2.FieldByName('namalengkap').AsString);
     Jprint1.WriteLn(' Tgl    : '+FormatDateTime('dd/mm/yyyy',now));
     Jprint1.WriteLn(' Jam    : '+FormatDateTime('hh:nn:ss',now));
     Jprint1.WriteLn(' Cust   : '+dm.Q2.FieldByName('namapelanggan').AsString);
     Jprint1.WriteLn(Enter);
     dm.Q4.Close;
     dm.Q4.SQL.Text := 'SELECT SUM(p.piutang) as total_piutang,SUM(p.dibayar) as total_dibayar,'+
     ' SUM(p.piutang-p.dibayar) as sisa_piutang '+
     ' FROM piutang p LEFT JOIN penjualan pj ON pj.fakturjual=p.fakturjual '+
     ' WHERE (pj.idpelanggan="'+GetVal(dm.Q2,'idpelanggan')+'" and p.kekurangan > 0 ) '+
     ' OR p.fakturjual IN (SELECT nobuktijual FROM detailbayarpiutang '+
     ' WHERE nobukti="'+getVal(dm.Q2,'nobukti')+'") ';
     dm.Q4.Open;

     PiutangSebelumNya  := (GetValF(dm.Q4,'total_piutang') - GetValF(dm.Q4,'total_dibayar')) + GetValF(dm.Q2,'nominal');

     Jprint1.WriteLn(' Piutang: '+Format('%.0n',[PiutangSebelumNya]));
     Jprint1.WriteLn(' D.Bayar: '+GetValR(dm.Q2,'nominal'));
     Jprint1.WriteLn(' Sisa   : '+GetValR(dm.Q4,'sisa_piutang'));

     Jprint1.WriteLn(Enter);
     Jprint1.PotongKertas;

     jprint1.Alhamdulillah;

end;

function TFbayarPiutangTitip.SumCxGrid: Real;

var
  i : integer;
  Total : Real;
begin
  Total := 0;
  with cxGrid1DBTableView1.DataController do begin
  for i := 0 to RecordCount -1 do
    begin
     if VarToStr(Values[i,5]) <> '' then

      total := Total + StrToFloatDef(VarToStr(Values[i,5]),0);
    end;
  end;
  Result := TOtal;
end;

procedure TFbayarPiutangTitip.TampilanAwal;

begin
  ClearText(Self);
  dtrx.Qpiutang.Active := False;
  Enobukti.Text        := GetCode(dm.Q1,'bayarpiutang','nobukti','BP');
  setTanggal(Self);
  LNOGIRO.Caption := '';
  dttanggal.Date := now;

  ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
  ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);
    cbAKun.Properties.Items.Clear;
  while not dm.Q2.Eof do begin
    cbAKun.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    dm.Q2.Next;
  end;

  OpenTable(dm.Q1,['default_kas_penjualan'],'profile');

   cbAKun.ItemIndex := cbAKun.Properties.Items.IndexOf(dm.Q1.Fields[0].AsString);

end;

end.

