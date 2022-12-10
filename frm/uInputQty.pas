unit uInputQty;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uctrlFrm;

type
  TFinputQty = class(TForm)
    Eqty: TEdit;
    Lnamabarang: TLabel;
    procedure EqtyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EqtyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FinputQty: TFinputQty;

implementation

{$R *.dfm}

uses uPenjualan;

procedure TFinputQty.EqtyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
     FPenjualanBarang.sg1.Cells[4,FPenjualanBarang.sg1.Row] := Eqty.Text;
     FPenjualanBarang.HitungSubtotal(FPenjualanBarang.sg1.Row);
     FPenjualanBarang.HitungTotal;
     FPenjualanBarang.Focus;
     Eqty.Clear;
     Close;

  end;
end;

procedure TFinputQty.EqtyKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#10,#13,#8,',','.']) then
       Key := #0;

end;

end.
