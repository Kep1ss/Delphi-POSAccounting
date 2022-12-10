unit uInputDataBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, cxMemo,dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, dxSkiniMaginary,
  dxSkinOffice2010Blue, dxSkinOffice2016Colorful, dxSkinMoneyTwins, Vcl.ExtCtrls,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.ComCtrls, cxGroupBox, dxSkinTheBezier, cxCheckBox;

type
  TFinputBarang = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Enamabarang: TcxTextEdit;
    EisiBox: TcxTextEdit;
    EStokMin: TcxTextEdit;
    EstokMax: TcxTextEdit;
    Ekodebarang: TcxTextEdit;
    Label16: TLabel;
    Label17: TLabel;
    Ekodebarcode: TcxTextEdit;
    cbKategori: TcxComboBox;
    btnCariKategori: TcxButton;
    Label18: TLabel;
    Label19: TLabel;
    cbsatuanbeli: TcxComboBox;
    btnCariSatuan: TcxButton;
    Label20: TLabel;
    Label21: TLabel;
    cbSatuanjual: TcxComboBox;
    Label3: TLabel;
    Label7: TLabel;
    EHargaBeli: TcxTextEdit;
    Label22: TLabel;
    Label23: TLabel;
    EHargaJual: TcxTextEdit;
    Label24: TLabel;
    Label25: TLabel;
    EHargaGrosir: TcxTextEdit;
    Label26: TLabel;
    Label27: TLabel;
    EHargaPartai: TcxTextEdit;
    Label32: TLabel;
    Label33: TLabel;
    Eppn: TcxTextEdit;
    cxTabSheet2: TcxTabSheet;
    cbSatuan1: TcxComboBox;
    cbSatuan2: TcxComboBox;
    cbSatuan3: TcxComboBox;
    cbSatuan4: TcxComboBox;
    cbSatuan5: TcxComboBox;
    EIsi1: TcxTextEdit;
    EIsi2: TcxTextEdit;
    EIsi3: TcxTextEdit;
    Eisi4: TcxTextEdit;
    EIsi5: TcxTextEdit;
    EHarga1: TcxTextEdit;
    EHarga2: TcxTextEdit;
    EHarga3: TcxTextEdit;
    EHarga4: TcxTextEdit;
    EHarga5: TcxTextEdit;
    dxBevel1: TdxBevel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label72: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Eqty1: TcxTextEdit;
    Eqty2: TcxTextEdit;
    Eqty3: TcxTextEdit;
    Label71: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Lpcs4: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Eqtydan1: TcxTextEdit;
    Eqtydan2: TcxTextEdit;
    Eqtydan3: TcxTextEdit;
    Ehrg3: TcxTextEdit;
    Ehrg2: TcxTextEdit;
    Ehrg1: TcxTextEdit;
    Lpcs1: TLabel;
    Lpcs2: TLabel;
    Lpcs3: TLabel;
    Lpcs7: TLabel;
    Lpcs5: TLabel;
    Lpcs6: TLabel;
    EnamaBarcode: TcxTextEdit;
    Label95: TLabel;
    Label94: TLabel;
    Ehargapartai1: TcxTextEdit;
    Ehargapartai2: TcxTextEdit;
    Ehargapartai3: TcxTextEdit;
    Ehargapartai4: TcxTextEdit;
    Ehargapartai5: TcxTextEdit;
    Label44: TLabel;
    shp2: TShape;
    shp3: TShape;
    shp5: TShape;
    shp6: TShape;
    shp7: TShape;
    E6: TcxTextEdit;
    E7: TcxTextEdit;
    E8: TcxTextEdit;
    E9: TcxTextEdit;
    E10: TcxTextEdit;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    E11: TcxTextEdit;
    Ehargagrosir1: TcxTextEdit;
    Ehargagrosir2: TcxTextEdit;
    E14: TcxTextEdit;
    E15: TcxTextEdit;
    Ehargagrosir3: TcxTextEdit;
    Ehargagrosir4: TcxTextEdit;
    E18: TcxTextEdit;
    E19: TcxTextEdit;
    Ehargagrosir5: TcxTextEdit;
    shp8: TShape;
    Label37: TLabel;
    Label38: TLabel;
    E21: TcxTextEdit;
    E22: TcxTextEdit;
    E23: TcxTextEdit;
    E24: TcxTextEdit;
    E25: TcxTextEdit;
    Label39: TLabel;
    Label40: TLabel;
    shp9: TShape;
    Label41: TLabel;
    Ekodebarcode1: TcxTextEdit;
    Ekodebarcode2: TcxTextEdit;
    Ekodebarcode3: TcxTextEdit;
    Ekodebarcode4: TcxTextEdit;
    Ekodebarcode5: TcxTextEdit;
    Label42: TLabel;
    Label43: TLabel;
    EMargin: TcxTextEdit;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    EM1: TcxTextEdit;
    EM2: TcxTextEdit;
    EM3: TcxTextEdit;
    btnH1: TButton;
    btnH2: TButton;
    btnH3: TButton;
    btnH4: TButton;
    btnH5: TButton;
    Label51: TLabel;
    Label52: TLabel;
    EHargaSetelahPPN: TcxTextEdit;
    Label53: TLabel;
    Label54: TLabel;
    EMarginGrosir: TcxTextEdit;
    Label55: TLabel;
    Label56: TLabel;
    EMarginPartai: TcxTextEdit;
    Label57: TLabel;
    Label58: TLabel;
    EMinimalOrder: TcxTextEdit;
    Label91: TLabel;
    Label92: TLabel;
    Ecogs: TcxTextEdit;
    shp12: TShape;
    shp1: TShape;
    Label28: TLabel;
    Label29: TLabel;
    ESTOK: TcxTextEdit;
    Label63: TLabel;
    Label64: TLabel;
    cbSupplier: TcxComboBox;
    cxGroupBox1: TcxGroupBox;
    grp3: TGroupBox;
    Label89: TLabel;
    Label90: TLabel;
    Label93: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    dtawal3: TDateTimePicker;
    dtselesai3: TDateTimePicker;
    EHargaPromo3: TcxTextEdit;
    Emarginpromo3: TcxTextEdit;
    grp2: TGroupBox;
    Label78: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    dtawal2: TDateTimePicker;
    dtselesai2: TDateTimePicker;
    EHargaPromo2: TcxTextEdit;
    Emarginpromo2: TcxTextEdit;
    grp1: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    dtAwal: TDateTimePicker;
    dtSelesai: TDateTimePicker;
    EHargaPromo: TcxTextEdit;
    EMarginPromo: TcxTextEdit;
    cbSatuanQty1: TcxComboBox;
    cbSatuanQty2: TcxComboBox;
    cbSatuanQty3: TcxComboBox;
    GroupBox1: TGroupBox;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    dtPromoLevel11: TDateTimePicker;
    dtPromoLevel12: TDateTimePicker;
    EHargaPromoLevel1: TcxTextEdit;
    EMarginPromoLevel1: TcxTextEdit;
    GroupBox2: TGroupBox;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    dtPromoLevel21: TDateTimePicker;
    dtPromoLevel22: TDateTimePicker;
    EHargaPromoLevel2: TcxTextEdit;
    EMarginPromoLevel2: TcxTextEdit;
    GroupBox3: TGroupBox;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    dtPromoLevel31: TDateTimePicker;
    dtPromoLevel32: TDateTimePicker;
    EHargaPromoLevel3: TcxTextEdit;
    EMarginPromoLevel3: TcxTextEdit;
    Label117: TLabel;
    cbPromo: TcxComboBox;
    cBKP: TcxCheckBox;
    Label118: TLabel;
    Label119: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCariKategoriClick(Sender: TObject);
    procedure btnCariSatuanClick(Sender: TObject);
    procedure EHarga1PropertiesChange(Sender: TObject);
    procedure Ehargagrosir1PropertiesChange(Sender: TObject);
    procedure Ehargapartai1PropertiesChange(Sender: TObject);
    procedure EHarga2PropertiesChange(Sender: TObject);
    procedure Ehargagrosir2PropertiesChange(Sender: TObject);
    procedure Ehargapartai2PropertiesChange(Sender: TObject);
    procedure EHarga3PropertiesChange(Sender: TObject);
    procedure EHarga4PropertiesChange(Sender: TObject);
    procedure EHarga5PropertiesChange(Sender: TObject);
    procedure Ehargagrosir3PropertiesChange(Sender: TObject);
    procedure Ehargagrosir4PropertiesChange(Sender: TObject);
    procedure Ehargagrosir5PropertiesChange(Sender: TObject);
    procedure Ehargapartai3PropertiesChange(Sender: TObject);
    procedure Ehargapartai4PropertiesChange(Sender: TObject);
    procedure EHargaBeliPropertiesChange(Sender: TObject);
    procedure Ehrg1PropertiesChange(Sender: TObject);
    procedure Ehrg2PropertiesChange(Sender: TObject);
    procedure Ehrg3PropertiesChange(Sender: TObject);
    procedure btnH1Click(Sender: TObject);
    procedure btnH2Click(Sender: TObject);
    procedure btnH3Click(Sender: TObject);
    procedure btnH4Click(Sender: TObject);
    procedure btnH5Click(Sender: TObject);
    procedure EppnPropertiesChange(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure EMarginKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EHargaJualKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EMarginGrosirKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EMarginPartaiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EHargaGrosirKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EHargaPartaiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EHargaPromoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EHargaPromo2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EHargaPromo3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbSatuanQty1PropertiesChange(Sender: TObject);
    procedure cbSatuanQty2PropertiesChange(Sender: TObject);
    procedure cbSatuanQty3PropertiesChange(Sender: TObject);
    procedure EHargaPromoLevel1PropertiesChange(Sender: TObject);
    procedure EHargaPromoLevel2PropertiesChange(Sender: TObject);
    procedure cbPromoPropertiesChange(Sender: TObject);
    procedure EHargaPromoLevel3PropertiesChange(Sender: TObject);
    procedure EkodebarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

    { Private declarations }
    isiPromo : Real;


  public
    CanEdit : Boolean;
    idBarang : String;
    procedure TampilanAwal;
    { Public declarations }
  end;

var
  FinputBarang: TFinputBarang;


implementation
  uses
    udm,uDataBarang, uMainMenu, uInputKategori, uInputSatuan;

{$R *.dfm}

{ TFInputUser }

procedure TFinputBarang.btnCariKategoriClick(Sender: TObject);
begin
  if not Assigned(FinputKategori) then
  Application.CreateForm(TFinputKategori, FinputKategori);
  FinputKategori.Show;
end;

procedure TFinputBarang.btnCariSatuanClick(Sender: TObject);
begin
  if not Assigned(FinputSatuan) then
  Application.CreateForm(TFinputSatuan, FinputSatuan);
  FinputSatuan.Show;
end;

procedure TFinputBarang.btnH1Click(Sender: TObject);
begin
  if MessageDlg('Hapus multisatuan',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    cbSatuan1.Text := '' ;
    EIsi1.Text     := '';
    E6.Text        := '';
    EHarga1.Text   := '';
    E11.Text       := '';
    Ehargagrosir1.Text := '';
    E21.Text       := '';
    Ehargapartai1.Text := '';
    Ekodebarcode1.Text := '';
  end;

end;

procedure TFinputBarang.btnH2Click(Sender: TObject);
begin
  if MessageDlg('Hapus multisatuan',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    cbSatuan2.Text := '' ;
    EIsi2.Text     := '';
    E7.Text        := '';
    EHarga2.Text   := '';
    E14.Text       := '';
    Ehargagrosir2.Text := '';
    E22.Text       := '';
    Ehargapartai2.Text := '';
    Ekodebarcode2.Text := '';
  end;
end;

procedure TFinputBarang.btnH3Click(Sender: TObject);
begin
  if MessageDlg('Hapus multisatuan',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    cbSatuan3.Text := '' ;
    EIsi3.Text     := '';
    E8.Text        := '';
    EHarga3.Text   := '';
    E15.Text       := '';
    Ehargagrosir3.Text := '';
    E23.Text       := '';
    Ehargapartai3.Text := '';
    Ekodebarcode3.Text := '';
  end;
end;

procedure TFinputBarang.btnH4Click(Sender: TObject);
begin
  if MessageDlg('Hapus multisatuan',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    cbSatuan4.Text := '' ;
    EIsi4.Text     := '';
    E9.Text        := '';
    EHarga4.Text   := '';
    E18.Text       := '';
    Ehargagrosir4.Text := '';
    E24.Text       := '';
    Ehargapartai4.Text := '';
    Ekodebarcode4.Text := '';
  end;
end;

procedure TFinputBarang.btnH5Click(Sender: TObject);
begin
  if MessageDlg('Hapus multisatuan',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    cbSatuan5.Text := '' ;
    EIsi5.Text     := '';
    E10.Text        := '';
    EHarga5.Text   := '';
    E19.Text       := '';
    Ehargagrosir5.Text := '';
    E25.Text       := '';
    Ehargapartai5.Text := '';
    Ekodebarcode5.Text := '';
  end;
end;

procedure TFinputBarang.btnSimpanClick(Sender: TObject);
var
 i,x : Integer;
 Scmb : TcxComboBox;
 sTxt,stxt2,stxt3,stxt4,stxt5,stxt6,stxt7 : TcxTextEdit;
 aList      : TStringList;
 idSupplier : String;
begin
  if not CheckEdit(Self) then begin
    aList := TStringList.Create;
    try
      try
       if cbSupplier.ItemIndex < 0 then
          idSupplier := '' else idSupplier := GetIdCmb(cbSupplier);
       addParam('kodebarang',   Ekodebarang.Text,     aList,'str');
       addParam('kodebarcode',  Ekodebarcode.Text,    aList,'str');
       addParam('namabarang',   Enamabarang.Text,     aList,'str');
       addParam('namabarcode',  EnamaBarcode.Text,    aList,'str');
       addParam('idkategori',   GetIdcmb(cbKategori), aList,'str');
       addParam('satuanbeli',   cbsatuanbeli.Text,    aList,'str');
       addParam('satuanjual',   cbSatuanjual.Text,    aList,'str');
       addParam('isi',          EisiBox.isAngka,      aList,'str');
       addParam('margin',       StrToDecimal(EMargin.Text), aList,'str');
       addParam('stokmin',      EStokMin.isAngka,     aList,'str');
       addParam('stokmax',      EstokMax.isAngka,     aList,'str');
       addParam('minimalorder', EMinimalOrder.isAngka,     aList,'str');
       addParam('hargabeli',    StrToDecimal(EHargaBeli.Text),   aList,'str');
       addParam('hargaecer',    StrToDecimal(EHargaJual.Text),   aList,'str');
       addParam('margingrosir', StrToDecimal(EMargin.Text), aList,'str');
       addParam('hargagrosir',  StrToDecimal(EHargaGrosir.Text), aList,'str');
       addParam('marginpartai', StrToDecimal(EMargin.Text), aList,'str');
       addParam('hargapartai',  StrToDecimal(EHargaPartai.Text), aList,'str');
       if idSupplier <> '' then
       addParam('idsupplier',   idSupplier, aList,'str');
       addParam('ppn',          Eppn.isAngka,         aList,'str');
       addParam('tglawal',      frmTgl(dtAwal.Date),         aList,'date');
       addParam('tglakhir',     frmTgl(dtSelesai.Date),         aList,'date');
       addParam('hargapromo',   StrToDecimal(EHargaPromo.Text),         aList,'str');
       addParam('tglawal2',      frmTgl(dtAwal2.Date),         aList,'date');
       addParam('tglakhir2',     frmTgl(dtSelesai2.Date),         aList,'date');
       addParam('hargapromo2',   StrToDecimal(EHargaPromo2.Text),         aList,'str');
       addParam('tglawal3',      frmTgl(dtAwal3.Date),         aList,'date');
       addParam('tglakhir3',     frmTgl(dtSelesai3.Date),         aList,'date');
       addParam('hargapromo3',   StrToDecimal(EHargaPromo3.Text),         aList,'str');
       addParam('bkp',           BolStr(cBKP.Checked),alist,'str');
       OpenTable(dm.Q1,['idbarang'],'barang where (kodebarcode="'+Ekodebarcode.Text+'" OR kodebarang="'+Ekodebarang.Text+'" )');
      if dm.Q1.IsEmpty then begin
         exeDb(dm.Q1,'barang',aList);
         aList.Clear;
      end
      else begin
         if MessageDlg('Apakah yakin akan mengedit data?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            updatedb(dm.Q1,'barang',aList,'idbarang','"'+idbarang+'"') else
         aList.Clear;
      end;



      ExQry(dm.Q2,'delete from multisatuan Where kodebarang="'+Ekodebarang.Text+'"',False);
      addParam('kodebarang', Ekodebarang.Text,     aList,'str');
      addParam('satuan',     cbSatuanjual.Text, aList,'str');
      addParam('isi',        '1',  aList,'str');
      addParam('harga',      StrToDecimal(EHargaJual.Text),aList,'str');
      addParam('hargagrosir',StrToDecimal(EHargaGrosir.Text),aList,'str');
      addParam('hargapartai',StrToDecimal(EHargaPartai.Text),aList,'str');
      addParam('kodebarcode',Ekodebarcode.isAngka,aList,'str');
      exeDb(dm.Q1,'multisatuan',alist);
      if (EHargaPromo.AsFLoat > 0) or (EHargaPromo2.AsFLoat >0 ) or (EHargaPromo3.AsFLoat > 0) then begin
         ExQry(dm.Q1,'UPDATE multisatuan set '+
         ' tglawal="'+Tanggal(dtAwal.Date)+'" ,'+
         ' tglakhir="'+Tanggal(dtSelesai.Date)+'", '+
         ' hargapromo="'+StrToDecimal(EHargaPromo.Text)+'" ,'+
         ' tglawal2="'+Tanggal(dtAwal2.Date)+'" ,'+
         ' tglakhir2="'+Tanggal(dtSelesai2.Date)+'", '+
         ' hargapromo2="'+StrToDecimal(EHargaPromo2.Text)+'" ,'+
         ' tglawal3="'+Tanggal(dtAwal3.Date)+'" ,'+
         ' tglakhir3="'+Tanggal(dtSelesai3.Date)+'", '+
         ' hargapromo3="'+StrToDecimal(EHargaPromo3.Text)+'" '+
         ' WHERE kodebarang="'+Ekodebarang.Text+'" '+
         ' AND satuan="'+cbSatuanjual.Text+'" ',False
         );

      end;
      for I := 1 to 5 do begin
        Scmb := TcxComboBox(FindComponent('cbSatuan'+IntTostr(i)));
        sTxt := TcxTextEdit(FindComponent('Eharga'+IntTostr(i)));
        stxt2:= TcxTextEdit(FindComponent('Eisi'+IntTostr(i)));
        stxt3:= TcxTextEdit(FindComponent('Ehargagrosir'+IntTostr(i)));
        stxt4:= TcxTextEdit(FindComponent('Ehargapartai'+IntTostr(i)));
        stxt5:= TcxTextEdit(FindComponent('Ehargapartai4'+IntTostr(i)));
        stxt6:= TcxTextEdit(FindComponent('Ehargapartai5'+IntTostr(i)));
        stxt7:= TcxTextEdit(FindComponent('Ekodebarcode'+IntTostr(i)));
        if (Scmb.Text <> '') and (sTxt.Text <> '') then
        begin
          addParam('kodebarang', Ekodebarang.Text,     aList,'str');
          addParam('satuan',     Scmb.Text,     aList,'str');
          addParam('harga',      StrToDecimal(sTxt.Text),  aList,'str');
          addParam('hargagrosir',StrToDecimal(sTxt3.Text),  aList,'str');
          addParam('hargapartai',StrToDecimal(sTxt4.Text),  aList,'str');
          addParam('hargapartai4',StrToDecimal(sTxt5.Text),  aList,'str');
          addParam('hargapartai5',StrToDecimal(sTxt6.Text),  aList,'str');
          addParam('kodebarcode',sTxt7.Text,  aList,'str');
          addParam('isi',        stxt2.isAngka, aList,'str');

          exeDb(dm.Q1,'multisatuan',alist);
        end;
      end;
      ExQry(dm.Q2,'delete from multiqty Where kodebarang="'+Ekodebarang.Text+'"',False);
      for x := 1 to 3 do begin

        stxt3 := TcxTextEdit(FindComponent('Eqty'+IntTostr(x)));
        sTxt  := TcxTextEdit(FindComponent('Eqtydan'+IntTostr(x)));
        stxt2 := TcxTextEdit(FindComponent('Ehrg'+IntTostr(x)));
        Scmb  := TcxComboBox(FindComponent('cbSatuanQty'+IntTostr(x)));


        if (stxt3.Text <> '') and (stxt2.Text <> '') then
        begin
          addParam('kodebarang', Ekodebarang.Text, aList,'str');
          addParam('satuan',     Scmb.Text, aList,'str');
          addParam('qtyawal',    stxt3.isAngka,        aList,'str');
          addParam('qtyakhir',   sTxt.isAngka,     aList,'str');
          addParam('harga',      StrToDecimal(stxt2.Text),    aList,'str');

          exeDb(dm.Q1,'multiqty',alist);
        end;
      end;

      if cbPromo.ItemIndex >= 0 then begin
         ExQry(dm.Q1,'UPDATE multisatuan set '+
         ' tglawal="'+Tanggal(dtPromoLevel11.Date)+'" ,'+
         ' tglakhir="'+Tanggal(dtPromoLevel12.Date)+'", '+
         ' hargapromo="'+StrToDecimal(EHargaPromoLevel1.Text)+'" ,'+
         ' tglawal2="'+Tanggal(dtPromoLevel21.Date)+'" ,'+
         ' tglakhir2="'+Tanggal(dtPromoLevel22.Date)+'", '+
         ' hargapromo2="'+StrToDecimal(EHargaPromoLevel2.Text)+'" ,'+
         ' tglawal3="'+Tanggal(dtPromoLevel31.Date)+'" ,'+
         ' tglakhir3="'+Tanggal(dtPromoLevel32.Date)+'", '+
         ' hargapromo3="'+StrToDecimal(EHargaPromoLevel3.Text)+'" '+
         ' WHERE kodebarang="'+Ekodebarang.Text+'" '+
         ' AND satuan="'+cbPromo.Text+'" ',False
         );

      end;


      ExQry(dm.Q3,'SELECT kodebarang FROM hargabelirata WHERE kodebarang="'+Ekodebarang.Text+'"',True);
      if dm.Q3.IsEmpty then
         ExQry(dm.Q1,'INSERT INTO hargabelirata (kodebarang,hargabeli) VALUES '+
         '("'+Ekodebarang.Text+'","'+StrToDecimal(EHargaBeli.Text)+'")',False)
      else
         ExQry(dm.Q1,'UPDATE hargabelirata SET hargabeli="'+StrToDecimal(EHargaBeli.Text)+'" '+
         ' WHERE kodebarang="'+Ekodebarang.Text+'"',False);

      ExQry(dm.Q3,'SELECT kodebarang FROM kartustok WHERE kodebarang="'+Ekodebarang.Text+'"',True);

      if dm.Q3.IsEmpty then begin
          ExQry(dm.Q2,'SELECT DISTINCT(idlokasi) FROM lokasi',True);
          while not dm.Q2.Eof do begin

              PostingKartuStok(dm.Q1,FormatDateTime('ddmmyyss',Now),now,Ekodebarang.Text,
              GetVal(dm.Q2,'idlokasi'),cbSatuanjual.Text,EHargaBeli.AsFLoat,'MASUK',0,'Saldo Awal');
              dm.Q2.Next;
          end;
      end;

      TampilanAwal;
      if Assigned(Fdatabarang) then  begin
         Fdatabarang.LoadData;
      end;
      Except

      end;

    finally
      aList.Free;
    end;
          if CanEdit then
       Close;

  end;
end;

procedure TFinputBarang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputBarang.cbPromoPropertiesChange(Sender: TObject);
begin
  if cbPromo.Text = cbSatuan1.Text then
     isiPromo := EIsi1.AsFLoat
  else if cbPromo.Text = cbSatuan2.Text then
     isiPromo := EIsi2.AsFLoat
  else if cbPromo.Text = cbSatuan3.Text then
     isiPromo := EIsi3.AsFLoat
  else if cbPromo.Text = cbSatuan4.Text then
     isiPromo := EIsi4.AsFLoat
  else if cbPromo.Text = cbSatuan5.Text then
     isiPromo := EIsi5.AsFLoat;
end;

procedure TFinputBarang.cbSatuanQty1PropertiesChange(Sender: TObject);
begin

  Lpcs5.Caption :=  cbSatuanQty1.Text;

end;

procedure TFinputBarang.cbSatuanQty2PropertiesChange(Sender: TObject);
begin
  Lpcs6.Caption :=  cbSatuanQty2.Text;

end;

procedure TFinputBarang.cbSatuanQty3PropertiesChange(Sender: TObject);
begin
  Lpcs7.Caption :=  cbSatuanQty3.Text;
end;

procedure TFinputBarang.cxPageControl1Change(Sender: TObject);
begin
  if cbsatuanbeli.Text <> cbSatuanjual.Text then begin
    cbSatuan1.Text := cbsatuanbeli.Text;
    EIsi1.Text     := EisiBox.Text;

  end;
end;

procedure TFinputBarang.EHarga1PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if EHarga1.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi1.AsFLoat;
      jual := EHarga1.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E6.Text := Format('%.2n',[persen]);

  end ;
end;

procedure TFinputBarang.EHarga2PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if EHarga2.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi2.AsFLoat;
      jual := EHarga2.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E7.Text := Format('%.2n',[persen]);

  end ;
end;

procedure TFinputBarang.EHarga3PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if EHarga3.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi3.AsFLoat;
      jual := EHarga3.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E8.Text := Format('%.2n',[persen]);

  end;
end;

procedure TFinputBarang.EHarga4PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if EHarga4.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi4.AsFLoat;
      jual := EHarga4.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E9.Text := Format('%.2n',[persen]);

  end ;
end;

procedure TFinputBarang.EHarga5PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if EHarga5.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi5.AsFLoat;
      jual := EHarga5.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E10.Text := Format('%.2n',[persen]);

  end;
end;

procedure TFinputBarang.EHargaBeliPropertiesChange(Sender: TObject);
var
  HargaAwal : Real;
  Ppn, HargaPPN       : Real;
  MarginKategori : Real;
  HargajualMargin : Real;
begin
 if ( EHargaBeli.AsFLoat > 0 )  then
  begin


    HargaAwal    := EHargaBeli.AsFLoat;
    Ppn          := Eppn.AsFLoat;

    if Ppn > 0 then   begin

      HargaPPN     := HargaAwal + (HargaAwal * Ppn /100);
      EHargaSetelahPPN.Text := Format('%.2n',[HargaPPN]);
    end else begin
      EHargaSetelahPPN.Text := Format('%.2n',[HargaAwal]);
      HargaPPN     := HargaAwal;
    end;

    ExQry(dm.Q2,'SELECT margin FROM kategori WHERE namakategori="'+cbKategori.Text+'"',True);
    MarginKategori := GetValF(dm.Q2,'margin');



      if MarginKategori > 0 then begin
         EMargin.Text    := Format('%.2n',[MarginKategori]);
         HargajualMargin := Round(HargaPPN+ (HargaPPN *  MarginKategori / 100));
         EHargaJual.Text := Format('%.0n',[HargajualMargin]);
      end else begin
        if (EHargaJual.AsFLoat > 0 )  then
          EMargin.Text := Format('%.2n',[(EHargaJual.AsFLoat - HargaPPN)/ HargaPPN * 100])

      end;


    if (EHargaGrosir.AsFLoat > 0 )  then
        EMarginGrosir.Text := Format('%.2n',[((EhargaGrosir.AsFLoat - HargaPPN)/ HargaPPN) * 100]);
    if (EHargaPartai.AsFLoat > 0 )  then
    EMarginPartai.Text := Format('%.2n',[((EhargaPartai.AsFLoat - HargaPPN)/ HargaPPN) * 100]);
   
  end;
end;

procedure TFinputBarang.Ehargagrosir1PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if Ehargagrosir1.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi1.AsFLoat;
      jual := Ehargagrosir1.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E11.Text := Format('%.2n',[persen]);

  end ;
end;

procedure TFinputBarang.Ehargagrosir2PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if Ehargagrosir2.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi2.AsFLoat;
      jual := Ehargagrosir2.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E14.Text := Format('%.2n',[persen]);

  end;
end;

procedure TFinputBarang.Ehargagrosir3PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if Ehargagrosir3.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi3.AsFLoat;
      jual := Ehargagrosir3.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E15.Text := Format('%.2n',[persen]);

  end ;
end;

procedure TFinputBarang.Ehargagrosir4PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if Ehargagrosir4.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi4.AsFLoat;
      jual := Ehargagrosir4.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E18.Text := Format('%.2n',[persen]);

  end;
end;


procedure TFinputBarang.Ehargagrosir5PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if Ehargagrosir5.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi5.AsFLoat;
      jual := Ehargagrosir5.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E19.Text := Format('%.2n',[persen]);

  end;
end;

procedure TFinputBarang.EHargaGrosirKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  HargaAwal, PPn, HargaPPn : Real;
begin
  if ( EHargaBeli.AsFLoat > 0 )   then
  begin
    HargaAwal    := EHargaBeli.AsFLoat;
    Ppn          := StrToFloatDef(Eppn.Text,0);

    if Ppn > 0 then   begin

    HargaPPN     := HargaAwal + (HargaAwal * Ppn /100);
    EHargaSetelahPPN.Text := Format('%.2n',[HargaPPN]);
    end else begin
      EHargaSetelahPPN.Text := Format('%.2n',[HargaAwal]);
      HargaPPn              := HargaAwal;
    end;


    if  (EHargaGrosir.AsFLoat > 0 ) then
    EMarginGrosir.Text := Format('%.2n',[((EhargaGrosir.AsFLoat -HargaPPn)/ HargaPPn) * 100]);

  end;
end;

procedure TFinputBarang.EHargaJualKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  HargaAwal, PPn, HargaPPn : Real;
begin
  if ( EHargaBeli.AsFLoat > 0 )   then
  begin
    HargaAwal    := EHargaBeli.AsFLoat;
    Ppn          := StrToFloatDef(Eppn.Text,0);

    if Ppn > 0 then   begin

    HargaPPN     := HargaAwal + (HargaAwal * Ppn /100);
    EHargaSetelahPPN.Text := Format('%.2n',[HargaPPN]);
    end else begin
      EHargaSetelahPPN.Text := Format('%.2n',[HargaAwal]);
      HargaPPn              := HargaAwal;
    end;


    if  (EHargaJual.AsFLoat > 0 ) then
    EMargin.Text := Format('%.2n',[((EHargaJual.AsFLoat -HargaPPn)/ HargaPPn) * 100]);
    if  (EHargaGrosir.AsFLoat > 0 ) then
    EMarginGrosir.Text := Format('%.2n',[((EhargaGrosir.AsFLoat -HargaPPn)/ HargaPPn) * 100]);
    if  (EHargaPartai.AsFLoat > 0 ) then
    EMarginPartai.Text := Format('%.2n',[((EhargaPartai.AsFLoat - HargaPPn)/ HargaPPn) * 100]);

  end;
end;

procedure TFinputBarang.Ehargapartai1PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if Ehargapartai1.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi1.AsFLoat;
      jual := Ehargapartai1.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E21.Text := Format('%.2n',[persen]);

  end;
end;

procedure TFinputBarang.Ehargapartai2PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if Ehargapartai2.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi2.AsFLoat;
      jual := Ehargapartai2.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E22.Text := Format('%.2n',[persen]);

  end;
end;

procedure TFinputBarang.Ehargapartai3PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if Ehargapartai3.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi3.AsFLoat;
      jual := Ehargapartai3.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E23.Text := Format('%.2n',[persen]);

  end;
end;

procedure TFinputBarang.Ehargapartai4PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if Ehargapartai4.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := EIsi4.AsFLoat;
      jual := Ehargapartai4.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      E24.Text := Format('%.2n',[persen]);

  end;
end;

procedure TFinputBarang.EHargaPartaiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  HargaAwal, PPn, HargaPPn : Real;
begin
  if ( EHargaBeli.AsFLoat > 0 )   then
  begin
    HargaAwal    := EHargaBeli.AsFLoat;
    Ppn          := StrToFloatDef(Eppn.Text,0);

    if Ppn > 0 then   begin

    HargaPPN     := HargaAwal + (HargaAwal * Ppn /100);
    EHargaSetelahPPN.Text := Format('%.2n',[HargaPPN]);
    end else begin
      EHargaSetelahPPN.Text := Format('%.2n',[HargaAwal]);
      HargaPPn              := HargaAwal;
    end;


    if  (EHargaPartai.AsFLoat > 0 ) then
    EMarginPartai.Text := Format('%.2n',[((EHargaPartai.AsFLoat -HargaPPn)/ HargaPPn) * 100]);

  end;
end;

procedure TFinputBarang.EHargaPromo2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  HargaAwal, PPn, HargaPPn : Real;
begin
  if ( EHargaBeli.AsFLoat > 0 )   then
  begin
    HargaAwal    := EHargaBeli.AsFLoat;
    Ppn          := StrToFloatDef(Eppn.Text,0);

    if Ppn > 0 then   begin

    HargaPPN     := HargaAwal + (HargaAwal * Ppn /100);
    EHargaSetelahPPN.Text := Format('%.2n',[HargaPPN]);
    end else begin
      EHargaSetelahPPN.Text := Format('%.2n',[HargaAwal]);
      HargaPPn              := HargaAwal;
    end;


    if  (EHargaPromo2.AsFLoat > 0 ) then
    EMarginPromo2.Text := Format('%.2n',[((EHargaPromo2.AsFLoat -HargaPPn)/ HargaPPn) * 100]);

  end;
end;

procedure TFinputBarang.EHargaPromo3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  HargaAwal, PPn, HargaPPn : Real;
begin
  if ( EHargaBeli.AsFLoat > 0 )   then
  begin
    HargaAwal    := EHargaBeli.AsFLoat;
    Ppn          := StrToFloatDef(Eppn.Text,0);

    if Ppn > 0 then   begin

    HargaPPN     := HargaAwal + (HargaAwal * Ppn /100);
    EHargaSetelahPPN.Text := Format('%.2n',[HargaPPN]);
    end else begin
      EHargaSetelahPPN.Text := Format('%.2n',[HargaAwal]);
      HargaPPn              := HargaAwal;
    end;


    if  (EHargaPromo3.AsFLoat > 0 ) then
    EMarginPromo3.Text := Format('%.2n',[((EHargaPromo3.AsFLoat -HargaPPn)/ HargaPPn) * 100]);

  end;
end;

procedure TFinputBarang.EHargaPromoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  HargaAwal, PPn, HargaPPn : Real;
begin
  if ( EHargaBeli.AsFLoat > 0 )   then
  begin
    HargaAwal    := EHargaBeli.AsFLoat;
    Ppn          := StrToFloatDef(Eppn.Text,0);

    if Ppn > 0 then   begin

    HargaPPN     := HargaAwal + (HargaAwal * Ppn /100);
    EHargaSetelahPPN.Text := Format('%.2n',[HargaPPN]);
    end else begin
      EHargaSetelahPPN.Text := Format('%.2n',[HargaAwal]);
      HargaPPn              := HargaAwal;
    end;


    if  (EHargaPromo.AsFLoat > 0 ) then
    EMarginPromo.Text := Format('%.2n',[((EHargaPromo.AsFLoat -HargaPPn)/ HargaPPn) * 100]);

  end;
end;

procedure TFinputBarang.EHargaPromoLevel1PropertiesChange(Sender: TObject);
var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if EHargaPromoLevel1.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := isiPromo;
      jual := EHargaPromoLevel1.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      EMarginPromoLevel1.Text := Format('%.2n',[persen]);

  end ;

end;

procedure TFinputBarang.EHargaPromoLevel2PropertiesChange(Sender: TObject);

var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if EHargaPromoLevel2.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := isiPromo;
      jual := EHargaPromoLevel2.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      EMarginPromoLevel2.Text := Format('%.2n',[persen]);

  end ;

end;

procedure TFinputBarang.EHargaPromoLevel3PropertiesChange(Sender: TObject);

var
 laba : real;
 persen : real;
 beli : Real;
 jual : Real;
 isi  : real;

begin
  if EHargaPromoLevel3.AsFLoat <> 0 then
  begin
      beli := StrToFloatDef(nilai(EHargaSetelahPPN.Text),0);
      isi  := isiPromo;
      jual := EHargaPromoLevel3.AsFLoat / isi;
      laba := jual - beli;
      persen := (laba / beli) * 100;
      EMarginPromoLevel3.Text := Format('%.2n',[persen]);

  end ;

end;

procedure TFinputBarang.Ehrg1PropertiesChange(Sender: TObject);
var
  hargaSatuan : Real;
begin
  if (EHargaBeli.AsFLoat > 0) and (Ehrg1.AsFLoat > 0) and (Eqty1.AsFLoat > 0) then
  begin
    hargaSatuan := Round(Ehrg1.AsFLoat);
    EM1.Text := Format('%.2n',[((HargaSatuan - EhargaSetelahPPn.AsFLoat) / EhargaSetelahPPn.AsFLoat )*100]);
  end;
end;

procedure TFinputBarang.Ehrg2PropertiesChange(Sender: TObject);
var
  hargaSatuan : Real;
begin
  if (EHargaBeli.AsFLoat > 0) and (Ehrg2.AsFLoat > 0) and (Eqty2.AsFLoat > 0) then
  begin
    hargaSatuan := Round(Ehrg2.AsFLoat);
    EM2.Text := Format('%.2n',[((HargaSatuan - EhargaSetelahPPn.AsFLoat) / EhargaSetelahPPn.AsFLoat )*100]);
  end;
end;

procedure TFinputBarang.Ehrg3PropertiesChange(Sender: TObject);
var
  hargaSatuan : Real;
begin
  if (EHargaBeli.AsFLoat > 0) and (Ehrg3.AsFLoat > 0) and (Eqty3.AsFLoat > 0)then
  begin
    hargaSatuan := Round(Ehrg3.AsFLoat);
    EM3.Text := Format('%.2n',[((HargaSatuan - EhargaSetelahPPn.AsFLoat) / EhargaSetelahPPn.AsFLoat )*100]);
  end;
end;

procedure TFinputBarang.EkodebarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  smb   : Tcxcombobox;
  stxt1 : TcxTextEdit;
  stxt2 : TcxTextEdit;
  stxt3 : TcxTextEdit;
  stxt4 : TcxTextEdit;
  stxt5 : TcxTextEdit;
  stxt6 : TcxTextEdit;
  stxt7 : TcxTextEdit;

  MarginPromo,MarginPromo2,MarginPromo3 : Real;
  i     : Integer;
begin
  if Key = 13 then begin

     ExQry(dm.QBarang,_SQLbarang+' WHERE kodebarcode="'+Ekodebarang.Text+'"',True);

     if dm.QBarang.IsEmpty = False then begin

       Enamabarang.Text     := GetVal(dm.QBarang,'namabarang');
       cbKategori.ItemIndex := idxCmb(cbKategori,GetValInt(dm.QBarang,'idkategori'));
       cbsatuanbeli.Text    := GetVal(dm.QBarang,'satuanbeli');
       cbSatuanjual.Text    := GetVal(dm.QBarang,'satuanjual');
       EisiBox.Text         := GetValR(dm.QBarang,'isi');
       EStokMin.Text        := GetValR(dm.QBarang,'stokmin');
       EstokMax.Text        := GetValR(dm.QBarang,'stokmax');
       Eppn.Text            := GetVal(dm.QBarang,'ppn');
       EHargaBeli.Text      := GetValCur(dm.QBarang,'hargabeli');
       EHargaSetelahPPN.Text:= getValCur(dm.QBarang,'HargaPPN');
       EHargaJual.Text      := GetValCur(dm.QBarang,'hargaecer');
       EHargaGrosir.Text    := GetValCur(dm.QBarang,'hargagrosir');
       EHargaPartai.Text    := GetValCur(dm.QBarang,'hargapartai');
       EMinimalOrder.Text   := GetValR(dm.QBarang,'minimalorder');
       Ecogs.Text           := GetValCur(dm.QBarang,'hargabeliratarata');
       ESTOK.Text           := GetVal(dm.QBarang,'stok');
       dtAwal.Date          := GetValDate(dm.QBarang,'tglawal');
       dtSelesai.Date       := GetValDate(dm.QBarang,'tglakhir');
       EHargaPromo.Text     := GetValCur(dm.QBarang,'hargapromo');
       dtAwal2.Date         := GetValDate(dm.QBarang,'tglawal2');
       dtSelesai2.Date      := GetValDate(dm.QBarang,'tglakhir2');
       EHargaPromo2.Text    := GetValCur(dm.QBarang,'hargapromo2');
       dtAwal3.Date         := GetValDate(dm.QBarang,'tglawal3');
       dtSelesai3.Date      := GetValDate(dm.QBarang,'tglakhir3');
       EHargaPromo3.Text    := GetValCur(dm.QBarang,'hargapromo3');
       idBarang             := GetVal(dm.QBarang,'idbarang');
       EnamaBarcode.Text    := GetVal(dm.QBarang,'namabarcode');
       MarginPromo          := (GetValF(dm.QBarang,'hargapromo')- GetValF(dm.QBarang,'hargabeli')) / GetValF(dm.QBarang,'hargabeli') * 100;
       EMarginPromo.Text    := Format('%.2n',[MarginPromo]);
       MarginPromo2          := (GetValF(dm.QBarang,'hargapromo2')- GetValF(dm.QBarang,'hargabeli')) / GetValF(dm.QBarang,'hargabeli') * 100;
       EMarginPromo2.Text    := Format('%.2n',[MarginPromo2]);
       MarginPromo3          := (GetValF(dm.QBarang,'hargapromo3')- GetValF(dm.QBarang,'hargabeli')) / GetValF(dm.QBarang,'hargabeli') * 100;
       EMarginPromo3.Text    := Format('%.2n',[MarginPromo3]);
       cbsupplier.ItemIndex := idxCmb(cbSupplier,GetValInt(dm.Qbarang,'idsupplier'));
       cBKP.Checked         := GetValBol(dm.QBarang,'bkp');

       ExQry(dm.Q1,'SELECT m.* FROM multisatuan m LEFT JOIN barang b ON m.kodebarang=b.kodebarang WHERE b.kodebarcode="'+Ekodebarang.Text+'" '+
       ' AND m.satuan<>"'+GetVal(dm.QBarang,'satuanjual')+'" ORDER BY isi DESC ',True);

       i:=1;
       while not dm.Q1.Eof do begin

           smb   := TcxComboBox(FindComponent('cbSatuan'+intTostr(i)));
           stxt1 := TcxTextEdit(FindComponent('EIsi'+intTostr(i)));
           stxt2 := TcxTextEdit(FindComponent('EHarga'+intTostr(i)));
           stxt3 := TcxTextEdit(FindComponent('EHargagrosir'+intTostr(i)));
           stxt4 := TcxTextEdit(FindComponent('EHargapartai'+intTostr(i)));
           stxt5 := TcxTextEdit(FindComponent('EHargapartai4'+intTostr(i)));
           stxt6 := TcxTextEdit(FindComponent('EHargapartai5'+intTostr(i)));
           stxt7 := TcxTextEdit(FindComponent('Ekodebarcode'+intTostr(i)));

           smb.ItemIndex := smb.Properties.Items.IndexOf(GetVal(dm.Q1,'satuan'));
           stxt1.Text := GetValR(dm.Q1,'isi');
           stxt2.Text := GetValR(dm.Q1,'harga');
           stxt3.Text := GetValR(dm.Q1,'hargagrosir');
           stxt4.Text := GetValR(dm.Q1,'hargapartai');
           stxt5.Text := GetValR(dm.Q1,'hargapartai4');
           stxt6.Text := GetValR(dm.Q1,'hargapartai5');
           stxt7.Text := GetVal(dm.Q1,'kodebarcode');

           if (GetValF(dm.Q1,'hargapromo') > 0) or (GetValF(dm.Q1,'hargapromo2') > 0) or (GetValF(dm.Q1,'hargapromo2') > 0) then
           begin
             cbPromo.ItemIndex := smb.Properties.Items.IndexOf(GetVal(dm.Q1,'satuan'));
             dtPromoLevel11.Date := GetValDate(dm.Q1,'tglawal');
             dtPromoLevel12.Date := GetValDate(dm.Q1,'tglakhir');
             EHargaPromoLevel1.Text := GetValR(dm.Q1,'hargapromo');

             dtPromoLevel21.Date := GetValDate(dm.Q1,'tglawal2');
             dtPromoLevel22.Date := GetValDate(dm.Q1,'tglakhir2');
             EHargaPromoLevel2.Text := GetValR(dm.Q1,'hargapromo2');

             dtPromoLevel31.Date := GetValDate(dm.Q1,'tglawal3');
             dtPromoLevel32.Date := GetValDate(dm.Q1,'tglakhir3');
             EHargaPromoLevel3.Text := GetValR(dm.Q1,'hargapromo3');

           end;

         Inc(i);
         dm.Q1.Next;

       end;

       OpenTable(dm.Q1,['*'],'multiqty WHERE kodebarang="'+Ekodebarang.Text+'"');
       dm.Q1.First;
       i:=1;
       while not dm.Q1.Eof do begin
         stxt1 := TcxTextEdit(FindComponent('Eqty'+intTostr(i)));
         stxt2 := TcxTextEdit(FindComponent('Eqtydan'+intTostr(i)));
         stxt3 := TcxTextEdit(FindComponent('Ehrg'+intTostr(i)));

         stxt1.Text := GetValR(dm.Q1,'qtyawal');
         stxt2.Text := GetValR(dm.Q1,'qtyakhir');
         stxt3.Text := GetValR(dm.Q1,'harga');
         Inc(i);
         dm.Q1.Next;

       end;
     end;
    end;
end;

procedure TFinputBarang.EMarginGrosirKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  HargaBeli , Persen , HargaJual , TambahPersen: Real;
begin

  if EHargaBeli.AsFLoat > 0 then begin

      HargaBeli := EHargaSetelahPPN.AsFLoat;
      Persen    := EMarginGrosir.AsFLoat;
      TambahPersen := HargaBeli * Persen / 100;
      HargaJual := HargaBeli + TambahPersen;

      EHargaGrosir.Text := Format('%.2n',[HargaJual]);
  end;



end;


procedure TFinputBarang.EMarginKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  HargaBeli , Persen , HargaJual , TambahPersen: Real;
begin

  if EHargaBeli.AsFLoat > 0 then begin

      HargaBeli := EHargaSetelahPPN.AsFLoat;
      Persen    := EMargin.AsFLoat;
      TambahPersen := HargaBeli * Persen / 100;
      HargaJual := HargaBeli + TambahPersen;

      EHargaJual.Text := Format('%.2n',[HargaJual]);
  end;



end;

procedure TFinputBarang.EMarginPartaiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  HargaBeli , Persen , HargaJual , TambahPersen: Real;
begin

  if EHargaBeli.AsFLoat > 0 then begin

      HargaBeli := EHargaSetelahPPN.AsFLoat;
      Persen    := EMarginPartai.AsFLoat;
      TambahPersen := HargaBeli * Persen / 100;
      HargaJual := HargaBeli + TambahPersen;

      EHargaPartai.Text := Format('%.2n',[HargaJual]);
  end;



end;


procedure TFinputBarang.EppnPropertiesChange(Sender: TObject);
  var
  HargaAwal : Real;
  Ppn, HargaPPN       : Real;
begin
  HargaAwal    := EHargaBeli.AsFLoat;
  Ppn          := Eppn.AsFLoat;

  if (Ppn > 0) and (HargaAwal > 0) then   begin
    HargaPPN              := HargaAwal + (HargaAwal * Ppn /100);
    EHargaSetelahPPN.Text := Format('%.0n',[HargaPPN]);
  end else
    EHargaSetelahPPN.Text := EHargaBeli.Text;
end;

procedure TFinputBarang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
end;

procedure TFinputBarang.FormCreate(Sender: TObject);
begin
  EHargaBeli.isRupiah     := True;
  EHargaJual.isRupiah     := True;
  EHargaGrosir.isRupiah   := True;
  EHargaGrosir1.isRupiah   := True;
  EHargaGrosir2.isRupiah   := True;
  EHargaGrosir3.isRupiah   := True;
  EHargaGrosir4.isRupiah   := True;
  EHargaGrosir5.isRupiah   := True;

  EHargaPartai.isRupiah   := True;
  EHargaPartai1.isRupiah   := True;
  EHargaPartai2.isRupiah   := True;
  EHargaPartai3.isRupiah   := True;
  EHargaPartai4.isRupiah   := True;
  EHargaPartai5.isRupiah   := True;

  EHargaPromo.isRupiah     := True;

  EHarga1.isRupiah        := True;
  EHarga2.isRupiah        := True;
  EHarga3.isRupiah        := True;
  EHarga4.isRupiah        := True;
  EHarga5.isRupiah        := True;
  Ehrg1.isRupiah          := True;
  Ehrg2.isRupiah          := True;
  Ehrg3.isRupiah          := True;
  EIsi1.isRupiah          := True;
  EIsi2.isRupiah          := True;
  EIsi3.isRupiah          := True;
  EIsi4.isRupiah          := True;
  Eqty1.isRupiah          := True;
  Eqty2.isRupiah          := True;
  Eqty3.isRupiah          := True;
  Eqtydan1.isRupiah       := True;
  Eqtydan2.isRupiah       := True;
  Eqtydan3.isRupiah       := True;
  EisiBox.isRupiah        := True;
  EStokMin.isRupiah       := True;
  EstokMax.isRupiah       := True;
  Eppn.isPersen           := True;
  EMargin.isPersen        := True;
  EHargaPromoLevel1.isRupiah := True;
  EHargaPromoLevel2.isRupiah := True;
  EHargaPromoLevel3.isRupiah := True;

  isiCmb(dm.Q1,'kategori',['idkategori','namakategori'],cbKategori);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbsatuanbeli);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuanjual);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan1);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan2);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan3);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan4);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuan5);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuanQty1);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuanQty2);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbSatuanQty3);
  isiCmb(dm.Q1,'satuan',['idsatuan','namasatuan'],cbPromo);

end;

procedure TFinputBarang.FormShow(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex :=0;
  Ekodebarang.SetFocus;

end;


procedure TFinputBarang.TampilanAwal;
begin
  ClearText(Self);
  cxPageControl1.ActivePageIndex :=0;
  Ekodebarang.Text  := GetCode(dm.Q1,'barang','kodebarang','');
  Ekodebarcode.Text := Ekodebarang.Text;
  CanEdit           := False;
  idBarang          := '';
  dtAwal.Date       := Now;
  dtSelesai.Date    := Now;
  dtAwal2.Date       := Now;
  dtSelesai2.Date    := Now;
  dtAwal3.Date       := Now;
  dtSelesai3.Date    := Now;
 // Ekodebarcode.SetFocus;
end;

end.
