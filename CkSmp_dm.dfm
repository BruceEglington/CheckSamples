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
  object SVGIconImageCollection1: TSVGIconImageCollection
    SVGIconItems = <
      item
        IconName = 'about'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#219' +
          '6F3" d="M37,40H11l-6,6V12c0-3.3,2.7-6,6-6h26c3.3,0,6,2.7,6,6v22C' +
          '43,37.3,40.3,40,37,40z"/>'#13#10'    <g fill="#fff">'#13#10'        <rect x=' +
          '"22" y="20" width="4" height="11"/>'#13#10'        <circle cx="24" cy=' +
          '"15" r="2"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'alphabetical_sorting_az'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '546E7A" points="38,33 38,5 34,5 34,33 28,33 36,43 44,33"/>'#13#10'    ' +
          '<g fill="#2196F3">'#13#10'        <path d="M16.8,17.2h-5.3l-1.1,3H6.9L' +
          '12.6,5h2.9l5.7,15.2h-3.2L16.8,17.2z M12.2,14.5H16l-1.9-5.7L12.2,' +
          '14.5z"/>'#13#10'        <path d="M12.4,40.5H20V43H8.4v-1.9L16,30.3H8.4' +
          'v-2.5h11.4v1.7L12.4,40.5z"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'approval'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '8BC34A" points="24,3 28.7,6.6 34.5,5.8 36.7,11.3 42.2,13.5 41.4,' +
          '19.3 45,24 41.4,28.7 42.2,34.5 36.7,36.7 34.5,42.2 28.7,41.4 24,' +
          '45 19.3,41.4 13.5,42.2 11.3,36.7 5.8,34.5 6.6,28.7 3,24 6.6,19.3' +
          ' 5.8,13.5 11.3,11.3 13.5,5.8 19.3,6.6"/>'#13#10'    <polygon fill="#CC' +
          'FF90" points="34.6,14.6 21,28.2 15.4,22.6 12.6,25.4 21,33.8 37.4' +
          ',17.4"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'approve'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#FFCC80' +
          '">'#13#10'        <circle cx="38" cy="26" r="4"/>'#13#10'        <circle cx=' +
          '"10" cy="26" r="4"/>'#13#10'        <path d="M39,19c0-12.7-30-8.3-30,0' +
          'c0,1.8,0,8.2,0,10c0,8.3,6.7,15,15,15s15-6.7,15-15C39,27.2,39,20.' +
          '8,39,19z"/>'#13#10'        <path d="M24,4C15.2,4,8,11.2,8,20c0,1.2,0,3' +
          '.5,0,3.5l2.1,0.6V19l19.5-6.3l8.2,6.3v5.1l2.1-0.6c0,0,0-2.3,0-3.5' +
          ' C40,12.5,34.6,4,24,4z"/>'#13#10'    </g>'#13#10'    <polygon fill="#4CAF50"' +
          ' points="32.6,18.6 22.3,28.9 17.4,24 14.6,26.8 22.3,34.5 35.4,21' +
          '.4"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'area_chart'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '3F51B5" points="42,37 6,37 6,25 16,10 30,17 42,6"/>'#13#10'    <polygo' +
          'n fill="#00BCD4" points="42,42 6,42 6,32 16,24 30,26 42,17"/>'#13#10'<' +
          '/svg>'#13#10
      end
      item
        IconName = 'automatic'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#3F5' +
          '1B5" d="M39,43H9c-2.2,0-4-1.8-4-4V9c0-2.2,1.8-4,4-4h30c2.2,0,4,1' +
          '.8,4,4v30C43,41.2,41.2,43,39,43z"/>'#13#10'    <path fill="#B3E5FC" d=' +
          '"M33.6,25.4c0.1-0.4,0.1-0.9,0.1-1.4s0-0.9-0.1-1.4l2.8-2c0.3-0.2,' +
          '0.4-0.6,0.2-0.9l-2.7-4.6 c-0.2-0.3-0.5-0.4-0.8-0.3L30,16.3c-0.7-' +
          '0.6-1.5-1-2.4-1.4l-0.3-3.4c0-0.3-0.3-0.6-0.6-0.6h-5.3c-0.3,0-0.6' +
          ',0.3-0.6,0.6L20.4,15 c-0.9,0.3-1.6,0.8-2.4,1.4l-3.1-1.4c-0.3-0.1' +
          '-0.7,0-0.8,0.3l-2.7,4.6c-0.2,0.3-0.1,0.7,0.2,0.9l2.8,2c-0.1,0.4-' +
          '0.1,0.9-0.1,1.4 s0,0.9,0.1,1.4l-2.8,2c-0.3,0.2-0.4,0.6-0.2,0.9l2' +
          '.7,4.6c0.2,0.3,0.5,0.4,0.8,0.3l3.1-1.4c0.7,0.6,1.5,1,2.4,1.4l0.3' +
          ',3.4 c0,0.3,0.3,0.6,0.6,0.6h5.3c0.3,0,0.6-0.3,0.6-0.6l0.3-3.4c0.' +
          '9-0.3,1.6-0.8,2.4-1.4l3.1,1.4c0.3,0.1,0.7,0,0.8-0.3l2.7-4.6 c0.2' +
          '-0.3,0.1-0.7-0.2-0.9L33.6,25.4z M24,29c-2.8,0-5-2.2-5-5c0-2.8,2.' +
          '2-5,5-5c2.8,0,5,2.2,5,5C29,26.8,26.8,29,24,29z"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'bar_chart'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#00BCD4' +
          '">'#13#10'        <rect x="19" y="22" width="10" height="20"/>'#13#10'      ' +
          '  <rect x="6" y="12" width="10" height="30"/>'#13#10'        <rect x="' +
          '32" y="6" width="10" height="36"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'calculator'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#616' +
          '161" d="M40,16H8v24c0,2.2,1.8,4,4,4h24c2.2,0,4-1.8,4-4V16z"/>'#13#10' ' +
          '   <path fill="#424242" d="M36,4H12C9.8,4,8,5.8,8,8v9h32V8C40,5.' +
          '8,38.2,4,36,4z"/>'#13#10'    <path fill="#9CCC65" d="M36,14H12c-0.6,0-' +
          '1-0.4-1-1V8c0-0.6,0.4-1,1-1h24c0.6,0,1,0.4,1,1v5C37,13.6,36.6,14' +
          ',36,14z"/>'#13#10'    <g fill="#33691E">'#13#10'        <rect x="33" y="10" ' +
          'width="2" height="2"/>'#13#10'        <rect x="29" y="10" width="2" he' +
          'ight="2"/>'#13#10'    </g>'#13#10'    <path fill="#FF5252" d="M36,23h-3c-0.6' +
          ',0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C37,22.6,36.6' +
          ',23,36,23z"/>'#13#10'    <g fill="#E0E0E0">'#13#10'        <path d="M15,23h-' +
          '3c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C16,22.' +
          '6,15.6,23,15,23z"/>'#13#10'        <path d="M22,23h-3c-0.6,0-1-0.4-1-1' +
          'v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C23,22.6,22.6,23,22,23z"/' +
          '>'#13#10'        <path d="M29,23h-3c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-' +
          '1h3c0.6,0,1,0.4,1,1v2C30,22.6,29.6,23,29,23z"/>'#13#10'        <path d' +
          '="M15,29h-3c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,' +
          '1v2C16,28.6,15.6,29,15,29z"/>'#13#10'        <path d="M22,29h-3c-0.6,0' +
          '-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C23,28.6,22.6,2' +
          '9,22,29z"/>'#13#10'        <path d="M29,29h-3c-0.6,0-1-0.4-1-1v-2c0-0.' +
          '6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C30,28.6,29.6,29,29,29z"/>'#13#10'     ' +
          '   <path d="M15,35h-3c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,' +
          '0,1,0.4,1,1v2C16,34.6,15.6,35,15,35z"/>'#13#10'        <path d="M22,35' +
          'h-3c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C23,3' +
          '4.6,22.6,35,22,35z"/>'#13#10'        <path d="M29,35h-3c-0.6,0-1-0.4-1' +
          '-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C30,34.6,29.6,35,29,35z' +
          '"/>'#13#10'        <path d="M15,41h-3c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,' +
          '1-1h3c0.6,0,1,0.4,1,1v2C16,40.6,15.6,41,15,41z"/>'#13#10'        <path' +
          ' d="M22,41h-3c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,' +
          '1,1v2C23,40.6,22.6,41,22,41z"/>'#13#10'        <path d="M29,41h-3c-0.6' +
          ',0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C30,40.6,29.6' +
          ',41,29,41z"/>'#13#10'    </g>'#13#10'    <g fill="#BDBDBD">'#13#10'        <path d' +
          '="M36,29h-3c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,' +
          '1v2C37,28.6,36.6,29,36,29z"/>'#13#10'        <path d="M36,35h-3c-0.6,0' +
          '-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C37,34.6,36.6,3' +
          '5,36,35z"/>'#13#10'        <path d="M36,41h-3c-0.6,0-1-0.4-1-1v-2c0-0.' +
          '6,0.4-1,1-1h3c0.6,0,1,0.4,1,1v2C37,40.6,36.6,41,36,41z"/>'#13#10'    <' +
          '/g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'calendar'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#CFD' +
          '8DC" d="M5,38V14h38v24c0,2.2-1.8,4-4,4H9C6.8,42,5,40.2,5,38z"/>'#13 +
          #10'    <path fill="#F44336" d="M43,10v6H5v-6c0-2.2,1.8-4,4-4h30C41' +
          '.2,6,43,7.8,43,10z"/>'#13#10'    <g fill="#B71C1C">'#13#10'        <circle c' +
          'x="33" cy="10" r="3"/>'#13#10'        <circle cx="15" cy="10" r="3"/>'#13 +
          #10'    </g>'#13#10'    <g fill="#B0BEC5">'#13#10'        <path d="M33,3c-1.1,0' +
          '-2,0.9-2,2v5c0,1.1,0.9,2,2,2s2-0.9,2-2V5C35,3.9,34.1,3,33,3z"/>'#13 +
          #10'        <path d="M15,3c-1.1,0-2,0.9-2,2v5c0,1.1,0.9,2,2,2s2-0.9' +
          ',2-2V5C17,3.9,16.1,3,15,3z"/>'#13#10'    </g>'#13#10'    <g fill="#90A4AE">'#13 +
          #10'        <rect x="13" y="20" width="4" height="4"/>'#13#10'        <re' +
          'ct x="19" y="20" width="4" height="4"/>'#13#10'        <rect x="25" y=' +
          '"20" width="4" height="4"/>'#13#10'        <rect x="31" y="20" width="' +
          '4" height="4"/>'#13#10'        <rect x="13" y="26" width="4" height="4' +
          '"/>'#13#10'        <rect x="19" y="26" width="4" height="4"/>'#13#10'       ' +
          ' <rect x="25" y="26" width="4" height="4"/>'#13#10'        <rect x="31' +
          '" y="26" width="4" height="4"/>'#13#10'        <rect x="13" y="32" wid' +
          'th="4" height="4"/>'#13#10'        <rect x="19" y="32" width="4" heigh' +
          't="4"/>'#13#10'        <rect x="25" y="32" width="4" height="4"/>'#13#10'   ' +
          '     <rect x="31" y="32" width="4" height="4"/>'#13#10'    </g>'#13#10'</svg' +
          '>'#13#10
      end
      item
        IconName = 'cancel'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#D50' +
          '000" d="M24,6C14.1,6,6,14.1,6,24s8.1,18,18,18s18-8.1,18-18S33.9,' +
          '6,24,6z M24,10c3.1,0,6,1.1,8.4,2.8L12.8,32.4 C11.1,30,10,27.1,10' +
          ',24C10,16.3,16.3,10,24,10z M24,38c-3.1,0-6-1.1-8.4-2.8l19.6-19.6' +
          'C36.9,18,38,20.9,38,24C38,31.7,31.7,38,24,38 z"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'checkmark'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '43A047" points="40.6,12.1 17,35.7 7.4,26.1 4.6,29 17,41.3 43.4,1' +
          '4.9"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'clear_filters'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          'F57C00" points="29,23 19,23 7,9 41,9"/>'#13#10'    <g fill="#FF9800">'#13 +
          #10'        <polygon points="29,38 19,44 19,23 29,23"/>'#13#10'        <p' +
          'ath d="M41.5,9h-35C5.7,9,5,8.3,5,7.5v0C5,6.7,5.7,6,6.5,6h35C42.3' +
          ',6,43,6.7,43,7.5v0C43,8.3,42.3,9,41.5,9z"/>'#13#10'    </g>'#13#10'    <circ' +
          'le fill="#F44336" cx="38" cy="38" r="10"/>'#13#10'    <rect x="32" y="' +
          '36" fill="#fff" width="12" height="4"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'combo_chart'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#00BCD4' +
          '">'#13#10'        <rect x="37" y="18" width="6" height="24"/>'#13#10'       ' +
          ' <rect x="29" y="26" width="6" height="16"/>'#13#10'        <rect x="2' +
          '1" y="22" width="6" height="20"/>'#13#10'        <rect x="13" y="32" w' +
          'idth="6" height="10"/>'#13#10'        <rect x="5" y="28" width="6" hei' +
          'ght="14"/>'#13#10'    </g>'#13#10'    <g fill="#3F51B5">'#13#10'        <circle cx' +
          '="8" cy="16" r="3"/>'#13#10'        <circle cx="16" cy="18" r="3"/>'#13#10' ' +
          '       <circle cx="24" cy="11" r="3"/>'#13#10'        <circle cx="32" ' +
          'cy="13" r="3"/>'#13#10'        <circle cx="40" cy="9" r="3"/>'#13#10'       ' +
          ' <polygon points="39.1,7.2 31.8,10.9 23.5,8.8 15.5,15.8 8.5,14.1' +
          ' 7.5,17.9 16.5,20.2 24.5,13.2 32.2,15.1 40.9,10.8"/>'#13#10'    </g>'#13#10 +
          '</svg>'#13#10
      end
      item
        IconName = 'data_sheet'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#90C' +
          'AF9" d="M39,16v7h-6v-7h-2v7h-6v-7h-2v7h-7v2h7v6h-7v2h7v6h-7v2h25' +
          'V16H39z M39,25v6h-6v-6H39z M25,25h6v6h-6V25z M25,33h6v6h-6V33z M' +
          '33,39v-6h6v6H33z"/>'#13#10'    <polygon fill="#00BCD4" points="40,8 8,' +
          '8 8,40 16,40 16,16 40,16"/>'#13#10'    <path fill="#0097A7" d="M7,7v34' +
          'h10V17h24V7H7z M9,23v-6h6v6H9z M15,25v6H9v-6H15z M17,9h6v6h-6V9z' +
          ' M25,9h6v6h-6V9z M15,9v6H9V9H15z M9,39v-6h6v6H9z M39,15h-6V9h6V1' +
          '5z"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'document'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '90CAF9" points="40,45 8,45 8,3 30,3 40,13"/>'#13#10'    <polygon fill=' +
          '"#E1F5FE" points="38.5,14 29,14 29,4.5"/>'#13#10'    <g fill="#1976D2"' +
          '>'#13#10'        <rect x="16" y="21" width="17" height="2"/>'#13#10'        ' +
          '<rect x="16" y="25" width="13" height="2"/>'#13#10'        <rect x="16' +
          '" y="29" width="17" height="2"/>'#13#10'        <rect x="16" y="33" wi' +
          'dth="13" height="2"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'download'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#1565C0' +
          '">'#13#10'        <polygon points="24,37.1 13,24 35,24"/>'#13#10'        <re' +
          'ct x="20" y="4" width="8" height="4"/>'#13#10'        <rect x="20" y="' +
          '10" width="8" height="4"/>'#13#10'        <rect x="20" y="16" width="8' +
          '" height="11"/>'#13#10'        <rect x="6" y="40" width="36" height="4' +
          '"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'empty_filter'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#FFCC80' +
          '">'#13#10'        <polygon points="29,23 19,23 7,9 41,9"/>'#13#10'        <p' +
          'olygon points="29,38 19,44 19,23 29,23"/>'#13#10'        <path d="M41.' +
          '5,9h-35C5.7,9,5,8.3,5,7.5v0C5,6.7,5.7,6,6.5,6h35C42.3,6,43,6.7,4' +
          '3,7.5v0C43,8.3,42.3,9,41.5,9z"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'export'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#FFC' +
          'CBC" d="M7,40V8c0-2.2,1.8-4,4-4h24c2.2,0,4,1.8,4,4v32c0,2.2-1.8,' +
          '4-4,4H11C8.8,44,7,42.2,7,40z"/>'#13#10'    <g fill="#FF5722">'#13#10'       ' +
          ' <polygon points="42.7,24 32,33 32,15"/>'#13#10'        <rect x="14" y' +
          '="21" width="23" height="6"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'file'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '90CAF9" points="40,45 8,45 8,3 30,3 40,13"/>'#13#10'    <polygon fill=' +
          '"#E1F5FE" points="38.5,14 29,14 29,4.5"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'filled_filter'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          'F57C00" points="29,23 19,23 7,9 41,9"/>'#13#10'    <g fill="#FF9800">'#13 +
          #10'        <polygon points="29,38 19,44 19,23 29,23"/>'#13#10'        <p' +
          'ath d="M41.5,9h-35C5.7,9,5,8.3,5,7.5v0C5,6.7,5.7,6,6.5,6h35C42.3' +
          ',6,43,6.7,43,7.5v0C43,8.3,42.3,9,41.5,9z"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'folder'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#FFA' +
          '000" d="M40,12H22l-4-4H8c-2.2,0-4,1.8-4,4v8h40v-4C44,13.8,42.2,1' +
          '2,40,12z"/>'#13#10'    <path fill="#FFCA28" d="M40,12H8c-2.2,0-4,1.8-4' +
          ',4v20c0,2.2,1.8,4,4,4h32c2.2,0,4-1.8,4-4V16C44,13.8,42.2,12,40,1' +
          '2z"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'generic_sorting_asc'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <rect x="6" y="6' +
          '" fill="#2196F3" width="4" height="4"/>'#13#10'    <rect x="6" y="14" ' +
          'fill="#2196F3" width="12" height="4"/>'#13#10'    <rect x="6" y="22" f' +
          'ill="#2196F3" width="20" height="4"/>'#13#10'    <rect x="6" y="30" fi' +
          'll="#2196F3" width="28" height="4"/>'#13#10'    <rect x="6" y="38" fil' +
          'l="#2196F3" width="36" height="4"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'generic_sorting_desc'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <rect x="6" y="3' +
          '8" fill="#2196F3" width="4" height="4"/>'#13#10'    <rect x="6" y="30"' +
          ' fill="#2196F3" width="12" height="4"/>'#13#10'    <rect x="6" y="22" ' +
          'fill="#2196F3" width="20" height="4"/>'#13#10'    <rect x="6" y="14" f' +
          'ill="#2196F3" width="28" height="4"/>'#13#10'    <rect x="6" y="6" fil' +
          'l="#2196F3" width="36" height="4"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'globe'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#7CB' +
          '342" d="M24,4C13,4,4,13,4,24s9,20,20,20s20-9,20-20S35,4,24,4z"/>' +
          #13#10'    <path fill="#0277BD" d="M45,24c0,11.7-9.5,21-21,21S3,35.7,' +
          '3,24S12.3,3,24,3S45,12.3,45,24z M23.8,33.7c0-0.4-0.2-0.6-0.6-0.8' +
          ' c-1.3-0.4-2.5-0.4-3.6-1.5c-0.2-0.4-0.2-0.8-0.4-1.3c-0.4-0.4-1.5' +
          '-0.6-2.1-0.8c-0.8,0-1.7,0-2.7,0c-0.4,0-1.1,0-1.5,0 c-0.6-0.2-1.1' +
          '-1.1-1.5-1.7c0-0.2,0-0.6-0.4-0.6c-0.4-0.2-0.8,0.2-1.3,0c-0.2-0.2' +
          '-0.2-0.4-0.2-0.6c0-0.6,0.4-1.3,0.8-1.7 c0.6-0.4,1.3,0.2,1.9,0.2c' +
          '0.2,0,0.2,0,0.4,0.2c0.6,0.2,0.8,1,0.8,1.7c0,0.2,0,0.4,0,0.4c0,0.' +
          '2,0.2,0.2,0.4,0.2 c0.2-1.1,0.2-2.1,0.4-3.2c0-1.3,1.3-2.5,2.3-2.9' +
          'c0.4-0.2,0.6,0.2,1.1,0c1.3-0.4,4.4-1.7,3.8-3.4c-0.4-1.5-1.7-2.9-' +
          '3.4-2.7 c-0.4,0.2-0.6,0.4-1,0.6c-0.6,0.4-1.9,1.7-2.5,1.7c-1.1-0.' +
          '2-1.1-1.7-0.8-2.3c0.2-0.8,2.1-3.6,3.4-3.1c0.2,0.2,0.6,0.6,0.8,0.' +
          '8 c0.4,0.2,1.1,0.2,1.7,0.2c0.2,0,0.4,0,0.6-0.2c0.2-0.2,0.2-0.2,0' +
          '.2-0.4c0-0.6-0.6-1.3-1-1.7c-0.4-0.4-1.1-0.8-1.7-1.1 c-2.1-0.6-5.' +
          '5,0.2-7.1,1.7s-2.9,4-3.8,6.1c-0.4,1.3-0.8,2.9-1,4.4c-0.2,1-0.4,1' +
          '.9,0.2,2.9c0.6,1.3,1.9,2.5,3.2,3.4 c0.8,0.6,2.5,0.6,3.4,1.7c0.6,' +
          '0.8,0.4,1.9,0.4,2.9c0,1.3,0.8,2.3,1.3,3.4c0.2,0.6,0.4,1.5,0.6,2.' +
          '1c0,0.2,0.2,1.5,0.2,1.7 c1.3,0.6,2.3,1.3,3.8,1.7c0.2,0,1-1.3,1-1' +
          '.5c0.6-0.6,1.1-1.5,1.7-1.9c0.4-0.2,0.8-0.4,1.3-0.8c0.4-0.4,0.6-1' +
          '.3,0.8-1.9 C23.8,35.1,24,34.3,23.8,33.7z M24.2,14.3c0.2,0,0.4-0.' +
          '2,0.8-0.4c0.6-0.4,1.3-1.1,1.9-1.5c0.6-0.4,1.3-1.1,1.7-1.5 c0.6-0' +
          '.4,1.1-1.3,1.3-1.9c0.2-0.4,0.8-1.3,0.6-1.9c-0.2-0.4-1.3-0.6-1.7-' +
          '0.8c-1.7-0.4-3.1-0.6-4.8-0.6c-0.6,0-1.5,0.2-1.7,0.8 c-0.2,1.1,0.' +
          '6,0.8,1.5,1.1c0,0,0.2,1.7,0.2,1.9c0.2,1-0.4,1.7-0.4,2.7c0,0.6,0,' +
          '1.7,0.4,2.1L24.2,14.3z M41.8,29 c0.2-0.4,0.2-1.1,0.4-1.5c0.2-1,0' +
          '.2-2.1,0.2-3.1c0-2.1-0.2-4.2-0.8-6.1c-0.4-0.6-0.6-1.3-0.8-1.9c-0' +
          '.4-1.1-1-2.1-1.9-2.9 c-0.8-1.1-1.9-4-3.8-3.1c-0.6,0.2-1,1-1.5,1.' +
          '5c-0.4,0.6-0.8,1.3-1.3,1.9c-0.2,0.2-0.4,0.6-0.2,0.8c0,0.2,0.2,0.' +
          '2,0.4,0.2 c0.4,0.2,0.6,0.2,1,0.4c0.2,0,0.4,0.2,0.2,0.4c0,0,0,0.2' +
          '-0.2,0.2c-1,1.1-2.1,1.9-3.1,2.9c-0.2,0.2-0.4,0.6-0.4,0.8 c0,0.2,' +
          '0.2,0.2,0.2,0.4c0,0.2-0.2,0.2-0.4,0.4c-0.4,0.2-0.8,0.4-1.1,0.6c-' +
          '0.2,0.4,0,1.1-0.2,1.5c-0.2,1.1-0.8,1.9-1.3,2.9 c-0.4,0.6-0.6,1.3' +
          '-1,1.9c0,0.8-0.2,1.5,0.2,2.1c1,1.5,2.9,0.6,4.4,1.3c0.4,0.2,0.8,0' +
          '.2,1.1,0.6c0.6,0.6,0.6,1.7,0.8,2.3 c0.2,0.8,0.4,1.7,0.8,2.5c0.2,' +
          '1,0.6,2.1,0.8,2.9c1.9-1.5,3.6-3.1,4.8-5.2C40.6,32.4,41.2,30.7,41' +
          '.8,29z"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'heat_map'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          'CFD8DC" points="9,39 9,6 7,6 7,41 42,41 42,39"/>'#13#10'    <g fill="#' +
          '00BCD4">'#13#10'        <circle cx="14" cy="11" r="2"/>'#13#10'        <circ' +
          'le cx="32" cy="11" r="2"/>'#13#10'        <circle cx="39" cy="11" r="2' +
          '"/>'#13#10'        <circle cx="23" cy="11" r="4"/>'#13#10'        <circle cx' +
          '="14" cy="33" r="2"/>'#13#10'        <circle cx="30" cy="33" r="2"/>'#13#10 +
          '        <circle cx="22" cy="33" r="3"/>'#13#10'        <circle cx="38"' +
          ' cy="33" r="4"/>'#13#10'        <circle cx="14" cy="22" r="2"/>'#13#10'     ' +
          '   <circle cx="39" cy="22" r="2"/>'#13#10'        <circle cx="32" cy="' +
          '22" r="3"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'home'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          'E8EAF6" points="42,39 6,39 6,23 24,6 42,23"/>'#13#10'    <g fill="#C5C' +
          'AE9">'#13#10'        <polygon points="39,21 34,16 34,9 39,9"/>'#13#10'      ' +
          '  <rect x="6" y="39" width="36" height="5"/>'#13#10'    </g>'#13#10'    <pol' +
          'ygon fill="#B71C1C" points="24,4.3 4,22.9 6,25.1 24,8.4 42,25.1 ' +
          '44,22.9"/>'#13#10'    <rect x="18" y="28" fill="#D84315" width="12" he' +
          'ight="16"/>'#13#10'    <rect x="21" y="17" fill="#01579B" width="6" he' +
          'ight="6"/>'#13#10'    <path fill="#FF8A65" d="M27.5,35.5c-0.3,0-0.5,0.' +
          '2-0.5,0.5v2c0,0.3,0.2,0.5,0.5,0.5S28,38.3,28,38v-2C28,35.7,27.8,' +
          '35.5,27.5,35.5z"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'image_file'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '90CAF9" points="40,45 8,45 8,3 30,3 40,13"/>'#13#10'    <polygon fill=' +
          '"#E1F5FE" points="38.5,14 29,14 29,4.5"/>'#13#10'    <polygon fill="#1' +
          '565C0" points="21,23 14,33 28,33"/>'#13#10'    <polygon fill="#1976D2"' +
          ' points="28,26.4 23,33 33,33"/>'#13#10'    <circle fill="#1976D2" cx="' +
          '31.5" cy="24.5" r="1.5"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'import'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#F8B' +
          'BD0" d="M7,40V8c0-2.2,1.8-4,4-4h24c2.2,0,4,1.8,4,4v32c0,2.2-1.8,' +
          '4-4,4H11C8.8,44,7,42.2,7,40z"/>'#13#10'    <g fill="#E91E63">'#13#10'       ' +
          ' <polygon points="13.3,24 24,15 24,33"/>'#13#10'        <rect x="19" y' +
          '="21" width="23" height="6"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'info'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <circle fill="#2' +
          '196F3" cx="24" cy="24" r="21"/>'#13#10'    <rect x="22" y="22" fill="#' +
          'fff" width="4" height="11"/>'#13#10'    <circle fill="#fff" cx="24" cy' +
          '="16.5" r="2.5"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'inspection'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#455' +
          'A64" d="M36,4H26c0,1.1-0.9,2-2,2s-2-0.9-2-2H12C9.8,4,8,5.8,8,8v3' +
          '2c0,2.2,1.8,4,4,4h24c2.2,0,4-1.8,4-4V8 C40,5.8,38.2,4,36,4z"/>'#13#10 +
          '    <path fill="#fff" d="M36,41H12c-0.6,0-1-0.4-1-1V8c0-0.6,0.4-' +
          '1,1-1h24c0.6,0,1,0.4,1,1v32C37,40.6,36.6,41,36,41z"/>'#13#10'    <g fi' +
          'll="#90A4AE">'#13#10'        <path d="M26,4c0,1.1-0.9,2-2,2s-2-0.9-2-2' +
          'h-7v4c0,1.1,0.9,2,2,2h14c1.1,0,2-0.9,2-2V4H26z"/>'#13#10'        <path' +
          ' d="M24,0c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S26.2,0,24,0z M24,' +
          '6c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2 S25.1,6,24,6z"/>'#13#10'    </g' +
          '>'#13#10'    <polygon fill="#4CAF50" points="30.6,18.6 21.6,27.6 17.4,' +
          '23.3 14.9,25.8 21.7,32.5 33.1,21.1"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'internal'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <circle fill="#B' +
          '3E5FC" cx="24" cy="30" r="15"/>'#13#10'    <g fill="#1565C0">'#13#10'       ' +
          ' <polygon points="24,38.7 15,28 33,28"/>'#13#10'        <rect x="21" y' +
          '="5" width="6" height="26"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'line_chart'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#3F51B5' +
          '">'#13#10'        <circle cx="8" cy="38" r="3"/>'#13#10'        <circle cx="' +
          '16" cy="40" r="3"/>'#13#10'        <circle cx="24" cy="33" r="3"/>'#13#10'  ' +
          '      <circle cx="32" cy="35" r="3"/>'#13#10'        <circle cx="40" c' +
          'y="31" r="3"/>'#13#10'        <polygon points="39.1,29.2 31.8,32.9 23.' +
          '5,30.8 15.5,37.8 8.5,36.1 7.5,39.9 16.5,42.2 24.5,35.2 32.2,37.1' +
          ' 40.9,32.8"/>'#13#10'    </g>'#13#10'    <g fill="#00BCD4">'#13#10'        <circle' +
          ' cx="8" cy="20" r="3"/>'#13#10'        <circle cx="16" cy="22" r="3"/>' +
          #13#10'        <circle cx="24" cy="15" r="3"/>'#13#10'        <circle cx="3' +
          '2" cy="20" r="3"/>'#13#10'        <circle cx="40" cy="8" r="3"/>'#13#10'    ' +
          '    <path d="M38.3,6.9c-2.1,3.2-5.3,8-6.9,10.4c-1.2-0.7-3.1-2-6.' +
          '4-4l-1.3-0.8l-8.3,7.3l-7-1.7l-1,3.9l9,2.3l7.7-6.7 c2.6,1.6,5.8,3' +
          '.6,6.5,4.1l0.5,0.5l0.9-0.1c1.1-0.1,1.1-0.1,9.5-12.9L38.3,6.9z"/>' +
          #13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'menu'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#607D8B' +
          '">'#13#10'        <rect x="6" y="22" width="36" height="4"/>'#13#10'        ' +
          '<rect x="6" y="10" width="36" height="4"/>'#13#10'        <rect x="6" ' +
          'y="34" width="36" height="4"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'next'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '2196F3" points="17.1,5 14,8.1 29.9,24 14,39.9 17.1,43 36,24"/>'#13#10 +
          '</svg>'#13#10
      end
      item
        IconName = 'numerical_sorting_12'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '546E7A" points="38,33 38,5 34,5 34,33 28,33 36,43 44,33"/>'#13#10'    ' +
          '<g fill="#2196F3">'#13#10'        <path d="M16.4,20h-3V8.6L9.9,9.7V7.3' +
          'L16,5.1h0.3V20z"/>'#13#10'        <path d="M19.4,43H9.2v-2l4.8-5.1c0.4' +
          '-0.4,0.7-0.8,0.9-1.1c0.2-0.3,0.5-0.6,0.6-0.9c0.2-0.3,0.3-0.5,0.3' +
          '-0.8 c0.1-0.2,0.1-0.5,0.1-0.7c0-0.7-0.2-1.2-0.5-1.6c-0.3-0.4-0.8' +
          '-0.6-1.4-0.6c-0.3,0-0.7,0.1-0.9,0.2c-0.3,0.1-0.5,0.3-0.7,0.5 c-0' +
          '.2,0.2-0.3,0.5-0.4,0.8s-0.1,0.6-0.1,1h-3c0-0.7,0.1-1.3,0.4-1.9c0' +
          '.2-0.6,0.6-1.1,1-1.6c0.5-0.4,1-0.8,1.6-1.1 c0.6-0.3,1.4-0.4,2.2-' +
          '0.4c0.8,0,1.5,0.1,2.1,0.3c0.6,0.2,1.1,0.5,1.5,0.8s0.7,0.8,0.9,1.' +
          '3s0.3,1.1,0.3,1.8c0,0.5-0.1,1-0.2,1.4 S18.3,34.5,18,35s-0.6,0.9-' +
          '1,1.4c-0.4,0.5-0.9,1-1.4,1.5L13,40.6h6.4V43z"/>'#13#10'    </g>'#13#10'</svg' +
          '>'#13#10
      end
      item
        IconName = 'numerical_sorting_21'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '546E7A" points="38,33 38,5 34,5 34,33 28,33 36,43 44,33"/>'#13#10'    ' +
          '<g fill="#2196F3">'#13#10'        <path d="M19.2,20H9v-2l4.8-5.1c0.4-0' +
          '.4,0.7-0.8,0.9-1.1c0.2-0.3,0.5-0.6,0.6-0.9c0.2-0.3,0.3-0.5,0.3-0' +
          '.8 c0.1-0.2,0.1-0.5,0.1-0.7c0-0.7-0.2-1.2-0.5-1.6c-0.3-0.4-0.8-0' +
          '.6-1.4-0.6c-0.3,0-0.7,0.1-0.9,0.2c-0.3,0.1-0.5,0.3-0.7,0.5 c-0.2' +
          ',0.2-0.3,0.5-0.4,0.8s-0.1,0.6-0.1,1h-3c0-0.7,0.1-1.3,0.4-1.9c0.2' +
          '-0.6,0.6-1.1,1-1.6c0.5-0.4,1-0.8,1.6-1.1 c0.6-0.3,1.4-0.4,2.2-0.' +
          '4c0.8,0,1.5,0.1,2.1,0.3c0.6,0.2,1.1,0.5,1.5,0.8s0.7,0.8,0.9,1.3c' +
          '0.2,0.5,0.3,1.1,0.3,1.8 c0,0.5-0.1,1-0.2,1.4s-0.4,0.9-0.7,1.4s-0' +
          '.6,0.9-1,1.4c-0.4,0.5-0.9,1-1.4,1.5l-2.6,2.8h6.4V20z"/>'#13#10'       ' +
          ' <path d="M16.2,43h-3V31.6l-3.5,1.1v-2.4l6.2-2.2h0.3V43z"/>'#13#10'   ' +
          ' </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'ok'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <circle fill="#4' +
          'CAF50" cx="24" cy="24" r="21"/>'#13#10'    <polygon fill="#CCFF90" poi' +
          'nts="34.6,14.6 21,28.2 15.4,22.6 12.6,25.4 21,33.8 37.4,17.4"/>'#13 +
          #10'</svg>'#13#10
      end
      item
        IconName = 'pie_chart'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#00B' +
          'CD4" d="M24,6C14.1,6,6,14.1,6,24s8.1,18,18,18c5.2,0,9.9-2.2,13.1' +
          '-5.7L24,24V6z"/>'#13#10'    <path fill="#448AFF" d="M42,24c0-9.9-8.1-1' +
          '8-18-18v18H42z"/>'#13#10'    <path fill="#3F51B5" d="M24,24l13.1,12.3c' +
          '3-3.2,4.9-7.5,4.9-12.3H24z"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'plus'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <circle fill="#4' +
          'CAF50" cx="24" cy="24" r="21"/>'#13#10'    <g fill="#fff">'#13#10'        <r' +
          'ect x="21" y="14" width="6" height="20"/>'#13#10'        <rect x="14" ' +
          'y="21" width="20" height="6"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'previous'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          '2196F3" points="30.9,43 34,39.9 18.1,24 34,8.1 30.9,5 12,24"/>'#13#10 +
          '</svg>'#13#10
      end
      item
        IconName = 'print'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <rect x="9" y="1' +
          '1" fill="#424242" width="30" height="3"/>'#13#10'    <path fill="#6161' +
          '61" d="M4,25h40v-7c0-2.2-1.8-4-4-4H8c-2.2,0-4,1.8-4,4V25z"/>'#13#10'  ' +
          '  <path fill="#424242" d="M8,36h32c2.2,0,4-1.8,4-4v-8H4v8C4,34.2' +
          ',5.8,36,8,36z"/>'#13#10'    <circle fill="#00E676" cx="40" cy="18" r="' +
          '1"/>'#13#10'    <rect x="11" y="4" fill="#90CAF9" width="26" height="1' +
          '0"/>'#13#10'    <path fill="#242424" d="M37.5,31h-27C9.7,31,9,30.3,9,2' +
          '9.5v0c0-0.8,0.7-1.5,1.5-1.5h27c0.8,0,1.5,0.7,1.5,1.5v0 C39,30.3,' +
          '38.3,31,37.5,31z"/>'#13#10'    <rect x="11" y="31" fill="#90CAF9" widt' +
          'h="26" height="11"/>'#13#10'    <rect x="11" y="29" fill="#42A5F5" wid' +
          'th="26" height="2"/>'#13#10'    <g fill="#1976D2">'#13#10'        <rect x="1' +
          '6" y="33" width="17" height="2"/>'#13#10'        <rect x="16" y="37" w' +
          'idth="13" height="2"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'puzzle'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#8BC' +
          '34A" d="M39,15c0-2.2-1.8-4-4-4h-6c-0.7,0-1.1-0.8-0.7-1.4c0.6-1,0' +
          '.9-2.2,0.6-3.5c-0.4-2-1.9-3.6-3.8-4 C21.8,1.4,19,3.9,19,7c0,1,0.' +
          '3,1.8,0.7,2.6c0.4,0.6,0,1.4-0.8,1.4h-6c-2.2,0-4,1.8-4,4v7c0,0.7,' +
          '0.8,1.1,1.4,0.7 c1-0.6,2.2-0.9,3.5-0.6c2,0.4,3.6,1.9,4,3.8c0.7,3' +
          '.2-1.8,6.1-4.9,6.1c-1,0-1.8-0.3-2.6-0.7C9.8,30.9,9,31.3,9,32v6c0' +
          ',2.2,1.8,4,4,4 h22c2.2,0,4-1.8,4-4V15z"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'refresh'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#1565C0' +
          '">'#13#10'        <path d="M13,13c0-3.3,2.7-6,6-6h10c3.3,0,6,2.7,6,6h4' +
          'c0-5.5-4.5-10-10-10H19C13.5,3,9,7.5,9,13v11.2h4V13z"/>'#13#10'        ' +
          '<polygon points="4.6,22 11,30.4 17.4,22"/>'#13#10'    </g>'#13#10'    <g fil' +
          'l="#1565C0">'#13#10'        <path d="M35,35c0,3.3-2.7,6-6,6H19c-3.3,0-' +
          '6-2.7-6-6H9c0,5.5,4.5,10,10,10h10c5.5,0,10-4.5,10-10V23h-4V35z"/' +
          '>'#13#10'        <polygon points="30.6,26 37,17.6 43.4,26"/>'#13#10'    </g>' +
          #13#10'</svg>'#13#10
      end
      item
        IconName = 'rules'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#42A' +
          '5F5" d="M39,45H9c0,0-3-0.1-3-8h36C42,44.9,39,45,39,45z"/>'#13#10'    <' +
          'rect x="8" y="3" fill="#90CAF9" width="32" height="34"/>'#13#10'    <g' +
          ' fill="#1976D2">'#13#10'        <rect x="18" y="15" width="16" height=' +
          '"2"/>'#13#10'        <rect x="18" y="19" width="16" height="2"/>'#13#10'    ' +
          '    <rect x="18" y="23" width="16" height="2"/>'#13#10'        <rect x' +
          '="18" y="27" width="16" height="2"/>'#13#10'        <rect x="18" y="31' +
          '" width="16" height="2"/>'#13#10'    </g>'#13#10'    <g fill="#1976D2">'#13#10'   ' +
          '     <rect x="14" y="15" width="2" height="2"/>'#13#10'        <rect x' +
          '="14" y="19" width="2" height="2"/>'#13#10'        <rect x="14" y="23"' +
          ' width="2" height="2"/>'#13#10'        <rect x="14" y="27" width="2" h' +
          'eight="2"/>'#13#10'        <rect x="14" y="31" width="2" height="2"/>'#13 +
          #10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'scatter_plot'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <polygon fill="#' +
          'CFD8DC" points="9,39 9,6 7,6 7,41 42,41 42,39"/>'#13#10'    <g fill="#' +
          '00BCD4">'#13#10'        <circle cx="39" cy="11" r="3"/>'#13#10'        <circ' +
          'le cx="31" cy="13" r="3"/>'#13#10'        <circle cx="37" cy="19" r="3' +
          '"/>'#13#10'        <circle cx="34" cy="26" r="3"/>'#13#10'        <circle cx' +
          '="28" cy="20" r="3"/>'#13#10'        <circle cx="26" cy="28" r="3"/>'#13#10 +
          '        <circle cx="20" cy="23" r="3"/>'#13#10'        <circle cx="21"' +
          ' cy="33" r="3"/>'#13#10'        <circle cx="14" cy="30" r="3"/>'#13#10'    <' +
          '/g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'search'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#616161' +
          '">'#13#10'        <rect x="34.6" y="28.1" transform="matrix(.707 -.707' +
          ' .707 .707 -15.154 36.586)" width="4" height="17"/>'#13#10'        <ci' +
          'rcle cx="20" cy="20" r="16"/>'#13#10'    </g>'#13#10'    <rect x="36.2" y="3' +
          '2.1" transform="matrix(.707 -.707 .707 .707 -15.839 38.239)" fil' +
          'l="#37474F" width="4" height="12.3"/>'#13#10'    <circle fill="#64B5F6' +
          '" cx="20" cy="20" r="13"/>'#13#10'    <path fill="#BBDEFB" d="M26.9,14' +
          '.2c-1.7-2-4.2-3.2-6.9-3.2s-5.2,1.2-6.9,3.2c-0.4,0.4-0.3,1.1,0.1,' +
          '1.4c0.4,0.4,1.1,0.3,1.4-0.1 C16,13.9,17.9,13,20,13s4,0.9,5.4,2.5' +
          'c0.2,0.2,0.5,0.4,0.8,0.4c0.2,0,0.5-0.1,0.6-0.2C27.2,15.3,27.2,14' +
          '.6,26.9,14.2z"/>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'settings'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#607' +
          'D8B" d="M39.6,27.2c0.1-0.7,0.2-1.4,0.2-2.2s-0.1-1.5-0.2-2.2l4.5-' +
          '3.2c0.4-0.3,0.6-0.9,0.3-1.4L40,10.8 c-0.3-0.5-0.8-0.7-1.3-0.4l-5' +
          ',2.3c-1.2-0.9-2.4-1.6-3.8-2.2l-0.5-5.5c-0.1-0.5-0.5-0.9-1-0.9h-8' +
          '.6c-0.5,0-1,0.4-1,0.9l-0.5,5.5 c-1.4,0.6-2.7,1.3-3.8,2.2l-5-2.3c' +
          '-0.5-0.2-1.1,0-1.3,0.4l-4.3,7.4c-0.3,0.5-0.1,1.1,0.3,1.4l4.5,3.2' +
          'c-0.1,0.7-0.2,1.4-0.2,2.2 s0.1,1.5,0.2,2.2L4,30.4c-0.4,0.3-0.6,0' +
          '.9-0.3,1.4L8,39.2c0.3,0.5,0.8,0.7,1.3,0.4l5-2.3c1.2,0.9,2.4,1.6,' +
          '3.8,2.2l0.5,5.5 c0.1,0.5,0.5,0.9,1,0.9h8.6c0.5,0,1-0.4,1-0.9l0.5' +
          '-5.5c1.4-0.6,2.7-1.3,3.8-2.2l5,2.3c0.5,0.2,1.1,0,1.3-0.4l4.3-7.4' +
          ' c0.3-0.5,0.1-1.1-0.3-1.4L39.6,27.2z M24,35c-5.5,0-10-4.5-10-10c' +
          '0-5.5,4.5-10,10-10c5.5,0,10,4.5,10,10C34,30.5,29.5,35,24,35z"/>'#13 +
          #10'    <path fill="#455A64" d="M24,13c-6.6,0-12,5.4-12,12c0,6.6,5.' +
          '4,12,12,12s12-5.4,12-12C36,18.4,30.6,13,24,13z M24,30 c-2.8,0-5-' +
          '2.2-5-5c0-2.8,2.2-5,5-5s5,2.2,5,5C29,27.8,26.8,30,24,30z"/>'#13#10'</s' +
          'vg>'#13#10
      end
      item
        IconName = 'support'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <path fill="#607' +
          'D8B" d="M44.7,11L36,19.6c0,0-2.6,0-5.2-2.6s-2.6-5.2-2.6-5.2l8.7-' +
          '8.7c-4.9-1.2-10.8,0.4-14.4,4 c-5.4,5.4-0.6,12.3-2,13.7C12.9,28.7' +
          ',5.1,34.7,4.9,35c-2.3,2.3-2.4,6-0.2,8.2c2.2,2.2,5.9,2.1,8.2-0.2c' +
          '0.3-0.3,6.7-8.4,14.2-15.9 c1.4-1.4,8,3.7,13.6-1.8C44.2,21.7,45.9' +
          ',15.9,44.7,11z M9.4,41.1c-1.4,0-2.5-1.1-2.5-2.5C6.9,37.1,8,36,9.' +
          '4,36 c1.4,0,2.5,1.1,2.5,2.5C11.9,39.9,10.8,41.1,9.4,41.1z"/>'#13#10'</' +
          'svg>'#13#10
      end
      item
        IconName = 'template'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <rect x="4" y="7' +
          '" fill="#BBDEFB" width="40" height="34"/>'#13#10'    <rect x="9" y="12' +
          '" fill="#3F51B5" width="30" height="5"/>'#13#10'    <g fill="#2196F3">' +
          #13#10'        <rect x="9" y="21" width="13" height="16"/>'#13#10'        <' +
          'rect x="26" y="21" width="13" height="16"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'undo'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#00BCD4' +
          '">'#13#10'        <polygon points="5,18 19,6.3 19,29.7"/>'#13#10'        <pa' +
          'th d="M28,14H16v8h12c2.8,0,5,2.2,5,5s-2.2,5-5,5h-3v8h3c7.2,0,13-' +
          '5.8,13-13S35.2,14,28,14z"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'upload'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <g fill="#009688' +
          '">'#13#10'        <polygon points="24,10.9 35,24 13,24"/>'#13#10'        <re' +
          'ct x="20" y="40" width="8" height="4"/>'#13#10'        <rect x="20" y=' +
          '"34" width="8" height="4"/>'#13#10'        <rect x="20" y="21" width="' +
          '8" height="11"/>'#13#10'        <rect x="6" y="4" width="36" height="4' +
          '"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end
      item
        IconName = 'view_details'
        SVGText = 
          '<svg version="1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0' +
          ' 48 48" enable-background="new 0 0 48 48">'#13#10'    <rect x="7" y="4' +
          '" fill="#BBDEFB" width="34" height="40"/>'#13#10'    <g fill="#2196F3"' +
          '>'#13#10'        <rect x="13" y="26" width="4" height="4"/>'#13#10'        <' +
          'rect x="13" y="18" width="4" height="4"/>'#13#10'        <rect x="13" ' +
          'y="34" width="4" height="4"/>'#13#10'        <rect x="13" y="10" width' +
          '="4" height="4"/>'#13#10'        <rect x="21" y="26" width="14" height' +
          '="4"/>'#13#10'        <rect x="21" y="18" width="14" height="4"/>'#13#10'   ' +
          '     <rect x="21" y="34" width="14" height="4"/>'#13#10'        <rect ' +
          'x="21" y="10" width="14" height="4"/>'#13#10'    </g>'#13#10'</svg>'#13#10
      end>
    Left = 640
    Top = 24
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
    IndexFieldNames = 'SampleNo'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvSortOptions]
    FormatOptions.SortOptions = [soNoCase, soPrimary]
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.KeyFields = 'SampleNo'
    StoreDefs = True
    Left = 576
    Top = 136
    object fdmtNewSamplesSampleNo: TStringField
      FieldName = 'SampleNo'
      KeyFields = 'SampleNo'
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
      DisplayFormat = '###0.00000'
      EditFormat = '###0.00000'
    end
    object fdmtNewSamplesLatitude: TFloatField
      FieldName = 'Latitude'
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
  object dsfdmtNewSamples: TDataSource
    DataSet = fdmtNewSamples
    Left = 648
    Top = 136
  end
end
