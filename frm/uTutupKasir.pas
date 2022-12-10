unit uTutupKasir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, dxSkinOffice2016Colorful, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, Vcl.ExtCtrls, Vcl.ComCtrls, dxBevel,
  uOvEdit, uComCtrl, uctrlFrm, uEngine,DateUtils,strUtils, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFtutupKasir = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dt1: TDateTimePicker;
    Label32: TLabel;
    btnTutup: TcxButton;
    btnTutupForm: TcxButton;
    Label43: TLabel;
    Label44: TLabel;
    ESetorKekasBesar: TcxTextEdit;
    Label48: TLabel;
    Label50: TLabel;
    ETinggalDIkasir: TcxTextEdit;
    grp1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LpenjualanCash: TLabel;
    LpenjualanKredit: TLabel;
    shp1: TShape;
    Label9: TLabel;
    Label10: TLabel;
    LtotalPenjualan: TLabel;
    shp2: TShape;
    Label11: TLabel;
    Label12: TLabel;
    Ltunai: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Ltransfer: TLabel;
    shp4: TShape;
    grp2: TGroupBox;
    Label8: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    LtotalUangKasir: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    LsaldoAwal: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    LpenjualanTunai: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    LtotalPengeluaran: TLabel;
    shp3: TShape;
    LtotalUangMasuk: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    LtotalPembelian: TLabel;
    shp5: TShape;
    Label25: TLabel;
    cbKas: TComboBox;
    Label26: TLabel;
    Label27: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    LpembayaranPiutang: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Ldisetorkas: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    cbKasir: TComboBox;
    procedure btnTutupFormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure ESetorKekasBesarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbKasirChange(Sender: TObject);
  private
    { Private declarations }
    function GetIdkasir(cmb:TComboBox):String;

  public
    { Public declarations }
    procedure HitungUang;
  end;

var
  FtutupKasir: TFtutupKasir;

implementation

{$R *.dfm}

uses udm, uDlaporan;



procedure TFtutupKasir.btnTutupClick(Sender: TObject);
var
  ls : TStringList;
begin
      if ESetorKekasBesar.AsFLoat = 0 then begin
        Warning('Nominal kas besar belum di inputkan');
        Exit;
      end else begin

        ls := TStringList.Create;
         try

           PostingJurnal(dm.Q1,Copy(cbKas.Text,1,7),FormatDateTime('ddmmyyhhnnss',dt1.Date),
           'Tutup Kasir '+FormatDateTime('dd mmmm yyyy',dt1.Date),dt1.Date,ESetorKekasBesar.AsFLoat,ESetorKekasBesar.AsFLoat,ESetorKekasBesar.AsFLoat,'D');
           PostingJurnal(dm.Q1,'101.003',FormatDateTime('ddmmyyhhnnss',dt1.Date),
           'Tutup Kasir '+FormatDateTime('dd mmmm yyyy',dt1.Date),dt1.Date,ESetorKekasBesar.AsFLoat,ESetorKekasBesar.AsFLoat,ESetorKekasBesar.AsFLoat,'K');

           Informasi('Proses Berhasil');

           Dlaporan.Fr1.LoadFromFile(aPathRpt+'\printKasir.fr3');
           FMemo(Dlaporan.Fr1,'Lkasir').Text := cbKasir.Text;
           FMemo(Dlaporan.Fr1,'Ltanggal').Text := FormatDateTime('dd mmmm yyyy',dt1.Date);
           FMemo(Dlaporan.Fr1,'Lsaldoawal').Text := LsaldoAwal.Caption;
           FMemo(Dlaporan.Fr1,'Lsaldoawal').Text := LsaldoAwal.Caption;
           FMemo(Dlaporan.Fr1,'Lpenjualantunai').Text := LpenjualanTunai.Caption;
           FMemo(Dlaporan.Fr1,'Lpenerimaanpiutang').Text := LpembayaranPiutang.Caption;
           FMemo(Dlaporan.Fr1,'Ltotalmasuk').Text := LtotalUangMasuk.Caption;
           FMemo(Dlaporan.Fr1,'Lpembelian').Text  := LtotalPembelian.Caption;
           FMemo(Dlaporan.Fr1,'Ltotalpengeluaran').Text := LtotalPengeluaran.Caption;
           FMemo(Dlaporan.Fr1,'Ldisetorkan').Text  := ESetorKekasBesar.Text;
           FMemo(Dlaporan.Fr1,'Ltotaluangkasir').Text := ETinggalDIkasir.Text;
           Dlaporan.Fr1.PrepareReport();
           Dlaporan.Fr1.Print;
         Close;
         finally
           ls.Free;
         end;
      end;



end;

procedure TFtutupKasir.btnTutupFormClick(Sender: TObject);
begin
    Close;
end;

procedure TFtutupKasir.cbKasirChange(Sender: TObject);
begin
  HitungUang;
end;

procedure TFtutupKasir.dt1Change(Sender: TObject);
begin
  OpenTable(dm.Q1,['tgl'],'tutupkasir WHERE tgl="'+Tanggal(dt1.Date)+'"');

  btnTutup.Enabled := dm.Q1.IsEmpty;
  HitungUang;
end;

procedure TFtutupKasir.ESetorKekasBesarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    TotalUangKasir , TotalDisetor , Sisa : Real;
begin
    TotalUangKasir := StrToFloatDef(nilai(LtotalUangKasir.Caption),0);
    TotalDisetor   := ESetorKekasBesar.AsFLoat;

    if (TotalUangKasir <> 0) and (TotalDisetor <> 0) then  begin
        Sisa           := TotalUangKasir - TotalDisetor;
        ETinggalDIkasir.Text := Format('%.0n',[Sisa]);
    end else Error('Tidak ada data yg diproses');


end;

procedure TFtutupKasir.FormCreate(Sender: TObject);
begin

  ESetorKekasBesar.isRupiah := True;
  LpenjualanTunai.Caption     := '0';
  LpembayaranPiutang.Caption  := '0';
  LtotalUangMasuk.Caption     := '0';
  LtotalPembelian.Caption     := '0';
  LtotalPengeluaran.Caption   := '0';
  Ldisetorkas.Caption         := '0';
end;

procedure TFtutupKasir.FormShow(Sender: TObject);
begin

  ExQry(dm.Q1,'SELECT iduser,username FROM m_user',true);

  cbKasir.Items.Clear;
  while not dm.Q1.Eof do begin

    cbKasir.AddItem(GetVal(dm.Q1,'username'),TObject(GetValInt(dm.Q1,'iduser')));
    dm.Q1.Next;
  end;
  cbKasir.ItemIndex := cbKasir.Items.IndexOfObject(TObject(StrToInt(setIdUser)));
  dt1.Date := now;

  ExQry(dm.Q1,'SELECT level FROM m_user where iduser="'+setIdUser+'"',True);

  cbKasir.Enabled := (GetVal(dm.Q1,'level') = 'ADMIN') or (GetVal(dm.Q1,'level') = 'SUPER ADMIN');


  ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
   ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);

    cbKas.Items.Clear;
    while not dm.Q2.Eof do begin
      cbKas.Items.Add(
      GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
      GetVal(dm.Q2,'namaakunperkiraan'));
      dm.Q2.Next;
    end;
    cbKas.ItemIndex := 0;
    LtotalPenjualan.Caption   := '0';
    LpenjualanCash.Caption    := '0';
    LpenjualanKredit.Caption  := '0';
    Ltransfer.Caption         := '0';
    Ltunai.Caption            := '0';
    LsaldoAwal.Caption        := '0';
    LpenjualanTunai.Caption   := '0';
    LtotalUangMasuk.Caption   := '0';
    LtotalPembelian.Caption   := '0';
    LtotalPengeluaran.Caption := '0';
    ESetorKekasBesar.Text     := '0';
    ETinggalDIkasir.Text      := '0';
    OpenTable(dm.Q1,['tgl'],'tutupkasir WHERE tgl="'+Tanggal(dt1.Date)+'"');

    btnTutup.Enabled := dm.Q1.IsEmpty;
    HitungUang;
end;

function TFtutupKasir.GetIdkasir(cmb: TComboBox): String;
begin
  Result := Inttostr(integer(cmb.Items.Objects[cmb.ItemIndex]));
end;

procedure TFtutupKasir.HitungUang;
var
  SaldoTambahan   : Real;
  tgl1            : TDate;
  TOtalUangKasir  : Real;
  DisetorKebank   : Real;
  SaldoAwal       : Real;
  SaldoAkhir      : Real;
  TotalPembelian  : Real;
  TotalPengeluaran : Real;
  TotalPembayaranPiutang : Real;
  PemasukanTunai  : Real;
  SaldoKasirSebelumnya : Real;
  iduser           : string;

  PemasukanPeruser : Real;
  PengeluaranPerUser : Real;
  PembayaranHutang : Real;
begin
  tgl1 := EncodeDate(YearOf(dt1.Date),MonthOf(dt1.Date),1);

  if cbKasir.ItemIndex = 0 then
     iduser           :='' else
     iduser           := ' AND iduser='+GetIdkasir(cbKasir)+' ';
  ExQry(dm.Q1,'SELECT                            '+
              '      tgljual,                  '+
              '      SUM(                        '+
              '        CASE                      '+
              '          WHEN pembayaran = 0   '+
              '          THEN grandtotal       '+
              '          ELSE 0                  '+
              '        END                       '+
              '      ) AS totalcash,             '+
              '      SUM(                        '+
              '        CASE                      '+
              '          WHEN pembayaran = 1   '+
              '          THEN grandtotal       '+
              '          ELSE 0                  '+
              '        END                       '+
              '      ) AS totalkredit,           '+
              '      SUM(                        '+
              '        CASE                      '+
              '          WHEN (pembayaran = 0) '+
              '          THEN grandtotal - nontunai      '+
              '          ELSE 0  '+
              '        END                       '+
              '      ) AS totaltunai,            '+
              '      SUM(                        '+
              '        CASE                      '+
              '          WHEN (pembayaran = 0) '+
              '          AND (nontunai > 0)    '+
              '          THEN nontunai         '+
              '          ELSE 0                  '+
              '        END                       '+
              '      ) AS totaltransfer          '+
              '    FROM                          '+
              '      penjualan   WHERE tgljual="'+Tanggal(dt1.Date)+'" '+iduser+' '+
              ' ',True);


        ExQry(dm.Q2,'SELECT saldo from saldoawalkasir WHERE tgl="'+Tanggal(dt1.Date)+'" '+
        ' AND iduser="'+GetIdkasir(cbKasir)+'"',True);

        SaldoAwal := GetValF(dm.Q2,'saldo');
        
        LpenjualanCash.Caption    := GetValR(dm.Q1,'totalcash');
        LpenjualanKredit.Caption  := GetValR(dm.Q1,'totalkredit');
        LtotalPenjualan.Caption   := Format('%.0n',[GetValF(dm.Q1,'totalcash')+GetValF(dm.Q1,'totalkredit')]);
        Ltunai.Caption            := GetValR(dm.Q1,'totaltunai');
        Ltransfer.Caption         := GetValR(dm.Q1,'totaltransfer');
        LpenjualanTunai.Caption   := Ltunai.Caption;
        PemasukanTunai            := GetValF(dm.Q1,'totaltunai');


        ExQry(dm.Q5,' SELECT SUM(ROUND(s_awal+debet-kredit)) as saldomasuk FROM saldoakun '+
                    ' WHERE tgl="'+Tanggal(dt1.Date)+'" AND noakun="101.003" AND nobukti LIKE "JM%"',True);

        //------------------------------ Total Pengeluaran Biaya ----------------------------------------
         ExQry(dm.Q2,' SELECT SUM(ROUND(kredit)) as totalpengeluaran FROM saldoakun WHERE tgl="'+Tanggal(dt1.Date)+'" '+
                    ' AND noakun="101.003" AND keterangan NOT LIKE "PEMBELIAN%" '+
                    ' AND keterangan not LIKE "Saldo Awal Kasir%" '+
                    ' AND keterangan NOT LIKE "Tutup Kasir%" '+iduser+' AND keterangan NOT LIKE "PEMBAYARAN HUTANG%" '+
                    ' ',True);
        TotalPengeluaran          := GetValF(dm.Q2,'totalpengeluaran');


        //------------------------------- Total Pmbelian -------------------------------------------------
        ExQry(dm.Q2,' SELECT SUM(ROUND(kredit)) as totalpembelian FROM saldoakun WHERE tgl="'+Tanggal(dt1.Date)+'" '+
                    ' AND noakun="101.003" AND (keterangan LIKE "PEMBELIAN%" '+
                    ' OR keterangan LIKE "PEMBAYARAN HUTANG%" )'+iduser+' ',True);
        TotalPembelian            := GetValF(dm.Q2,'totalpembelian');

        //------------------------------- Total penerimaan piutang --------------------------------------

        ExQry(dm.Q2,' SELECT SUM(ROUND(debet)) as totalpembayaranpiutang FROM saldoakun WHERE tgl="'+Tanggal(dt1.Date)+'" '+
                    ' AND noakun="101.003" AND keterangan LIKE "PEMBAYARAN PIUTANG%" '+iduser+' ',True);
        TotalPembayaranPiutang := GetValF(dm.Q2,'totalpembayaranpiutang');

        //------------------------------- Disetor ke bang -----------------------------------------------

        ExQry(dm.Q2,' SELECT SUM(ROUND(kredit)) as disetorkebank FROM saldoakun WHERE tgl="'+Tanggal(dt1.Date)+'" '+
                    ' AND noakun="101.003" AND keterangan LIKE "Tutup Kasir%" '+iduser+' ',True);
        DisetorKebank := GetValF(dm.Q2,'disetorkebank');

        ExQry(dm.Q2,' SELECT SUM(ROUND(kredit)) as masukdarikasir FROM saldoakun WHERE tgl="'+Tanggal(dt1.Date)+'" '+
                    ' AND noakun="101.003" AND keterangan LIKE "Tutup Kasir%" AND iduser<>'+GetIdkasir(cbKasir)+' ',True);
        SaldoKasirSebelumnya := GetValF(dm.Q2,'masukdarikasir');


        SaldoTambahan             := 0;

        SaldoAwal                   := SaldoAwal;
        LsaldoAwal.Caption          := Format('%.0n',[SaldoAwal]);
        LpembayaranPiutang.Caption  := Format('%.0n',[TotalPembayaranPiutang]);
        LtotalUangMasuk.Caption     := Format('%.0n',[SaldoAwal + GetValF(dm.Q1,'totaltunai') +TotalPembayaranPiutang ]);
        LtotalPembelian.Caption     := Format('%.0n',[TotalPembelian]);
        LtotalPengeluaran.Caption   := Format('%.0n',[TotalPengeluaran]);
        Ldisetorkas.Caption         := Format('%.0n',[DisetorKebank]);

        TOtalUangKasir            := (((SaldoAwal)+GetValF(dm.Q1,'totaltunai')+SaldoTambahan + TotalPembayaranPiutang)
                                      - (TotalPembelian + TotalPengeluaran + DisetorKebank));


        LtotalUangKasir.Caption   := Format('%.0n',[TOtalUangKasir]);

end;


end.
