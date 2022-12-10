unit uMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore,dxNavBar, dxNavBarCollns, cxClasses,
  dxNavBarBase, Vcl.ImgList, cxPC, Vcl.ExtCtrls, dxDockControl, dxDockPanel, dxSkinsdxNavBarPainter,
  dxSkinsdxNavBarAccordionViewPainter, dxSkinOffice2016Colorful, dxSkinsForm,
  Vcl.ComCtrls, dxSkiniMaginary, dxSkinsdxStatusBarPainter, cxContainer, cxEdit,
  cxTextEdit, Vcl.StdCtrls, cxGroupBox, dxStatusBar, cxListView, uEngine,
  dxSkinOffice2010Blue,dateUtils, dxSkinSharp, dxSkinMoneyTwins, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,System.Win.Registry,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,Winapi.ActiveX,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxRibbonSkins, dxSkinsdxRibbonPainter,
  dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar, dxRibbon,System.IniFiles,
  dxGalleryControl,MyAccess, dxRibbonGallery, dxSkinChooserGallery,WbemScripting_TLB,
  cxProgressBar, dxSkinTheBezier, cxImageList;

type
  TFmain = class(TForm)
    img1: TcxImageList;
    img2: TcxImageList;
    dxSkinController1: TdxSkinController;
    img3: TcxImageList;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxMn1: TdxBarManager;
    dxGMn1Bar1: TdxBar;
    dxBtnLogin: TdxBarLargeButton;
    dxBtnLogInRibbon: TdxBarLargeButton;
    dxBtnSetting: TdxBarLargeButton;
    cxImageList1: TcxImageList;
    dxRibbon1Tab2: TdxRibbonTab;
    dxGMaster: TdxBar;
    dxBtnLokasi: TdxBarLargeButton;
    dxBtnKategori: TdxBarLargeButton;
    dxBtnSatuan: TdxBarLargeButton;
    dxBtnPelanggan: TdxBarLargeButton;
    dxBtnBarang: TdxBarLargeButton;
    dxBtnSales: TdxBarLargeButton;
    dxBtnSupplier: TdxBarLargeButton;
    dxBtnUser: TdxBarLargeButton;
    dxBtnKomputer: TdxBarLargeButton;
    dxBtnEdc: TdxBarLargeButton;
    dxRibbon1Tab3: TdxRibbonTab;
    dxGPembelian: TdxBar;
    dxGMn1Bar2: TdxBar;
    dxGMn1Bar3: TdxBar;
    dxGMn1Bar4: TdxBar;
    dxBtnPembelian: TdxBarLargeButton;
    dxBtnReturPembelian: TdxBarLargeButton;
    dxBtnPenjualan: TdxBarLargeButton;
    dxBtnReturPenjualan: TdxBarLargeButton;
    dxBtnDaftarHutang: TdxBarLargeButton;
    dxBtnPembayaranHutang: TdxBarLargeButton;
    dxBtnDaftarPiutang: TdxBarLargeButton;
    dxBtnPenerimaanPiutang: TdxBarLargeButton;
    dxRibbon1Tab4: TdxRibbonTab;
    dxGStokBarang: TdxBar;
    dxBtnStokBarang: TdxBarLargeButton;
    dxBtnKartuStok: TdxBarLargeButton;
    dxBtnInoutBarang: TdxBarLargeButton;
    dxBtnStokOpname: TdxBarLargeButton;
    dxBtnMutasiStok: TdxBarLargeButton;
    dxBtnPemakainBarang: TdxBarLargeButton;
    dxRibbon1Tab5: TdxRibbonTab;
    dxGMn1Bar5: TdxBar;
    dxBtnBukuBesar: TdxBarLargeButton;
    dxBtnJurnal: TdxBarLargeButton;
    dxBtnPengeluaranKas: TdxBarLargeButton;
    dxBtnPembayaranPajak: TdxBarLargeButton;
    dxBtn1: TdxBarLargeButton;
    dxGLaporanAkuntansi: TdxBar;
    dxBtnLapBukuBesar: TdxBarLargeButton;
    dxBtnLapJurnal: TdxBarLargeButton;
    dxBtnNeraca: TdxBarLargeButton;
    dxBtnLaporanLabaRugiBulan: TdxBarLargeButton;
    dxBtnLabaRugiTahun: TdxBarLargeButton;
    pg: TPanel;
    sbr1: TdxStatusBar;
    dxRibbon1Tab6: TdxRibbonTab;
    dxGMn1Bar6: TdxBar;
    dxGMn1Bar7: TdxBar;
    dxGMn1Bar8: TdxBar;
    dxGMn1Bar9: TdxBar;
    dxGMn1Bar10: TdxBar;
    dxGMn1Bar11: TdxBar;
    dxBtn2: TdxBarLargeButton;
    dxBtn3: TdxBarLargeButton;
    dxBtn4: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBtn5: TdxBarLargeButton;
    dxBtn6: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBtn7: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBtn8: TdxBarLargeButton;
    dxBtn9: TdxBarLargeButton;
    dxBtn10: TdxBarLargeButton;
    dxBtn11: TdxBarLargeButton;
    dxbrpmn1: TdxBarPopupMenu;
    dxbrbtn1: TdxBarButton;
    dxbrgrp1: TdxBarGroup;
    dxbrbtn2: TdxBarButton;
    dxGMn1Bar12: TdxBar;
    dxsknchsrglrytm1: TdxSkinChooserGalleryItem;
    dxbrbtn3: TdxBarButton;
    dxbrbtn5: TdxBarButton;
    dxbrbtn6: TdxBarButton;
    dxbrbtn7: TdxBarButton;
    dxbrbtn8: TdxBarButton;
    dxbrbtn10: TdxBarButton;
    dxbrbtn13: TdxBarButton;
    dxBtn12: TdxBarLargeButton;
    dxsknchsrglrytm2: TdxSkinChooserGalleryItem;
    dxbrbtn4: TdxBarButton;
    dxbrbtn9: TdxBarButton;
    dxbrbtn11: TdxBarButton;
    dxstsbrcntnrcntrlsbr1Container6: TdxStatusBarContainerControl;
    pb1: TcxProgressBar;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton6: TdxBarLargeButton;
    procedure navUserClick(Sender: TObject);
    procedure navSettingClick(Sender: TObject);
    procedure navBukuBesarClick(Sender: TObject);
    procedure navSupplierClick(Sender: TObject);
    procedure NavKategoriClick(Sender: TObject);
    procedure navMasterLokasiClick(Sender: TObject);
    procedure NavSatuan1Click(Sender: TObject);
    procedure navPelangganClick(Sender: TObject);
    procedure NavBarangClick(Sender: TObject);
    procedure navPembelianBarangClick(Sender: TObject);
    procedure navDataPembelianClick(Sender: TObject);
    procedure navReturPembelianClick(Sender: TObject);
    procedure navDataReturPembelianClick(Sender: TObject);
    procedure navPersediaanBarangsubClick(Sender: TObject);
    procedure navDataPenjualanClick(Sender: TObject);
    procedure navReturPenjualanClick(Sender: TObject);
    procedure navDataReturPenjualanClick(Sender: TObject);
    procedure navDataPiutangClick(Sender: TObject);
    procedure navDataHutangClick(Sender: TObject);
    procedure navPembayaranHutangClick(Sender: TObject);
    procedure navBayarPiutangClick(Sender: TObject);
    procedure navKoreksiClick(Sender: TObject);
    procedure navMutasiStokClick(Sender: TObject);
    procedure navKartuStokClick(Sender: TObject);
    procedure navLapBarangClick(Sender: TObject);
    procedure navLapPelangganClick(Sender: TObject);
    procedure navPengeluaranKasClick(Sender: TObject);
    procedure navCetakJurnalMemorialClick(Sender: TObject);
    procedure navLapPenjualanClick(Sender: TObject);
    procedure navLapPembelianClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure navPoPembelianClick(Sender: TObject);
    procedure navDataPoPembelianClick(Sender: TObject);
    procedure navDataPenerimaanBarangClick(Sender: TObject);
    procedure navStokOpnameClick(Sender: TObject);
    procedure navMutasiBarangClick(Sender: TObject);
    procedure navLapPiutangClick(Sender: TObject);
    procedure navLapHutangClick(Sender: TObject);
    procedure navLapReturJualClick(Sender: TObject);
    procedure navLapReturBeliClick(Sender: TObject);
    procedure naviKomputerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure navivoucherClick(Sender: TObject);
    procedure navisalesClick(Sender: TObject);
    procedure naviSalesOrderClick(Sender: TObject);
    procedure naviStokAwalBulanClick(Sender: TObject);
    procedure naviDataSalesOrderClick(Sender: TObject);
    procedure navNeracaSaldoClick(Sender: TObject);
    procedure navLabaRugiClick(Sender: TObject);
    procedure navLapJurnalClick(Sender: TObject);
    procedure navLapBukuBesarClick(Sender: TObject);
    procedure navTutupBukuClick(Sender: TObject);
    procedure navSuratJalanClick(Sender: TObject);
    procedure navDataPelunasanHutangClick(Sender: TObject);
    procedure navDataPelunasanPiutangClick(Sender: TObject);
    procedure navLapPivotClick(Sender: TObject);
    procedure navBackupClick(Sender: TObject);
    procedure navRestoreClick(Sender: TObject);
    procedure navTutupTahunClick(Sender: TObject);
    procedure navPemakaianBarangClick(Sender: TObject);
    procedure navLaporanHarianClick(Sender: TObject);
    procedure navBar1Item1Click(Sender: TObject);
    procedure navDataMutasiBarangClick(Sender: TObject);
    procedure navRekapBarangTerujualClick(Sender: TObject);
    procedure navPoPenjualanClick(Sender: TObject);
    procedure navFIFOClick(Sender: TObject);
    procedure navRekapKasirClick(Sender: TObject);
    procedure navSaldoAwalClick(Sender: TObject);
    procedure dxBtnLoginClick(Sender: TObject);
    procedure dxBtnLogInRibbonClick(Sender: TObject);
    procedure dxBtnSettingClick(Sender: TObject);
    procedure dxBtnSupplierClick(Sender: TObject);
    procedure dxBtnLokasiClick(Sender: TObject);
    procedure dxBtnKategoriClick(Sender: TObject);
    procedure dxBtnSatuanClick(Sender: TObject);
    procedure dxBtnBarangClick(Sender: TObject);
    procedure dxBtnPelangganClick(Sender: TObject);
    procedure dxBtnUserClick(Sender: TObject);
    procedure dxBtnKomputerClick(Sender: TObject);
    procedure dxBtnSalesClick(Sender: TObject);
    procedure dxBtnEdcClick(Sender: TObject);
    procedure dxBtnPembelianClick(Sender: TObject);
    procedure dxBtnReturPembelianClick(Sender: TObject);
    procedure dxBtnPenjualanClick(Sender: TObject);
    procedure dxBtnReturPenjualanClick(Sender: TObject);
    procedure dxBtnDaftarHutangClick(Sender: TObject);
    procedure dxBtnPembayaranHutangClick(Sender: TObject);
    procedure dxBtnDaftarPiutangClick(Sender: TObject);
    procedure dxBtnPenerimaanPiutangClick(Sender: TObject);
    procedure dxBtnStokBarangClick(Sender: TObject);
    procedure dxBtnStokOpnameClick(Sender: TObject);
    procedure dxBtnMutasiStokClick(Sender: TObject);
    procedure dxBtnKartuStokClick(Sender: TObject);
    procedure dxBtnPemakainBarangClick(Sender: TObject);
    procedure dxBtnBukuBesarClick(Sender: TObject);
    procedure dxBtnJurnalClick(Sender: TObject);
    procedure dxBtnPengeluaranKasClick(Sender: TObject);
    procedure dxBtn1Click(Sender: TObject);
    procedure dxBtnLapBukuBesarClick(Sender: TObject);
    procedure dxBtnLapJurnalClick(Sender: TObject);
    procedure dxBtnNeracaClick(Sender: TObject);
    procedure dxBtnLaporanLabaRugiBulanClick(Sender: TObject);
    procedure dxBtn2Click(Sender: TObject);
    procedure dxBtn3Click(Sender: TObject);
    procedure dxBtn4Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBtn6Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBtn7Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBtnInoutBarangClick(Sender: TObject);
    procedure dxBtn8Click(Sender: TObject);
    procedure dxBtn9Click(Sender: TObject);
    procedure dxBtn10Click(Sender: TObject);
    procedure dxBtn11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxsknchsrglrytm2SkinChanged(Sender: TObject;
      const ASkinName: string);
    procedure dxbrbtn3Click(Sender: TObject);
    procedure dxbrbtn10Click(Sender: TObject);
    procedure dxbrbtn5Click(Sender: TObject);
    procedure dxbrbtn6Click(Sender: TObject);
    procedure dxbrbtn8Click(Sender: TObject);
    procedure dxbrbtn4Click(Sender: TObject);
    procedure dxbrbtn7Click(Sender: TObject);
    procedure dxbrbtn9Click(Sender: TObject);
    procedure dxbrbtn11Click(Sender: TObject);
    procedure dxbrbtn13Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
  private
    procedure unVisible;

    function SetSkin:string;
    procedure GetMotherBoardSerial(var isRsult :TStrings);

    { Private declarations }
  public
    procedure LoadForm(asForm : TFormClass);
    procedure CloseForm;
    procedure UpdateStok;
    function Active:Boolean;
    procedure SaveSkin(aSkinName:string);

    { Public declarations }
  end;

  type
    TTtutupBuku = class(TTHread)
      private
        FQ1   : TMyQuery;
        FQ2   : TMyQuery;
        FQ3   : TMyQuery;
        FQ4   : TMyQuery;
        FQ5   : TMyQuery;
        FQ6   : TMyQuery;
        FPBar : TcxProgressBar;
        function GetNoAkun(id:String):String;
        procedure ExeTutupBuku;
        protected
    procedure Execute; override;
          public

        Constructor Create(AQ1:TMyQUery;AQ2:TMyQUery;AQ3:TMyQUery;AQ4:TMyQUery; AQ5:TMyQUery;AQ6:TMyQUery;
                               aProgress:TcxProgressBar);
        property Q1: TMyQUery Read FQ1 write FQ1;
        property Q2: TMyQUery Read FQ2 write FQ2;
        property Q3: TMyQUery Read FQ3 write FQ3;
        property Progress : TcxProgressBar Read FPBar write FPBar;
        destructor Destroy;



    end;

var
  Fmain: TFmain;
  aForm : TForm;

implementation

{$R *.dfm}

uses  uDataUser,    Uprofile,
  uMasterBukuBesar, uSupplier, uDataKategori, uDataLokasi, uDataSatuan,
  udataPelanggan, uDataBarang, uPembelian, uComCtrl, uDataPembelian,
   uDataReturPembelian, uDataStokBarang, uPenjualan,
  uDataPenjualan, uDataReturPenjualan, uDataPiutang,
  uDataHutang, uBayarHutang, UBayarPiutang, uStokOpname, uMutasiBarang,
  uKartuStok, uLaporanBarang, UlapPelanggan, uPengeluaranBiaya, uJurnalMemorial,
  uLapPenjualan, uLapPembelian, uSetingLimitasi, UPOPembelian, uDataOrderPembelian, uDataPenerimaanBarang,
  uDataTransaksiStokOpname, uDataMutasiBarang, uLaporanHutang, uLapPiutang,
  uLapReturPenjualan, uLapReturPembelian, uFormDashBoard, uDataKomputerKasir,
  uDlaporan, uLogin, uDataVoucher, uDataSales, uSalesOrder, uStokAwalBulan,
  uDataSalesOrder, uProgress, uReturBeliNew, uReturPenjualannew,
  uPembayaranHutangNew, uPembayaranPiutangNew, uLapNeraca, uLaporanLabaRugi,
  uLapJurnalTransaksi, uLapBukuBesar, uTutupBuku, uDataSuratJalan,
  uDataPelunasanHutang, uDataPelunasanPiutang, uLapPivot, Ubackup,
  UrestoreDatabase, usetHarga, uTutupTahun, uDataPemakainBarang, uLph,
  uMasterEDC, uRekapitulasiBarangTerjual, uDataPoPenjualan, uLaporanFIFO,
  uPoPembelianBarangBaru, uTutupKasir, uSetSaldoAwal,
  uLaporanInOutBarang, uStokLimitPersupplier, uLapMarginBarang,
  uLaporanPenjualanPerKategori, udm, uNewLaporanPenjualan, uLapPenjualanKasir,
  uLapPenjualanBarangPelanggan, uLapLabaPelanggan, uLapOmsetBulan,
  uLapPenjualanBarangPerSupplier, uLapRekapitulasiPenjualanBarangPelanggan,
  uLapFrekuensiBarang, uLaporanCigaretNonCigaret, uMigration, uLapProfitHarian,
  uSetoranKasir;

{ TFmain }


function setSerial(s: String): String;

var
  K:Array [0..11] of Char;
  mKey:String;

  i:byte;
begin
  mKey:='';
  strPCopy(K,pChar(UpperCase(S)));
  for i := 0 to (Length(S)-1) do
  begin
    Mkey:= mKey + chr(WORD(K[i]))+inttostr(i+9);
  end;
  Result:=mKey;

end;
function bacareg(regkey, fieldtesk: string): string;
var
   reg:TRegistry;
begin
  try
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
    if reg.OpenKey(regkey,true)then
      begin
        if reg.ValueExists(fieldtesk)then
          result:=reg.ReadString(fieldtesk);
        end;
  finally
    reg.Free;
  end;
end;

Function ekripsi(Const S:String):String;

var
  i:byte;
  t:String;
begin
  for i := 1 to length(s) do
  begin
    t:=t+chr(ord(s[i])+64);
  end;
  Result:=t;
end;

Function deskripsi(Const S:String):String;
var
  i:byte;
  t:String;
begin
  for i := 1 to length(s) do
  begin
    t:=t+chr(ord(s[i])-64);
  end;
  Result:=t;
end;

function TFmain.Active: Boolean;
var
  FileReg : TStringList;
begin
  if FileExists(ExtractFilePath(ParamStr(0))+'cfn.sav') then begin
     FileReg := TStringList.Create;

     try
       FileReg.LoadFromFile(ExtractFilePath(ParamStr(0))+'cfn.sav');
       FileReg.NameValueSeparator := ':';

       if ekripsi(FileReg.Values['Serial'])  = bacareg('SOFTWARE\Anaba Software\active','Sn') then
          Result := True
       else begin
         Result := False;

       end;
     finally
       FileReg.Free;
     end;
  end else begin
    Result := False;
  end;

end;

procedure TFmain.CloseForm;
var
  frm : TComponent;

begin
  frm := pg.FindComponent(aFOrm.Name);
  if (frm <> nil) then
  FreeAndNil(frm);
end;

procedure TFmain.dxBarButton1Click(Sender: TObject);
begin
  LoadForm(TFLapProfitHarian);
end;

procedure TFmain.dxBarLargeButton1Click(Sender: TObject);
begin
  LoadForm(TFlapReturPembelian);
end;

procedure TFmain.dxBarLargeButton2Click(Sender: TObject);
begin
  if not Assigned(FlapPivot) then
  Application.CreateForm(TFlapPivot, FlapPivot);
  FlapPivot.ShowModal;
end;

procedure TFmain.dxBarLargeButton4Click(Sender: TObject);
begin
  LoadForm(TFlapPiutang);
end;

procedure TFmain.dxBarLargeButton5Click(Sender: TObject);
begin
  FMigrationData.ShowModal;
end;

procedure TFmain.dxBarLargeButton6Click(Sender: TObject);
begin
  LoadForm(TFSetoranKasir)
end;

procedure TFmain.dxbrbtn10Click(Sender: TObject);
begin
  LoadForm(TFLapPenjualanKasir);
end;

procedure TFmain.dxbrbtn11Click(Sender: TObject);
begin
  LoadForm(TFLapFrekuensiBarang);
end;

procedure TFmain.dxbrbtn13Click(Sender: TObject);
begin
  LoadForm(TFLaporanCigaretNonCigaret);
end;

procedure TFmain.dxbrbtn3Click(Sender: TObject);
begin
  LoadForm(TFNewLaporanPenjualan);
end;

procedure TFmain.dxbrbtn4Click(Sender: TObject);
begin
  LoadForm(TFLapOmsetBulan);
end;

procedure TFmain.dxbrbtn5Click(Sender: TObject);
begin
  LoadForm(TFLapPenjualanBarangPelanggan);
end;

procedure TFmain.dxbrbtn6Click(Sender: TObject);
begin
  LoadForm(TFLapPenjualanKategori);
end;

procedure TFmain.dxbrbtn7Click(Sender: TObject);
begin
  LoadForm(TFLapPenjualanBarangPerSupplier);
end;

procedure TFmain.dxbrbtn8Click(Sender: TObject);
begin
  LoadForm(TFLaporanLabaPelanggan);
end;

procedure TFmain.dxbrbtn9Click(Sender: TObject);
begin
  LoadForm(TFlapRekapitulasiBarangPelanggan);
end;

procedure TFmain.dxBtn10Click(Sender: TObject);
begin
  LoadForm(TFLapMarginBarang);
end;

procedure TFmain.dxBtn11Click(Sender: TObject);
begin
    LoadForm(TFLapPenjualanKategori);
end;

procedure TFmain.dxBtn1Click(Sender: TObject);
begin
  FtutupBUku.isAuto     := False;
  FtutupBUku.dtp1.Date  := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  FtutupBUku.sHOWMODAL;
end;

procedure TFmain.dxBtn2Click(Sender: TObject);
begin
  LoadForm(TFlaporanBarang);
end;

procedure TFmain.dxBtn3Click(Sender: TObject);
begin
  LoadForm(TFlapPelanggan);
end;

procedure TFmain.dxBtn4Click(Sender: TObject);
begin
  LoadForm(TFlapPembelian);
end;

procedure TFmain.dxBtn6Click(Sender: TObject);
begin
  LoadForm(TFlapReturPenjualan);
end;

procedure TFmain.dxBtn7Click(Sender: TObject);
begin
  LoadForm(TFlapHutang);
end;

procedure TFmain.dxBtn8Click(Sender: TObject);
begin

  LoadForm(TFStokLimtiPerSupplier);
end;

procedure TFmain.dxBtn9Click(Sender: TObject);
begin
  LoadForm(TFdataOrderPembelian);
end;

procedure TFmain.dxBtnBarangClick(Sender: TObject);
begin
    LoadForm(TFdatabarang);
end;

procedure TFmain.dxBtnBukuBesarClick(Sender: TObject);
begin
  LoadForm(TFmasterBukubesar);
end;

procedure TFmain.dxBtnDaftarHutangClick(Sender: TObject);
begin
  LoadForm(TFdataHutang);
end;

procedure TFmain.dxBtnDaftarPiutangClick(Sender: TObject);
begin
  LoadForm(TFdataPiutang);
end;

procedure TFmain.dxBtnEdcClick(Sender: TObject);
begin
  LoadForm(TFmasterEDC);
end;

procedure TFmain.dxBtnInoutBarangClick(Sender: TObject);
begin
  LoadForm(TFlaporanInoutBarang);
end;

procedure TFmain.dxBtnJurnalClick(Sender: TObject);
begin
  LoadForm(TFJurnalMemorial);
end;

procedure TFmain.dxBtnKartuStokClick(Sender: TObject);
begin
  LoadForm(TFkartuStok);
end;

procedure TFmain.dxBtnKategoriClick(Sender: TObject);
begin
    LoadForm(TFDataKategori);
end;

procedure TFmain.dxBtnKomputerClick(Sender: TObject);
begin
  LoadForm(TFdataMasterKomputer);
end;

procedure TFmain.dxBtnLapBukuBesarClick(Sender: TObject);
begin
  LoadForm(TFlapBukuBesar);
end;

procedure TFmain.dxBtnLapJurnalClick(Sender: TObject);
begin
  LoadForm(TFlapJurnalTransaksi);
end;

procedure TFmain.dxBtnLaporanLabaRugiBulanClick(Sender: TObject);
begin
  LoadForm(TFlapLabaRugi);
end;

procedure TFmain.dxBtnLoginClick(Sender: TObject);
begin
  if pg.ComponentCount > 0 then
     pg.Components[0].Free;
end;

procedure TFmain.dxBtnLogInRibbonClick(Sender: TObject);
begin
  Flogin.Login;
end;

procedure TFmain.dxBtnLokasiClick(Sender: TObject);
begin
    LoadForm(TFdataLokasi);
end;

procedure TFmain.dxBtnMutasiStokClick(Sender: TObject);
begin
  LoadForm(TFMutasiBarang);
  FMutasiBarang.TampilAwal;
end;

procedure TFmain.dxBtnNeracaClick(Sender: TObject);
begin
  LoadForm(TFlapNeraca);
end;

procedure TFmain.dxBtnPelangganClick(Sender: TObject);
begin
  LoadForm(TFdataPelanggan);
end;

procedure TFmain.dxBtnPemakainBarangClick(Sender: TObject);
begin
  LoadForm(TFdataPemakainBarang);
end;

procedure TFmain.dxBtnPembayaranHutangClick(Sender: TObject);
begin
  LoadForm(TFdataPelunasanHutang);
end;

procedure TFmain.dxBtnPembelianClick(Sender: TObject);
begin
  LoadForm(TFdataPembelian);
end;

procedure TFmain.dxBtnPenerimaanPiutangClick(Sender: TObject);
begin
  LoadForm(TFdataPelunasanPiutang);

end;

procedure TFmain.dxBtnPengeluaranKasClick(Sender: TObject);
begin
  LoadForm(TFpengeluaranBiaya);
end;

procedure TFmain.dxBtnPenjualanClick(Sender: TObject);
begin
  LoadForm(TFdataPenjualan);
end;

procedure TFmain.dxBtnReturPembelianClick(Sender: TObject);
begin
  LoadForm(TFdataReturPembelian);
end;

procedure TFmain.dxBtnReturPenjualanClick(Sender: TObject);
begin
  LoadForm(TFdataReturPenjualan);
end;

procedure TFmain.dxBtnSalesClick(Sender: TObject);
begin
  LoadForm(TFdataSales);
end;

procedure TFmain.dxBtnSatuanClick(Sender: TObject);
begin
  LoadForm(TFdataSatuan);
end;

procedure TFmain.dxBtnSettingClick(Sender: TObject);
begin
  if not Assigned(Fprofile) then
     Application.CreateForm(TFprofile, Fprofile);
  Fprofile.ShowModal;
end;

procedure TFmain.dxBtnStokBarangClick(Sender: TObject);
begin
  LoadForm(TFdataStokBarang);
end;

procedure TFmain.dxBtnStokOpnameClick(Sender: TObject);
begin
  LoadForm(TFStokOpname);
  FStokOpname.TampilanAwal;
end;

procedure TFmain.dxBtnSupplierClick(Sender: TObject);
begin
    LoadForm(TFdataSupplier);
end;

procedure TFmain.dxBtnUserClick(Sender: TObject);
begin
  LoadForm(TFDataUser);
end;

procedure TFmain.dxsknchsrglrytm2SkinChanged(Sender: TObject;
  const ASkinName: string);
begin
  Fmain.dxSkinController1.SkinName := ASkinName;
  Fmain.dxRibbon1.ColorSchemeName  := ASkinName;
  Fmain.SaveSkin(ASkinName);
end;

procedure TFmain.FormCreate(Sender: TObject);
var
  isString : TStrings;
  Serial1,Serial2,SerialNumber, xText ,S1,S2,S3,S4,SetNumber  : String;
  i   : integer;
  jml : Integer;

begin
  Fmain := Self;
  dxSkinController1.SkinName := SetSkin;
  dxRibbon1.ColorSchemeName  := SetSkin;

  isString := TStringList.Create;
  try
    CoInitialize(nil);
    GetMotherBoardSerial(isString);
    Serial1 :=  'A90'+isString[0]+'NOB';
    Serial2 :=  isString[1];
    CoUninitialize;
  finally
     isString.Free;
    CoUninitialize;
  end;

  SerialNumber  := CopY(Serial1,2,11)+Copy(Serial2,2,4)+'240989';

  if Length(SerialNumber) < 14 then
  begin
     jml := 14 - Length(SerialNumber);

     for i := 1 to jml do
       SerialNumber := SerialNumber + '0';
  end else if Length(SerialNumber) > 14 then
       SerialNumber :=  Copy(SerialNumber,1,14);


  if Length(SerialNumber)<14 then
   Begin
    Application.MessageBox('Comp ID belum lengkap!!','',MB_OK)
   end else
      Begin
       xText := Copy(SerialNumber,3,10);
        for i := 1 to Length(SetSerial(xText)) do
         begin
           if i<5 then S1:=S1+SetSerial(xText)[i];
           if (i<9) and (i>4) then S2:=S2+SetSerial(xText)[i];
           if (i<13) and (i>8)  then S3:=S3+SetSerial(xText)[i];
           if (i<17) and (i>12)  then S4:=S4+SetSerial(xText)[i];
         end;
   end;

   SetNumber:= S1 + S2 + S3 + S4;

  With TRegistry.Create Do
  Try
    RootKey := HKEY_CURRENT_USER;
    OPenKey('\SOFTWARE',True);
    CreateKey('Anaba Software\active');
    try
      RootKey:=HKEY_CURRENT_USER;
      OpenKey('\SOFTWARE\Anaba Software\active',True);
      WriteString('Sn',ekripsi(SetNumber));
    Except
      Showmessage('Unable Create Key');
    end;
    CloseKey;
  Finally
    Free;
  End;


end;

procedure TFmain.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = 71) and (Shift = [ssCtrl]) then
  begin
    FsetingLImitasi.Show;
  end;
end;

procedure TFmain.FormShow(Sender: TObject);

begin

  dm.Qprofil.Active := True;

  ExQry(dm.Q1,'SELECT MONTH(tgl) from kartustok WHERE month(tgl)="'+IntToStr(MonthOf(Now))+'" '+
  ' AND Year(tgl)="'+intToStr(YearOf(now))+'" LIMIT 1',True);

  if dm.Q1.IsEmpty then begin
      UpdateStok;
      //TTtutupBuku.Create(dm.Q1,dm.Q2,dm.Q3,dm.Q4,dm.Q5,dm.Q6,pb1);

  end;

 { if dm.Qprofil.FieldByName('nama').AsString <> 'TOKO DEMO' then
     Application.Terminate;  }


 { ExQry(dm.Q1,'SELECT Count(*) FROM penjualan',True);
  if dm.Q1.Fields[0].AsInteger >= 100 then
     Application.Terminate;    }

 { ExQry(Dlaporan.Qstoklimit,' SELECT                                            '+
                              '      b.kodebarang,b.namabarang,k.namakategori,    '+
                              '      b.stokmin,b.warningiflimit as "PERINGATAN",   '+
                              '      c.kodebarang,c.stok                          '+
                              '    FROM                                           '+
                              '      barang b left join kategori                  '+
                              '      k on k.idkategori=b.idkategori               '+
                              '      LEFT JOIN (SELECT kodebarang,              '+
                              '     SUM(saldoawal + masuk - keluar) as stok FROM kartustok '+
                              '     WHERE MONTH(tgl)='+intToStr(MonthOf(now))+' '+
                              '     AND YEAR(tgl)='+IntToStr(YearOf(Now))+' GROUP by kodebarang) c '+
                              '     ON c.kodebarang=b.kodebarang                    '+
                              '        WHERE b.warningiflimit=True                  '+
                              '     AND c.stok <= b.stokmin  ',True);

  LoadForm(TFFormDashBoard);
  OpenTable(dm.Q1,['tgltempo'],'piutang WHERE tgltempo="'+Tanggal(now)+'"');
  OpenTable(dm.Q2,['tgltempo'],'hutang WHERE tgltempo="'+Tanggal(now)+'"');
  if (dm.Q1.IsEmpty = False) or (dm.Q2.IsEmpty = False) or (Dlaporan.Qstoklimit.IsEmpty = False) then
     LoadForm(TFFormDashBoard);     }




end;


procedure TFmain.GetMotherBoardSerial(var isRsult: TStrings);
var
  WMIServices : ISWbemServices;
  Root        : ISWbemObjectSet;
  Item        : Variant;
begin
    WMIServices := CoSWbemLocator.Create.ConnectServer('localhost', 'root\cimv2','', '', '', '', 0, nil);
    Root        := WMIServices.ExecQuery('Select product,SerialNumber From Win32_BaseBoard','WQL', 0, nil);
    Item        :=  Root.ItemIndex(0);
    isRsult.Add(VarToStr(Item.Product));
    isRsult.Add(VarToStr(Item.SerialNumber));
end;



procedure TFmain.LoadForm(asForm: TFormClass);
begin
  if  Assigned(aForm) then
      CloseForm;
      Aform := asForm.Create(pg);
  with aForm do
    begin
       Align := AlClient;
       BorderStyle := bsNOne;
       Position := poOwnerFormCenter ;
       Parent := pg;
       visible := True;


    end;
end;

procedure TFmain.navBackupClick(Sender: TObject);
begin
  Fbackupdatabase.Show;
end;

procedure TFmain.navBar1Item1Click(Sender: TObject);
begin
  LoadForm(TFmasterEDC);
end;

procedure TFmain.navDataPiutangClick(Sender: TObject);
begin
  LoadForm(TFdataPiutang);
end;

procedure TFmain.navDataHutangClick(Sender: TObject);
begin
  LoadForm(TFdataHutang);
end;

procedure TFmain.navDataMutasiBarangClick(Sender: TObject);
begin
  LoadForm(TFdataMutasiBarang);
end;

procedure TFmain.navPemakaianBarangClick(Sender: TObject);
begin
  LoadForm(TFdataPemakainBarang);
end;

procedure TFmain.navPembayaranHutangClick(Sender: TObject);
begin
  LoadForm(TFbayarHutang);
  FbayarHutang.TampilanAwal;
end;

procedure TFmain.navBayarPiutangClick(Sender: TObject);
begin
  LoadForm(TFbayarPiutang);
  FbayarPiutang.TampilanAwal;
end;

procedure TFmain.NavBarangClick(Sender: TObject);
begin
  LoadForm(TFdatabarang);
end;

procedure TFmain.navMutasiStokClick(Sender: TObject);
begin

  LoadForm(TFMutasiBarang);
  FMutasiBarang.TampilAwal;
end;

procedure TFmain.navNeracaSaldoClick(Sender: TObject);
begin
  LoadForm(TFlapNeraca);
end;

procedure TFmain.navDataReturPembelianClick(Sender: TObject);
begin
  LoadForm(TFdataReturPembelian);
end;

procedure TFmain.navBukuBesarClick(Sender: TObject);
begin
  LoadForm(TFmasterBukubesar);
end;

procedure TFmain.navCetakJurnalMemorialClick(Sender: TObject);
begin

  LoadForm(TFJurnalMemorial);
end;

procedure TFmain.navLapPembelianClick(Sender: TObject);
begin
  LoadForm(TFlapPembelian);
end;

procedure TFmain.navLapPenjualanClick(Sender: TObject);
begin
 LoadForm(TFlapPenjualan);
end;

procedure TFmain.navLapReturJualClick(Sender: TObject);
begin
  LoadForm(TFlapReturPenjualan);

end;

procedure TFmain.navLapReturBeliClick(Sender: TObject);
begin
  LoadForm(TFlapReturPembelian);
end;

procedure TFmain.navPoPembelianClick(Sender: TObject);
begin
  FpoPembelianBarang.TampilAwal;
  FpoPembelianBarang.ShowModal;
end;

procedure TFmain.navPoPenjualanClick(Sender: TObject);
begin
  LoadForm(TFDataPoPenjualan);
end;

procedure TFmain.navDataPoPembelianClick(Sender: TObject);
begin
  LoadForm(TFdataOrderPembelian);
end;

procedure TFmain.navStokOpnameClick(Sender: TObject);
begin
  LoadForm(TFdataStokOpname);
end;

procedure TFmain.navMutasiBarangClick(Sender: TObject);
begin
  LoadForm(TFdataMutasiBarang);
end;

procedure TFmain.navLabaRugiClick(Sender: TObject);
begin
  LoadForm(TFlapLabaRugi);
end;

procedure TFmain.navLapBarangClick(Sender: TObject);
begin
  LoadForm(TFlaporanBarang);
end;

procedure TFmain.navLapBukuBesarClick(Sender: TObject);
begin
  LoadForm(TFlapBukuBesar);
end;

procedure TFmain.navLapPelangganClick(Sender: TObject);
begin
  LoadForm(TFlapPelanggan);
end;

procedure TFmain.navLapPiutangClick(Sender: TObject);
begin
  LoadForm(TFlapPiutang);
end;

procedure TFmain.navLapPivotClick(Sender: TObject);
begin
  FlapPivot.ShowModal;
end;

procedure TFmain.navLapHutangClick(Sender: TObject);
begin
  LoadForm(TFlapHutang);
end;

procedure TFmain.navLapJurnalClick(Sender: TObject);
begin
  LoadForm(TFlapJurnalTransaksi);
end;

procedure TFmain.navLaporanHarianClick(Sender: TObject);
begin
  LoadForm(TFLPH);
end;

procedure TFmain.navDataPenerimaanBarangClick(Sender: TObject);
begin
  LoadForm(TFDataPenerimaanBarang);
end;

procedure TFmain.naviDataSalesOrderClick(Sender: TObject);
begin
  LoadForm(TFdataSalesOrder);
end;

procedure TFmain.naviKomputerClick(Sender: TObject);
begin
  LoadForm(TFdataMasterKomputer);
end;

procedure TFmain.navisalesClick(Sender: TObject);
begin
  LoadForm(TFdataSales);
end;

procedure TFmain.naviSalesOrderClick(Sender: TObject);
begin
  LoadForm(TFsalesOrder);
  FsalesOrder.TampilAwal;
end;

procedure TFmain.naviStokAwalBulanClick(Sender: TObject);
begin
  LoadForm(TFprosesStokAwal);
end;

procedure TFmain.navivoucherClick(Sender: TObject);
begin
  LoadForm(TFDataVoucher);
end;

procedure TFmain.navKartuStokClick(Sender: TObject);
begin
  LoadForm(TFkartuStok);
end;

procedure TFmain.navReturPenjualanClick(Sender: TObject);
begin
  LoadForm(TFreturJualNew);
  FreturJualNew.TampilAwal;
end;

procedure TFmain.navSaldoAwalClick(Sender: TObject);
begin
  FSaldoAwal.ShowModal;
end;

procedure TFmain.navDataPenjualanClick(Sender: TObject);
begin
  LoadForm(TFdataPenjualan);
end;

procedure TFmain.NavKategoriClick(Sender: TObject);
begin
  LoadForm(TFDataKategori);
end;

procedure TFmain.navKoreksiClick(Sender: TObject);
begin
  LoadForm(TFStokOpname);
  FStokOpname.TampilanAwal;
end;

procedure TFmain.navDataPelunasanHutangClick(Sender: TObject);
begin
  LoadForm(TFdataPelunasanHutang);
end;

procedure TFmain.navDataPelunasanPiutangClick(Sender: TObject);
begin
     LoadForm(TFdataPelunasanPiutang);
end;

procedure TFmain.navDataPembelianClick(Sender: TObject);
begin
  LoadForm(TFdataPembelian);
end;

procedure TFmain.navMasterLokasiClick(Sender: TObject);
begin
  LoadForm(TFdataLokasi);
end;

procedure TFmain.navRekapBarangTerujualClick(Sender: TObject);
begin
  LoadForm(TFrekapitulasiBarangTerjual);
end;

procedure TFmain.navRekapKasirClick(Sender: TObject);
begin
  FtutupKasir.ShowModal;
end;

procedure TFmain.navRestoreClick(Sender: TObject);
begin
  FRestoreDatabase.Show;
end;

procedure TFmain.navReturPembelianClick(Sender: TObject);
begin
  Freturbelinew.TampilAwal;
  Freturbelinew.ShowModal;
end;

procedure TFmain.navPelangganClick(Sender: TObject);
begin

  LoadForm(TFdataPelanggan);
end;

procedure TFmain.navPembelianBarangClick(Sender: TObject);
begin
  FpembelianBarang.TampilAwal;
  FpembelianBarang.ShowModal;


end;

procedure TFmain.navPengeluaranKasClick(Sender: TObject);
begin
 LoadForm(TFpengeluaranBiaya);
end;

procedure TFmain.navPersediaanBarangsubClick(Sender: TObject);
begin
  LoadForm(TFdataStokBarang);
end;

procedure TFmain.navDataReturPenjualanClick(Sender: TObject);
begin
  LoadForm(TFdataReturPenjualan);
end;

procedure TFmain.navFIFOClick(Sender: TObject);
begin
  LoadForm(TFLaporanFIFO);
end;

procedure TFmain.NavSatuan1Click(Sender: TObject);
begin
  LoadForm(TFdataSatuan);
end;

procedure TFmain.navSettingClick(Sender: TObject);
begin
  Fprofile.Show;
end;

procedure TFmain.navSupplierClick(Sender: TObject);
begin
  LoadForm(TFdataSupplier);
end;

procedure TFmain.navSuratJalanClick(Sender: TObject);
begin
  LoadForm(TFdataSuratJalan);
end;

procedure TFmain.navTutupBukuClick(Sender: TObject);
begin
  FtutupBUku.isAuto     := False;
  FtutupBUku.dtp1.Date  := EncodeDate(YearOf(now),MonthOf(now),DayOf(EndOfTheMonth(Now)));
  FtutupBUku.sHOWMODAL;
end;

procedure TFmain.navTutupTahunClick(Sender: TObject);
begin
  FtutupTahun.SHowModal;
end;

procedure TFmain.navUserClick(Sender: TObject);
begin
  LoadForm(TFDataUser);
end;

procedure TFmain.SaveSkin(aSkinName :string);
var
  FileSkin : TIniFile;
begin
  FileSkin := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Skins.ini');
  try
    FileSkin.WriteString('SKINS','SkinName',aSkinName);
  finally
    FileSkin.Free;
  end;
end;

function TFmain.SetSkin:String;
var
  FileSkin : TIniFile;
begin
  FileSkin := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Skins.ini');
  try
    Result := FileSkin.ReadString('SKINS','SkinName','AlphastWorld');
  finally
    FileSkin.Free;
  end;
end;

procedure TFmain.unVisible;
var
  i :integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TdxnavBarGroup) then
       begin
          TdxnavBarGroup(Components[i]).Visible := False;
       end
       else
       if (Components[i] is TdxnavBarItem) then
       begin
          TdxnavBarItem(Components[i]).Visible := False;
       end;

  end;
end;



procedure TFmain.UpdateStok;
var
  tgl : TDate;
begin
   tgl := EncodeDate(YearOf(now),MonthOf(now),1);
   FtutupBUku.dtp1.Date := tgl -1;
   //FtutupBUku.dtp1.OnCloseUp(Self);
   FtutupBUku.isAuto := True;
   FtutupBUku.Show;

end;

{ TTtutupBuku }

constructor TTtutupBuku.Create(AQ1, AQ2, AQ3: TMyQUery;AQ4:TMyQUery;AQ5:TMyQUery;AQ6:TMyQUery;
  aProgress: TcxProgressBar);
begin
  FQ1       := AQ1;
  FQ2       := AQ2;
  FQ3       := AQ3;
  FQ4       := AQ4;
  FQ5       := AQ5;
  FQ6       := AQ6;

  FPBar    := aProgress;
  FreeOnTerminate := True;

  Inherited Create(False);
end;

destructor TTtutupBuku.Destroy;
begin
  FQ1.Free;
  FQ2.Free;
  FQ3.Free;
  FQ4.Free;
  FPBar.Free;
end;

procedure TTtutupBuku.Execute;
begin
  inherited;
  Synchronize(ExeTutupBuku);
end;

procedure TTtutupBuku.ExeTutupBuku;
var
  i : integer;
  Stok , Harga , HargaRata2,TotalHarga,TotalStok : Real;
  NextKode : String;
  tglTutup : TDate;
  nobukti ,Kode, NoBuktiSaldo : String;
  LabaRugi : Real;
  alist : TStringList;
  tgl1 , tgl2  : TDate;
begin
    alist := TStringList.Create;

          try
              tglTutup  := Now - 1;
              tgl1 := EncodeDate(YearOf(tglTutup),MonthOf(tglTutup),1);
              tgl2 := EncodeDate(YearOf(tglTutup),MonthOf(tglTutup),DayOf(EndOfTheMonth(tglTutup)));
              ExQry(FQ1,' CALL sp_labarugi("'+Tanggal(tgl1)+'","'+Tanggal(tgl2)+'")',True);

              LabaRugi := GetValF(FQ1,'Pendapatan') - GetValF(FQ1,'Biaya');

              Kode := FormatDateTime('ddmmyyhhss',now);
              ExQry(FQ1,'DELETE FROM saldoakun WHERE noakun="302.001" '+
              ' AND YEAR(tgl)="'+IntToStr(YearOf(tgl1))+'" '+
              ' AND MONTH(tgl)="'+IntToStr(MOnthOf(tgl1))+'"',False);



                  addParam('noakun',     '302.001',                aList,'str');
                  addParam('nobukti',    kode,                     aList,'str');
                  addParam('tgl',        frmTgl(tgl2),              aList,'date');
                  if LabaRugi < 0 then begin
                  addParam('debet',      StrToDecimal(FloatToStr(Abs(LabaRugi))),    aList,'str');
                  addParam('kredit',     '0',    aList,'str');
                  end else begin
                  addParam('debet',      '0',    aList,'str');
                  addParam('kredit',     StrToDecimal(FloatToStr(Abs(LabaRugi))),    aList,'str');
                  end;
                  addParam('s_akhir',    StrToDecimal(FloatToStr(Abs(LabaRugi))),      aList,'str');


                  exeDb(FQ2,'saldoakun',aList);
          finally
            alist.Free;
          end;

          OpenTable(FQ1,['kodebarang','satuanjual'],'barang');

          i := 1;
          FPBar.Properties.Max := FQ1.RecordCount;
          FPBar.Position := 0;
          nobukti  := FormatDateTime('ddmmyyhhss',now);
            while not FQ1.Eof do begin
                ExQry(FQ3,'SELECT * from lokasi',True);
                while FQ3.Eof = False  do begin
                  ExQry(FQ2,'SELECT hargabeli,SUM(saldoawal + masuk - keluar) as stok FROM kartustok '+
                  ' WHERE kodebarang="'+getval(FQ1,'kodebarang')+'" '+
                  ' AND MONTH(tgl)="'+intToStr(MonthOF(tgl1))+'" '+
                  ' AND YEAR(tgl)="'+IntToStr(YearOf(tgl1))+'" '+
                  ' AND idgudang="'+Getval(FQ3,'idlokasi')+'" GROUP BY kodebarang,idgudang ORDER BY idkartustok ASC',True);

                  TotalHarga := 0;
                  TotalStok  := 0;
                  while not FQ2.Eof do begin
                    Harga := GetValF(FQ2,'hargabeli') ;
                    Stok  := GetValF(FQ2,'stok');

                    TotalHarga := TotalHarga + (Harga * Stok);
                    TotalStok  := TotalStok + Stok ;

                    FQ2.Next;
                  end;
                    if TotalHarga > 0 then

                    HargaRata2 := TotalHarga / TotalStok  else
                    HargaRata2 := 0;

                    FQ4.Close;
                    FQ4.SQL.Text := ' INSERT INTO kartustok ( '+
                                    '      nobukti,           '+
                                    '      tgl,               '+
                                    '      kodebarang,        '+
                                    '      hargabeli,        '+
                                    '      idgudang,          '+
                                    '      satuan,            '+
                                    '      saldoawal,             '+
                                    '      saldoakhir,keterangan '+
                                    '    )                       '+
                                    '    VALUES                  '+
                                    '      (                     '+
                                    '        :nobukti,        '+
                                    '        :tgl,          '+
                                    '        :kodebarang,     '+
                                    '        :hargabeli,     '+
                                    '        :idgudang,       '+
                                    '        :satuan,         '+
                                    '        :saldoawal,            '+
                                    '        :saldoakhir,:keterangan '+
                                    '      ) ';
                    FQ4.ParamByName('nobukti').AsString     := nobukti;
                    FQ4.ParamByName('tgl').AsDate           := tglTutup + 1;
                    FQ4.ParamByName('kodebarang').AsString  := GetVal(FQ1,'kodebarang');
                    FQ4.ParamByName('idgudang').AsString    := GetVal(FQ3,'idlokasi');
                    FQ4.ParamByName('satuan').AsString      := GetVal(FQ1,'satuanjual');
                    FQ4.ParamByName('hargabeli').AsFloat    := HargaRata2;
                    FQ4.ParamByName('saldoawal').AsFloat    := TotalStok;
                    FQ4.ParamByName('saldoakhir').AsFloat   := TotalStok;
                    FQ4.ParamByName('keterangan').AsString  := 'PROSES TUTUP STOK BULAN '+IntToStr(MonthOf(tglTutup));
                    FQ4.ExecSQL;

                    FQ3.Next;
                end;
                Inc(i);

                FPbar.Position    := i;
                Application.ProcessMessages;
                FQ1.Next;

            end;
           OpenTable(FQ1,['kodeakunperkiraan','namaakunperkiraan'],'m_akunperkiraan WHERE akunsubmaster REGEXP "10|20|30"');
           FPbar.Properties.Max := FQ1.RecordCount;
           FPbar.Position := 0;
           i := 1;


           NextKode :=GetNoAkun('302');

            ExQry(FQ6,'SELECT * FROM m_akunperkiraan WHERE kodeakunperkiraan="'+NextKode+'"',True);
           if FQ6.IsEmpty then
           ExQry(FQ5,'INSERT INTO m_akunperkiraan ( kodeakunperkiraan,namaakunperkiraan,akunsubmaster) VALUES ( '+
           '"'+NextKode+'" ,"LABA RUGI BULAN '+UPPERCASE(FOrmatDateTIme('mmmm',tglTutup))+'","302")',False);



           NoBuktiSaldo := GetCode(FQ5,'saldoakun','nobukti','TBK');
           while not FQ1.Eof do begin

             ExQry(FQ2,' SELECT                                                       '+
                         '       SUM(                                                      '+
                         '         CASE                                                 '+
                         '           WHEN bb.jenisakun = "A"                            '+
                         '           THEN (s.s_awal+s.debet-s.kredit)  '+
                         '           ELSE (s.s_awal +s.kredit - s.debet)  '+
                         '         END                                                  '+
                         '      ) AS saldoakhir                                        '+
                         '     FROM                                                     '+
                         '       m_akunperkiraan ak                                     '+
                         '       LEFT JOIN saldoakun s                                  '+
                         '         ON s.`noakun` = ak.`kodeakunperkiraan`               '+
                         '       LEFT JOIN m_subbukubesar ms                            '+
                         '         ON ms.akunsubmaster = ak.`akunsubmaster`             '+
                         '       LEFT JOIN m_bukubesar bb                               '+
                         '         ON bb.`nomasterakun` = ms.`nomasterakun`             '+
                         '     WHERE MONTH(s.tgl)="'+IntTOStr(monthof(tglTutup))+'"  '+
                         '     AND YEAR(s.tgl)="'+IntToStr(YearOf(tglTutup))+'" AND '+
                         '     noakun="'+GetVal(FQ1,'kodeakunperkiraan')+'" '+
                         '    GROUP BY noakun',True);

            with FQ3 do begin
               Close;
               SQL.Text := ' INSERT INTO tutupbulan(tgl,noakun,nominal) VALUES '+
                           ' (:tgl,:noakun,:nominal)';
               ParamByName('tgl').AsDate      := tgltutup;
               if GetVal(FQ1,'kodeakunperkiraan') ='302.001' then
               ParamByName('noakun').AsString := 'L|'+IntToStr(MonthOf(tglTutup))+' '+IntToStr(YearOf(tglTutup))+' | '+GetVal(FQ1,'kodeakunperkiraan')
               else
               ParamByName('noakun').AsString := GetVal(FQ1,'kodeakunperkiraan');
               ParamByName('nominal').AsFloat := GetValF(FQ2,'saldoakhir');
               ExecSQL;
             end;
             with FQ4 do begin

               Close;
               SQL.Text := ' INSERT INTO saldoakun(noakun,nobukti,keterangan,tgl,s_awal,s_akhir) '+
                           ' VALUES (:noakun,:nobukti,:keterangan,:tgl,:s_awal,:s_akhir)';
               if GetVal(FQ1,'kodeakunperkiraan') = '302.001' then
               ParamByName('noakun').AsString     := NextKode else
               ParamByName('noakun').AsString     := GetVal(FQ1,'kodeakunperkiraan');
               ParamByName('nobukti').AsString    := nobuktiSaldo;
               ParamByName('keterangan').AsString := 'SALDO AWAL BULAN "'+INTTOSTR(MonthOf(tglTutup)+1)+'" THN "'+INTTOSTR(YearOf(tglTutup))+'"';
               ParamByName('tgl').AsDate          := tglTutup + 1;
               ParamByName('s_awal').AsFloat      := GetValF(FQ2,'saldoakhir');
               ParamByName('s_akhir').AsFloat     := GetValF(FQ2,'saldoakhir');
               ExecSQL;

             end;

             FPbar.Position    := i;
             Application.ProcessMessages;
             FQ1.Next;
             inC(i);
           end;

           if (MonthOf(tglTutup) = MonthOf(EndOfTheYear(tglTutup))) then begin
                 FPbar.Properties.Max := dm.Q1.RecordCount;
               FPbar.Position := 0;
               i := 1;


               NextKode := GetNoAkun('303');

               ExQry(FQ5,'DELETE FROM m_akunperkiraan WHERE kodeakunperkiraan="'+NExtKode+'"',False);
               ExQry(FQ5,'INSERT INTO m_akunperkiraan ( kodeakunperkiraan,namaakunperkiraan,akunsubmaster) VALUES ( '+
               '"'+NextKode+'" ,"LABA RUGI THN. '+UPPERCASE(FOrmatDateTIme('yyyy',tglTutup))+'","303")',FAlse);

                 ExQry(FQ2,' SELECT                                                       '+
                             '       SUM(nominal) as totallabarugi                          '+
                             '     FROM                                                     '+
                             '     tutupbulan                                               '+
                             '     WHERE noakun LIKE "%L%" '+
                             '     AND YEAR(tgl)="'+IntToStr(YearOf(tglTutup))+'"           ',True);

                 with FQ4 do begin
                   Close;
                   SQL.Text := ' INSERT INTO tutuptahun(thn,noakun,nominal) VALUES '+
                               ' (:tgl,:noakun,:nominal)';
                   ParamByName('tgl').AsDate      := tglTutup;
                   ParamByName('noakun').AsString := NextKode;
                   ParamByName('nominal').AsFloat := GetValF(FQ2,'totallabarugi');
                   ExecSQL;
                 end;

                 with FQ5 do begin
                   Close;
                   SQL.Text := ' INSERT INTO saldoakun(noakun,nobukti,keterangan,tgl,s_awal,s_akhir) '+
                               ' VALUES (:noakun,:nobukti,:keterangan,:tgl,:s_awal,:s_akhir)';
                   ParamByName('noakun').AsString     := NextKode;
                   ParamByName('nobukti').AsString    := NoBuktiSaldo;
                   ParamByName('keterangan').AsString := 'SALDO AWAL TAHUN "'+INTTOSTR(YearOf(tglTutup)+1)+'"';
                   ParamByName('tgl').AsDate          := tglTutup + 1;
                   ParamByName('s_awal').AsFloat      := GetValF(FQ2,'totallabarugi');
                   ParamByName('s_akhir').AsFloat     := GetValF(FQ2,'totallabarugi');
                   ExecSQL;

                 end;
                 ExQry(FQ2,'SELECT kodeakunperkiraan FROM m_akunperkiraan WHERE akunsubmaster in ("302","404")',True);

                 while not FQ2.Eof  do begin

                   ExQry(FQ4,'UPDATE saldoakun SET s_awal=0,s_akhir=0 WHERE noakun="'+GetVal(FQ2,'kodeakunperkiraan')+'" '+
                               ' AND tgl="'+Tanggal(tglTutup+1)+'"',False)  ;

                   FQ2.Next;
                 end;
                  FPbar.Position    := FPbar.Properties.Max;

                 Application.ProcessMessages;

           end;

end;

function TTtutupBuku.GetNoAkun(id: String): String;
var
  jml  : Integer;
  Kode : string;
  tglkemarin : TDate;
begin



  ExQry(FQ4,'select kodeakunperkiraan,max(Right(kodeakunperkiraan,3)) as '+
                ' jum from m_akunperkiraan where akunsubmaster="'+id+'" '+
                ' AND namaakunperkiraan '+
                ' LIKE "%'+UPPERCASE(FormatDateTime('mmmm',Now -1))+'%"',True);


      if StrToIntDef(GetVal(FQ4,'jum'),0)=0  then jml := 2 else
       jml := GetValInt(FQ4,'jum') + 1;

      kode := IntToStr(MonthOf(Now -1)+1);
      kode:= Copy('000'+kode,length('000'+kode)-2,3);
      Result := id+'.'+Kode;

end;

end.
