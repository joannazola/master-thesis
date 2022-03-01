object Form1: TForm1
  Left = 152
  Top = 105
  Width = 1600
  Height = 842
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 160
    Top = 0
    Width = 131
    Height = 24
    Caption = 'Obraz z kamery'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 512
    Top = 24
    Width = 465
    Height = 441
  end
  object Label2: TLabel
    Left = 616
    Top = 0
    Width = 190
    Height = 24
    Caption = 'Przechwycone zdj'#281'cie'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 320
    Top = 656
    Width = 14
    Height = 24
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 320
    Top = 680
    Width = 12
    Height = 24
    Caption = 'Y'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Image2: TImage
    Left = 992
    Top = 24
    Width = 465
    Height = 441
  end
  object Image3: TImage
    Left = 992
    Top = 504
    Width = 465
    Height = 441
  end
  object Image4: TImage
    Left = 512
    Top = 506
    Width = 465
    Height = 441
  end
  object Label5: TLabel
    Left = 288
    Top = 680
    Width = 12
    Height = 24
    Caption = 'Y'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 288
    Top = 656
    Width = 14
    Height = 24
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 48
    Top = 24
    Width = 449
    Height = 441
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 56
    Top = 488
    Width = 313
    Height = 153
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Color = clHighlightText
    TabOrder = 1
    object Zle: TShape
      Left = 8
      Top = 8
      Width = 137
      Height = 137
      Brush.Color = clGray
      Shape = stCircle
    end
    object Dobrze: TShape
      Left = 168
      Top = 8
      Width = 137
      Height = 137
      Brush.Color = clGray
      Shape = stCircle
    end
  end
  object Memo2: TMemo
    Left = 56
    Top = 648
    Width = 193
    Height = 129
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 32
  end
  object Timer2: TTimer
    Interval = 4000
    OnTimer = Timer2Timer
    Left = 16
    Top = 496
  end
end
