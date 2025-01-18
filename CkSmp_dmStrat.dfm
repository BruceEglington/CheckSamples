object dmStratCkSmp: TdmStratCkSmp
  Height = 651
  Width = 869
  object fdGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'FMX'
    Left = 320
    Top = 152
  end
  object fdGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 504
    Top = 16
  end
  object fdMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Left = 592
    Top = 136
  end
  object fdqProblemCharacters: TFDQuery
    SQL.Strings = (
      'select * from ProblemCharacters')
    Left = 88
    Top = 152
    object fdqProblemCharactersPROBLEMSTRING: TStringField
      FieldName = 'PROBLEMSTRING'
      Origin = 'PROBLEMSTRING'
      Required = True
      Size = 1
    end
    object fdqProblemCharactersREPLACEMENTSTRING: TStringField
      FieldName = 'REPLACEMENTSTRING'
      Origin = 'REPLACEMENTSTRING'
      Required = True
      Size = 1
    end
    object fdqProblemCharactersISPROBLEM: TStringField
      FieldName = 'ISPROBLEM'
      Origin = 'ISPROBLEM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object fdqProblemCharactersPROBLEMCHARNUM: TIntegerField
      FieldName = 'PROBLEMCHARNUM'
      Origin = 'PROBLEMCHARNUM'
      Required = True
    end
    object fdqProblemCharactersREPLACEMENTCHARNUM: TIntegerField
      FieldName = 'REPLACEMENTCHARNUM'
      Origin = 'REPLACEMENTCHARNUM'
      Required = True
    end
  end
  object fdc_Strat: TFDConnection
    ConnectionName = 'StratDB_bromo2'
    Params.Strings = (
      'CharacterSet=ASCII'
      'ConnectionDef=bromo2_StratDB')
    LoginPrompt = False
    Left = 80
    Top = 48
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 264
    Top = 56
  end
end
