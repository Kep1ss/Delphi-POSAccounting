unit uBayarHutang;

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
  dxSkinOffice2016Colorful, dxSkinSharp, dxBevel, cxLabel, dxSkinOffice2007Blue,
  dxSkinsDefaultPainters, cxCheckBox, dxSkinMoneyTwins,DateUtils, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

  const
  UM_CHECK = WM_USER + 10000;

type
  TFbayarHutang = class(TForm)
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
    Esupplier: TcxTextEdit;
    Ekodesupplier: TcxTextEdit;
    Eketerangan: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Enohutang: TcxTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    Ebayar: TcxTextEdit;
    btnTutup: TcxButton;
    btnSimpan: TcxButton;
    Eterbilang: TcxTextEdit;  Label16: TLabel;
    EjumlahHutang: TcxTextEdit;
    Label13: TLabel;
    Label14: TLabel;
    Esisahutang: TcxTextEdit;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Label17: TLabel;
    Label18: TLabel;
    EDiskonHutang: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2kodebarang: TcxGridDBColumn;
    cxGrid1DBTableView2namabarang: TcxGridDBColumn;
    cxGrid1DBTableView2satuan: TcxGridDBColumn;
    cxGrid1DBTableView2harga: TcxGridDBColumn;
    cxGrid1DBTableView2jumlah: TcxGridDBColumn;
    cxGrid1DBTableView2diskonpersen: TcxGridDBColumn;
    cxGrid1DBTableView2diskon2: TcxGridDBColumn;
    cxGrid1DBTableView2diskon3: TcxGridDBColumn;
    cxGrid1DBTableView2subtotal: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    cbCaraBayar: TcxComboBox;
    cbAKun: TcxComboBox;
    cxGrid1DBTableView1tglinput: TcxGridDBColumn;
    cxGrid1DBTableView1hutang: TcxGridDBColumn;
    cxGrid1DBTableView1dibayar: TcxGridDBColumn;
    cxGrid1DBTableView1kekurangan: TcxGridDBColumn;
    cxGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxlbl1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure EbayarPropertiesChange(Sender: TObject);
    procedure EDiskonHutangKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDiskonHutangExit(Sender: TObject);
    procedure EbayarExit(Sender: TObject);
    procedure ColCheckPropertiesEditValueChanged(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private

    { Private declarations }
  public

    { Public declarations }
    procedure TampilanAwal;
    function SumCxGrid:Real;
    procedure CetakSpn(nobukti:String);
    procedure Check(AGridView: TcxGridDBTableView);
    procedure UmCheck(var Message: TMessage); message UM_CHECK;
    procedure Split(const Delimiter: Char;Input: string;const Strings: TStrings) ;
  end;
  const
      SQLHUTang = 'SELECT                          '+
                  '      h.nobukti,                '+
                  '      h.tglinput,               '+
                  '      h.tgltempo,               '+
                  '      h.hutang,                 '+
                  '      h.dibayar,                '+
                  '      h.kekurangan,             '+
                  '      h.nominalbkp,             '+
                  '      h.nominalnonbkp,          '+
                  '      h.lunas,                  '+
                  '      s.namasupplier            '+
                  '    FROM                        '+
                  '      hutang h                  '+
                  '      LEFT JOIN pembelian p           '+
                  '      ON p.`nobukti` = h.`nobukti`    '+
                  '      LEFT JOIN m_supplier s          '+
                  '    ON s.`idsupplier` = p.`idsupplier` ' ;


var
  FbayarHutang: TFbayarHutang;

implementation

{$R *.dfm}

uses uDtrx, udm, uCariSupplier, uMainMenu, uDLaporan;

{ TFbayarHutang }

procedure TFbayarHutang.btnSimpanClick(Sender: TObject);
var
  alist : TStringList;
  idSupplier    : string;
  bayar ,Hutang : Real;
  nohutang      : string;
  saldoakun   : Real;
  nominalBKP : real;
  nominalNonBkp : Real;
  SelisihBkp : real;
begin
  if Enohutang.Text = '' then begin
     Error('Nomer hutang belum dipilih, '+#13+'Silahkan Pilih Nomer Hutang yang akan dibayar');
     Exit;

  end else begin
  if (cbAKun.ItemIndex >= 0) AND (  Not CheckEdit(Self)) then begin

     if SaldoRekening(Copy(cbAKun.Text,1,7)) < EDiskonHutang.AsFLoat + Ebayar.AsFLoat then begin
        Error('Saldo Rekening Tidak mencukupi !!'+#13+'Saldo '+cbAKun.Text+' : '+Format('%.2n',[SaldoRekening(Copy(cbAKun.Text,1,7))]));
        Exit;

     end else begin
         ExQry(dm.Q2,'SELECT SUM(s_awal+debet-kredit) as saldoakhir FROM saldoakun WHERE '+
         ' month(tgl)="'+IntToStr(MonthOf(dttanggal.Date))+'" AND '+
         ' Year(tgl)="'+IntToStr(YearOf(dttanggal.Date))+'" AND '+
         ' noakun="'+Copy(cbAKun.Text,1,7)+'" ',True);

         saldoakun := GetValF(dm.Q2,'saldoakhir');

         if saldoakun >= StrToFloatDef(koma(Ebayar.Text),0) then begin

             alist := TStringList.Create;

             try
             alist.Duplicates := dupIgnore;
             nohutang         := StringReplace(Enohutang.Text,'"','',[rfReplaceAll]);
             nohutang         := StringReplace(nohutang,',','|',[rfReplaceAll]);
                 if Ebayar.AsFLoat > 0 then begin

                    idSupplier := getData(dm.Q2,'m_supplier WHERE kodesupplier="'+EkodeSupplier.Text+'"','idsupplier');
                    addParam('nobukti',     Enobukti.Text,alist,'str');
                    addParam('tgl',         frmTgl(dttanggal.Date),alist,'date');
                    addParam('idsupplier',  idSupplier,alist,'str');
                    addParam('iduser',      Fmain.sbr1.Panels[1].Text,alist,'str');
                    addParam('keterangan',  'BAYAR HUTANG NO ['+nohutang+'] ['+Eketerangan.Text+']',alist,'str');
                    addParam('nominal',     StrToDecimal(nilai(Ebayar.Text)),alist,'str');
                    addParam('diskon',      StrToDecimal(nilai(EDiskonHutang.Text)),alist,'str');
                    addParam('carabayar',   cbCaraBayar.Text,alist,'str');
                    addParam('nohutang',    Enohutang.Text,alist,'str');

                    exeDb(dm.Q1,'bayarhutang',alist);


                    ExQry(dm.Q4,SQLHUTang+' WHERE s.kodesupplier="'+Ekodesupplier.Text+'" '+
                    ' AND h.nobukti="'+Enohutang.Text+'"',True);


                    bayar      := Ebayar.AsFLoat + EDiskonHutang.AsFLoat;

                    if bayar  > EjumlahHutang.AsFLoat then
                       bayar  := EjumlahHutang.AsFLoat;


                      Hutang     := GetValF(dm.Q4,'kekurangan');
                      nominalBKP := GetValF(dm.Q4,'nominalbkp');
                      nominalNonBkp := GetValF(dm.Q4,'nominalnonbkp');

                      if bayar  >= hutang then begin


                        ExQry(dm.Q2,' UPDATE hutang h SET h.kekurangan=0,h.dibayar=h.hutang,'+
                        ' nominalbkp=0,nominalnonbkp=0,Lunas=True '+
                                    ' WHERE nobukti="'+GetVal(dm.Q4,'nobukti')+'"',False);

                        addParam('nobukti',Enobukti.Text,alist,'str');
                        addParam('nobuktibeli',GetVal(dm.Q4,'nobukti'),alist,'str');
                        addParam('nominal',StrToDecimal(FloatTostr(Hutang)),alist,'str');
                        addParam('nominalbkp',StrToDecimal(FloatTostr(nominalBKP)),alist,'str');
                        addParam('nominalnonbkp',StrToDecimal(FloatTostr(nominalNonBkp)),alist,'str');

                        exeDb(dm.Q3,'detailbayarhutang',alist);


                      end else
                      begin
                        ExQry(dm.Q2,' UPDATE hutang h SET h.kekurangan=h.kekurangan - "'+FloatTostr(Bayar)+'",'+
                                    ' nominalbkp=IF(nominalbkp > "'+FloatToStr(Bayar)+'" ,nominalbkp-"'+FloatToStr(bayar)+'",0) ,'+
                                    ' nominalnonbkp=IF(nominalbkp < "'+FloatToStr(Bayar)+'","'+StrToDecimal(FloatToStr(nominalNonBkp-(Bayar-nominalBkp)))+'",'+
                                    ' nominalnonbkp), '+
                                    ' h.dibayar= h.dibayar+"'+FloatTostr(Bayar)+'" '+
                                    ' WHERE nobukti="'+GetVal(dm.Q4,'nobukti')+'"',False);

                        addParam('nobukti',Enobukti.Text,alist,'str');
                        addParam('nobuktibeli',GetVal(dm.Q4,'nobukti'),alist,'str');
                        addParam('nominal',StrToDecimal(FloatTostr(Bayar)),alist,'str');
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

                        exeDb(dm.Q3,'detailbayarhutang',alist);

                      end;



                    if Ebayar.AsFLoat >= nominalBKP then begin
                        SelisihBkp := Ebayar.AsFLoat - nominalBKP;
                        PostingJurnal(dm.Q1,'201.001',Enobukti.Text,'PEMBAYARAN HUTANG ['+Esupplier.Text+']',
                        dttanggal.Date,Ebayar.AsFLoat,NominalBkp,SelisihBkp,'D');
                        PostingJurnal(dm.Q1,Copy(cbAKun.Text,1,Pos('|',cbAKun.Text)-2),Enobukti.Text,'PEMBAYARAN HUTANG ['+Esupplier.Text+']',
                        dttanggal.Date,Ebayar.AsFLoat,NominalBkp,SelisihBkp,'K');

                        if EDiskonHutang.AsFLoat > 0 then begin
                           PostingJurnal(dm.Q1,'402.001',Enobukti.Text,'PEMBAYARAN HUTANG ['+Esupplier.Text+']',
                           dttanggal.Date,EDiskonHutang.AsFLoat,EDiskonHutang.AsFloat,0,'K');
                           PostingJurnal(dm.Q1,'201.001',Enobukti.Text,'PEMBAYARAN HUTANG ['+Esupplier.Text+']',
                           dttanggal.Date,EDiskonHutang.AsFLoat,EDiskonHutang.AsFloat,0,'D');

                        end;
                    end else begin


                        PostingJurnal(dm.Q1,'201.001',Enobukti.Text,'PEMBAYARAN HUTANG ['+Esupplier.Text+']',
                        dttanggal.Date,Ebayar.AsFLoat,Ebayar.AsFLoat,0,'D');
                        PostingJurnal(dm.Q1,Copy(cbAKun.Text,1,Pos('|',cbAKun.Text)-2),Enobukti.Text,'PEMBAYARAN HUTANG ['+Esupplier.Text+']',
                        dttanggal.Date,Ebayar.AsFLoat,Ebayar.AsFLoat,0,'K');

                        if EDiskonHutang.AsFLoat > 0 then begin
                           PostingJurnal(dm.Q1,'402.001',Enobukti.Text,'PEMBAYARAN HUTANG ['+Esupplier.Text+']',
                           dttanggal.Date,EDiskonHutang.AsFLoat,EDiskonHutang.AsFloat,0,'K');
                           PostingJurnal(dm.Q1,'201.001',Enobukti.Text,'PEMBAYARAN HUTANG ['+Esupplier.Text+']',
                           dttanggal.Date,EDiskonHutang.AsFLoat,EDiskonHutang.AsFloat,0,'D');

                        end;
                    end;

                   Informasi('Hutang berhasil dibayarkan');
                   TampilanAwal;
                 end;

             finally
               alist.Free;

             end;

         end else begin
           Error('Saldo Tidak Mencukupi');
           Exit;
         end;
     end;

  end else
     Error('Kas belum dipilih');
  end;
end;

procedure TFbayarHutang.btnSupplierClick(Sender: TObject);
begin
  FcariSupplier.Show;
  FcariSupplier.isFormSUpplier := 1;
end;

procedure TFbayarHutang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFbayarHutang.CetakSpn(nobukti: String);
begin
  ExQry(dtrx.QpelunasanHutang,'SELECT                                    '+
                              '    h.nobukti,                            '+
                              '    h.tgl,                                '+
                              '    s.namasupplier,                       '+
                              '    u.namalengkap,                        '+
                              '    h.keterangan,                         '+
                              '    h.diskon,                             '+
                              '    h.nominal,                            '+
                              '    h.nohutang                            '+
                              '  FROM                                    '+
                              '    bayarhutang h                         '+
                              '    LEFT JOIN m_supplier s                '+
                              '      ON s.`idsupplier` = h.`idsupplier`  '+
                              '    LEFT JOIN m_user u                    '+
                              '      ON u.`iduser` = h.iduser            '+
                              '  WHERE h.nobukti in ('+nobukti+')          ',True);
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\spmBayarHutang.fr3');
  FMemo(Dlaporan.Fr1,'Lterbilang').Text := MyTerbilang(GetValF(dtrx.QpelunasanHutang,'nominal'));
  Dlaporan.Fr1.ShowReport(True);
end;

procedure TFbayarHutang.Check(AGridView: TcxGridDBTableView);

begin
{  for i:= 0 to AGridView.DataController.RecordCount - 1 do BEGIN
    if AGridView.DataController.Values[i, ColCheck.Index] = true then
      AGridView.DataController.ChangeRowSelection(i, true)
    else
      AGridView.DataController.ChangeRowSelection(i, false);
  END;      }
end;

procedure TFbayarHutang.ColCheckPropertiesEditValueChanged(Sender: TObject);
var
  ACheck: TcxCheckBox;
  AGridSite: TcxGridSite;
  AGridView: TcxGridDBTableView;
  I : INTEGER;
  s : Real;
  Hutang  : Real;
  kode : String;
begin
  ACheck := Sender as TcxCheckBox;
  AGridSite := ACheck.Parent as TcxGridSite;
  AGridView := AGridSite.GridView as TcxGridDBTableView;
  Check(AGridView);
  s := 0;
  kode := '';
  with cxGrid1DBTableView1.Controller do
    for I := 0 to SelectedRecordCount - 1 do begin
      s := s+ cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[5];
      kode := kode+'"' + cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1]+'",';
    end;
    Delete(kode,length(kode),1);

  Hutang             := s;
  EjumlahHutang.Text := Format('%.2n',[hutang]);
  Enohutang.Text     := kode;

end;

procedure TFbayarHutang.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin

  Enohutang.Text        := dtrx.Qhutang.FieldByName('nobukti').AsString;
  EjumlahHutang.Text    := Format('%.2n',[GetValF(dtrx.Qhutang,'kekurangan')]);

  Ebayar.SetFocus;
end;

procedure TFbayarHutang.EbayarExit(Sender: TObject);
begin
  Ebayar.Text := Format('%.2n',[Ebayar.AsFLoat]);
end;

procedure TFbayarHutang.EbayarPropertiesChange(Sender: TObject);
begin
    if (Ebayar.AsFLoat + EDiskonHutang.AsFLoat > 0) then begin
       Eterbilang.Text  := MyTerbilang(Ebayar.AsFLoat + EDiskonHutang.AsFLoat);


       Esisahutang.Text := ToGaji(EjumlahHutang.AsFLoat - EDiskonHutang.AsFLoat - Ebayar.AsFLoat);

       if (Ebayar.AsFLoat + EDiskonHutang.AsFLoat> EjumlahHutang.AsFLoat) then begin
           Ebayar.Text   := Format('%.2n',[EjumlahHutang.AsFLoat - EdiskonHutang.AsFLoat]);
           Esisahutang.Text :='0';
       end;
     end;
end;

procedure TFbayarHutang.EDiskonHutangExit(Sender: TObject);
begin
  EDiskonHutang.Text := Format('%.2n',[EdiskonHUtang.AsFLoat]);
end;

procedure TFbayarHutang.EDiskonHutangKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EDiskonHutang.AsFLoat > 0 then begin
     Esisahutang.Text  := Format('%.2n',[EjumlahHutang.AsFLoat - EdiskonHUtang.AsFLoat]);
     Ebayar.Text  := Format('%.2n',[EjumlahHutang.AsFLoat - EdiskonHUtang.AsFLoat]);

  end;
  if KEy = VK_RETURN then
    Ebayar.SetFocus;
end;

procedure TFbayarHutang.FormCreate(Sender: TObject);
begin
  
  FbayarHutang := Self;

end;

procedure TFbayarHutang.Split(const Delimiter: Char; Input: string;
  const Strings: TStrings);
begin
    Assert(Assigned(Strings)) ;
    Strings.Clear;
    Strings.Delimiter := Delimiter;
    Strings.DelimitedText := Input;

end;

function TFbayarHutang.SumCxGrid: Real;

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

procedure TFbayarHutang.TampilanAwal;
begin
  ClearText(Self);
  dtrx.Qhutang.Active := False;
  Enobukti.Text       := GetCode(dm.Q1,'bayarhutang','nobukti','BH');
  dttanggal.Date      := now;

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

procedure TFbayarHutang.UmCheck(var Message: TMessage);
begin
  Check(TcxGridDBTableView(Message.WParam));
end;

end.
