unit uGantiKasir;

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
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uEngine,
  uComCtrl, uctrlFrm, uOvEdit;

type
  TFGantiKasir = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    EUserName: TcxTextEdit;
    EPassword: TcxTextEdit;
    btnLogin: TcxButton;
    btnBatal: TcxButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGantiKasir: TFGantiKasir;

implementation

{$R *.dfm}

uses udm, uPenjualan, uMainMenu;

procedure TFGantiKasir.btnBatalClick(Sender: TObject);
begin
  Close;
end;

procedure TFGantiKasir.btnLoginClick(Sender: TObject);
begin
  ExQry(dm.Q1,' select * from m_user where username="'+EUserName.Text+'" '+
                    ' and pwd=MD5("'+EPassword.Text+'")',True);

        if dm.Q1.IsEmpty then begin
          MessageDlg('Username dan password tidak cocok',mtError,[mbYes],0);
          Exit;
        end else
        begin
          if GetVal(dm.Q1,'penjualan_only') = 'True' then begin

             Fmain.sbr1.Panels[2].Text := GetVal(dm.Q1,'username');
             Fmain.sbr1.Panels[1].Text := GetVal(dm.Q1,'iduser');
             Fmain.sbr1.Panels[4].Text := GetVal(dm.Q1,'level');
             UserAktif(GetVal(dm.Q1,'iduser'));
             FPenjualanBarang.stat1.Panels[1].Text := setIdKom;
             FPenjualanBarang.stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
             FPenjualanBarang.stat1.Panels[4].Text := Fmain.sbr1.Panels[2].Text;
             FPenjualanBarang.stat1.Panels[5].Text := Fmain.sbr1.Panels[4].Text;
             FPenjualanBarang.TampilAwal;

             Close;
          end else begin
             Fmain.sbr1.Panels[2].Text := GetVal(dm.Q1,'username');
             Fmain.sbr1.Panels[1].Text := GetVal(dm.Q1,'iduser');
             Fmain.sbr1.Panels[4].Text := GetVal(dm.Q1,'level');
             UserAktif(GetVal(dm.Q1,'iduser'));
             FPenjualanBarang.stat1.Panels[1].Text := setIdKom;
             FPenjualanBarang.stat1.Panels[3].Text := Fmain.sbr1.Panels[1].Text;
             FPenjualanBarang.stat1.Panels[4].Text := Fmain.sbr1.Panels[2].Text;
             FPenjualanBarang.stat1.Panels[5].Text := Fmain.sbr1.Panels[4].Text;
             Close;
          end;
        end;
end;

procedure TFGantiKasir.EPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnLogin.Click;
  end;
end;

procedure TFGantiKasir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(self);
end;

procedure TFGantiKasir.FormCreate(Sender: TObject);
begin
  EPassword.FocusNextOnEnter := False;
  EPassword.isPassword := True;
  EUserName.isPassword := True;
end;

end.
