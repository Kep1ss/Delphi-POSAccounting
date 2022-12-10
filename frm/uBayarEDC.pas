unit uBayarEDC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkiniMaginary,
  dxSkinMoneyTwins, dxSkinOffice2010Blue, uComCtrl,dxSkinOffice2016Colorful,
  Vcl.StdCtrls, cxTextEdit, uEngine, uctrlFrm, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFbayarEDC = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EMesinEDC: TcxTextEdit;
    lst1: TListBox;
    Label3: TLabel;
    Label4: TLabel;
    EKartuDebet: TcxTextEdit;
    btnOk: TButton;
    Label5: TLabel;
    Label6: TLabel;
    ENokartu: TcxTextEdit;
    procedure btnTutupClick(Sender: TObject);
    procedure EMesinEDCEnter(Sender: TObject);
    procedure EKartuDebetEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EMesinEDCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EKartuDebetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lst1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    MesinFocus : Boolean;
    { Public declarations }
  end;

var
  FbayarEDC: TFbayarEDC;

implementation

{$R *.dfm}

uses  udm, uBayar;

procedure TFbayarEDC.btnOkClick(Sender: TObject);
var
  Nominal , sucharge, totalNominal ,nominalsucharge: Real;
begin
  ExQry(dm.Q1,'SELECT * FROM masteredc WHERE namamesin="'+EMesinEDC.Text+'" AND '+
  ' kartudebet="'+EKartuDebet.Text+'"',True);

  if Fbayar.Ebayar.AsFLoat > 0 then begin
     Nominal := Fbayar.Ebayar.AsFLoat;
     sucharge := GetValF(dm.Q1,'sucharge');
     nominalsucharge :=  ROUND( Nominal * sucharge / 100);
     totalNominal := Nominal + nominalsucharge;
     Fbayar.Epersensucharge.Text := GetVal(dm.Q1,'sucharge');
     Fbayar.ENominalSurcharge.Text := Format('%.0n',[nominalsucharge]);
     Fbayar.ETotalNonTUnai.Text    := Format('%.0n',[totalNominal]);
  end else
  begin
    Fbayar.Ebayar.Text := Format('%.0n',[Fbayar.EGrandTotal.AsFLoat -Fbayar.ETUnai.AsFLoat]);
    Nominal := Fbayar.Ebayar.AsFLoat;
    sucharge := GetValF(dm.Q1,'sucharge');
    nominalsucharge :=  ROUND( Nominal * sucharge / 100);
    totalNominal := Nominal + nominalsucharge;
    Fbayar.Epersensucharge.Text   := GetVal(dm.Q1,'sucharge');
    Fbayar.ENominalSurcharge.Text := Format('%.0n',[nominalsucharge]);
    Fbayar.ETotalNonTUnai.Text    := Format('%.0n',[totalNominal]);
  end;
  Fbayar.Ebayar.SetFocus;
  Fbayar.NoKartu        := ENokartu.Text;
  Fbayar.Lmesin.Caption := EMesinEDC.Text;
  Fbayar.Lkartu.Caption := EKartuDebet.Text;
  Close;
end;

procedure TFbayarEDC.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFbayarEDC.EKartuDebetEnter(Sender: TObject);
begin
  MesinFocus := False;
end;

procedure TFbayarEDC.EKartuDebetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_RETURN : begin
                if MesinFocus = False then begin
                   ExQry(dm.Q1,' SELECT DISTINCT kartudebet FROM masteredc ',True);
                   lst1.Items.Clear;
                   while not dm.Q1.Eof do begin

                     lst1.Items.Add(GetVal(dm.Q1,'kartudebet'));
                     dm.Q1.Next;
                   end;
                   lst1.Left := EKartuDebet.Left;
                   lst1.Top  := EKartuDebet.Top + EKartuDebet.Height + 1;
                   lst1.Visible := True;
                   lst1.BringToFront;

                   lst1.SetFocus ;
                   lst1.ItemIndex := 0;

                    end;
              end;
  end;
end;

procedure TFbayarEDC.EMesinEDCEnter(Sender: TObject);
begin
   MesinFocus := True;
end;

procedure TFbayarEDC.EMesinEDCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
  VK_RETURN : begin
                if MesinFocus = True then begin
                   ExQry(dm.Q1,' SELECT DISTINCT namamesin FROM masteredc ',True);
                   lst1.Items.Clear;
                   while not dm.Q1.Eof do begin

                     lst1.Items.Add(GetVal(dm.Q1,'namamesin'));
                     dm.Q1.Next;
                   end;
                   lst1.Left := EMesinEDC.Left;
                   lst1.Top  := EMesinEDC.Top + EMesinEDC.Height + 1;
                   lst1.Visible := True;
                   lst1.BringToFront;

                   lst1.SetFocus ;
                   lst1.ItemIndex := 0;

                    end;
              end;
  end;


end;

procedure TFbayarEDC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key  of
  VK_SPACE : btnOk.Click;
  end;
end;

procedure TFbayarEDC.FormShow(Sender: TObject);
begin
  EMesinEDC.SetFocus;
  EMesinEDC.Text   := getData(dm.Q1,'masteredc WHERE idedc=1','namamesin');
  EKartuDebet.Text := getData(dm.Q1,'masteredc WHERE idedc=1','kartudebet');
  ENokartu.Text    := '';
end;

procedure TFbayarEDC.lst1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_RETURN : begin
                  if MesinFocus = True then begin

                    EMesinEDC.Text := lst1.Items[lst1.ItemIndex];
                    EKartuDebet.SetFocus;
                    lst1.Visible   := False;
                  end else
                  begin
                    EKartuDebet.Text := lst1.Items[lst1.ItemIndex];
                    btnOk.SetFocus;
                    lst1.Visible   := False;
                  end;
              end;
  end;
end;

end.
