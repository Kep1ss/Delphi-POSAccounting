unit uReturPembelian;

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
  uOvEdit, cxCalc, cxCurrencyEdit, Vcl.Menus, cxVariants,cxButtons, dxSkiniMaginary;

type
  TFreturPembelian = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ENobukti: TcxTextEdit;
    cxDateEdit1: TcxDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ENobuktiBeli: TcxTextEdit;
    ESupplier: TcxTextEdit;
    Label9: TLabel;
    Eketerangan: TcxTextEdit;
    Label10: TLabel;
    G2: TcxGroupBox;
    cxgGrid1DBTableView1: TcxGridDBTableView;
    cxgGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    dxBevel1: TdxBevel;
    cxgGrid1Level11: TcxGridLevel;
    cxgrd2: TcxGrid;
    G3: TcxGroupBox;
    cxgrd2TableView1: TcxGridTableView;
    CkodeBarcode: TcxGridColumn;
    cNamaBarang: TcxGridColumn;
    CSatuan: TcxGridColumn;
    cHarga: TcxGridColumn;
    cPPn: TcxGridColumn;
    cDiskonpersen: TcxGridColumn;
    cJumlah: TcxGridColumn;
    cSubtotal: TcxGridColumn;
    cIsi: TcxGridColumn;
    Label11: TLabel;
    cxDateEdit2: TcxDateEdit;
    Label12: TLabel;
    EPencarian: TcxTextEdit;
    cxgGrid1DBTableView1nobukti: TcxGridDBColumn;
    cxgGrid1DBTableView1namasupplier: TcxGridDBColumn;
    CJumlahRetur: TcxGridColumn;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    Label13: TLabel;
    Label15: TLabel;
    cbGudang: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cxgGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxgrd2TableView1Editing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxgrd2TableView1EditKeyUp(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure btnBaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure cxDateEdit2PropertiesChange(Sender: TObject);
    procedure EPencarianKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CJumlahReturPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    procedure TampilAwal;
    procedure BuatGrid;
    function SumCxGrid:String;
    { Public declarations }
  end;

  const
      SQLPembelian = ' SELECT                                     '+
                     '     p.idpembelian,                         '+
                     '     p.nobukti,                             '+
                     '     p.tgl,                                 '+
                     '     p.pembayaran,                          '+
                     '     p.idsupplier,                          '+
                     '     s.namasupplier,                        '+
                     '     p.iduser,                              '+
                     '     u.namalengkap,                         '+
                     '     p.total                                '+
                     '   FROM                                     '+
                     '     pembelian p                            '+
                     '     LEFT JOIN m_supplier s                 '+
                     '       ON s.`idsupplier` = p.`idsupplier`   '+
                     '     LEFT JOIN m_user u                     '+
                     '       ON u.`iduser` = p.`iduser`           ';

    _SQLDetailBeli = ' SELECT                                  '+
                     '     d.iddetilbeli,                      '+
                     '     d.nobukti,                          '+
                     '     d.kodebarang,                       '+
                     '     b.kodebarcode,                       '+
                     '     b.namabarang,                       '+
                     '     d.satuan,                           '+
                     '     d.harga,                            '+
                     '     d.jumlah,                           '+
                     '     d.diskonpersen,                     '+
                     '     d.diskonrupiah,                     '+
                     '     d.ppn,                              '+
                     '     d.subtotal,                         '+
                     '     d.isi,                              '+
                     '     d.idgudang,                         '+
                     '     l.namalokasi                        '+
                     '   FROM                                  '+
                     '     detailbeli d                        '+
                     '     LEFT JOIN barang b                  '+
                     '       ON d.`kodebarang` = b.`kodebarang`'+
                     '     LEFT JOIN lokasi l                  '+
                     '       ON l.`idlokasi` = d.`idgudang`';

var
  FreturPembelian: TFreturPembelian;
  aList : TStringList;

implementation

{$R *.dfm}

uses uDtrx, udm;

{ TFreturPembelian }

procedure TFreturPembelian.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFreturPembelian.btnSimpanClick(Sender: TObject);
var
  i : Integer;
  KodeBarang:String;
begin
  if NOT CheckEdit(Self) then
  begin
    addParam('nobukti',ENobukti.Text,aList,'str');
    addParam('tgl',frmTgl(cxDateEdit1.Date),aList,'date');
    addParam('nobuktibeli',ENobuktiBeli.Text,aList,'str');
    addParam('total',SumCxGrid,aList,'str');
    addParam('keterangan',Eketerangan.Text,aList,'str');

    exeDb(dm.Q1,'returpembelian',aList);
    with cxgrd2TableView1.DataController do begin
      for I := 0 to RecordCount -1 do   begin
        if VarToStr(Values[i,7]) <> '' then begin
          KodeBarang := getData(dm.Q2,'barang where kodebarcode="'+VarTOstr(Values[i,0])+'"','kodebarang');
          addParam('nobukti',ENobukti.Text,aList,'str');
          addParam('idgudang',GetIdcmb(cbGudang),aList,'int');
          addParam('kodebarang',KodeBarang,aList,'str');
          addParam('harga',VarToStr(Values[i,3]),aList,'str');
          addParam('diskonpersen',VarToStr(Values[i,5]),aList,'str');
          addParam('jumlah',VarToStr(Values[i,7]),aList,'str');
          addParam('isi',VarToStr(Values[i,9]),aList,'str');
          addParam('ppn',VarToStr(Values[i,4]),aList,'str');
          addParam('subtotal',VarToStr(Values[i,8]),aList,'str');
          addParam('satuan',VarToStr(Values[i,2]),aList,'str');

          exeDb(dm.Q2,'detailreturbeli',aList);
        end;
      end;
    end;


    TampilAwal;
  end;

end;

procedure TFreturPembelian.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFreturPembelian.BuatGrid;
var
  i,x : integer;

begin


 with cxgrd2TableView1.DataController do
  begin

      for i := 0 to RecordCount -1 do
      for x := 0 to GetItemCount -1 do
        Values[i,x] := '';

      RecordCount := 1;

  end;
end;

procedure TFreturPembelian.CJumlahReturPropertiesEditValueChanged(
  Sender: TObject);
var
  jumlah , harga, subtotal,isi,totalisi : Real;
  Edit: TcxCustomEdit;
  Value: Variant;
  View: TcxGridDBTableView;
  AnotherColumn: TcxGridColumn;

begin
  Edit := Sender as TcxCustomEdit;
  if VarIsNumericEx(Edit.EditValue) then
  begin
    Value := Edit.EditValue;
    Edit.PostEditValue;  // To 'stick' the new value in the active cell

    with cxgrd2TableView1.DataController do      begin
    OpenTable(dm.Q1,['isi'],'barang WHERE kodebarcode="'+VarToStr(Values[FocusedRecordIndex,0])+'"');
    isi           := GetValF(dm.Q1,'isi');
    Harga         := StrToFloatDef(VarToStr(Values[FocusedRecordIndex,3]),0);
    Jumlah        := StrToFloatDef(VarToStr(Values[FocusedRecordIndex,7]),0);
    subtotal      := jumlah * harga;
    totalisi      := isi * jumlah;
    AnotherColumn := cSubtotal;
    SetValue(FocusedRecordIndex,8,subtotal);
    SetValue(FocusedRecordIndex,9,totalisi);


    end;
  end;
end;

procedure TFreturPembelian.cxDateEdit2PropertiesChange(Sender: TObject);
begin
  ExQry(dtrx.QPembelian,SQLPembelian+' WHERE p.tgl="'+Tanggal(cxDateEdit2.Date)+'" AND returbeli=0',True);
end;

procedure TFreturPembelian.cxgGrid1DBTableView1DblClick(Sender: TObject);
var
  i : integer;
begin
   ExQry(dm.Q1,SQLPembelian+' WHERE nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'"',True);

   ENobuktiBeli.Text      := GetVal(dm.Q1,'nobukti');
   ESupplier.Text         := GetVal(dm.Q1,'namasupplier');
   i:=0;
   BuatGrid;
   ExQry(dm.Q2,_SQLDetailBeli+' WHERE nobukti="'+GetVal(dtrx.QPembelian,'nobukti')+'"',True);
   while dm.Q2.Eof = False do begin
     with cxgrd2TableView1.DataController do begin
       Values[i,0] := GetVal(dm.Q2,'kodebarcode');
       Values[i,1] := GetVal(dm.Q2,'namabarang');
       Values[i,2] := GetVal(dm.Q2,'satuan');
       Values[i,3] := GetVal(dm.Q2,'harga');
       Values[i,4] := GetVal(dm.Q2,'ppn');
       Values[i,5] := GetVal(dm.Q2,'diskonpersen');
      // Values[i,6] := GetVal(dm.Q2,'diskonrupiah');
       Values[i,6] := GetVal(dm.Q2,'jumlah');
       Values[i,7] := '';
       Values[i,8] := GetVal(dm.Q2,'subtotal');
       Values[i,9] := GetVal(dm.Q2,'isi');


       RecordCount := RecordCount + 1;
     end;
    Inc(i);
    dm.Q2.Next;
   end;
  cxgrd2.SetFocus;
  cxgrd2TableView1.Controller.FocusedRecordIndex := 0;
  cxgrd2TableView1.Controller.FocusedColumnIndex :=7;
  
end;

procedure TFreturPembelian.cxgrd2TableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
   AAllow := (Sender.Controller.FocusedItem.Index = 7);
   
end;

procedure TFreturPembelian.cxgrd2TableView1EditKeyUp(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  with  cxgrd2TableView1.DataController do
  if AEdit.EditingValue > Values[EditingRecordIndex,6] then
  begin
    Error('Jumlah Retur terlalu banyak');
    AEdit.EditValue := 0;
  end;
end;

procedure TFreturPembelian.EPencarianKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ExQry(dtrx.QPembelian,SQLPembelian+' WHERE '+
  ' s.namasupplier like"%'+Epencarian.Text+'%" OR p.nobukti like"%'+Epencarian.Text+'%" and returbeli=0',True);
end;

procedure TFreturPembelian.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFreturPembelian.FormCreate(Sender: TObject);
begin
  FreturPembelian := Self;
  setTanggal(Self);
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudang);
end;

procedure TFreturPembelian.FormShow(Sender: TObject);
begin
  alist := TStringList.Create;
end;

function TFreturPembelian.SumCxGrid: String;
var
  i : integer;
  Total : Real;
begin
  Total := 0;
  with cxgrd2TableView1.DataController do begin
  for i := 0 to RecordCount -1 do
    begin
     if VarToStr(Values[i,8]) <> '' then
     
      total := Total + StrToFloatDef(VarToStr(Values[i,9]),0);
    end;
  end;
  Result := FloatToStr(TOtal);

end;

procedure TFreturPembelian.TampilAwal;
begin
  ClearText(Self);
  ENobukti.Text := GetCode(dm.Q1,'returpembelian','nobukti','RB'+setIdKom);
  BuatGrid;
  OpenTable(dm.Q1,['*'],'profile');
  cbGudang.ItemIndex := idxCmb(cbGudang,GetValInt(dm.Q1,'gudangterima'));
  ExQry(dtrx.QPembelian,SQLPembelian+' WHERE tgl="'+Tanggal(cxDateEdit2.Date)+'" AND '+
  ' returbeli=0',True);
end;

end.
