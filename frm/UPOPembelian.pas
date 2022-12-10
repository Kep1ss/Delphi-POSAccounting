unit UPOPembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, dxBevel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, Vcl.StdCtrls, cxGroupBox, uComCtrl, uctrlFrm, uEngine,
  uOvEdit, cxCalc, cxCurrencyEdit, Vcl.Menus, cxButtons, cxMemo, cxVariants,
  dxSkiniMaginary, cxLabel, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,DateUtils,
  dxSkinMoneyTwins, dxSkinFoggy, dxSkinGlassOceans, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TForderPembelian = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ENobukti: TcxTextEdit;
    cxDateEdit1: TcxDateEdit;
    Label6: TLabel;
    Label8: TLabel;
    ESupplier: TcxTextEdit;
    Label9: TLabel;
    Eketerangan: TcxTextEdit;
    Label10: TLabel;
    cxgGrid1Level11: TcxGridLevel;
    cxgrd2: TcxGrid;
    G3: TcxGroupBox;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    EKodeSupplier: TcxTextEdit;
    btnHapus: TcxButton;
    btnSupplier: TcxButton;
    btnCariBarang: TcxButton;
    cxgrd2TableView1: TcxGridTableView;
    CKodeBarang: TcxGridColumn;
    cxgrd2TableView1Column1: TcxGridColumn;
    cxgrd2TableView1Column2: TcxGridColumn;
    cxgrd2TableView1Column4: TcxGridColumn;
    cSubtotal: TcxGridColumn;
    cxgrd2TableView1Column6: TcxGridColumn;
    cxgrdclmncxgrd2TableView1Column3: TcxGridColumn;
    cxlbl1: TcxLabel;
    Etotal: TcxTextEdit;
    Label7: TLabel;
    Label5: TLabel;
    cbPembayaran: TcxComboBox;
    Label21: TLabel;
    cbAkun: TcxComboBox;
    Label11: TLabel;
    CheckBox1: TCheckBox;
    btnCariSupplier: TcxButton;
    cxgrd2TableView1Column3: TcxGridColumn;
    btnUbah: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxgrd2TableView1Editing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure btnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure btnCariBarangClick(Sender: TObject);
    procedure cxgrd2TableView1InitEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure cxgrd2TableView1EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure btnHapusClick(Sender: TObject);
    procedure cxgrd2TableView1Column4PropertiesEditValueChanged(
      Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
  private
    aList : TStringList;
    { Private declarations }
  public
    procedure TampilAwal;
    procedure BuatGrid;
    function SumCxGrid:String;
    procedure bersihCell;
    procedure ReplaceData;
    function CheckItem(KodeBarcode:string):Integer;
    procedure HitungTotal;
    procedure PrintPO(noBukti : string);
    { Public declarations }
  end;



var
  ForderPembelian: TForderPembelian;
  ShowHarga :Boolean;
  txt : string;

implementation

{$R *.dfm}

uses uDtrx, udm, uCariSupplier, uCariBarang, uDlaporan, uMainMenu,
  uInputDataBarang;

{ TFreturPembelian }

procedure TForderPembelian.bersihCell;
var
  i : integer;
begin
  with cxgrd2TableView1.DataController do begin
  for i := 0 to GetItemCount -1 do
      Values[FocusedRowIndex,i] := '';
  end;

end;

procedure TForderPembelian.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TForderPembelian.btnCariBarangClick(Sender: TObject);
begin
  FcariBarang.Show;
   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+'  GROUP BY b.kodebarang',True);
   FcariBarang.Show;
  FcariBarang.isFormTransaksi := 3;
end;

procedure TForderPembelian.btnHapusClick(Sender: TObject);
begin
with cxgrd2TableView1 do begin
if MessageDlg('Apakah yakin akan dihapus',mtConfirmation,[Mbyes,Mbno],0)=mrYes then
  begin
  if (DataController.RecordCount >= 1)  then
  begin
      try
         Controller.DeleteSelection;
      except
        Peringatan('Tidak ada data transaksi');
      end;
    end else
    Peringatan('Data yang dipilih kosong');
  end;
end;
end;

procedure TForderPembelian.btnSimpanClick(Sender: TObject);
var
  i: Integer;
  idSupplier : string;
begin
  if NOT CheckEdit(Self) then
  begin
    idSupplier := getData(dm.Q1,'m_supplier where kodesupplier="'+EKodeSupplier.Text+'"','idsupplier');
    addParam('nobukti',     ENobukti.Text,aList,'str');
    addParam('tgl',         frmTgl(cxDateEdit1.Date),aList,'date');
    addParam('idsupplier',  idSupplier,aList,'str');
    addParam('total',       Etotal.isAngka,aList,'str');
    addParam('keterangan',  Eketerangan.Text,aList,'str');
    addParam('createby', Fmain.sbr1.Panels[1].Text,aList,'str');

    exeDb(dm.Q1,'pobeli',aList);
    with cxgrd2TableView1.DataController do begin
      for I := 0 to RecordCount -1 do   begin
        if VarToStr(Values[i,4]) <> '' then begin

          addParam('nobukti',       ENobukti.Text,aList,'str');
          addParam('kodebarang',    VarTOstr(Values[i,0]),aList,'str');
          addParam('hargabeli',     VarToStr(Values[i,2]),aList,'str');
          addParam('satuan',        VarToStr(Values[i,3]),aList,'str');
          addParam('jumlah',        VarToStr(Values[i,4]),aList,'str');
          addParam('subtotal',      VarToStr(Values[i,5]),aList,'str');
          addParam('isi',           VarToStr(Values[i,6]),aList,'str');

          exeDb(dm.Q1,'pobelidetail',aList);
        end;
      end;
    end;
    if MessageDlg('Print PO pembelian',mtConfirmation,[mbYes,mbNo],0) =  mrYes then
       PrintPO(ENobukti.Text);
    TampilAwal;
  end;
end;

procedure TForderPembelian.btnSupplierClick(Sender: TObject);
begin
  FcariSupplier.Show;
  FcariSupplier.isFormSUpplier := 2;
end;

procedure TForderPembelian.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TForderPembelian.btnUbahClick(Sender: TObject);
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
                   '   b.ppn,                '+
                   '   b.stok,                '+
                   '   b.warningiflimit,    '+
                   '   h.hargabeli as hargabeliratarata     '+
                   ' FROM                   '+
                   '   barang b             '+
                   '   LEFT JOIN kategori k '+
                   '     ON b.`idkategori` = k.idkategori '+
                   '   LEFT JOIN hargabelirata h ON '+
                   '   h.kodebarang=b.kodebarang ';
var
  smb   : Tcxcombobox;
  stxt1 : TcxTextEdit;
  stxt2 : TcxTextEdit;
  stxt3 : TcxTextEdit;
  stxt4 : TcxTextEdit;
  stxt5 : TcxTextEdit;
  stxt6 : TcxTextEdit;
  stxt7 : TcxTextEdit;

  i     : Integer;
begin
  with cxgrd2TableView1.DataController do begin
      if Values[FocusedRecordIndex,0] = '' then begin

          if MessageDlg('Input barang Baru ???',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin

              Finputbarang.Show;
              FinputBarang.EHargaBeli.Enabled := True;
              FinputBarang.TampilanAwal;
              FinputBarang.CanEdit := False;
          end;

      end else
      begin


      with Finputbarang do  begin
         CanEdit := True;
         ExQry(dm.QBarang,_SQLbarang+' WHERE b.kodebarang="'+Values[FocusedRecordIndex,0]+'"',True);
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
         EHargaBeli.Enabled   := False;
         EHargaBeli.Text      := GetValCur(dm.QBarang,'hargabeli');
         EHargaSetelahPPN.Text:= getValCur(dm.QBarang,'HargaPPN');
         EHargaJual.Text      := GetValCur(dm.QBarang,'hargaecer');
         EHargaGrosir.Text    := GetValCur(dm.QBarang,'hargagrosir');
         EHargaPartai.Text    := GetValCur(dm.QBarang,'hargapartai');
         EMinimalOrder.Text   := GetValR(dm.QBarang,'minimalorder');
         Ecogs.Text           := GetValCur(dm.QBarang,'hargabeliratarata');

         idBarang             := GetVal(dm.QBarang,'idbarang');
         EnamaBarcode.Text    := GetVal(dm.QBarang,'namabarcode');

         OpenTable(dm.Q1,['*'],'multisatuan WHERE kodebarang="'+Ekodebarang.Text+'"');
         dm.Q1.RecNo := 2;
         i:=1;
         while not dm.Q1.Eof do begin

          if dm.Q1.RecNo >=2  then begin
           smb   := TcxComboBox(FindComponent('cbSatuan'+intTostr(i)));
           stxt1 := TcxTextEdit(FindComponent('EIsi'+intTostr(i)));
           stxt2 := TcxTextEdit(FindComponent('EHarga'+intTostr(i)));
           stxt3 := TcxTextEdit(FindComponent('EHargagrosir'+intTostr(i)));
           stxt4 := TcxTextEdit(FindComponent('EHargapartai'+intTostr(i)));
           stxt5 := TcxTextEdit(FindComponent('EHargapartai4'+intTostr(i)));
           stxt6 := TcxTextEdit(FindComponent('EHargapartai5'+intTostr(i)));
           stxt7 := TcxTextEdit(FindComponent('Ekodebarcode'+intTostr(i)));

           smb.Text   := GetVal(dm.Q1,'satuan');
           stxt1.Text := GetValR(dm.Q1,'isi');
           stxt2.Text := GetValR(dm.Q1,'harga');
           stxt3.Text := GetValR(dm.Q1,'hargagrosir');
           stxt4.Text := GetValR(dm.Q1,'hargapartai');
           stxt5.Text := GetValR(dm.Q1,'hargapartai4');
           stxt6.Text := GetValR(dm.Q1,'hargapartai5');
           stxt7.Text := GetVal(dm.Q1,'kodebarcode');
           Inc(i);
          end;
           dm.Q1.Next;


         end;

         OpenTable(dm.Q1,['*'],'multiqty WHERE kodebarang="'+Values[FocusedRecordIndex,0]+'"');
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

        Show;
      end;
    end;
  end;
end;

procedure TForderPembelian.BuatGrid;


begin
 with cxgrd2TableView1.DataController do
  begin
      RecordCount := 0;
      RecordCount := 50;
      FocusedRecordIndex := 0;
  end;
end;

function TForderPembelian.CheckItem(kodeBarcode:string): Integer;
var
  i     : Integer;
  Hasil : integer;
begin
  Hasil := 0;
  with cxgrd2TableView1.DataController  do begin
    for i := 0 to RecordCount -1 do begin
     if VarToStr(Values[i,0]) <> '' then begin
        if VarToStr(Values[i,0]) = KodeBarcode then begin
           Hasil := i +1;
           Break;
        end;
      end;
    end;
  end;
  Result := Hasil;
end;

procedure TForderPembelian.cxgrd2TableView1Column4PropertiesEditValueChanged(
  Sender: TObject);
var
  jumlah , Harga, Subtotal : Real;
  Edit                     : TcxCustomEdit;
  Value                    : Double;
  IsiBeli                  : Real;
  TotalIsi                 : Real;

begin

  Edit := Sender as TcxCustomEdit;

  if VarIsNumericEx(Edit.EditValue) then

  begin

    Value := Edit.EditValue;

    Edit.PostEditValue;
    jumlah := Value;
    with cxgrd2TableView1.DataController do      begin
      OpenTable(dm.Q1,['isi'],'barang WHERE kodebarang="'+Values[FocusedRecordIndex,0]+'"');
      Harga         := Values[FocusedRecordIndex,2];
      IsiBeli       := GetValF(dm.Q1,'isi');
      Subtotal      := jumlah * Harga;
      TotalIsi      := IsiBeli * jumlah;
      SetValue(FocusedRecordIndex,5,Subtotal);
      SetValue(FocusedRecordIndex,6,TotalIsi);
      HitungTotal;
    end;
  end;

end;
procedure TForderPembelian.cxgrd2TableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
   AAllow := (Sender.Controller.FocusedItem.Index in [0, 4]);
end;

procedure TForderPembelian.cxgrd2TableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
  var
  pas : Integer;
  hrg      : real;
  jml      : Real;
  isiBeli  : Real;

begin
with cxgrd2TableView1 do begin
        Case AItem.Index of
        0 : if Key = 13 then
            begin
              txt := VarTOStr(AEdit.EditingValue);

              ExQry(dm.Q1,FcariBarang._SQLCaribarang+' where '+
              'kodebarcode="'+txt+'" or namabarang LIKE "%'+txt+'%"',True);
              if (dm.Q1.IsEmpty) or (dm.Q1.RecordCount > 1) then begin
                 with cxgrd2TableView1.DataController do begin
                   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE namabarang like"%'+VarToStr(Values[FocusedRecordIndex,0])+'%" '+
                   ' or kodebarcode like"%'+VarToStr(Values[FocusedRecordIndex,0])+'%" GROUP BY b.kodebarang',True);
                   FcariBarang.isFormTransaksi := 3;
                   FcariBarang.Show;
                 end;
              end
              else begin
                with cxgrd2TableView1.DataController do begin
                  pas   := CheckItem(txt);


                   if  pas > 0 then begin
                     isiBeli                      := GetValF(dm.Q1,'isi');
                     Jml                          := StrToFloatDef(VarToStr(Values[pas-1,4]),0);
                     Values[pas -1,4]             := FloatToStr( Jml + 1 );
                     hrg                          := StrToFloatDef(VarToStr(Values[pas-1,2]),0);
                     Values[pas -1,5]             := FloatToStr(hrg * StrToFloatDef(VarToStr(Values[pas-1,4]),0));
                     Values[pas -1,6]             := FloatToStr(jml * isibeli);
                     cxgrd2.SetFocus;
                     cxgrd2TableView1.Controller.FocusedColumnIndex :=0;
                   end else
                   begin
                     Values[FocusedRecordIndex,0] := GetVal(dm.Q1,'kodebarcode');
                     Values[FocusedRecordIndex,1] := GetVal(dm.Q1,'namabarang');
                     Values[FocusedRecordIndex,2] := GetVal(dm.Q1,'hargabeli');
                     Values[FocusedRecordIndex,3] := GetVal(dm.Q1,'satuanbeli');
                     Values[FocusedRecordIndex,4] := '1';
                     Values[FocusedRecordIndex,5] := GetVal(dm.Q1,'hargabeli');
                     Values[FocusedRecordIndex,6] := GetVal(dm.Q1,'isi');
                     cxgrd2.SetFocus;

                     cxgrd2TableView1.Controller.FocusedColumnIndex :=4;
                   end;
                  end;
              end;
            HitungTotal;
            end;
        4 : if Key = 13 then
            begin
              Controller.FocusedRecordIndex      := Controller.FocusedRecordIndex +1;
              Controller.FocusedColumnIndex      := 0;
            end;
        end;
     end;

end;

procedure TForderPembelian.cxgrd2TableView1InitEdit(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
begin
  AEdit.Style.Color := clYellow;
end;

procedure TForderPembelian.FormActivate(Sender: TObject);
begin
  cxgrd2.SetFocus;
  cxgrd2TableView1.Controller.FocusedColumnIndex := 0;
  cxgrd2TableView1.Controller.FocusedRecordIndex := cxgrd2TableView1.Controller.FocusedRecordIndex;
  
end;

procedure TForderPembelian.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TForderPembelian.FormCreate(Sender: TObject);
begin
  ForderPembelian := Self;
  setTanggal(Self);
end;

procedure TForderPembelian.FormShow(Sender: TObject);
begin
  alist := TStringList.Create;

  ExQry(dm.Q1,'SELECT * FROM m_user WHERE username="'+FMain.sbr1.Panels[2].Text+'"',True);

  ShowHarga := GetValBol(dm.Q1,'showHarga');


  if ShowHarga = True then
  begin
    cxgrd2TableView1Column2.visible :=True;
    Csubtotal.Visible := True;
    cxlbl1.Visible := True;
    Etotal.Visible := True;
  end else
  begin
    cxgrd2TableView1Column2.visible :=False;
    Csubtotal.Visible := False;
    cxlbl1.Visible := False;
    Etotal.Visible := False;
  end;

   ExQry(dm.Q2,'SELECT kodeakunperkiraan,namaakunperkiraan '+
  ' FROM m_akunperkiraan WHERE akunsubmaster in ("102","101")',True);
    cbAKun.Properties.Items.Clear;
  while not dm.Q2.Eof do begin
    cbAKun.Properties.Items.Add(
    GetVal(dm.Q2,'kodeakunperkiraan')+' | '+
    GetVal(dm.Q2,'namaakunperkiraan'));
    dm.Q2.Next;
  end;

  cbAkun.ItemIndex := 3;
  cbPembayaran.Properties.OnChange(Sender);
end;

procedure TForderPembelian.HitungTotal;
begin
  Etotal.Text := GetRupiah(SumCxGrid);
end;

procedure TForderPembelian.PrintPO(noBukti: string);
const
 SQLPO = ' SELECT                                         '+
         '       p.idpobeli,                              '+
         '       p.nobukti,                               '+
         '       p.tgl,                                   '+
         '       p.idsupplier,                            '+
         '       s.namasupplier,                          '+
         '       s.alamat,                                '+
         '       s.kota,                                  '+
         '       s.notelpon,                              '+
         '       u.namalengkap,                           '+
         '       p.total                                  '+
         '     FROM                                       '+
         '       pobeli p                                 '+
         '       LEFT JOIN m_supplier s                   '+
         '         ON s.`idsupplier` = p.`idsupplier`     '+
         '       LEFT JOIN m_user u                       '+
         '     ON u.iduser=p.createby                     ';
begin
  ExQry(Dlaporan.Qpobeli,SQLPO+' WHERE nobukti="'+nobukti+'"',True);

  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\cetakPO.fr3');
  Dlaporan.Fr1.PrepareReport(True);
  Dlaporan.Fr1.ShowReport();
end;

procedure TForderPembelian.ReplaceData;

  var
  i:integer;
begin
  With cxgrd2TableView1.DataController do begin
    for i := FocusedRecordIndex to RecordCount -1 do
    begin
      Values[i,0]:=Values[i+1,0];
      Values[i,1]:=Values[i+1,1];
      Values[i,2]:=Values[i+1,2];
      Values[i,3]:=Values[i+1,3];
      Values[i,4]:=Values[i+1,4];
      Values[i,5]:=Values[i+1,5];
      Values[i,6]:=Values[i+1,6];
    end;
  end;
end;

function TForderPembelian.SumCxGrid: String;
var
  i : integer;
  Total : Real;
begin
  Total := 0;
  with cxgrd2TableView1.DataController do begin
  for i := 0 to RecordCount -1 do
    begin
     if VarToStr(Values[i,5]) <> '' then
     
      total := Total + StrToFloatDef(VarToStr(Values[i,5]),0);
    end;
  end;
  Result := FloatToStr(TOtal);

end;

procedure TForderPembelian.TampilAwal;
begin
  ClearText(Self);
  cbPembayaran.ItemIndex := 0;
  BuatGrid;
  ENobukti.Text := GetCode(dm.Q1,'pobeli','nobukti','POB'+setIdKom);
end;

end.
