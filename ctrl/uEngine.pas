unit uEngine;

interface
  uses
    windows,SysUtils,MyAccess,Classes,Dialogs,DateUtils,uDm,
    DB,IniFiles,ComCtrls,cxDropDownEdit,Controls, uComCtrl;

    procedure SetKoneksi(aCon : TMyConnection);
    procedure OpenTable(Q:TMyQuery;aField: array of string;aTable:string);
    procedure FreeQuery(Q:TMyQuery;Queri:string);
    procedure addParam(aField:string;aValue:string; var Params:TStringList;fType:string);
    procedure exeDb(Q:TMyQuery;aTable:string;aList: TStringList);
    procedure updatedb(Q:TMyQuery;aTable:string;aList:TStringList;aField,aValue:string);
    procedure DelDb(Q:TMyQuery;aTable:string;S,Key1:String;Val1:string);
    procedure ExQry(Q:TMyQuery;_SQL:String;isCari:Boolean);
    procedure isiCmb(Q:TMyQuery;aTable:string;aField:array of string;cb:TcxComboBox);
    function GetIdcmb(cmb:TcxCombobox):String;
    function idxCmb(cb:TcxComboBox;idx:Integer):Integer;
    function getData(Q:TMyQuery;aTable:string;aField:string):String;
    function AnyStringToDate(fmt, dt: String) : TDateTime;
    function GetVal(Q:TMyQuery;aFIeld:string):String;
    function GetValF(Q:TMyQuery;aFIeld:string):Extended;
    function getValCur(Q:TMyQuery;aField:string):String;
    function GetValBol(Q:TMyQuery;aField:string):Boolean;
    function GetValInt(Q:TMyQuery;AField:string):Integer;
    function GetValDate(Q:TMyQuery;aFIeld:string):TDateTime;
    function GetCode(Q:TMyQuery;aTable:string;aField:string;s:string):string;
    function GetCodeB(Q:TMyQuery;aTable:string;aField:string;s:string):string;
    function GetValR(Q:TMyQuery;aFIeld:string):String;
    procedure Post(Q:TMyQuery;aTable:string;aList: TStringList);
    procedure updatePOST(Q:TMyQuery;aTable:string;aList:TStringList;aField,aValue:string);
    procedure PostingJurnal(Q:TMyQuery;noakun:string;nobukti:string;keterangan:string;
            tgl:TDate;nominal:Real;nominalBKP:Real;NominalNonBkp:Real;jnstrans:string);
    procedure PostingKartuStok(Q:TMyQuery;nobukti:string;tgl:TDate;kodebarang:string;
              idgudang:string;satuan:string;hargabeli:Real;IO:string;jml:Real;
              keterangan:string);

    procedure AddHistory(Ket:string;idUser:String);
    function SaldoRekening(Kode:string):Real;
    function isMinus : Boolean;
    function asPPn : Real;




implementation










function AnyStringToDate(fmt, dt: String) : TDateTime;
var
  fs : TFormatSettings;
Begin
  dt := StringReplace(dt,'/','-',[rfReplaceAll]);
  fs := TFormatSettings.Create;
  fs.DateSeparator := '-';
  fs.ShortDateFormat := fmt;

  result := StrToDateDef(dt, 0, fs);
End;

function GetValR(Q:TMyQuery;aFIeld:string):String;
begin
  Result := GetRupiah(Q.FieldByName(aFIeld).AsString);
end;

function GetValF(Q:TMyQuery;aFIeld:string):Extended;
begin
  Result := Q.FieldByName(aField).AsFloat;
end;

function getValCur(Q:TMyQuery;aField:string):String;
begin
  Result := Format('%.2n',[Q.FieldByName(aField).AsFloat]);
end;
function GetValDate(Q:TMyQuery;aFIeld:string):TDateTime;
begin
  Result := Q.FieldByName(aFIeld).AsDateTime;
end;
function GetValBol(Q:TMyQuery;aField:string):Boolean;
begin
  Result := Q.FieldByName(aFIeld).AsBoolean;
end;
function GetValInt(Q:TMyQuery;AField:string):Integer;
begin
  Result :=Q.FieldbyName(AField).AsInteger;
end;
function idxCmb(cb:TcxComboBox;idx:Integer):Integer;
begin
  cb.ItemIndex  := cb.Properties.Items.IndexOfObject(TObject(idx));
end;
procedure SetKoneksi(aCon : TMyConnection);
var
  Aini : TINIFIle;
begin
   Aini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'Config.Ini');
  try
    with aCon do
    begin
        Server    := Aini.ReadString('Database','Host','');
        port      := Strtoint(Aini.ReadString('Database','Port','0'));
        Database  := Aini.ReadString('Database','DB','');
        UserName  := aini.ReadString('Database','User','');
        Password  := Aini.ReadString('Database','Pass','');
      end;
  finally
    Aini.Free;
  end;
end;
procedure OpenTable(Q:TMyQuery;aFIeld:array of String;aTable:string);
var
  i : integer;
  str : string;
begin

  for i:=Low(aField) to High(aFIeld) do
      str := str + aField[i]+',';
  Delete(str,Length(str),1);
  with Q do begin
    Close;
    SQL.Text  := ' SELECT ';
    SQL.Add(str);
    SQL.Add(' FROM '+aTable);
    Open;
  end;

end;
procedure FreeQuery(Q:TMyQuery;Queri:string);
begin
  with Q do begin
    Close;
    Sql.Clear;
    SQL.Add(Queri);
    Open;
  end;
end;
function GetVal(Q:TMyQuery;aFIeld:string):string;
begin
  Result := Q.FieldByName(aFIeld).AsString;
end;

procedure addParam(aField:string;aValue:string; var Params:TStringList;fType:string);
begin
  if fType = 'date' then
     aValue := 'STR_TO_DATE("'+aValue+'","%d/%m/%Y")'
  else if fType ='int' then
     aValue := aValue
  else if fType ='str' then
     aValue := '"'+aValue+'"'
  else if fType ='pwd' then
     aValue := 'MD5("'+aValue+'")';

  Params.Add(aField+','+aValue);
end;

procedure exeDb(Q:TMyQuery;aTable:string;aList   : TStringList);
var
  i       : Integer;
  aFIeld  : string;
  aValue  : String;
begin
    for i:= 0 to aList.Count -1 do begin
      aFIeld  := aField+Copy(aList[i],1,Pos(',',aList[i])-1)+',';
      aValue  := aValue+Copy(aList[i],Pos(',',aList[i])+1,Length(aList[i]))+',';
    end;
    Delete(aFIeld,Length(aFIeld),1);
    Delete(aValue,Length(aValue),1);

    Q.Connection.StartTransaction;
    try
    with Q do begin
      Close;
      SQL.Text := 'INSERT INTO '+Atable+' ('+aField+') Values ('+aValue+')';

      ExecSQL;
    end;
    Q.Connection.Commit;
    except
 //
      on E:Exception do begin
        Q.Connection.Rollback;
        MessageDlg('Gagal input Data : '+#13+' Pesan Error : '+E.Message+#13+
        ' SQL Script : '+Q.SQL.Text,
        mtError,[mbOK],0);
      end;
    end;

    aList.Clear;

end;


function isMinus : Boolean;

begin

      ExQry(dm.QFree,'SELECT stokmin FROM profile WHERE idprofil=1',False);

      Result := GetValBol(dm.QFree,'stokmin');


end;
function asPPn : Real;
begin
  ExQry(dm.QFree,'SELECT ppn_pemerintah FROM profile WHERE idprofil=1',False);

      Result := GetValF(dm.QFree,'ppn_pemerintah');
end;

procedure Post(Q:TMyQuery;aTable:string;aList: TStringList);
var
  i       : Integer;
  aFIeld  : string;
  aValue  : String;
begin
    for i:= 0 to aList.Count -1 do begin
      aFIeld  := aField+Copy(aList[i],1,Pos(',',aList[i])-1)+',';
      aValue  := aValue+Copy(aList[i],Pos(',',aList[i])+1,Length(aList[i]))+',';
    end;
    Delete(aFIeld,Length(aFIeld),1);
    Delete(aValue,Length(aValue),1);


    try
    with Q do begin
      Close;
      SQL.Text := 'INSERT INTO '+Atable+' ('+aField+') Values ('+aValue+')';
      ExecSQL;
    end;

    except
 //
      on E:Exception do begin

        MessageDlg('Gagal input Data : '+#13+' Pesan Error : '+E.Message,
        mtError,[mbOK],0);
      end;
    end;

    aList.Clear;

end;

procedure updatedb(Q:TMyQuery;aTable:string;aList:TStringList;aField,aValue:string);
var
  i       : Integer;
  _SQL  : string;
  bField : String;
  vField : String;

begin
    for i:= 0 to aList.Count -1 do begin
      bFIeld  := Copy(aList[i],1,Pos(',',aList[i])-1);
      vField  := Copy(aList[i],Pos(',',aList[i])+1,Length(aList[i]));
      _SQL  := _SQL+ bField+'='+vFIeld+',';
    end;
    Delete(_SQL,Length(_SQL),1);
    Q.Connection.StartTransaction;
    try
    with Q do begin
      Close;
      SQL.Text := 'UPDATE '+Atable+' SET '+_SQL+' WHERE '+aField+'='+avalue+'';
      ExecSQL;
    end;
    Q.Connection.Commit;
    aList.Clear;
    except

      on E:Exception do begin
        Q.Connection.Rollback;
        MessageDlg('Gagal simpan data '+#13+' Pesan error : '+ E.Message,
               mtError,[mbYes],0);
      end;


    end;

end;

procedure updatePOST(Q:TMyQuery;aTable:string;aList:TStringList;aField,aValue:string);
var
  i       : Integer;
  _SQL  : string;
  bField : String;
  vField : String;

begin
    for i:= 0 to aList.Count -1 do begin
      bFIeld  := Copy(aList[i],1,Pos(',',aList[i])-1);
      vField  := Copy(aList[i],Pos(',',aList[i])+1,Length(aList[i]));
      _SQL  := _SQL+ bField+'='+vFIeld+',';
    end;
    Delete(_SQL,Length(_SQL),1);

    try
    with Q do begin
      Close;
      SQL.Text := 'UPDATE '+Atable+' SET '+_SQL+' WHERE '+aField+'='+avalue+'';
      ExecSQL;
    end;

    aList.Clear;
    except

      on E:Exception do begin

        MessageDlg('Gagal simpan data '+#13+' Pesan error : '+ E.Message,
               mtError,[mbYes],0);
      end;


    end;

end;
procedure ExQry(Q:TMyQuery;_SQL:String;isCari:Boolean);
begin
  try
    with Q do begin
      Close;
      SQL.Text :=_SQL;
      if isCari then
         Open
      else
         ExecSQL;
    end;
  except
    on E:Exception do
    MessageDlg('Perintah Query gagal'+#13+' Pesan Error '+
    #13+' '+E.Message,mtError,[mbYes],0);
    end;
end;
procedure DelDb(Q:TMyQuery;aTable:string;S,Key1:String;Val1:string);
begin
  if MessageDlg('Yakin data '+S+' Akan dihapus?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
     Q.Connection.StartTransaction;
    try
    with Q do  begin
      Close;
      SQL.Text := 'DELETE FROM '+aTable+' WHERE '+Key1+'='+Val1+'';
      ExecSQL;
    end;
    Q.Connection.Commit;
    except

    on E:Exception do
    begin
      MessageDlg('Gagal Hapus data '+#13+' Pesan error : '+ E.Message,
               mtError,[mbYes],0);
      Q.Connection.Rollback;
    end;
  end;
  end;
end;

procedure isiCmb(Q:TMyQuery;aTable:string;aField:array of string;cb:TcxComboBox);
var
  i       : integer;
  idx     : integer;
  aValue  : string;
  _SQl    : string;
begin

  for i:=Low(aField) to High(aFIeld) do
      _SQL:=_SQL+ aFIeld[i]+',';
  Delete(_SQl,Length(_SQl),1);

  with Q do begin
    Close;
    SQL.Text := 'SELECT '+_SQL+' FROM '+aTable;
    Open;

    cb.Properties.Items.Clear;

    while not Eof do begin
      idx     := Fields[0].AsInteger;
      aValue  := Fields[1].AsString;

      cb.Properties.Items.AddObject(aValue,TObject(idx));
      Next;
    end;
  end;
end;

function Getidcmb(cmb:TcxComboBox):String;
begin
  Result := Inttostr(integer(cmb.Properties.Items.Objects[cmb.ItemIndex]));
end;

function getData(Q:TMyQuery;aTable:string;aField:string):String;
begin
  with Q do begin
    Close;
    SQL.Text := ' SELECT '+aField+' from '+Atable+' ';
    Open;
  end;
   Result := Q.Fields[0].AsString;
end;
function GetCode(Q:TMyQuery;aTable:string;aField:string;s:string):string;
var
  x : Integer;
  k : string;
begin
  ExQry(Q,' SELECT MAX(RIGHT('+aField+',3)) as jml  '+
          ' FROM '+aTable+' WHERE '+aField+' '+
          ' LIKE"%'+s+setIdKom+FormatDateTime('yymmdd',now)+'%" ',True);
    if StrToIntDef(Q.Fields[0].AsString,0) =0 then x := 1
    else
       x := Q.Fields[0].AsInteger +1;
  k := IntToStr(x);
  k:= Copy('000'+k,length('000'+k)-2,3);
  result :=s+setIdKom+FormatDateTime('yymmdd',Now)+ k;

end;
function GetCodeB(Q:TMyQuery;aTable:string;aField:string;s:string):string;
var
  x : Integer;
  k : string;
begin
  ExQry(Q,' SELECT MAX(RIGHT('+aField+',3)) as jml  '+
          ' FROM '+aTable+' WHERE '+aField+' '+
          ' LIKE"%'+FormatDateTime('yymmdd',now)+'%" ',True);
    if StrToIntDef(Q.Fields[0].AsString,0) =0 then x := 1
    else
       x := Q.Fields[0].AsInteger +1;
  k := IntToStr(x);
  k:= Copy('000'+k,length('000'+k)-2,3);
  result :=s+setIdKom+FormatDateTime('yymmdd',Now)+ k;

end;

procedure PostingJurnal(Q:TMyQuery;noakun:string;nobukti:string;keterangan:string;
tgl:TDate;nominal:Real;nominalBKP:Real;NominalNonBkp:Real;jnstrans:string);
var
  JenisAKun   : String;
begin

  ExQry(Q,'SELECT jenisakun From m_bukubesar bs '+
          'LEFT JOIN m_subbukubesar sb '+
          'ON sb.nomasterakun=bs.nomasterakun '+
          'LEFT JOIN m_akunperkiraan ak '+
          'ON ak.akunsubmaster=sb.akunsubmaster '+
          'WHERE ak.kodeakunperkiraan="'+noakun+'"',True);

  JenisAKun  := GetVal(Q,'jenisakun');



    if jnstrans = 'D' then begin
      if JenisAKun = 'A' then
          ExQry(Q,' INSERT INTO saldoakun (noakun, nobukti,keterangan, tgl, debet, nominalbkp,nominalnonbkp,iduser)  '+
                ' VALUES                                                            '+
                '  (                                                                '+
                '    "'+noakun+'",                                                  '+
                '    "'+nobukti+'",                                                 '+
                '    "'+keterangan+'",                                              '+
                '    "'+Tanggal(tgl)+'",                                            '+
                '    "'+KomaDatabase(FloatToStr(nominal))+'",                       '+
                '    "'+KomaDatabase(FloatToStr(nominalBKP))+'",'+
                '    "'+KomaDatabase(FloatToStr(NominalNonBkp))+'","'+setIdUser+'"   '+
                '  )',False)

      else if  JenisAKun = 'P' then

          ExQry(Q,' INSERT INTO saldoakun (noakun, nobukti,keterangan, tgl, debet, nominalbkp,nominalnonbkp,iduser)'+
                ' VALUES                                                            '+
                '  (                                                                '+
                '    "'+noakun+'",                                                  '+
                '    "'+nobukti+'",                                                 '+
                '    "'+keterangan+'",                                              '+
                '    "'+Tanggal(tgl)+'",                                            '+
                '    "'+KomaDatabase(FloatToStr(nominal))+'",                       '+
                '    "'+KomaDatabase(FloatToStr(nominalBKP))+'",'+
                '    "'+KomaDatabase(FloatToStr(NominalNonBkp))+'","'+setIdUser+'"   '+
                '  )',False);
    end else if jnstrans = 'K' then begin
      IF JenisAKun = 'A' then
         ExQry(Q,' INSERT INTO saldoakun (noakun, nobukti,keterangan, tgl, kredit, nominalbkp,nominalnonbkp,iduser)'+
                ' VALUES                                                            '+
                '  (                                                                '+
                '    "'+noakun+'",                                                  '+
                '    "'+nobukti+'",                                                 '+
                '    "'+keterangan+'",                                              '+
                '    "'+Tanggal(tgl)+'",                                            '+
                '    "'+KomaDatabase(FloatToStr(nominal))+'",                       '+
                '    "'+KomaDatabase(FloatToStr(nominalBKP))+'",'+
                '    "'+KomaDatabase(FloatToStr(NominalNonBkp))+'","'+setIdUser+'"   '+
                '  )',False)
      else if JenisAKun = 'P' then
          ExQry(Q,' INSERT INTO saldoakun (noakun, nobukti,keterangan, tgl, kredit, nominalbkp,nominalnonbkp,iduser)'+
                ' VALUES                                                            '+
                '  (                                                                '+
                '    "'+noakun+'",                                                  '+
                '    "'+nobukti+'",                                                 '+
                '    "'+keterangan+'",                                              '+
                '    "'+Tanggal(tgl)+'",                                            '+
                  '    "'+KomaDatabase(FloatToStr(nominal))+'",                     '+
                '    "'+KomaDatabase(FloatToStr(nominalBKP))+'",'+
                '    "'+KomaDatabase(FloatToStr(NominalNonBkp))+'","'+setIdUser+'"   '+
                '  )',False);
    end;

end;

procedure PostingKartuStok(Q:TMyQuery;nobukti:string;tgl:TDate;kodebarang:string;
              idgudang:string;satuan:string;hargabeli:Real;IO:string;jml:Real;
              keterangan:string);
var
  s_akhir : Real;
begin


    if IO ='MASUK' then
       ExQry(Q,' INSERT INTO kartustok (                        '+
               '   nobukti,                                     '+
               '   tgl,                                         '+
               '   kodebarang,                                  '+
               '   idgudang,                                    '+
               '   satuan,                                      '+
               '   hargabeli,                                   '+
               '   masuk,                                       '+
               '   keterangan                        '+
               ' )                                              '+
               ' VALUES                                         '+
               '   (                                            '+
               '     "'+nobukti+'",                             '+
               '     "'+Tanggal(tgl)+'",                        '+
               '     "'+kodebarang+'",                          '+
               '     "'+idgudang+'",                            '+
               '     "'+satuan+'",                              '+
               '     "'+komadatabase(FloatToStr(hargabeli))+'",         '+
               '     "'+(StrToDecimal(FloatToStr(jml)))+'",               '+
               '     "'+keterangan+'")',False)
    else if IO = 'KELUAR' then
       ExQry(Q,' INSERT INTO kartustok (                        '+
               '   nobukti,                                     '+
               '   tgl,                                         '+
               '   kodebarang,                                  '+
               '   idgudang,                                    '+
               '   satuan,                                      '+
               '   hargabeli,                                   '+
               '   keluar,                                       '+
               '   keterangan                        '+
               ' )                                              '+
               ' VALUES                                         '+
               '   (                                            '+
               '     "'+nobukti+'",                             '+
               '     "'+Tanggal(tgl)+'",                        '+
               '     "'+kodebarang+'",                          '+
               '     "'+idgudang+'",                            '+
               '     "'+satuan+'",                              '+
               '     "'+komadatabase(FloatToStr(hargabeli))+'",         '+
               '     "'+(StrToDecimal(FloatToStr(jml)))+'",               '+
               '     "'+keterangan+'")',False);
end;


procedure AddHistory(Ket:string;idUser:String);
var
  Q : TMyQuery;
  C : TMyConnection;
begin
  Q := TMyQuery.Create(nil);
  C := TMyConnection.Create(nil);
  Try
    SetKoneksi(C);
    Q.Connection := C;

    try
      ExQry(Q,'INSERT into historysistem(keterangan,iduser)'+
      ' Values ("'+Ket+'","'+idUser+'"',False);
    Except


    end;
  Finally
    Q.Free;
    C.Free;
  End;
end;

function SaldoRekening(Kode:string):Real;

begin

  try
      dm.Q1.Close;
      dm.Q1.SQL.Text := 'SELECT SUM(s_awal+debet-kredit) as Saldo FROM saldoakun '+
      ' WHERE noakun="'+Kode+'" AND Year(tgl)='+INtToStr(YearOf(now))+' '+
      ' AND month(tgl)='+IntToStr(MonthOf(now))+' ';
      dm.Q1.Open;

      Result := dm.Q1.Fields[0].AsFloat;
    except
      MessageDlg('Cek Saldo Gagal Silahkan Ulangi Kode Rekening',mtError,[mbOK],0);
    end;
 
end;
end.
