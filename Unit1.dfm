object Form1: TForm1
  Left = 876
  Top = 143
  Width = 441
  Height = 253
  Caption = 'Form1'
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
    Width = 9
    Height = 19
    Caption = 'p'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 24
    Top = 88
    Width = 9
    Height = 19
    Caption = 'q'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 16
    Top = 128
    Width = 16
    Height = 19
    Caption = 'Kc'
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
    OnChange = edt1Change
    OnKeyPress = edt1KeyPress
  end
  object edt2: TEdit
    Left = 40
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = edt1Change
    OnKeyPress = edt1KeyPress
  end
  object edt3: TEdit
    Left = 40
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 3
    OnKeyPress = edt1KeyPress
  end
  object btn2: TButton
    Left = 32
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Run'
    Enabled = False
    TabOrder = 4
    OnClick = btn2Click
  end
  object mmo1: TMemo
    Left = 216
    Top = 56
    Width = 185
    Height = 89
    TabOrder = 5
  end
end
