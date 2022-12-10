unit uOvEdit;

interface
  uses
    Classes,Controls,Graphics,Windows,Forms,cxMemo,cxDropDownEdit,cxcalendar, Messages,cxTextEdit,uComCtrl,SysUtils,cxCheckBox;

    type
      TcxTextEdit = Class(cxTextEdit.TcxTextEdit)
        protected

          procedure KeyPress(var Key : Char);Override;
          procedure KeyUp(var  Key: Word;Shift: TShiftState);Override;
          procedure DoExit;override;
          Procedure DoEnter;override;


        public
          DefaultColor  : TColor;
          FocusColor    : TColor;
          DefaultFontColor : TColor;
          FocusFontColor : TColor;
          DefaultFontStyles:TFontStyles;
          FocusFontStyles:TFontStyles;
          NextFocus : TWinControl;
          FocusNextOnEnter : Boolean;
          isRupiah : Boolean;
          isPersen : Boolean;
          isCari   : Boolean;
          isPassword : Boolean;


          Constructor Create(AOwner:TComponent);Override;

          function stencecase(aWord : String) : String;
          function isAngka:String;
          function AsFLoat : Real;
      End;
      TcxComboBox = class (cxDropDownEdit.TcxComboBox)
      protected
        procedure KeyUp(var  Key: Word;Shift: TShiftState);Override;
        procedure DoExit; override;
        procedure DoEnter;override;
      public
        NextFOcus : boolean;
        FocusColor : TColor;
        DefaultColor : TColor;
        constructor Create(aOwner:TComponent);override;

      end;
      TcxMemo = class (cxMemo.TcxMemo)
        protected
        procedure KeyUp(var  Key: Word;Shift: TShiftState);Override;
        procedure DoExit; override;
        procedure DoEnter;override;
      public
        NextFOcus : boolean;
        FocusColor : TColor;
        DefaultColor : TColor;
        constructor Create(aOwner:TComponent);override;

      end;
      TcxDateEdit = class (cxcalendar.TcxDateEdit)
        protected
        procedure KeyUp(var  Key: Word;Shift: TShiftState);Override;
        procedure DoExit; override;
        procedure DoEnter;override;
      public
        NextFOcus : boolean;
        FocusColor : TColor;
        DefaultColor : TColor;
        constructor Create(aOwner:TComponent);override;
      end;

      TcxCheckBox = class (cxCheckBox.TcxCheckBox)
        protected
          procedure KeyUp(var Key :Word;Shift:TShiftState);override;
        public
          NextFocus : Boolean;
          constructor create(aOwNer:TComponent);override;
        end;


implementation

{ TsEdit }

function TcxTextEdit.AsFLoat: Real;
begin
  Result := StrToFloatDef(nilai(Trim(Text)),0);
end;

constructor TcxTextEdit.Create(AOwner: TComponent);
begin
  inherited;

  DefaultColor      := Color;
  DefaultFontColor  := Font.Color;

  FocusColor        := Clyellow;
  FocusFontColor    := DefaultFontColor ;
  FocusFontStyles   := [fsBold];

  FocusNextOnEnter  := True;
  isRupiah          := False;
  isPassword := False;

end;

procedure TcxTextEdit.DoEnter;
begin
  inherited;

  Color := FocusColor;
  Font.Color := FocusFontColor;
  Font.Style := FocusFontStyles;
  SetFocus;

end;

procedure TcxTextEdit.DoExit;
begin
  inherited;

  Color := clWhite;
  Font.Color := clBlack;
  Font.Style := DefaultFontStyles;
  if isPassword = False then

  self.Text := stenceCase(self.Text);

  if (isRupiah) and (Pos(',00',Self.Text) = 0) then
     Self.Text := Format('%.2n',[StrToFloatDEf(nilai(Self.Text),0)]);



end;



function TcxTextEdit.isAngka: String;
begin
  if Text <> '' then

  Result := StrToDecimal(Trim(Text)) else
  Result :='0';

end;

procedure TcxTextEdit.KeyPress(var Key: Char);
begin
  inherited;

  if Tag = 3 then begin
    if not (Key in['0'..'9',#10,#13,#8,',','.']) then
       Key := #0;
  end;

end;

procedure TcxTextEdit.KeyUp(var Key: Word;Shift: TShiftState);
begin
  inherited;
  if ( isRupiah = True) then
      Rupiah(self.Text,self);

  if (isPersen) and (StrToFloatDef(Text,0) > 99) then begin
      MessageBox(Handle,'Angka harus kurang 100','Error',MB_ICONERROR);
      Text :='';
  end;

  if (FocusNextOnEnter) AND ( not isCari) then
    if Key = VK_RETURN then begin
      PostMessage(GetParentForm(Self).Handle, wm_NextDlgCtl, Ord((ssShift in Shift)), 0);
      Key := 0;
    end;
end;



function TcxTextEdit.stencecase(aWord: String): String;
var
  i:integer;
  s : String;
begin
  if aWord = '' then Exit;
  s := UpperCase(aWord[1]);
  for i := 2 to Length(aWord) do
    if (Aword[i-1] in [' ',';','.',',',':']) then
      s:=s+UpperCase(aWord[i])
    else
      s:=s+UpperCase(aWord[i]);
  Result := s;
end;



{ TcxComboBox }

constructor TcxComboBox.Create(aOwner: TComponent);
begin
  inherited;
  NextFOcus := True;
  DefaultColor      := Color;
  FocusColor        := Clyellow;
end;

procedure TcxComboBox.DoEnter;
begin
  inherited;
  Color := FocusColor;
  SetFocus;
end;

procedure TcxComboBox.DoExit;
begin
  inherited;
  Color := clWhite;
  Font.Color := clBlack;
end;

procedure TcxComboBox.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;

  if NextFOcus then
    if Key = VK_RETURN then begin
      PostMessage(GetParentForm(Self).Handle, wm_NextDlgCtl, Ord((ssShift in Shift)), 0);
      Key := 0;
    end;
end;

{ TcxMemo }

constructor TcxMemo.Create(aOwner: TComponent);
begin
  inherited;
  NextFOcus := True;
  DefaultColor      := Color;
  FocusColor        := Clyellow;
end;

procedure TcxMemo.DoEnter;
begin
  inherited;
  Color := FocusColor;
  SetFocus;
end;

procedure TcxMemo.DoExit;
begin
  inherited;
  Color := clWhite;
  Font.Color := clBlack;
end;

procedure TcxMemo.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if NextFOcus then
    if Key = VK_RETURN then begin
      PostMessage(GetParentForm(Self).Handle, wm_NextDlgCtl, Ord((ssShift in Shift)), 0);
      Key := 0;
    end;
end;

{ TcxDateTime }

constructor TcxDateEdit.Create(aOwner: TComponent);
begin
  inherited;
  NextFOcus := True;
  DefaultColor      := Color;
  FocusColor        := Clyellow;
end;

procedure TcxDateEdit.DoEnter;
begin
  inherited;
  Color := FocusColor;
  SetFocus;
end;

procedure TcxDateEdit.DoExit;
begin
  inherited;
  Color := clWhite;
  Font.Color := clBlack;
end;

procedure TcxDateEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if NextFOcus then
    if Key = VK_RETURN then begin
      PostMessage(GetParentForm(Self).Handle, wm_NextDlgCtl, Ord((ssShift in Shift)), 0);
      Key := 0;
    end;
end;

{ TcxCheckBox }

constructor TcxCheckBox.create(aOwNer: TComponent);
begin
  inherited;
  NextFOcus := True;
end;

procedure TcxCheckBox.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if NextFOcus then
    if Key = VK_RETURN then begin
      PostMessage(GetParentForm(Self).Handle, wm_NextDlgCtl, Ord((ssShift in Shift)), 0);
      Key := 0;
    end;
end;

end.
