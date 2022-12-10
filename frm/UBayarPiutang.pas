unit UBayarPiutang;

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
  TFbayarPiutang = class(TForm)
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
    Label21: TLabel;
    Label22: TLabel;
    EnoPiutang: TcxTextEdit;
    cCetak: TCheckBox;
    jprint1: TJPRINTER;
    procedure FormCreate(Sender: TObject);
    procedure btnCariPelangganClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
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
  FbayarPiutang: TFbayarPiutang;

implementation

{$R *.dfm}

uses uDtrx, udm, uMainMenu, uCariPelanggan, uInputGiro, uDlaporan;

{ TFbayarpiutang }

procedure TFbayarPiutang.btnSimpanClick(Sender: TObject);
var

  idpelanggan    : string;
  nominalbkp : real;
  nominalnonbkp : real;
  bayar : real;
  SelisihBkp : Real;
begin
  if Not CheckEdit(Self) then begin

     if (cbCaraBayar.ItemIndex = 2) and (LNOGIRO.Caption ='')  then  begin
         Error('Giro/Cek belum di masukan');
         FinputGiro.SetAwal;
         FinputGiro.ShowModal;
     end else begin

     if EnoPiutang.Text = '' then begin
        Error('Nomer Piutang Belum dipilih');
        exit;

     end else begin

       if Ebayar.AsFLoat > 0 then begin


          idpelanggan  := getData(dm.Q3,'pelanggan WHERE kodepelanggan="'+Ekodepelanggan.Text+'"','idpelanggan');

          bayar := Ebayar.AsFLoat + EDiskonPiutang.AsFLoat;
          nominalbkp    := dtrx.Qpiutang.FieldByName('nominalbkp').AsFloat;
          nominalnonbkp := dtrx.Qpiutang.FieldByName('nominalnonbkp').AsFloat;




          addParam('nobukti',   Enobukti.Text,alist,'str');
          addParam('tgl',       frmTgl(dttanggal.Date),alist,'date');
          addParam('idpelanggan',idpelanggan,alist,'str');
          addParam('iduser',    setIdUser,alist,'str');
          addParam('keterangan',Eketerangan.Text,alist,'str');
          addParam('diskonpiutang',   StrToDecimal(EDiskonPiutang.Text),alist,'str');
          addParam('nominal',   StrToDecimal(Ebayar.Text),alist,'str');
          addParam('nopiutang', EnoPiutang.Text,alist,'str');
          addParam('nobuktijual',EnoPiutang.Text,alist,'str' );
          addParam('noakun',      Copy(cbAKun.Text,1,Pos('|',cbAKun.Text)-2),alist,'str');
          addParam('carabayar',   cbCaraBayar.Text,alist,'str');

           if nominalBKP > bayar then
              addParam('nominalbkp',StrToDecimal(FloatTostr(bayar)),alist,'str') else
              addParam('nominalbkp',StrToDecimal(FloatTostr(nominalBKP)),alist,'str');

              if (nominalBKP < Bayar) and (nominalBKP > 0) then

              addParam('nominalnonbkp',StrToDecimal(FloatTostr(bayar - nominalBKP)),alist,'str')
              else if (nominalBKP = 0) and (nominalNonBkp > 0 ) then begin
                  if (bayar > nominalNonBkp) then

                  addParam('nominalnonbkp',StrToDecimal(FloatTostr(nominalBKP)),alist,'str')
              else
                 addParam('nominalnonbkp',StrToDecimal(FloatTostr(bayar)),alist,'str');
              end;

          exeDb(dm.Q2,'bayarpiutang',alist);
          if Ebayar.AsFLoat >= nominalBKP then begin
              SelisihBkp := Ebayar.AsFLoat - nominalBKP;
              PostingJurnal(dm.Q1,'104.001',Enobukti.Text,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+']',
              dttanggal.Date,Ebayar.AsFLoat,NominalBkp,SelisihBkp,'K');
              PostingJurnal(dm.Q1,Copy(cbAKun.Text,1,Pos('|',cbAKun.Text)-2),Enobukti.Text,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+']',
              dttanggal.Date,Ebayar.AsFLoat,NominalBkp,SelisihBkp,'D');

              if EDiskonPiutang.AsFLoat > 0 then begin
                 PostingJurnal(dm.Q1,'502.005',Enobukti.Text,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+']',
                 dttanggal.Date,EDiskonPiutang.AsFLoat,EDiskonPiutang.AsFloat,0,'D');
                 PostingJurnal(dm.Q1,'104.001',Enobukti.Text,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+']',
                 dttanggal.Date,EDiskonPiutang.AsFLoat,EDiskonPiutang.AsFloat,0,'K');

              end;
          end else begin


              PostingJurnal(dm.Q1,'104.001',Enobukti.Text,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+']',
              dttanggal.Date,Ebayar.AsFLoat,Ebayar.AsFLoat,0,'K');
              PostingJurnal(dm.Q1,Copy(cbAKun.Text,1,Pos('|',cbAKun.Text)-2),Enobukti.Text,'PEMBAYARAN PIUTANG ['+Epelanggan.Text+']',
              dttanggal.Date,Ebayar.AsFLoat,Ebayar.AsFLoat,0,'D');

              if EDiskonPiutang.AsFLoat > 0 then begin
                 PostingJurnal(dm.Q1,'502.005',Enobukti.Text,'PEMBAYARAN HUTANG ['+Epelanggan.Text+']',
                 dttanggal.Date,EDiskonPiutang.AsFLoat,EDiskonPiutang.AsFloat,0,'D');
                 PostingJurnal(dm.Q1,'104.001',Enobukti.Text,'PEMBAYARAN HUTANG ['+Epelanggan.Text+']',
                 dttanggal.Date,EDiskonPiutang.AsFLoat,EDiskonPiutang.AsFloat,0,'K');

              end;
          end;

          ExQry(dm.Q2,' UPDATE piutang SET dibayar=dibayar+'+StrToDecimal(Ebayar.Text)+'+'+StrToDecimal(EDiskonPiutang.Text)+','+
                      ' kekurangan=piutang.piutang-dibayar,'+
                      ' lunas=IF(kekurangan=0,TRUE,FALSE),'+
                      ' nominalbkp=IF(nominalbkp > "'+FloatToStr(Bayar)+'" ,nominalbkp-"'+FloatToStr(bayar)+'",0) ,'+
                      ' nominalnonbkp=IF(nominalbkp < "'+FloatToStr(Bayar)+'","'+StrToDecimal(FloatToStr(nominalNonBkp-(Bayar-nominalBkp)))+'",'+
                      ' nominalnonbkp)  WHERE    '+
                      ' fakturjual="'+EnoPiutang.Text+'"',False);



            


       end;
       if  cCetak.Checked then
          PrintStruck(EnoPiutang.Text);
       ClearText(Self);
       ExQry(dtrx.Qpiutang,SQLpiutang+' WHERE namapelanggan="'+Epelanggan.Text+'" '+
                                     ' AND lunas=False',True);
       EjumlahPiutang.Text     := GetRupiah(FloatToStr(SumCxGrid));
       Eterbilang.Text         := MyTerbilang(SumCxGrid);
       Enobukti.Text           := GetCode(dm.Q1,'bayarpiutang','nobukti','BP');
     end;



     end;
    end;
end;

procedure TFbayarPiutang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFbayarPiutang.cbCaraBayarPropertiesCloseUp(Sender: TObject);
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

procedure TFbayarPiutang.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
 ExQry(dm.Q1,'SELECT nopiutang FROM datagiro WHERE nopiutang="'+GetVal(dtrx.Qpiutang,'fakturjual')+'"',True);

  if dm.Q1.IsEmpty = False then begin
     Informasi('Piutang Sudah Dibayarkan dengan giro');
     Exit;
  end else begin
      Enopiutang.Text        := dtrx.Qpiutang.FieldByName('fakturjual').AsString;
      EjumlahPiutang.Text    := GetValR(dtrx.Qpiutang,'kekurangan');
      Eterbilang.Text        := MyTerbilang(GetValF(dtrx.Qpiutang,'kekurangan'));

      Ebayar.SetFocus;
  end;
end;

procedure TFbayarPiutang.EbayarPropertiesChange(Sender: TObject);
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

procedure TFbayarPiutang.EDiskonPiutangKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EDiskonPiutang.AsFLoat > 0 then begin
     Esisapiutang.Text  := Format('%.2n',[EjumlahPiutang.AsFLoat - EDiskonPiutang.AsFLoat]);
     Ebayar.Text  := Format('%.2n',[EjumlahPiutang.AsFLoat - EDiskonPiutang.AsFLoat]);

  end;
  if KEy = VK_RETURN then
    Ebayar.SetFocus;
end;

procedure TFbayarPiutang.btnCariPelangganClick(Sender: TObject);
begin
  Fcaripelanggan.Show;
  Fcaripelanggan.isFormPelanggan := 1;
end;

procedure TFbayarPiutang.FormCreate(Sender: TObject);
begin
  Ebayar.isRupiah         := True;
  EjumlahPiutang.isRupiah := True;
  EDiskonPiutang.isRupiah := True;
  Fbayarpiutang           := Self;
  Esisapiutang.isRupiah   := True;
  alist                   := TStringList.Create;
end;

procedure TFbayarPiutang.FormDestroy(Sender: TObject);
begin
  Alist.Free;
end;

procedure TFbayarPiutang.FormShow(Sender: TObject);
begin
  dttanggal.Date :=now;
end;

function TFbayarPiutang.Header(txt: string): string;
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

procedure TFbayarPiutang.PrintStruck(Nota: String);

const  Enter = #13+#10;

const SQLdataPelunasanPiutang = ' SELECT                                    '+
                               '     h.nobukti,                            '+
                               '     h.tgl,                                '+
                               '     s.namapelanggan,                       '+
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

begin
    jprint1.Bismillah;
     ExQry(dm.Q1,'select * '+
     'from profile where idprofil=1',True);



     jprint1.WriteLn(Header(dm.Q1.FieldByName('nama').AsString));
     jprint1.WriteLn(Header(dm.Q1.FieldByName('alamat').AsString));
     jprint1.WriteLn(Header(dm.Q1.FieldByName('kota').AsString));
     jprint1.WriteLn(Header(dm.Q1.FieldByName('notelepon').AsString));
     jPrint1.WriteLn(Enter);
     ExQry(dm.Q2,SQLdataPelunasanPiutang+' WHERE nobukti="'+Enobukti.Text+'"',True);


     jPrint1.WriteLn('PEMBAYARAN PIUTANG');

     jprint1.WriteLn(' No.    : '+dm.Q2.FieldByName('nobukti').AsString);
     jprint1.WriteLn(' Kasir  : '+dm.Q2.FieldByName('namalengkap').AsString);
     jprint1.WriteLn(' Tgl    : '+FormatDateTime('dd/mm/yyyy',now));
     jprint1.WriteLn(' Jam    : '+FormatDateTime('hh:nn:ss',now));
     jprint1.WriteLn(' Cust   : '+dm.Q2.FieldByName('namapelanggan').AsString);
     jprint1.WriteLn(' No.Penj: '+dm.Q2.FieldByName('nobuktijual').AsString);
     dm.Q4.Close;
     dm.Q4.SQL.Text := 'SELECT * FROM piutang WHERE fakturjual="'+GetVal(dm.Q2,'nobuktijual')+'"';
     dm.Q4.Open;
     jprint1.WriteLn(' Piutang: '+GetValR(dm.Q4,'piutang'));
     jprint1.WriteLn(' D.Bayar: '+GetValR(dm.Q4,'dibayar'));
     jprint1.WriteLn(' Sisa   : '+GetValR(dm.Q4,'kekurangan'));



      jPrint1.WriteLn(Enter);
      Jprint1.PotongKertas;

      jprint1.Alhamdulillah;

end;

function TFbayarPiutang.SumCxGrid: Real;

var
  i : integer;
  Total : Real;
begin
  Total := 0;
  with cxGrid1DBTableView1.DataController do begin
  for i := 0 to RecordCount -1 do
    begin
     if VarToStr(Values[i,4]) <> '' then

      total := Total + StrToFloatDef(VarToStr(Values[i,4]),0);
    end;
  end;
  Result := TOtal;
end;

procedure TFbayarPiutang.TampilanAwal;

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

