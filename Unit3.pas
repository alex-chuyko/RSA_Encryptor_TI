unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    btn1: TButton;
    edt1: TEdit;
    edt2: TEdit;
    btn2: TButton;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  flagText: Boolean;
  FileNameText, OutputFileName: String;


implementation

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
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

function SwapW(i: Word): Word;
begin
  asm
    mov ax, [i]
    xchg al,ah
    mov [i], ax
  end;
  SwapW := i;
end;

procedure TForm3.btn2Click(Sender: TObject);
var
 n, i, d, countText: integer;
  arr : array[1..100000] of word;
  File_text: file of word;
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
      arr[countText] := SwapW(arr[countText]);
    end;
    CloseFile(File_text);

    d := StrToInt(edt2.Text);
    n := StrToInt(edt1.Text);

    OutputFileName := FileNameText + '.decryptionRSA';
    AssignFile(output, OutputFileName);
    Rewrite(output);
    for i:= 1 to countText do
    begin
      write(chr(fast_exp(arr[i], d, n)));
      mmo1.Text := mmo1.Text + IntToStr(fast_exp(arr[i], d, n) mod 256) + ' ';
    end;
    CloseFile(output);
  end;
end;

procedure TForm3.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

end.
