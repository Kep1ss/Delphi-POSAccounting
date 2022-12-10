unit usetHarga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uEngine, uComCtrl, Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TFsetHargaDefault = class(TForm)
    btn1: TButton;
    pb1: TProgressBar;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FsetHargaDefault: TFsetHargaDefault;

implementation

{$R *.dfm}

uses udm;

procedure TFsetHargaDefault.btn1Click(Sender: TObject);
begin
  ExQry(dm.Q1,'SELECT * FROM barang',True);
  pb1.Max := dm.Q1.RecordCount;
  pb1.Position := 0;
  while not dm.Q1.Eof do begin
    ExQry(dm.Q2,'SELECT * FROM multisatuan '+
    ' WHERE kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" AND satuan="'+GetVal(dm.Q1,'satuanjual')+'"',True);

    if dm.Q2.IsEmpty then begin
      with dm.Q3 do begin
        Close;
        SQL.Text :='INSERT INTO multisatuan '+
            ' (kodebarang,satuan,isi,harga,hargagrosir,hargapartai,kodebarcode) '+
            ' VALUES (:kodebarang,:satuan,:isi,:harga,:hargagrosir,:hargapartai,:kodebarcode)';
        ParamByName('kodebarang').AsString  := GetVal(dm.Q1,'kodebarang');
        ParamByName('satuan').AsString      := GetVal(dm.Q1,'satuanjual');
        ParamByName('isi').AsString         := '1';
        ParamByName('harga').AsString       := GetVal(dm.Q1,'hargaecer');
        ParamByName('hargagrosir').AsString := GetVal(dm.Q1,'hargagrosir');
        ParamByName('hargapartai').AsString := GetVal(dm.Q1,'hargapartai');
        ParamByName('kodebarcode').AsString := GetVal(dm.Q1,'kodebarcode');
        ExecSQL;
      end;
      end;

    ExQry(dm.Q2,'SELECT * FROM multisatuan '+
    ' WHERE kodebarang="'+GetVal(dm.Q1,'kodebarang')+'" AND satuan="'+GetVal(dm.Q1,'satuanbeli')+'"',True);

    if dm.Q2.IsEmpty then begin
      with dm.Q3 do begin
        Close;
        SQL.Text :='INSERT INTO multisatuan '+
            ' (kodebarang,satuan,isi,harga,hargagrosir,hargapartai,kodebarcode) '+
            ' VALUES (:kodebarang,:satuan,:isi,:harga,:hargagrosir,:hargapartai,:kodebarcode)';
        ParamByName('kodebarang').AsString  := GetVal(dm.Q1,'kodebarang');
        ParamByName('satuan').AsString      := GetVal(dm.Q1,'satuanbeli');
        ParamByName('isi').AsString         := GetVal(dm.Q1,'isi');
        ParamByName('harga').AsFloat        := GetValF(dm.Q1,'hargaecer') * GetValF(dm.Q1,'isi');
        ParamByName('hargagrosir').AsFloat := GetValF(dm.Q1,'hargaecer') * GetValF(dm.Q1,'isi');
        ParamByName('hargapartai').AsFloat := GetValF(dm.Q1,'hargaecer') * GetValF(dm.Q1,'isi');
        ParamByName('kodebarcode').AsString := '';
        ExecSQL;
      end;
      end;
    dm.Q1.Next;
    pb1.Position := dm.Q1.RecNo;
  end;
  pb1.Position := dm.Q1.RecordCount;
end;

procedure TFsetHargaDefault.btn2Click(Sender: TObject);
begin
  Close;
end;

end.
