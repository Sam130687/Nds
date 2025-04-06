object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1095#1077#1090' '#1053#1044#1057
  ClientHeight = 162
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrice: TLabel
    Left = 24
    Top = 16
    Width = 33
    Height = 17
    Caption = #1062#1077#1085#1072
  end
  object lblPrice1: TLabel
    Left = 223
    Top = 17
    Width = 22
    Height = 13
    Caption = #1053#1044#1057
  end
  object lblPriceNDS: TLabel
    Left = 24
    Top = 74
    Width = 59
    Height = 13
    Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
  end
  object lblPriceWNDS: TLabel
    Left = 223
    Top = 74
    Width = 71
    Height = 13
    Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
  end
  object lblPriceNDS1: TLabel
    Left = 24
    Top = 135
    Width = 59
    Height = 13
    Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
  end
  object lblPriceNDS2: TLabel
    Left = 105
    Top = 104
    Width = 155
    Height = 13
    Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057' * (1 + '#1053#1044#1057'/100)'
  end
  object edtPrice: TEdit
    Left = 88
    Top = 14
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
    OnKeyPress = edtPriceKeyPress
  end
  object cbbNDS: TComboBox
    Left = 304
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnCalculate: TButton
    Left = 24
    Top = 41
    Width = 75
    Height = 25
    Action = actCalculate
    TabOrder = 2
  end
  object edtPriceNDS: TEdit
    Left = 88
    Top = 72
    Width = 121
    Height = 21
    NumbersOnly = True
    ParentColor = True
    ReadOnly = True
    TabOrder = 3
    Text = '0'
  end
  object edtPriceWNDS: TEdit
    Left = 304
    Top = 72
    Width = 121
    Height = 21
    NumbersOnly = True
    ParentColor = True
    ReadOnly = True
    TabOrder = 4
    Text = '0'
  end
  object btnCheck: TButton
    Left = 24
    Top = 99
    Width = 75
    Height = 25
    Action = actCheck
    TabOrder = 5
  end
  object edtPriceCheck: TEdit
    Left = 88
    Top = 133
    Width = 121
    Height = 21
    NumbersOnly = True
    ParentColor = True
    ReadOnly = True
    TabOrder = 6
    Text = '0'
  end
  object lstActList: TActionList
    Left = 376
    Top = 112
    object actCalculate: TAction
      Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100
      Hint = #1047#1072#1087#1091#1089#1082' '#1088#1072#1089#1095#1077#1090#1072' '#1053#1044#1057
      OnExecute = actCalculateExecute
      OnUpdate = actCalculateUpdate
    end
    object actCheck: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
      Hint = #1055#1088#1086#1074#1077#1089#1090#1080' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072' '#1088#1072#1089#1095#1077#1090#1072
      OnExecute = actCheckExecute
      OnUpdate = actCheckUpdate
    end
  end
end
