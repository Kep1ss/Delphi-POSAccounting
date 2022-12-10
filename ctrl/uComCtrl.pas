unit uComCtrl;

interface
uses

  SysUtils,Windows,dialogs,Forms,stdCtrls,cxTextEdit,cxDropDownEdit,
  Controls,Classes,FrxClass,Graphics,IniFIles,cxCalendar,cxDateUtils,
  Grids,DBgrids,ComCtrls,cxMemo,MyAccess,advgrid;


  function CheckEdit(aForm:TForm):Boolean;
  procedure ClearText(Aform:TForm);
  function GetRupiah(text:String):string;
  function Rupiah(Text:String;nEdit:TcxTextEdit):String;
  function nilai(Text:String):String;
  function Bulat(Text:String):String;
  function koma(Text:String):String;
  Function Freport(Fastreport:TFrxReport;ObjectName:String):TObject;
  Function FMemo(FastReport:TFrxReport;ObjectName:String):TFrxMemoView;
  function pesan(s : string ):Boolean;
  Procedure Peringatan(s : PChar);
  function SumGrid(Grid:TStringGrid;aCol:integer):String;
  function Tanggal(dt:TDateTime) : string;
  procedure setTanggal(aForm:TForm);
  procedure PrintInv(aFIle:String;rpt:TfrxReport);
  function BolStr(Abol:Boolean):String;
  procedure PesanErr(str:string);
  function frmTgl(dt:TDateTime):string;
  function ToGaji(value:Real):String;
  procedure Warning(s:String);
  procedure Error(s:String);
  procedure AturGrid(sg:TAdvStringGrid;ACOl:Integer);
  procedure Informasi(S:string);
  function setIdKom:string;
  function PrinterInvoice: String;
  function CheckAuto: Boolean;
  function StrToDecimal(text:string):String;
  function CellF(str : String):Real;
  function GetRupiahKoma(text:String):string;
  function KomaDatabase(text:String):string;
  function setIdUser:string;
  function SaveHarga:Boolean;
  procedure UserAktif(id:string);
  procedure AturGridx(sg:TAdvStringGrid;ACol:Integer);
  function SizeStruk : String;


implementation


function StrToDecimal(text:string):String;
begin
  text := StringReplace(text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]);
  text := StringReplace(text,FormatSettings.DecimalSeparator,'.',[rfReplaceAll]);
  if text = '' then
     Result :='0'
  else
     Result :=text;
end;

function CellF(str : String):Real;
begin
  Result := StrToFloatDef(StrToDecimal(str),0);
end;

function PrinterInvoice: String;
var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'SetKasir.ini');
  try
     Result := aIni.ReadString('KOMPUTER','printerinvoice','Default Printer');
  finally
    aIni.Free;

  end;
end;


function SizeStruk : String;
var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'SetKasir.ini');
  try
     Result := aIni.ReadString('KOMPUTER','Size','80 mm');
  finally
    aIni.Free;

  end;
end;
function CheckAuto: Boolean;

  var
  aIni : Tinifile;
begin
  aIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'SetKasir.ini');
  try
     Result := StrToBool(aIni.ReadString('KOMPUTER','AutoPrint','0'));
  finally
    aIni.Free;
  end;
end;

function setIdKom:string;
var
  aIni : TIniFile;

begin
   Aini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'SetKasir.Ini');
   try
      Result := aIni.ReadString('KOMPUTER','komputerid','1');
   finally
     Aini.Free;
   end;

end;

procedure UserAktif(id:string);
var
  aIni : TIniFile;

begin
   Aini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'SetUser.Ini');
   try
       aIni.WriteString('USER','user',id);
   finally
     Aini.Free;
   end;
end;


function setIdUser:string;
var
  aIni : TIniFile;

begin
   Aini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'SetUser.Ini');
   try
      Result := aIni.ReadString('USER','user','1');
   finally
     Aini.Free;
   end;

end;

function SaveHarga:Boolean;
var
  aIni : TIniFile;

begin
   Aini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'SetKasir.Ini');
   try
      Result := Aini.ReadBool('KOMPUTER','SaveHarga',False);
   finally
     Aini.Free;
   end;

end;

procedure AturGrid(sg:TAdvStringGrid;ACol:Integer);
  var
    Panjang,Lebar,tengah:Integer;

    i,j:integer;
begin
    panjang :=0;
    for i:=1 to sg.ColCount -2 do
    begin
      Panjang := Panjang + sg.ColWidths[i];
    end;

    Lebar := sg.Width - panjang;
    tengah := lebar div sg.ColCount ;


    for j:=1 to sg.ColCount -2 do
    begin
      sg.ColWidths[j] := sg.ColWidths[j] + tengah + 3;
    end;

    sg.ColumnSize.StretchColumn := ACol;
    sg.ColumnSize.Stretch       := True;
end;
procedure AturGridx(sg:TAdvStringGrid;ACol:Integer);
  var
    Panjang,Lebar,tengah:Integer;

    i,j:integer;
begin
    panjang :=0;
    for i:=1 to sg.ColCount -3 do
    begin
      Panjang := Panjang + sg.ColWidths[i];
    end;

    Lebar := sg.Width - panjang;
    tengah := lebar div sg.ColCount ;


    for j:=1 to sg.ColCount -3 do
    begin
      sg.ColWidths[j] := sg.ColWidths[j] + tengah + 3;
    end;

    sg.ColumnSize.StretchColumn := ACol;
    sg.ColumnSize.Stretch       := True;
end;

procedure Warning(s:String);
begin
  MessageDlg(s,mtWarning,[mbYes],0);
end;
procedure Error(s:String);
begin
  MessageDlg(s,mtError,[mbYes],0);
end;
procedure Informasi(s:String);
begin
  MessageDlg(s,mtInformation,[mbYes],0);
end;

function ToGaji(value:Real):String;
begin
  Result := FloatToStrF(value,ffNumber,20,2);
end;
function frmTgl(dt:TDateTime):string;
begin
  Result := FormatDateTime('dd/mm/yyyy',dt);
end;

procedure PesanErr(str:string);
begin
  MessageDlg(str,mtError,[mbYes],0);
end;

function BolStr(Abol:Boolean):String;
begin
  if Abol = True then
     Result := '1' else
     Result := '0';
end;
procedure PrintInv(aFile:string;rpt:TfrxReport);
var
  Prnt : TIniFile;

begin
  Prnt :=  TIniFile.Create(ExtractFilePath(Application.ExeName)+'ctrl.ini');
  try
    rpt.LoadFromFile(aFIle);
    rpt.PrepareReport;
    rpt.PrintOptions.Printer := Prnt.ReadString('Setting','Printer','Default Printer');
    if Prnt.ReadString('Setting','autoprint','0') = '0' then
    rpt.ShowReport
  else
    rpt.Print;
  finally
  Prnt.Free;
  end;

end;


function Tanggal(dt:TDateTime) : string;
begin
  Result := FormatDateTime('yyyy-mm-dd',dt);
end;

procedure setTanggal(aForm:TForm);
var
  i : integer;
begin
  with aForm do begin
    for i:=0 to ComponentCount -1 do begin
      if Components[i] is TcxDateEdit then
      TcxDateEdit(Components[i]).Date := now;
    end;
  end;
end;

function SumGrid(Grid:TStringGrid;aCol:integer):String;
var
  sum:real;
  i:integer;
begin
  sum := 0;
  for I := 1 to Grid.RowCount -1 do
  begin

    if Grid.Cells[aCol,i] <> '' then

    sum:=sum+StrToFloatDef(nilai(Grid.Cells[aCol,i]),0);
  end;

  Result := floattostr(Sum)
end;

function koma(Text:String):String;
begin
   if Text = '' then Text :='0';

   if Pos(',',Text) > 0 then
     Result := StringReplace(text,',',FormatSettings.DecimalSeparator,[RfReplaceAll]) else
   if Pos('.',Text) > 0 then
     Result := StringReplace(text,'.',FormatSettings.DecimalSeparator,[RfReplaceAll])
   else
     Result := Text;
end;


function komaDatabase(Text:String):String;
begin
   if Text = '' then Text :='0';
   if Pos(FormatSettings.DecimalSeparator,Text) > 0 then
     Result := StringReplace(text,FormatSettings.DecimalSeparator,'.',[RfReplaceAll]) else
     Result := Text;
end;


function GetRupiah(text:String):string;
var
  tulis:String;
  curr:Currency;
begin
  tulis:=text;
  Tulis:=StringReplace(tulis,',','',[RfreplaceAll,Rfignorecase]);
  tulis:=StringReplace(tulis,'.','',[RfReplaceAll,RfignoreCase]);
  curr:=StrtoCurrdef(tulis,0);
  Result:=FormatCurr('#,###',curr);
  if Result = '' then
     Result :='0';
end;

function GetRupiahKoma(text:String):string;
var
  tulis:String;
  curr:Currency;
begin
  tulis:=text;
  Tulis:=StringReplace(tulis,',','',[RfreplaceAll,Rfignorecase]);
  tulis:=StringReplace(tulis,'.','',[RfReplaceAll,RfignoreCase]);
  curr:=StrtoCurrdef(tulis,0);
  Result:=FormatCurr('#,##0.00',curr);
end;

function Rupiah(Text:String;nEdit:TcxTextEdit):String;
var
  tulis:String;
  Curr:Currency;
begin
  Tulis:=Text;
  tulis:=StringReplace(tulis,'.','',[RfReplaceAll,RfignoreCase]);
  curr:=StrtoCurrDef(tulis,0);
  nEdit.Text:=FormatCurr('#,###',curr);
  nEdit.SelStart:=Length(nEdit.Text);
end;


Function Nilai(Text:String):String;
begin
  if text = '' then text:='0';

  Result:=StringReplace(Text,'.','',[rfReplaceAll,rfIgnoreCase]);
end;


Function Freport(Fastreport:TFrxReport;ObjectName:String):TObject;
var
  i:Integer;
  Ketemu:Boolean;
begin
  Ketemu:=False;
  For i:=0 to FastReport.ComponentCount -1 do
    begin
      if lowercase(FastReport.Components[i].Name)=Lowercase(ObjectName) then
        begin
          Result:=Tobject(FastReport.Components[i]);
          Ketemu:=True;
          Break;
        end;
      end;
    if not ketemu then
      begin
        Result:=nil;
      end;
end;

Function FMemo(FastReport:TFrxReport;ObjectName:String):TFrxMemoView;
begin
  Result:=TFrxMemoView(Freport(FastReport,ObjectName));
end;

function CheckEdit(aForm:TForm):Boolean;
var
	I: integer;
begin
	with AForm do
	begin
		for I := 0 to ComponentCount -1 do
		begin
      if Components[I] is TcxComBobox then
			begin
				Result := (TcxComBobox(Components[I]).Tag = 0) AND (TcxComBobox(Components[I]).Text = '') AND (TcxComBobox(Components[I]).Enabled = True);
				if Result then
				begin
					MessageDLg('Data "'+UPPERCASE(TcxComBobox(Components[i]).Hint) +'" masih kosong ',
                      mtError,[mbOK],0);
					TcxComBobox(Components[i]).SetFocus;
					Break;
				end;
			end else
			if Components[I] is TcxTextEdit then
			begin
				Result := (TcxTextEdit(Components[I]).Tag = 0) AND (TcxTextEdit(Components[I]).Text = '') AND (TcxTextEdit(Components[I]).Enabled = True);
				if Result then
				begin
					MessageDLg('Data "'+UPPERCASE(TcxTextEdit(Components[i]).Hint) +'" masih kosong ',
                      mtError,[mbOK],0);
					TcxTextEdit(Components[i]).SetFocus;
					Break;
				end;
			end else

      if Components[I] is TcxMemo then
			begin
				Result := (TcxMemo(Components[I]).Tag = 0) AND (TcxMemo(Components[I]).Text = '') AND (TcxMemo(Components[I]).Enabled = True);
				if Result then
				begin
					MessageDLg('Data "'+UPPERCASE(TcxMemo(Components[i]).Hint) +'" masih kosong ',
                      mtError,[mbOK],0);
					TcxMemo(Components[i]).SetFocus;
					Break;
				end;
			end;
		end;
	end;
end;


procedure ClearText(Aform:TForm);
var
  i:integer;
begin
  with Aform do
  begin
    For i:=0 to ComponentCount -1 do
    begin
      if (Components[i] is TcxTextEdit)
       then
       if (TcxTextEdit(Components[i]).Tag <> 9) then

      begin
        TcxTextEdit(Components[i]).Text:='';
        TcxTextEdit(Components[i]).Style.Color :=clWhite;

      end;
      if (components[i] is TcxComBobox) then
      if (TcxComBobox(Components[i]).Tag <> 12) then
      begin
        TcxComBobox(Components[i]).Text :='';
      end;
      if (components[i] is TcxMemo) then
      if (TcxMemo(Components[i]).Tag <> 12) then
      begin
        TcxMemo(Components[i]).Text :='';
      end;
    end;
  end;
end;


Procedure Peringatan(s : PChar);
begin
    MessageBox(Application.handle,s,PChar('Warning'),MB_ICONWARNING);
end;



procedure DisableContrOL(aForm:TForm;const cArray : array of string;
                                ReEnable : boolean = False);
var
  AComponent: TComponent;

  i:integer;
begin

  with aform do
  begin
    for i := low(cArray) to High(cArray) do
    begin
      AComponent := FindComponent(cArray[i]);
      if Assigned(AComponent) then
        if (AComponent is TControl) then
        begin
          TControl(AComponent).Enabled := ReEnable;
        end;
    end;
  end;
end;

function pesan(s : string ):Boolean;
begin
  case MessageDlg('Apakah Yakin data '+ s+' akan dihapus?',mtConfirmation,[mbYes,mbNo],0) of
      mryes: Result:=True;
      mrNo:Result:=False;
  end;
end;


function Bulat(Text:String):String;
var
  angka : real;
  bil : real;
begin
  angka := StrToint(Copy(text,length(text)-1,2));
  //ShowMessage(FloatToStr(angka));
  if   (angka <100) and (angka <>0)then
  begin
    bil := 100 - angka;
    Result := GetRupiah(FloatTostr(StrToFLoatDef(Text,0)+bil));
  end else
    Result := GetRupiah(Text);
end;







{ TSetEdit }


end.
