unit uAktivasi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,activex,Registry, Vcl.StdCtrls,
  System.Math,WbemScripting_TLB;

type
  TFAktivasi = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EhwProduct: TEdit;
    EHwId: TEdit;
    EserialNumb: TEdit;
    Es1: TEdit;
    Es2: TEdit;
    Es3: TEdit;
    Es4: TEdit;
    btn1: TButton;
    btn2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetMotherBoardSerial(var isRsult :TStrings);
  public
    { Public declarations }
  end;

var
  FAktivasi: TFAktivasi;

implementation

{$R *.dfm}

function setSerial(s: String): String;

var
  K:Array [0..11] of Char;
  mKey:String;

  i:byte;
begin
  mKey:='';
  strPCopy(K,pChar(UpperCase(S)));
  for i := 0 to (Length(S)-1) do
  begin
    Mkey:= mKey + chr(WORD(K[i]))+inttostr(i+9);
  end;
  Result:=mKey;

end;

Function deskripsi(Const S:String):String;
var
  i:byte;
  t:String;
begin
  for i := 1 to length(s) do
  begin
    t:=t+chr(ord(s[i])-64);
  end;
  Result:=t;
end;
procedure  GetMotherBoardSerial(var isRsult : TStrings);
var
  WMIServices : ISWbemServices;
  Root        : ISWbemObjectSet;
  Item        : Variant;
begin
    WMIServices := CoSWbemLocator.Create.ConnectServer('localhost', 'root\cimv2','', '', '', '', 0, nil);
    Root        := WMIServices.ExecQuery('Select product,SerialNumber From Win32_BaseBoard','WQL', 0, nil);
    Item        :=  Root.ItemIndex(0);
    isRsult.Add(VarToStr(Item.Product));
    isRsult.Add(VarToStr(Item.SerialNumber));
end;


procedure TFAktivasi.btn1Click(Sender: TObject);
var
  List:TStringList;

begin

  with TRegistry.Create do
  try

    RootKey:=HKEY_CURRENT_USER;
    OpenKey('\SOFTWARE\Anaba Software\active',False);

    if valueExists('Sn') then
    begin

      if Es1.Text+Es2.Text+Es3.Text+Es4.Text = Deskripsi(ReadString('Sn')) then
      begin

        MessageBox(handle,'Registrasi berhasil, Buka kembali program','Information',MB_ICONINFORMATION);
        Application.Terminate;

        try
          List:=TStringList.Create;

          list.NameValueSeparator :=':';
          list.Add('Serial:'+Es1.Text+Es2.Text+Es3.Text+Es4.Text);
        try
          List.SaveToFile(ExtractFilePath(Application.ExeName)+'cfn.sav');
        Except
          Showmessage('Error');
        end;
        finally
          Application.Terminate;
          List.Free;
      end;
      end else
      begin
        MessageDlg('Serial Tidak Cocok',mtInformation,[mbYes],0);

      end;
    end;
    CloseKey;
  finally
     Free;
  end;

end;
procedure TFAktivasi.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFAktivasi.FormCreate(Sender: TObject);
var
  isString : TStrings;
  Serial1,Serial2,SerialNumber, xText ,S1,S2,S3,S4,SetNumber  : String;
  i   : integer;
  jml : Integer;
begin

  isString := TStringList.Create;
  try
    CoInitialize(nil);
    GetMotherBoardSerial(isString);
    Serial1 :=  'A90'+isString[0]+'NOB';
    Serial2 :=  isString[1];
    CoUninitialize;
  finally
     isString.Free;
    CoUninitialize;
  end;

  SerialNumber  := CopY(Serial1,2,11)+Copy(Serial2,2,4)+'240989';

  if Length(SerialNumber) < 14 then
  begin
     jml := 14 - Length(SerialNumber);

     for i := 1 to jml do
       SerialNumber := SerialNumber + '0';
  end else if Length(SerialNumber) > 14 then
       SerialNumber :=  Copy(SerialNumber,1,14);

   EhwProduct.Text := Serial1;
   EHwId.Text      := Serial2;


   EserialNumb.Text := SerialNumber;
end;

procedure TFAktivasi.GetMotherBoardSerial(var isRsult: TStrings);
var
  WMIServices : ISWbemServices;
  Root        : ISWbemObjectSet;
  Item        : Variant;
begin
    WMIServices := CoSWbemLocator.Create.ConnectServer('localhost', 'root\cimv2','', '', '', '', 0, nil);
    Root        := WMIServices.ExecQuery('Select product,SerialNumber From Win32_BaseBoard','WQL', 0, nil);
    Item        :=  Root.ItemIndex(0);
    isRsult.Add(VarToStr(Item.Product));
    isRsult.Add(VarToStr(Item.SerialNumber));
end;


end.
