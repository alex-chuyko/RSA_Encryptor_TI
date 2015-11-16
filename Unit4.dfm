object Form4: TForm4
  Left = 1180
  Top = 186
  Width = 432
  Height = 253
  Caption = 'Form4'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 128
    Top = 16
    Width = 16
    Height = 13
    Caption = 'lbl1'
  end
  object lbl2: TLabel
    Left = 24
    Top = 56
    Width = 6
    Height = 19
    Caption = 'r'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 16
    Top = 88
    Width = 18
    Height = 19
    Caption = 'Ko'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btn1: TButton
    Left = 40
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Text File'
    TabOrder = 0
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 40
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = edt1KeyPress
  end
  object edt2: TEdit
    Left = 40
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = edt1KeyPress
  end
  object btn2: TButton
    Left = 40
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 3
    OnClick = btn2Click
  end
  object mmo1: TMemo
    Left = 216
    Top = 56
    Width = 185
    Height = 89
    TabOrder = 4
  end
end
