unit uSetoranKasir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.ComCtrls,
  Vcl.StdCtrls, cxGroupBox, uEngine, uComCtrl, Vcl.Menus, cxButtons, Data.DB,
  MemDS, DBAccess, MyAccess, frxClass, frxDBSet;

type
  TFSetoranKasir = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dt1: TDateTimePicker;
    cxGroupBox2: TcxGroupBox;
    sg: TAdvStringGrid;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    frxReport1: TfrxReport;
    frSetoranKasir: TfrxDBDataset;
    QSetoranKasir: TMyQuery;
    procedure FormShow(Sender: TObject);
    procedure sgCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: string);
    procedure sgKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateGrid;
    procedure LoadData(tgl:TDate);
  public
    { Public declarations }
    varDt1 : TDate;
    varDt2 : TDate;
  end;

var
  FSetoranKasir: TFSetoranKasir;

implementation

{$R *.dfm}

uses udm, uPrintSetoranKasir;

{ TFSetoranKasir }

procedure TFSetoranKasir.CreateGrid;
begin
  with sg do begin
    ClearAll;

    ColCount := 12;
    RowCount := 2;

    Cells[0,0] := 'NO';
    Cells[1,0] := 'Kasir';
    Cells[2,0] := 'Total Penjualan';
    Cells[3,0] := 'Pembulatan';
    Cells[4,0] := 'Diskon';
    Cells[5,0] := 'Non Tunai';
    Cells[6,0] := 'Pemb. Poin';
    Cells[7,0] := 'Tunai';
    Cells[8,0] := 'Penjualan Bersih';
    Cells[9,0] := 'Setoran Kasir';
    Cells[10,0]:= 'Selisih';
    Cells[11,0]:= 'iduser';

    ColWidths[0] := 50;
    ColWidths[1] := 100;
    ColWidths[2] := 150;
    ColWidths[3] := 100;
    ColWidths[4] := 80;
    ColWidths[5] := 100;
    ColWidths[6] := 100;
    ColWidths[7] := 150;
    ColWidths[8] := 150;
    ColWidths[9] := 150;
    ColWidths[10]:= 150;
    ColWidths[11]:= 0;

    ColumnSize.StretchColumn := 1;
    ColumnSize.Stretch := true;
  end;
end;

procedure TFSetoranKasir.cxButton1Click(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to sg.RowCount -1 do begin
    if StrToFloatDef(nilai(sg.Cells[9,i]),0) <> 0 then begin
       ExQry(dm.Q2,'SELECT id FROM setoran_kasir WHERE iduser="'+sg.Cells[11,i]+'" '+
       ' AND tgl="'+Tanggal(dt1.Date)+'"',True);

       if dm.Q2.IsEmpty then begin
          ExQry(dm.Q3,'INSERT INTO setoran_kasir(tgl,iduser,total_penjualan,'+
          'pembulatan,diskon,non_tunai,pembayaran_poin,'+
          'tunai,penjualan_bersih,setoran,selisih) VALUES ('+
          '"'+Tanggal(dt1.Date)+'","'+sg.Cells[11,i]+'",'+
          '"'+StrToDecimal(sg.Cells[2,i])+'","'+StrToDecimal(sg.Cells[3,i])+'",'+
          '"'+StrToDecimal(sg.Cells[4,i])+'","'+StrToDecimal(sg.Cells[5,i])+'",'+
          '"'+StrToDecimal(sg.Cells[6,i])+'","'+StrToDecimal(sg.Cells[7,i])+'",'+
          '"'+StrToDecimal(sg.Cells[8,i])+'","'+StrToDecimal(sg.Cells[9,i])+'",'+
          '"'+StrToDecimal(sg.Cells[10,i])+'")',False);

       end;
    end;
  end;
  Informasi('Data berhasil disimpan');
  LoadData(dt1.Date);

end;

procedure TFSetoranKasir.cxButton2Click(Sender: TObject);
begin
  FPrintSetoranKasir.ShowModal;

end;

procedure TFSetoranKasir.cxButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TFSetoranKasir.FormCreate(Sender: TObject);
begin
  FSetoranKasir := Self;
  dt1.Date := now;
end;

procedure TFSetoranKasir.FormShow(Sender: TObject);
begin
  dt1.Date := now;
  LoadData(dt1.Date);
end;

procedure TFSetoranKasir.LoadData(tgl: TDate);
var
  i : integer;
begin
  CreateGrid;
  ExQry(dm.Q1,'SELECT * FROM m_user',True);

  i := 1;

  sg.RowCount := dm.Q1.RecordCount + 2;
  while dm.Q1.Eof = False do begin
     ExQry(dm.Q2,'SELECT * FROM setoran_kasir WHERE tgl="'+Tanggal(tgl)+'" '+
     ' AND iduser="'+GetVal(dm.Q1,'iduser')+'" ',True);
     if dm.Q2.IsEmpty then begin
        ExQry(dm.Q4,' SELECT                               '+
                     '     SUM(p.total) as total,                    '+
                     '     SUM(diskon) as diskon,                     '+
                     '     SUM(pembulatan) as pembulatan,                  '+
                     '     SUM(grandtotal) as grandtotal,                  '+
                     '     SUM(bayar_poin) as bayarpoin,                  '+
                     '     SUM(nontunai) as nontunai,                   '+
                     '     SUM(grandtotal-nontunai) as tunai              '+
                     '   FROM                               '+
                     '     penjualan p                      '+
                    ' WHERE  p.tgljual="'+FOrmatDateTIme('yyyy-mm-dd',tgl)+'" '+
                    ' AND  p.iduser="'+GetVal(dm.Q1,'iduser')+'"',True);
        sg.Cells[0,i] := IntToStr(i);
        sg.Cells[1,i] := GetVal(dm.Q1,'namalengkap');
        sg.Cells[2,i] := GetVal(dm.Q4,'total');
        sg.Cells[3,i] := GetVal(dm.Q4,'pembulatan');
        sg.Cells[4,i] := GetVal(dm.Q4,'diskon');
        sg.Cells[5,i] := GetVal(dm.Q4,'nontunai');
        sg.Cells[6,i] := GetVal(dm.Q4,'bayarpoin');
        sg.Cells[7,i] := GetVal(dm.Q4,'tunai');
        sg.Cells[8,i] := Format('%.0n',[GetValF(dm.Q4,'total')+GetValF(dm.Q4,'pembulatan')-GetValF(dm.Q4,'diskon')]);
        sg.Cells[9,i] := '';
        sg.Cells[10,i] := '';
        sg.Cells[11,i] := GetVal(dm.Q1,'iduser');
     end else begin
        sg.Cells[0,i] := IntToStr(i);
        sg.Cells[1,i] := GetVal(dm.Q1,'namalengkap');
        sg.Cells[2,i] := GetVal(dm.Q2,'total_penjualan');
        sg.Cells[3,i] := GetVal(dm.Q2,'pembulatan');
        sg.Cells[4,i] := GetVal(dm.Q2,'diskon');
        sg.Cells[5,i] := GetVal(dm.Q2,'non_tunai');
        sg.Cells[6,i] := GetVal(dm.Q2,'pembayaran_poin');
        sg.Cells[7,i] := GetVal(dm.Q2,'tunai');
        sg.Cells[8,i] := Format('%.0n',[GetValF(dm.Q2,'penjualan_bersih')]);
        sg.Cells[9,i] := GetVal(dm.Q2,'setoran');
        sg.Cells[10,i] := GetVal(dm.Q2,'selisih');;
        sg.Cells[11,i] := GetVal(dm.Q1,'iduser');
     end;
     inc(i);
     dm.Q1.Next;


  end;
  sg.FloatingFooter.Visible := true;
  for i := 0 to sg.ColCount -1 do begin
    if i > 1 then begin

    sg.FloatingFooter.ColumnCalc[i] := acSUM;
    end;

  end;
end;

procedure TFSetoranKasir.sgCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  ExQry(dm.Q1,'SELECT iduser FROM setoran_kasir WHERE iduser="'+sg.Cells[11,sg.Row]+'" AND tgl="'+Tanggal(dt1.Date)+'"',True);
  if dm.Q1.IsEmpty then begin
     CanEdit := ACol in [9];

  end else CanEdit := false;
end;

procedure TFSetoranKasir.sgGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
  var IsFloat: Boolean; var FloatFormat: string);
begin
  if ACol > 1 then begin
     IsFloat := True;
     FloatFormat := '%.0n';

  end;
end;

procedure TFSetoranKasir.sgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    TotalUnai , TotalSetor,Selisih : Real;
begin
  if sg.Col = 9 then begin
     TotalUnai  := StrToFloatDef(nilai(sg.Cells[7,sg.Row]),0);
     TOtalSetor := StrToFloatDef(nilai(sg.Cells[9,sg.Row]),0);
     Selisih    := TotalSetor - TotalUnai;

     sg.Cells[10,sg.Row]  := Format('%.0n',[Selisih]);



  end;
end;

end.
