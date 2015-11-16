unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  arrayInt = array[1..10000] of integer;
  TForm1 = class(TForm)
    btn1: TButton;
    lbl1: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    edt3: TEdit;
    lbl4: TLabel;
    btn2: TButton;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure edt1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  flagText: Boolean;
  FileNameText, OutputFileName: String;


implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  openDialog : TOpenDialog;
begin
  flagText:= True;
  openDialog := TOpenDialog.Create(openDialog);
  openDialog.Title:= 'Выберите файл для открытия';
  openDialog.InitialDir := GetCurrentDir;
  openDialog.Options := [ofFileMustExist];
  openDialog.Filter := 'Text file|*.*';
  openDialog.FilterIndex := 1;
  if openDialog.Execute then
  begin
    FileNameText:= openDialog.FileName;
  end
  else
    begin
      Application.MessageBox('Выбор файла для открытия остановлен!', 'Предупреждение!');
      flagText:=False;
    end;
  openDialog.Free;

  lbl1.Caption := FileNameText;
end;

function Nod(a, b: integer): integer;
begin
  while a * b <> 0 do
    if a > b then
      a := a mod b
    else
      b := b mod a;
  Nod := a + b;
end;

function evklid(a, b: integer): integer;
var
  d0, d1, x0, x1, y0, y1, q, d2, x2, y2: integer;
begin
  d0:=a; d1:=b;
  x0:=1; x1:=0;
  y0:=0; y1:=1;
  while d1>1 do
  begin
    q:=d0 div d1;
    d2:=d0 mod d1;
    x2:=x0-q*x1;
    y2:=y0-q*y1;
    d0:=d1; d1:=d2;
    x0:=x1; x1:=x2;
    y0:=y1; y1:=y2;
  end;
  if y1 < 0 then
    evklid := y1 + a
  else
    evklid := y1;
end;

function fast_exp(a: integer; z, n: integer): integer;
var
  x: integer;
begin
  x := 1;
  while z <> 0 do
  begin
    while (z mod 2) = 0 do
    begin
      z := z div 2;
      a := (a * a) mod n;
    end;
    z := z - 1;
    x := (x * a) mod n;
  end;
  fast_exp := x;
end;

procedure WordToByte(a : word; var b, c: byte);
var
  temp : word;
begin
  c := 0;
  b := 0;
  temp := 0;
  temp := a shl 8;
  b := temp shr 8;
  c := a shr 8;
end;

procedure sieveEratosthenes(n : integer; var arrayPrimeNumbers : arrayInt; var k : integer);
var
  i, x : integer;
  tempArray : array[1..100000] of byte;
begin
	i := 3;
	while i <= trunc(sqrt(n)) do
	begin
		x := i * i;
		while x <= n do
		begin
			tempArray[x] := 1;
			x := x + i;
		end;
		i := i + 2;
	end;
	i := 3;
	arrayPrimeNumbers[1] := 2;
	k := 2;
	while i <= n do
	begin
		if (tempArray[i] = 0) and (i mod 2 <> 0) then
		begin
			arrayPrimeNumbers[k] := i;
			inc(k);
		end;
		inc(i);
	end;
	dec(k);
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  q, p, n, fi, i, e, d, countText, quantityPrimeNumbers: integer;
  lsb, msb: byte;
  arr : array[1..100000] of byte;
  c : array [1..100000] of word;
  arrayPrimeNumbers : arrayInt;
  File_text: file of byte;
begin
  if flagText then
  begin
    countText := 0;
    AssignFile(File_text, FileNameText);
    reset(File_text);
    while not Eof(File_text) do
    begin
      inc(countText);
      read(File_text, arr[countText]);
    end;
    CloseFile(File_text);

    q := StrToInt(edt2.Text);
    p := StrToInt(edt1.Text);
    n := p * q;

    fi := (p - 1) * (q - 1);
    d := StrToInt(edt3.Text);
    e := evklid(fi, d);

    OutputFileName := FileNameText + '.RSA';
    AssignFile(output, OutputFileName);
    Rewrite(output);
    for i:=1 to countText do
    begin
      c[i] := fast_exp(arr[i], e, n);
      WordToByte(c[i], lsb, msb);
      write(chr(msb), chr(lsb));
      mmo1.Text := mmo1.Text + IntToStr(c[i]) + ' ';
    end;
    {writeln;
    writeln('Decryption:');
    for i:= 1 to countText do
    begin
      write(chr(fast_exp(c[i], d, n)));
      //mmo1.Text := mmo1.Text + IntToStr(fast_exp(c[i], d, n)) + ' ';
    end;}
    CloseFile(output);
  end;
end;

procedure TForm1.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TForm1.edt1Change(Sender: TObject);
var
  flag1, flag2 : boolean;
  quantityPrimeNumbers, i : integer;
  arrayPrimeNumbers : arrayInt;
begin
  if (edt1.Text <> '') and (edt2.Text <> '') and (StrToInt(edt1.Text) * StrToInt(edt2.Text) > 255) then
  begin
    sieveEratosthenes(StrToInt(edt1.Text) * StrToInt(edt2.Text), arrayPrimeNumbers, quantityPrimeNumbers);

    flag1 := false;
    flag2 := false;
    for i:= 1 to quantityPrimeNumbers do
    begin
      if (StrToInt(edt1.Text) = arrayPrimeNumbers[i]) then
        flag1 := true;
      if (StrToInt(edt2.Text) = arrayPrimeNumbers[i]) then
        flag2 := true;
    end;

    if (flag1) and (flag2) then
      btn2.Enabled := true
    else
      btn2.Enabled := false;
  end;
end;

end.
