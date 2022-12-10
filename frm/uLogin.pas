unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Light, Vcl.Menus,dxNavBar,dxNavBarCollns, Vcl.StdCtrls, cxButtons, cxTextEdit,
   cxImage, dxBevel, uComCtrl, uEngine, uOvEdit, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxGDIPlusClasses, dxSkinSharp,
  dxSkinMcSkin, dxSkiniMaginary, dxSkinOffice2010Blue, IniFiles,dxSkinOffice2016Colorful,
  dxSkinMoneyTwins,DateUtils, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,dxBar,dxRibbon,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinTheBezier;

type
  TFlogin = class(TForm)
    Label1: TLabel;
    EUserName: TcxTextEdit;
    EPassword: TcxTextEdit;
    btnLogin: TcxButton;
    btnBatal: TcxButton;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    procedure btnBatalClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EUserNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
  procedure Login;
    { Public declarations }
  end;



var
  Flogin: TFlogin;

implementation

{$R *.dfm}

uses uMainMenu,udm, uSetingDatabase, uPenjualan, uResetData;


procedure CreateId(user:string);
var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'SetUser.ini');
  try
     aIni.WriteString('USER','user',user);
  finally
    aIni.Free;

  end;
end;

function IsFormOpen(const FormName : string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Screen.FormCount - 1 DownTo 0 do
    if (Screen.Forms[i].Name = FormName) then
    begin
      Result := True;
      Break;
    end;
end;

procedure TFlogin.btnBatalClick(Sender: TObject);
begin

  Application.Terminate;
end;

procedure TFlogin.btnLoginClick(Sender: TObject);
var
  i: Integer;
  saldoawal : real;
begin

  if (EUserName.Text <> '') and (EPassword.Text <> '') then
  begin
    setKoneksi(dm.con1);
    dm.con1.Connect;

    if dm.con1.Connected  then begin


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
             FPenjualanBarang.ShowMOdal;
             ModalResult := mrOk;
             Close;
          end else begin

                ExQry(dm.Q2,'select * from hakakes where iduser="'+GetVal(dm.Q1,'iduser')+'"',True);

                if dm.Q2.IsEmpty then begin
                  MessageDlg('User tidak memiliki hak akses sistem',mtError,[mbYes],0);
                end else
                begin

                    while dm.Q2.Eof = False do begin

                         with Fmain do begin
                            for I := 0 to ComponentCount -1 do begin
                              if (Components[i] is TdxRibbonTab) then begin
                                  if TdxRibbonTab(Components[i]).Caption = Trim(GetVal(dm.Q2,'menu')) then
                                     begin
                                       if dm.Q2.FieldByName('tampil').AsBoolean = True then begin
                                          TdxRibbonTab(Components[i]).Visible := True;
                                       end else
                                          TdxRibbonTab(Components[i]).Visible := False;
                                     end;
                              end else
                              if (Components[i] is TdxBarLargeButton) then begin
                                  if TdxBarLargeButton(Components[i]).Caption = Trim(GetVal(dm.Q2,'akses')) then
                                     begin
                                       if dm.Q2.FieldByName('tampil').AsBoolean = True then
                                          TdxBarLargeButton(Components[i]).Enabled := True else
                                          TdxBarLargeButton(Components[i]).Enabled := False;
                                     end;
                              end;
                            end;


                          end;
                          dm.Q2.Next;
                        end;
                    Fmain.sbr1.Panels[2].Text := GetVal(dm.Q1,'username');
                    Fmain.sbr1.Panels[1].Text := GetVal(dm.Q1,'iduser');
                    Fmain.sbr1.Panels[4].Text := GetVal(dm.Q1,'level');
                    UserAktif(GetVal(dm.Q1,'iduser'));


                    ModalResult := mrOk;
                  end;
          end;

        end;
    end else begin
      if not Assigned(FsettingDatabase) then
         Application.CreateForm(TFsettingDatabase, FsettingDatabase);
      FsettingDatabase.ShowModal;

    end;
  end;
end;


procedure TFlogin.EPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnLogin.Click;
  end;
end;

procedure TFlogin.EUserNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Key = 82) and (Shift = [ssCtrl]) then
  begin
    FresetData.ShowModal;
  end;
end;

procedure TFlogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(self);
end;

procedure TFlogin.FormCreate(Sender: TObject);
begin

  EPassword.FocusNextOnEnter := False;
  EPassword.isPassword := True;
  EUserName.isPassword := True;
 
  Fmain.Hide;
end;

procedure TFlogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (Key=#27) then
   begin
   Application.Terminate;
   end;
end;

procedure TFlogin.FormShow(Sender: TObject);
begin
 { SetKoneksi(dm.con1);
  if dm.con1.Connected = False then begin
        Application.CreateForm(TFsettingDatabase,FsettingDatabase);
        FsettingDatabase.ShowModal;
        Application.ShowMainForm := False;
  end; }
end;

procedure TFlogin.Login;
begin
  with TFlogin.Create(nil) do
  try
    Application.MainForm.Hide;
    if ShowModal = mrOk then
       Application.MainForm.Show
    else
       Application.Terminate;

  finally
    Free;
  end;
end;

end.
