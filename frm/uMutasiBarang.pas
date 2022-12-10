unit uMutasiBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxGridTableView,cxDataStorage,
  cxNavigator, cxGridCustomTableView, cxGridDBTableView,cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, cxMemo, cxMaskEdit, cxVariants,cxDropDownEdit,
  Vcl.ComCtrls, cxTextEdit, Vcl.StdCtrls, cxGroupBox, uComCtrl, uctrlFrm,
  uEngine, uOvEdit, uTerbilang, Vcl.Menus, cxButtons, cxCurrencyEdit,
  dxSkiniMaginary, dxSkinOffice2010Blue, dxSkinOffice2016Colorful,System.DateUtils,
  dxSkinMoneyTwins, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
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
  dxSkinXmas2008Blue, cxLabel, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFMutasiBarang = class(TForm)
    G1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ENoBukti: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    dt1: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbGudangAwal: TcxComboBox;
    cbGudangAKir: TcxComboBox;
    Label9: TLabel;
    cxgL: TcxGridLevel;
    cxg1: TcxGrid;
    cgtKodeBarang: TcxGridTableView;
    cxgrdclmnKodeBarang: TcxGridColumn;
    cxgrdclmnNamaBarang: TcxGridColumn;
    cxgrdclmnSatuan: TcxGridColumn;
    cxgrdclmnJumlahMutasi: TcxGridColumn;
    G2: TcxGroupBox;
    btnBaru: TcxButton;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    cxgrdclmnSisaStok: TcxGridColumn;
    btnCariBarang: TcxButton;
    cxgrdclmnIsi: TcxGridColumn;
    EKeterangan: TcxTextEdit;
    cxlbl1: TcxLabel;
    procedure btnBaruClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cgtKodeBarangEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure btnCariBarangClick(Sender: TObject);
    procedure cgtKodeBarangEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure cbGudangAKirPropertiesCloseUp(Sender: TObject);
    procedure cgtKodeBarangInitEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTutupClick(Sender: TObject);
    procedure cxgrdclmnJumlahMutasiPropertiesEditValueChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EKeteranganExit(Sender: TObject);
  private
    aList : TStringList;
    procedure PrintBukti(nobukti: string);
    { Private declarations }
  public
    procedure TampilAwal;
    procedure BuatGrid;
    function CheckItem(KodeBarang:string):Integer;
    function SumCxGrid:String;
    function CariIsi(barcode:string;Satuan:string):Extended;
    { Public declarations }
  end;

var
  FMutasiBarang: TFMutasiBarang;
  txt :string;

implementation

{$R *.dfm}

uses udm, uCariBarang, uMainMenu, uDlaporan;

{ TFMutasiBarang }

procedure TFMutasiBarang.btnBaruClick(Sender: TObject);
begin
  TampilAwal;
end;

procedure TFMutasiBarang.btnCariBarangClick(Sender: TObject);
begin

  ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' GROUP BY b.kodebarang',True);
  FcariBarang.isFormTransaksi := 2;
  FcariBarang.Show;
end;

procedure TFMutasiBarang.btnSimpanClick(Sender: TObject);
var
  i : Integer;
begin
  if NOT CheckEdit(Self) then begin
    addParam('nobukti',         ENoBukti.Text,aList,'str');
    addParam('tgl',             frmTgl(dt1.Date),aList,'date');
    addParam('iduser',          Fmain.sbr1.Panels[1].Text ,aList,'str');
    addParam('darigudang',      cbGudangAwal.Text,aList,'str');
    addParam('kegudang',        cbGudangAKir.Text,aList,'str');
    addParam('totalbarang',     SumCxGrid ,aList,'str');
    addParam('keterangan',      EKeterangan.Text,aList,'str');

    exeDb(dm.Q1,'mutasibarang',aList);
     with cgtKodeBarang.DataController do begin
        for i := 0 to RecordCount -1 do begin
        if VarToStr(Values[i,4]) <> '' then begin
          addParam('nobukti',        ENoBukti.Text,aList,'str');
          addParam('kodebarang',     VarToStr(Values[i,0]),aList,'str');
          addParam('satuan',         VarToStr(Values[i,2]),aList,'str');
          addParam('jmlmutasi',      VarToStr(Values[i,4]),aList,'str');
          addParam('isi',            VarToStr(Values[i,5]),aList,'str');
          addParam('idgudangawal',   GetIdcmb(cbGudangAwal),aList,'str');
          addParam('idgudangtujuan', GetIdcmb(cbGudangAKir),aList,'str');

          exeDb(dm.Q1,'detailmutasi',aList);

          PostingKartuStok
          (dm.Q1,ENoBukti.Text,dt1.Date,VarToStr(Values[i,0]),
          GetIdcmb(cbGudangAwal),VarToStr(Values[i,2]),0,'KELUAR',Values[i,4],
          'MUTASI BARANG');
          PostingKartuStok
          (dm.Q1,ENoBukti.Text,dt1.Date,VarToStr(Values[i,0]),
          GetIdcmb(cbGudangAKir),VarToStr(Values[i,2]),0,'MASUK',Values[i,4],
          'MUTASI BARANG');
        end;
        end;
     end;
     if MessageDlg('Cetak bukti mutasi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
        PrintBukti(ENoBukti.Text);
    TampilAwal;
  end;

end;

procedure TFMutasiBarang.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFMutasiBarang.BuatGrid;
var
  i,x : integer;

begin


 with cgtKodeBarang.DataController do
  begin

      for i := 0 to RecordCount -1 do
      for x := 0 to GetItemCount -1 do
        Values[i,x] := '';

      RecordCount := 100;

  end;
end;

function TFMutasiBarang.CariIsi(barcode, Satuan: string): Extended;
begin
    ExQry(dm.Q5,'select mt.isi from multisatuan mt '+
  ' WHERE mt.satuan="'+satuan+'" AND mt.kodebarcode="'+barcode+'"',True);

  if dm.Q5.IsEmpty then begin
     ExQry(dm.Q4,'SELECT isi FROM barang WHERE satuanbeli="'+satuan+'" AND kodebarcode="'+barcode+'"',TRue);
     Result :=   dm.Q4.Fields[0].AsFloat;
  end
  else
  begin
    Result := dm.Q5.Fields[0].AsFloat;
  end;
end;

procedure TFMutasiBarang.cbGudangAKirPropertiesCloseUp(Sender: TObject);
begin
  if cbGudangAwal.Text = cbGudangAKir.Text then
  begin
    Error('Gudang Awal dan gudang tujuan tidak boleh sama');
    cbGudangAKir.ItemIndex := not cbGudangAwal.ItemIndex;
    exit;
  end;
end;

procedure TFMutasiBarang.cgtKodeBarangEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
 AAllow := (Sender.Controller.FocusedItem.Index in [0,4]);
end;

procedure TFMutasiBarang.cgtKodeBarangEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
 var
  pas : Integer;
  sisaStok : real;

  jml      : Real;


begin
with cgtKodeBarang do begin
        Case AItem.Index of
        0 : if Key = 13 then
            begin
              if (cbGudangAwal.ItemIndex = -1) or (cbGudangAKir.ItemIndex = -1) then Error('Silahkan tentukan gudang') else
              begin
                txt := VarTOStr(AEdit.EditingValue);

                ExQry(dm.Q1,FcariBarang._SQLCaribarang+' where b.kodebarang="'+txt+'"',True);
                if (dm.Q1.IsEmpty) or (dm.Q1.RecordCount > 1) then begin
                   with DataController do begin
                   ExQry(dm.Qcaribarang,FcariBarang._SQLCaribarang+' WHERE '+
                   ' b.namabarang like"%'+VarToStr(Values[FocusedRecordIndex,0])+'%" '+
                   ' or b.kodebarcode like"%'+VarToStr(Values[FocusedRecordIndex,0])+'%"  GROUP BY b.kodebarang',True);
                   FcariBarang.isFormTransaksi := 2;
                   FcariBarang.Show;

                   end;
                end
                else begin
                    with DataController do begin
                    pas   := CheckItem(GetVal(dm.Q1,'kodebarang'));
                    ExQry(dm.Q1,'select SUM(saldoawal+masuk-keluar) as saldoakhir from kartustok WHERE kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" '+
                                ' AND idgudang="'+GetIdcmb(cbGudangAwal)+'" AND '+
                                ' month(tgl)="'+IntToStr(MonthOf(now))+'" '+
                                ' AND Year(tgl)="'+IntToStr(YearOf(now))+'"',True);
                    SisaStok := GetValF(dm.Q1,'saldoakhir');
                     with cgtKodeBarang.DataController do begin
                       if  pas > 0 then begin
                         Jml                          := StrToFloatDef(VarToStr(Values[pas-1,4]),0);
                         Values[pas -1,4]             := FloatToStr( Jml + 1 );

                         Values[pas -1,5]             := FloatToStr(GetValF(dm.Qbarang,'isi') * jml);

                         cxg1.SetFocus;
                         cgtKodeBarang.Controller.FocusedColumnIndex :=0;
                       end else
                       begin
                          if GetVal(dm.Q1,'kodebarang') <>'' then begin

                           Values[FocusedRecordIndex,0] := GetVal(dm.Q1,'kodebarang');
                           Values[FocusedRecordIndex,1] := GetVal(dm.Q1,'namabarang');
                           Values[FocusedRecordIndex,2] := GetVal(dm.Q1,'satuanjual');
                           Values[FocusedRecordIndex,3] := FloatToStr(SisaStok);
                           Values[FocusedRecordIndex,4] := '1';
                           if GetValF(dm.Q1,'isi') = 0 then
                           Values[FocusedRecordIndex,5] := 1 else
                           Values[FocusedRecordIndex,5] := GetVal(dm.Q1,'isi');
                           cxg1.SetFocus;

                           cgtKodeBarang.Controller.FocusedColumnIndex :=4;
                          end;
                        end;
                     end;
                  end;

                end;
              end;
            end;
        4 : if Key = 13 then
            begin

            //  DataController.RecordCount         := DataController.RecordCount +1;
              Controller.FocusedRecordIndex      := Controller.FocusedRecordIndex +1;
              Controller.FocusedColumnIndex      := 0;

            end;
        end;
     end;

end;

procedure TFMutasiBarang.cgtKodeBarangInitEdit(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
begin
   AEdit.Style.Color := clYellow;
end;

function TFMutasiBarang.CheckItem(kodebarang:string): Integer;
var
  i     : Integer;
  Hasil : integer;
begin
  Hasil := 0;
  with cgtKodeBarang.DataController  do begin
    for i := 0 to RecordCount -1 do begin
     if VarToStr(Values[i,0]) <> '' then begin
        if VarToStr(Values[i,0]) = kodebarang then begin
           Hasil := i +1;
           Break;
        end;
      end;
    end;
  end;
  Result := Hasil;
end;

procedure TFMutasiBarang.cxgrdclmnJumlahMutasiPropertiesEditValueChanged(
  Sender: TObject);
var
  jumlah ,Stok : Real;
  aEdit                        : TcxCustomEdit;
  Value                    : Double;
  IsiBeli                  : Real;
  TotalIsi                 : Real;

begin

  aEdit := Sender as TcxCustomEdit;

  if VarIsNumericEx(aEdit.EditValue) then

  begin

    Value := aEdit.EditValue;

    aEdit.PostEditValue;
    jumlah := Value;
    with cgtKodeBarang.DataController do      begin
      Stok := StrToFloatDef(VarToStr(Values[FocusedRecordIndex,3]),0);

      if jumlah > Stok then begin

        Error('JUMLAH MELEBIHI STOK');
        aEdit.EditValue := Stok;
       Exit;
      end;

      IsiBeli       := CariIsi(VarToStr(Values[FocusedRecordIndex,0]),VarToStr(Values[FocusedRecordIndex,2]));
      if IsiBeli = 0 then IsiBeli := 1;

      TotalIsi      := IsiBeli * jumlah;
      SetValue(FocusedRecordIndex,5,TotalIsi);
    end;
  end;
end;

procedure TFMutasiBarang.EKeteranganExit(Sender: TObject);
begin
   cgtKodeBarang.Controller.FocusedRowIndex        := 0;
   cgtKodeBarang.Controller.FocusedColumnIndex     := 0;
end;

procedure TFMutasiBarang.FormActivate(Sender: TObject);
begin
  cxg1.SetFocus;
  cgtKodeBarang.Controller.FocusedRowIndex        := cgtKodeBarang.Controller.FocusedRowIndex;
  cgtKodeBarang.Controller.FocusedColumnIndex     := 0;
end;

procedure TFMutasiBarang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  aList.Free;
end;

procedure TFMutasiBarang.FormCreate(Sender: TObject);
begin
  FMutasiBarang := Self;
  setTanggal(Self);
  DT1.Date := NOW;
end;

procedure TFMutasiBarang.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;
  setTanggal(Self);
end;

procedure TFMutasiBarang.PrintBukti(nobukti: string);
const _SQL = '  SELECT                            '+
             '       mb.nobukti,                  '+
             '       mb.tgl,                      '+
             '       mb.iduser,                   '+
             '       u.namalengkap,               '+
             '       mb.darigudang,               '+
             '       mb.kegudang,                 '+
             '       mb.totalbarang,              '+
             '       mb.keterangan                '+
             '     FROM                           '+
             '       mutasibarang mb              '+
             '       LEFT JOIN m_user u           '+
             '         ON u.`iduser` = mb.`iduser`';

begin
  ExQry(Dlaporan.QdatamutasiBarang,_SQL+' WHERE mb.nobukti="'+nobukti+'"',True);
  Dlaporan.Fr1.LoadFromFile(aPathRpt+'\frBuktiMutasi.fr3');
  Dlaporan.Fr1.ShowReport();
end;
function TFMutasiBarang.SumCxGrid: String;
var
  i : integer;
  Total : Real;
begin
  Total := 0;
  with cgtKodeBarang.DataController do begin
  for i := 0 to RecordCount -1 do
    begin
     if VarToStr(Values[i,4]) <> '' then

      total := Total + StrToFloatDef(VarToStr(Values[i,4]),0);
    end;
  end;
  Result := FloatToStr(TOtal);

end;

procedure TFMutasiBarang.TampilAwal;
begin
  ClearText(Self);
  ENobukti.Text := GetCode(dm.Q1,'mutasibarang','nobukti','MB');
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudangAwal);
  isiCmb(dm.Q1,'lokasi',['idlokasi','namalokasi'],cbGudangAKir);
  BuatGrid
end;

end.
