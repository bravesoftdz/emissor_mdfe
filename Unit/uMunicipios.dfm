object FrMunicipios: TFrMunicipios
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Munic'#237'pios.'
  ClientHeight = 110
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 327
    Height = 68
    Align = alClient
    Caption = 'Munic'#237'pios de Carregamentos.'
    TabOrder = 0
    object Label11: TLabel
      Left = 6
      Top = 17
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label10: TLabel
      Left = 70
      Top = 17
      Width = 43
      Height = 13
      Caption = 'Munic'#237'pio'
    end
    object cbUF: TRzComboBox
      Left = 6
      Top = 32
      Width = 58
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnClick = cbUFClick
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
      Values.Strings = (
        '12'
        '27'
        '16'
        '13'
        '29'
        '23'
        '53'
        '32'
        '52'
        '21'
        '51'
        '50'
        '31'
        '15'
        '25'
        '41'
        '26'
        '22'
        '33'
        '24'
        '43'
        '11'
        '14'
        '42'
        '35'
        '28'
        '17')
    end
    object txtMunicipio: TJvDBSearchComboBox
      Left = 70
      Top = 32
      Width = 253
      Height = 21
      DataField = 'NOME'
      DataSource = dsMunicipios
      Style = csDropDownList
      TabOrder = 1
      Text = ''
    end
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 74
    Width = 333
    HotTrack = True
    OKDefault = False
    ModalResultOk = 0
    OnClickOk = RzDialogButtons1ClickOk
    TabOrder = 1
  end
  object Query: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 4
    Top = 74
  end
  object dsMunicipios: TDataSource
    AutoEdit = False
    DataSet = Query
    Left = 36
    Top = 74
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 72
    Top = 74
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 104
    Top = 74
  end
end
