unit uDataBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, ShellAPi,System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, Vcl.StdCtrls, cxButtons, cxTextEdit, cxGroupBox, dxSkinsCore,
  Vcl.Menus, dxSkinsdxStatusBarPainter, cxStyles, cxGridExportLink,
  dxSkinscxPCPainter, cxCustomData, Vcl.ImgList, udm, uEngine,IniFiles, uctrlFrm,
  cxCalc,cxDropDownEdit, dxSkiniMaginary, cxMaskEdit, dxSkinOffice2010Blue,
  dxSkinOffice2016Colorful, dxSkinMoneyTwins, cxCurrencyEdit, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxCheckBox, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  cxImageList;

type
  TFdatabarang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    EPencarian: TcxTextEdit;
    G3: TcxGroupBox;
    btnBaru: TcxButton;
    btnUbah: TcxButton;
    btnHapus: TcxButton;
    btnTutup: TcxButton;
    btnPrint: TcxButton;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    T1: TMenuItem;
    U1: TMenuItem;
    H1: TMenuItem;
    N1: TMenuItem;
    C1: TMenuItem;
    T2: TMenuItem;
    F1: TMenuItem;
    img1: TcxImageList;
    F2: TMenuItem;
    F3: TMenuItem;
    N2: TMenuItem;
    G5: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    sbr1: TdxStatusBar;
    N3: TMenuItem;
    R1: TMenuItem;
    cxGrid1DBTableView1kodebarang: TcxGridDBColumn;
    cxGrid1DBTableView1kodebarcode: TcxGridDBColumn;
    cxGrid1DBTableView1namakategori: TcxGridDBColumn;
    cxGrid1DBTableView1satuanbeli: TcxGridDBColumn;
    cxGrid1DBTableView1satuanjual: TcxGridDBColumn;
    cxGrid1DBTableView1isi: TcxGridDBColumn;
    cHargaBeli: TcxGridDBColumn;
    cxGrid1DBTableView1hargaecer: TcxGridDBColumn;
    cxGrid1DBTableView1hargagrosir: TcxGridDBColumn;
    cxGrid1DBTableView1hargapartai: TcxGridDBColumn;
    cxGrid1DBTableView1ppn: TcxGridDBColumn;
    cxGrid1DBTableView1namabarang: TcxGridDBColumn;
    C2: TMenuItem;
    Label2: TLabel;
    cbKategori: TcxComboBox;
    N4: TMenuItem;
    P1: TMenuItem;
    C3: TMenuItem;
    H2: TMenuItem;
    I1: TMenuItem;
    cxGrid1DBTableView1hargabeliratarata: TcxGridDBColumn;
    cxGrid1DBTableView1stok: TcxGridDBColumn;
    btn9: TcxButton;
    btnPromo: TcxButton;
    cxlbl1: TcxLabel;
    CheckBox1: TCheckBox;
    C4: TcxCheckBox;
    GDetail: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxg1: TcxGrid;
    GhargaPromo: TcxGridTableView;
    cxgL: TcxGridLevel;
    GhargaPromoColumn1: TcxGridColumn;
    GhargaPromoColumn2: TcxGridColumn;
    GhargaPromoColumn3: TcxGridColumn;
    C5: TMenuItem;
    GhargaPromoColumn4: TcxGridColumn;
    cxGrid1DBTableView1margin: TcxGridDBColumn;
    cxGrid1DBTableView1margingrosir: TcxGridDBColumn;
    cxGrid1DBTableView1marginpartai: TcxGridDBColumn;
    bkp: TcxGridDBColumn;
    procedure btnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure F3Click(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPencarianEnter(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure cbKategoriPropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure H2Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btnPromoClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure C5Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public

    procedure LoadData;
    { Public declarations }
  end;
  const
    _SQLbarang = ' SELECT                 '+
                   '   b.idbarang,          '+
                   '   b.kodebarang,        '+
                   '   b.kodebarcode,       '+
                   '   b.namabarang,        '+
                   '   b.namabarcode,       '+
                   '   b.hargasebelum,      '+
                   '   k.idkategori,        '+
                   '   k.namakategori,      '+
                   '   b.satuanbeli,        '+
                   '   b.idsupplier,        '+
                   '   s.namasupplier,        '+
                   '   b.minimalorder,      '+
                   '   b.satuanjual,        '+
                   '   b.isi,               '+
                   '   b.stokmin,           '+
                   '   b.stokmax,           '+
                   '   b.hargabeli,         '+
                   '   b.margin,            '+
                   '  (b.hargabeli + (b.hargabeli * b.ppn / 100)) as HargaPPN, ' +
                   '   b.hargaecer,         '+
                   '   b.hargagrosir,       '+
                   '   b.hargapartai,       '+
                   '   b.hargapartai4,       '+
                   '   b.hargapartai5,       '+
                   '   b.diskonpersen,      '+
                   '   b.diskonrupiah,      '+
                   '   b.hargapromo,      '+
                   '   b.tglawal,      '+
                   '   b.tglakhir,      '+
                   '   b.hargapromo2,      '+
                   '   b.tglawal2,      '+
                   '   b.tglakhir2,      '+
                   '   b.hargapromo3,      '+
                   '   b.tglawal3,      '+
                   '   b.tglakhir3,      '+
                   '   b.ppn,                '+
                   '   b.stok,                '+
                   '   b.warningiflimit,    '+
                   '   b.bkp,    '+
                   '   h.hargabeli as hargabeliratarata     '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN hargabelirata h ON '+
                   '   h.kodebarang=b.kodebarang  '+
                   '   LEFT JOIN m_supplier s ON '+
                   '   s.idsupplier=b.idsupplier';


var
  Fdatabarang: TFdatabarang;


implementation

{$R *.dfm}

uses uInputDataBarang, UcetakBarcode, uDlaporan, uMainMenu, UcatakLabel,
  uHistoryHargaBarang, uImportBarang, uSetingHargaPelanggan, uPrintBrosurBarang;

procedure TFdatabarang.btn9Click(Sender: TObject);
begin
  ExportGridToExcel(apathExe+'template\Data Barang All.xls',
  cxgrid1,true,True,True);
  ShellExecute(handle,'open',PChar(apathExe+'template\Data Barang All.xls'),nil,nil, SW_NORMAL);
end;

procedure TFdatabarang.btnBaruClick(Sender: TObject);
begin
  if not Assigned(FinputBarang) then
  Application.CreateForm(TFinputBarang, FinputBarang);
  Finputbarang.Show;
 // FinputBarang.EHargaBeli.Enabled := True;
  FinputBarang.TampilanAwal;
  isiCmb(dm.Q4,'m_supplier',['idsupplier','namasupplier'],FInputBarang.cbSupplier);
  FinputBarang.CanEdit := False;
end;

procedure TFdatabarang.btnHapusClick(Sender: TObject);
begin

  ExQry(dm.Q1,'SELECT kodebarang FROM kartustok WHERE kodebarang="'+GetVal(dm.QBarang,'kodebarang')+'" ',True);

  if dm.Q1.IsEmpty = False then begin
      if MessageDlg('Data barang sudah digunakan untuk transaksi !!,'+#13+'Jika dihapus kolom namabarang di transaksi akan kosong'+#13+#13+'Apakah yakin akan menghapus Barang?',mtWarning,[mbYes,mbNo],0)=mrYes then
      begin

         DelDb(
            dm.Q1,'barang',
            GetVal(dm.Qbarang,'namabarang'),
            'idbarang',GetVal(dm.Qbarang,'idbarang')
      );

      LoadData;

      end;
  end else
  begin
    DelDb(
            dm.Q1,'barang',
            GetVal(dm.Qbarang,'namabarang'),
            'idbarang',GetVal(dm.Qbarang,'idbarang')
      );

      LoadData;
  end;
end;

procedure TFdatabarang.btnPromoClick(Sender: TObject);
begin
  if not Assigned(FSetingHargaPelanggan) then
  Application.CreateForm(TFSetingHargaPelanggan, FSetingHargaPelanggan);

  FSetingHargaPelanggan.L1.Caption := GetVal(dm.QBarang,'kodebarang');
  FSetingHargaPelanggan.L2.Caption := GetVal(dm.QBarang,'namabarang');
  FSetingHargaPelanggan.ShowModal;
end;

procedure TFdatabarang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFdatabarang.btnUbahClick(Sender: TObject);
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
  if not Assigned(FinputBarang) then
  Application.CreateForm(TFinputBarang, FinputBarang);
  with Finputbarang do  begin
     isiCmb(dm.Q1,'kategori',['idkategori','namakategori'],cbKategori);
     isiCmb(dm.Q4,'m_supplier',['idsupplier','namasupplier'],FInputBarang.cbSupplier);
     Ekodebarang.Text     := GetVal(dm.QBarang,'kodebarang');
     Ekodebarcode.Text    := GetVal(dm.QBarang,'kodebarcode');
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
     dtAwal2.Date          := GetValDate(dm.QBarang,'tglawal2');
     dtSelesai2.Date       := GetValDate(dm.QBarang,'tglakhir2');
     EHargaPromo2.Text     := GetValCur(dm.QBarang,'hargapromo2');
     dtAwal3.Date          := GetValDate(dm.QBarang,'tglawal3');
     dtSelesai3.Date       := GetValDate(dm.QBarang,'tglakhir3');
     EHargaPromo3.Text     := GetValCur(dm.QBarang,'hargapromo3');
     idBarang             := GetVal(dm.QBarang,'idbarang');
     EnamaBarcode.Text    := GetVal(dm.QBarang,'namabarcode');
     if GetValF(dm.QBarang,'hargabeli') > 0 then begin

       MarginPromo          := (GetValF(dm.QBarang,'hargapromo')- GetValF(dm.QBarang,'hargabeli')) / GetValF(dm.QBarang,'hargabeli') * 100;
       EMarginPromo.Text    := Format('%.2n',[MarginPromo]);
       MarginPromo2          := (GetValF(dm.QBarang,'hargapromo2')- GetValF(dm.QBarang,'hargabeli')) / GetValF(dm.QBarang,'hargabeli') * 100;
       EMarginPromo2.Text    := Format('%.2n',[MarginPromo2]);
       MarginPromo3          := (GetValF(dm.QBarang,'hargapromo3')- GetValF(dm.QBarang,'hargabeli')) / GetValF(dm.QBarang,'hargabeli') * 100;
       EMarginPromo3.Text    := Format('%.2n',[MarginPromo3]);
     end;
     cbsupplier.ItemIndex := idxCmb(cbSupplier,GetValInt(dm.Qbarang,'idsupplier'));
     cBKP.Checked         := GetValBol(dm.QBarang,'bkp');

     OpenTable(dm.Q1,['*'],'multisatuan WHERE kodebarang="'+Ekodebarang.Text+'" AND satuan<>"'+GetVal(dm.QBarang,'satuanjual')+'" ORDER BY isi DESC ');

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
     CanEdit := True;
     Show;
  end;
end;

procedure TFdatabarang.C2Click(Sender: TObject);
begin
  FcetakBarcode.ShowModal;
end;

procedure TFdatabarang.C3Click(Sender: TObject);
begin
  if not Assigned(FcetakLabel) then

  Application.CreateForm(TFcetakLabel, FcetakLabel);
  FcetakLabel.ShowModal;
end;

procedure TFdatabarang.C4Click(Sender: TObject);
begin
    GDetail.Visible := not GDetail.Visible;
end;

procedure TFdatabarang.C5Click(Sender: TObject);
begin
  FDesignBrosurBarang.ShowModal;
end;

procedure TFdatabarang.cbKategoriPropertiesChange(Sender: TObject);
begin
  if cbKategori.ItemIndex >= 0 then
     ExQry(dm.QBarang,_SQLbarang+' WHERE namakategori="'+cbKategori.Text+'"',True)
  else
     ExQry(dm.QBarang,_SQLbarang,True);

  sbr1.Panels[1].Text := IntToStr(dm.Qbarang.RecordCount)+' Data';
end;

procedure TFdatabarang.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = True then
    ExQry(dm.QBarang,_SQLbarang+' WHERE ((h.hargabeli > hargaecer) and (hargaecer >0)) '+
  ' OR ((h.hargabeli > hargagrosir) and (hargagrosir > 0)) OR ((h.hargabeli > hargapartai) and '+
  ' (hargapartai > 0)) OR ((h.hargabeli > hargapartai4) and '+
  ' (hargapartai4 > 0)) OR ((h.hargabeli > hargapartai5) and '+
  ' (hargapartai5 > 0))',True) else
  LoadData;
end;

procedure TFdatabarang.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if (AViewInfo.GridRecord.Values[bkp.Index] = True) then
     ACanvas.Brush.Color := $0042D263;

end;

procedure TFdatabarang.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 if btnUbah.Enabled then
   btnUbah.Click;
end;

procedure TFdatabarang.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if GDetail.Visible then begin
     ExQry(dm.QMultiHarga,'SELECT * FROM multisatuan WHERE kodebarang="'+GetVal(dm.QBarang,'kodebarang')+'"',True);

     with GhargaPromo.DataController do begin
        RecordCount := 0;
        RecordCount := 3;
        if GetValF(dm.QBarang,'hargapromo') > 0 then begin
          Values[0,0] := GetVal(dm.Qbarang,'satuanjual');
          Values[0,1] := GetValR(dm.Qbarang,'hargapromo');
          Values[0,2] := GetVal(dm.Qbarang,'tglawal');
          Values[0,3] := GetVal(dm.Qbarang,'tglakhir');
        end;
        if GetValF(dm.QBarang,'hargapromo2') > 0 then begin
          Values[0,0]  := GetVal(dm.Qbarang,'satuanjual');
          Values[1,1] := GetValR(dm.Qbarang,'hargapromo2');
          Values[1,2] := GetVal(dm.Qbarang,'tglawal2');
          Values[1,3] := GetVal(dm.Qbarang,'tglakhir2');
        end;
        if GetValF(dm.QBarang,'hargapromo3') > 0 then begin
          Values[0,0] := GetVal(dm.Qbarang,'satuanjual');
          Values[2,1] := GetValR(dm.Qbarang,'hargapromo3');
          Values[2,2] := GetVal(dm.Qbarang,'tglawal3');
          Values[2,3] := GetVal(dm.Qbarang,'tglakhir3');
        end;

        while not dm.QMultiHarga.Eof do begin
           if GetValF(dm.QMultiHarga,'hargapromo') > 0 then begin
              Values[0,0] := GetVal(dm.QMultiHarga,'satuan');
              Values[0,1] := GetValR(dm.QMultiHarga,'hargapromo');
              Values[0,2] := GetVal(dm.QMultiHarga,'tglawal');
              Values[0,3] := GetVal(dm.QMultiHarga,'tglakhir');
           end;
           if GetValF(dm.QMultiHarga,'hargapromo2') > 0 then begin
              Values[0,0] := GetVal(dm.QMultiHarga,'satuan');
              Values[0,1] := GetValR(dm.QMultiHarga,'hargapromo2');
              Values[0,2] := GetVal(dm.QMultiHarga,'tglawal2');
              Values[0,3] := GetVal(dm.QMultiHarga,'tglakhir2');
           end;
           if GetValF(dm.QMultiHarga,'hargapromo3') > 0 then begin
              Values[0,0] := GetVal(dm.QMultiHarga,'satuan');
              Values[0,1] := GetValR(dm.QMultiHarga,'hargapromo3');
              Values[0,2] := GetVal(dm.QMultiHarga,'tglawal3');
              Values[0,3] := GetVal(dm.QMultiHarga,'tglakhir3');
           end;
            dm.QMultiHarga.Next;

        end;
     end;
  end;



end;

procedure TFdatabarang.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13  then
  begin
    if btnUbah.Enabled then

    btnUbah.Click;
  end;
end;

procedure TFdatabarang.EPencarianEnter(Sender: TObject);
begin
  EPencarian.Text := '';
  EPencarian.Style.Font.Color := clBlack;
  EPencarian.Style.Font.Style := EPencarian.Style.Font.Style - [fsItalic];
end;

procedure TFdatabarang.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin

    ExQry(dm.Qbarang,_SQLbarang+
    ' WHERE (b.namabarang like "%'+EPencarian.Text+'%" '+
    ' or kodebarcode like"%'+Epencarian.Text+'%" or '+
    ' b.kodebarang="'+Epencarian.Text+'") order BY b.namabarang asc',True);
  end else if Key = VK_DOWN then begin
    cxGrid1.SetFocus;

  end;
end;

procedure TFdatabarang.F2Click(Sender: TObject);
begin
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapDataBarang.fr3');
  Dlaporan.Fr1.ShowReport();

end;

procedure TFdatabarang.F3Click(Sender: TObject);
begin

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frLapDataBarang.fr3');
  Dlaporan.Fr1.PrepareReport(TRue);
  Dlaporan.Fr1.Export(Dlaporan.frxls1);
end;

procedure TFdatabarang.FormCreate(Sender: TObject);
begin
  Fdatabarang := Self;
end;

procedure TFdatabarang.FormShow(Sender: TObject);
var
  Showharga : Boolean;


begin
  LoadData;
  with dm.Q1 do begin
    Close;
    SQL.Text := ' SELECT idkategori,namakategori FROM kategori';
    Open;

    cbKategori.Properties.Items.Clear;
    cbKategori.Properties.Items.AddObject('ALL',TObject(0));
    while not Eof  do begin
      cbKategori.Properties.Items.AddObject(Fields[1].AsString,TObject(Fields[0].AsInteger));
      Next;

    end;
  end;

  ExQry(dm.Q1,'SELECT * FROM m_user WHERE username="'+FMain.sbr1.Panels[2].Text+'"',True);

  ShowHarga := GetValBol(dm.Q1,'showHarga');

  cHargaBeli.Visible := Showharga;
 // LoadData;

end;

procedure TFdatabarang.H2Click(Sender: TObject);
begin
  With FhistoryHargaBarang.QHistoryHarga do begin
    Active    := False;
    FilterSQL := ' b.namabarang LIKE "%'+dm.QBarang.FieldByName('namabarang').AsString+'%" '+
                 ' OR d.kodebarang LIKE "%'+dm.QBarang.FieldByName('kodebarang').AsString+'%"  ORDER BY p.tgl ASC ';
    Filtered  := True;
    Active    := True;
    end;
  FhistoryHargaBarang.ShowModal;
end;

procedure TFdatabarang.I1Click(Sender: TObject);
begin
  if not Assigned(FimportBarang) then
  Application.CreateForm(TFimportBarang, FimportBarang);
  FimportBarang.Showmodal;
end;

procedure TFdatabarang.LoadData;
begin
  if (EPencarian.Text <> '') and (EPencarian.Text <> 'Pencarian nama barang atau kodebarcode') then
  ExQry(dm.QBarang,_SQLbarang+' WHERE (b.kodebarcode LIKE "%'+EPencarian.Text+'%" '+
  ' or b.kodebarang LIKE "%'+EPencarian.Text+'%" or b.namabarang LIKE "%'+EPencarian.Text+'%")',True)
  else
  ExQry(dm.Qbarang,_SQLbarang +' ORDER BY namabarang asc ',True);
  sbr1.Panels[1].Text := IntToStr(dm.Qbarang.RecordCount)+' Data';
end;

procedure TFdatabarang.P1Click(Sender: TObject);
begin
  P1.Checked := NOT p1.Checked;
  with dm.Q1 do begin
    Close;
    SQL.Text := ' UPDATE barang SET warningiflimit=:warning WHERE kodebarang=:kodebarang';
    ParamByName('warning').AsBoolean := P1.Checked;
    ParamByName('kodebarang').AsString := GetVal(DM.QBarang,'kodebarang');
    ExecSQL;
  end;
end;

procedure TFdatabarang.pm1Popup(Sender: TObject);
begin
  if GetValBol(dm.QBarang,'warningiflimit') = True then begin
     P1.Checked := True;
     P1.Caption := 'Peringatan Jika Barang Limit [ AKTIF ]';
  end else begin
     P1.Checked := False;
     P1.Caption := 'Peringatan Jika Barang Limit [ NON AKTIF ]';
  end;
end;

procedure TFdatabarang.R1Click(Sender: TObject);
begin
  LoadData;
end;

end.
