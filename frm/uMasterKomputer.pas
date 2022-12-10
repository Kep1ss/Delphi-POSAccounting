aunit uMasterKomputer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, dxBevel, uComCtrl, uOvEdit, uctrlFrm, uEngine,
  dxSkinVisualStudio2013Light, cxMemo, dxSkinMcSkin, dxSkiniMaginary;

type
  TFinputKomputer = class(TForm)
    dxbvl1: TdxBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Enamakomputer: TcxTextEdit;
    btnSimpan: TcxButton;
    btnTutup: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    procedure TampilanAwal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FinputKomputer: TFinputKomputer;
  aList     : TStringList;

implementation
  uses
    udm,
  uDatakomputer, uInputDataBarang;

{$R *.dfm}

{ TFInputkomputer }

procedure TFinputkomputer.btnSimpanClick(Sender: TObject);
begin
  if not CheckEdit(Self) then begin
     addParam('namakomputer',Enamakomputer.Text,aList,'str');


     OpenTable(dm.Q1,['namakomputer'],'komputer where namakomputer="'+Enamakomputer.Text+'"');
    if dm.Q1.IsEmpty then
       exeDb(dm.Q1,'komputer',aList)
    else
       updatedb(dm.Q1,'komputer',aList,'namakomputer','"'+Enamakomputer.Text+'"');


    TampilanAwal;
    if FinputBarang.Showing then
    begin
       with FinputBarang do begin
        isiCmb(dm.Q1,'komputer',['idkomputer','namakomputer'],cbkomputerbeli);
        isiCmb(dm.Q1,'komputer',['idkomputer','namakomputer'],cbkomputerjual);
        isiCmb(dm.Q1,'komputer',['idkomputer','namakomputer'],cbkomputer1);
        isiCmb(dm.Q1,'komputer',['idkomputer','namakomputer'],cbkomputer2);
        isiCmb(dm.Q1,'komputer',['idkomputer','namakomputer'],cbkomputer3);
        isiCmb(dm.Q1,'komputer',['idkomputer','namakomputer'],cbkomputer4);
        isiCmb(dm.Q1,'komputer',['idkomputer','namakomputer'],cbkomputer5);
       end;
    end;
    if Assigned(FDatakomputer) then
    if FDatakomputer.CanEdit  then
      Close;
  end;

end;

procedure TFinputkomputer.btnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFinputkomputer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearText(Self);
  aList.Free;
end;

procedure TFinputkomputer.FormShow(Sender: TObject);
begin
  aList := TStringList.Create;
  Enamakomputer.SetFocus;
end;

procedure TFinputkomputer.TampilanAwal;
begin
  ClearText(Self);
  Enamakomputer.SetFocus;
  if Assigned(FDatakomputer) then
  FDatakomputer.LoadData;
end;

end.
