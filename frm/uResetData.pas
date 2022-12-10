unit uResetData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFresetData = class(TForm)
    mmo1: TMemo;
    btnReset: TButton;
    btnTutup: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    cbBulan: TComboBox;
    dtTahun: TDateTimePicker;
    procedure btnTutupClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FresetData: TFresetData;

implementation

{$R *.dfm}

uses uPasswordAdmin, udm;

procedure TFresetData.btnResetClick(Sender: TObject);
begin
  FpasswordAdmin.isFOrmPassword := 2;
  FpasswordAdmin.ShowModal;
end;

procedure TFresetData.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFresetData.Button1Click(Sender: TObject);
var
  Masuk,Keluar,Stok : Real;
begin
   with dm.Q1 do begin
     Close;
     SQL.Text := 'SELECT kodebarang,namabarang FROM barang';
     Open;
   end;

   while not dm.Q1.Eof do begin
      with dm.Q2 do begin
        Close;
        SQL.Text := 'SELECT SUM(d.isi) as masuk FROM detailbeli d '+
        ' LEFT JOIN pembelian p on p.nobukti=d.nobukti '+
        ' WHERE kodebarang="'+dm.Q1.FieldByName('kodebarang').AsString+'" '+
        ' AND p.tgl >= "2022-9-1" AND p.tgl < "2022-10-1"';
        Open;

        Masuk := dm.Q2.FieldByName('masuk').AsFloat;

        Close;
        SQL.Text := 'SELECT SUM(d.isi) as keluar FROM penjualandetil d '+
        ' LEFT JOIN penjualan p on p.fakturjual=d.fakturjual '+
        ' WHERE kodebarang="'+dm.Q1.FieldByName('kodebarang').AsString+'" AND  '+
        ' p.tgljual>="2022-9-1" AND p.tgljual < "2022-10-1" ';
        Open;

        Keluar := dm.Q2.FieldByName('keluar').AsFloat;

        Stok := Masuk - Keluar;

      end;

      with dm.Q3 do begin
        Close;
        SQL.Text := 'UPDATE kartustok SET saldoawal="'+FloatToStr(stok)+'" '+
        ' where keterangan LIKE "%PROSES TUTUP%" '+
        ' and kodebarang="'+dm.Q1.FieldByName('kodebarang').AsString+'" '+
        ' and idgudang=2 ';
        ExecSQL;
      end;

      mmo1.Lines.Add('Update saldoawal '+dm.Q1.FieldByName('namabarang').AsString+'....');
      dm.Q1.Next;
   end;
end;

procedure TFresetData.FormShow(Sender: TObject);
begin
  mmo1.Lines.Clear;
  mmo1.Lines.Add('Host Name : '+ dm.con1.Server);
  mmo1.Lines.Add('Data Base : '+ dm.con1.Database);
  mmo1.Lines.Add('-------------------------');

end;

end.
