object dmCkSmp: TdmCkSmp
  Height = 651
  Width = 869
  object fdc_DV: TFDConnection
    ConnectionName = 'DateView_bromo2'
    Params.Strings = (
      'User_Name=SYSDBA'
      'CharacterSet=ASCII'
      'Database=C:\Data\Firebird\DATEVIEW2021V30.FDB'
      'Password=Zbxc456~'
      'Server=localhost'
      'Port=3050'
      'Protocol=TCPIP'
      'DriverID=FB')
    Transaction = FDTransaction1
    Left = 96
    Top = 40
  end
  object fdqSamples: TFDQuery
    Connection = fdc_DV
    SQL.Strings = (
      'select SmpLoc.SampleNo, SmpLoc.OriginalNo,'
      '  SmpLoc.Longitude,SmpLoc.Latitude,'
      '  SmpLoc.ContinentID,Smploc.CountryAbr'
      'from SmpLoc'
      'where SmpLoc.SampleNo = :SampleID')
    Left = 96
    Top = 152
    ParamData = <
      item
        Name = 'SAMPLEID'
        DataType = ftString
        ParamType = ptInput
      end>
    object fdqSamplesSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      KeyFields = 'SAMPLENO'
      Origin = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqSamplesORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      Origin = 'ORIGINALNO'
      Required = True
    end
    object fdqSamplesLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Origin = 'LONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
      EditFormat = '###0.00000'
      MaxValue = 180.000000000000000000
      MinValue = -180.000000000000000000
    end
    object fdqSamplesLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Origin = 'LATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
      EditFormat = '###0.00000'
    end
    object fdqSamplesContinentID: TStringField
      FieldName = 'ContinentID'
      Size = 3
    end
    object fdqSamplesCountryAbr: TStringField
      FieldName = 'CountryAbr'
      Size = 3
    end
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    DriverID = 'Firebird3_64bit'
    VendorHome = 'C:\EXE64'
    VendorLib = 'C:\EXE64\fbclient.dll'
    ThreadSafe = True
    Left = 256
    Top = 40
  end
  object FDTransaction1: TFDTransaction
    Options.Isolation = xiReadCommitted
    Connection = fdc_DV
    Left = 392
    Top = 32
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'FMX'
    Left = 320
    Top = 152
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 504
    Top = 16
  end
  object fdmtNewSamples: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'SeqNo'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvSortOptions]
    FormatOptions.SortOptions = [soNoCase, soPrimary]
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 576
    Top = 136
    object fdmtNewSamplesSeqNo: TIntegerField
      FieldName = 'SeqNo'
      KeyFields = 'SeqNo'
      Required = True
    end
    object fdmtNewSamplesSampleNo: TStringField
      FieldName = 'SampleNo'
      Required = True
    end
    object fdmtNewSamplesOriginalNo: TStringField
      FieldName = 'OriginalNo'
    end
    object fdmtNewSamplesRegionID: TStringField
      FieldName = 'RegionID'
      Size = 3
    end
    object fdmtNewSamplesLongitude: TFloatField
      FieldName = 'Longitude'
      Required = True
      DisplayFormat = '###0.00000'
      EditFormat = '###0.00000'
    end
    object fdmtNewSamplesLatitude: TFloatField
      FieldName = 'Latitude'
      Required = True
    end
    object fdmtNewSamplesSampleStatus: TStringField
      DisplayWidth = 25
      FieldName = 'SampleStatus'
      Size = 50
    end
    object fdmtNewSamplesLocationStatusLongitude: TFloatField
      FieldName = 'LocationStatusLongitude'
      DisplayFormat = '###0.00000'
      EditFormat = '###0.00000'
    end
    object fdmtNewSamplesLocationStatusLatitude: TFloatField
      FieldName = 'LocationStatusLatitude'
      DisplayFormat = '###0.00000'
      EditFormat = '###0.00000'
    end
    object fdmtNewSamplesExistingRegionID: TStringField
      FieldName = 'ExistingRegionID'
      Size = 3
    end
  end
end
