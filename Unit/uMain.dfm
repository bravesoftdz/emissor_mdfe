object FrPrincipal: TFrPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de MDF-e'
  ClientHeight = 430
  ClientWidth = 945
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvDBGrid1: TJvDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 52
    Width = 939
    Height = 375
    Align = alClient
    DataSource = dsQuery
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AutoSizeColumns = True
    AutoSizeColumnIndex = 4
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'MD_NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_SERIE'
        Title.Caption = 'S'#233'rie'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_DH_EMISSAO'
        Title.Caption = 'Data Emiss'#227'o'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_DH_INICIO_VIAGEM'
        Title.Caption = 'Data Saida'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_STATUS'
        Title.Caption = 'Status'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_SEF_CHAVE'
        Title.Caption = 'Chave'
        Width = 483
        Visible = True
      end>
    Delphi2010OptionsMigrated = True
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 945
    Height = 49
    Align = alTop
    Caption = 'Emitente.'
    TabOrder = 1
    object cbEmitente: TJvDBSearchComboBox
      Left = 7
      Top = 20
      Width = 466
      Height = 21
      DataField = 'EMP_RAZAO'
      DataSource = dsEmitente
      Style = csDropDownList
      TabOrder = 0
      Text = ''
    end
    object RzDBEdit13: TRzDBEdit
      Left = 479
      Top = 20
      Width = 28
      Height = 21
      DataSource = dsEmitente
      DataField = 'EMP_UF'
      Enabled = False
      TabOrder = 1
    end
    object RzDBEdit14: TRzDBEdit
      Left = 513
      Top = 20
      Width = 158
      Height = 21
      DataSource = dsEmitente
      DataField = 'EMP_CNPJ'
      Enabled = False
      MaxLength = 18
      TabOrder = 2
    end
    object DataIni: TJvDateEdit
      Left = 696
      Top = 20
      Width = 77
      Height = 21
      ShowNullDate = False
      TabOrder = 3
    end
    object Datafim: TJvDateEdit
      Left = 779
      Top = 20
      Width = 77
      Height = 21
      ShowNullDate = False
      TabOrder = 4
    end
    object Button1: TButton
      Left = 862
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 5
    end
  end
  object Query: TFDQuery
    OnNewRecord = QueryNewRecord
    MasterSource = dsEmitente
    Connection = Modulo.DBConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    SQL.Strings = (
      'SELECT * FROM C000700')
    Left = 20
    Top = 96
    object QueryID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryID_EMP: TIntegerField
      FieldName = 'ID_EMP'
      Origin = 'ID_EMP'
    end
    object QueryMD_TIP_AMBIENTE: TIntegerField
      FieldName = 'MD_TIP_AMBIENTE'
      Origin = 'MD_TIP_AMBIENTE'
    end
    object QueryMD_TIP_EMITENTE: TIntegerField
      FieldName = 'MD_TIP_EMITENTE'
      Origin = 'MD_TIP_EMITENTE'
    end
    object QueryMD_TIP_TRANSPORTADOR: TIntegerField
      FieldName = 'MD_TIP_TRANSPORTADOR'
      Origin = 'MD_TIP_TRANSPORTADOR'
    end
    object QueryMD_TIP_MODAL: TIntegerField
      FieldName = 'MD_TIP_MODAL'
      Origin = 'MD_TIP_MODAL'
    end
    object QueryMD_TIP_EMISSAO: TIntegerField
      FieldName = 'MD_TIP_EMISSAO'
      Origin = 'MD_TIP_EMISSAO'
    end
    object QueryMD_TIP_APLICATIVO: TIntegerField
      FieldName = 'MD_TIP_APLICATIVO'
      Origin = 'MD_TIP_APLICATIVO'
    end
    object QueryMD_MODELO: TIntegerField
      FieldName = 'MD_MODELO'
      Origin = 'MD_MODELO'
    end
    object QueryMD_SERIE: TIntegerField
      Alignment = taCenter
      FieldName = 'MD_SERIE'
      Origin = 'MD_SERIE'
    end
    object QueryMD_NUMERO: TIntegerField
      FieldName = 'MD_NUMERO'
      Origin = 'MD_NUMERO'
      DisplayFormat = '000,000'
    end
    object QueryMD_COD_SEGURANCA: TStringField
      FieldName = 'MD_COD_SEGURANCA'
      Origin = 'MD_COD_SEGURANCA'
      Size = 10
    end
    object QueryMD_COD_DIVISOR: TIntegerField
      FieldName = 'MD_COD_DIVISOR'
      Origin = 'MD_COD_DIVISOR'
    end
    object QueryMD_DH_EMISSAO: TSQLTimeStampField
      FieldName = 'MD_DH_EMISSAO'
      Origin = 'MD_DH_EMISSAO'
      EditMask = '!99/99/0000 99:99:99;1; '
    end
    object QueryMD_DH_INICIO_VIAGEM: TSQLTimeStampField
      FieldName = 'MD_DH_INICIO_VIAGEM'
      Origin = 'MD_DH_INICIO_VIAGEM'
      EditMask = '!99/99/0000 99:99:99;1; '
    end
    object QueryMD_VER_APLICATIVO: TStringField
      FieldName = 'MD_VER_APLICATIVO'
      Origin = 'MD_VER_APLICATIVO'
      Size = 25
    end
    object QueryMD_COD_MUNICIPIO: TStringField
      FieldName = 'MD_COD_MUNICIPIO'
      Origin = 'MD_COD_MUNICIPIO'
      Size = 10
    end
    object QueryMD_NOM_MUNICIPIO: TStringField
      FieldName = 'MD_NOM_MUNICIPIO'
      Origin = 'MD_NOM_MUNICIPIO'
      Size = 65
    end
    object QueryMD_UF_INICIAL: TStringField
      FieldName = 'MD_UF_INICIAL'
      Origin = 'MD_UF_INICIAL'
      FixedChar = True
      Size = 2
    end
    object QueryMD_UF_FINAL: TStringField
      FieldName = 'MD_UF_FINAL'
      Origin = 'MD_UF_FINAL'
      FixedChar = True
      Size = 2
    end
    object QueryMD_STATUS: TIntegerField
      Alignment = taCenter
      FieldName = 'MD_STATUS'
      Origin = 'MD_STATUS'
      OnGetText = QueryMD_STATUSGetText
    end
    object QueryMD_VLR_CARGA: TFMTBCDField
      FieldName = 'MD_VLR_CARGA'
      Origin = 'MD_VLR_CARGA'
      Precision = 18
      Size = 2
    end
    object QueryMD_COD_UNIDADE: TIntegerField
      FieldName = 'MD_COD_UNIDADE'
      Origin = 'MD_COD_UNIDADE'
    end
    object QueryMD_QTD_CARGA: TBCDField
      FieldName = 'MD_QTD_CARGA'
      Origin = 'MD_QTD_CARGA'
      Precision = 18
    end
    object QueryMD_INF_COMPLEMENTARES: TStringField
      FieldName = 'MD_INF_COMPLEMENTARES'
      Origin = 'MD_INF_COMPLEMENTARES'
      Size = 1000
    end
    object QueryMD_SEF_CSTAT: TIntegerField
      FieldName = 'MD_SEF_CSTAT'
      Origin = 'MD_SEF_CSTAT'
    end
    object QueryMD_INF_FISCO: TStringField
      FieldName = 'MD_INF_FISCO'
      Origin = 'MD_INF_FISCO'
      Size = 1000
    end
    object QueryMD_SEF_RECIBO: TStringField
      FieldName = 'MD_SEF_RECIBO'
      Origin = 'MD_SEF_RECIBO'
      Size = 25
    end
    object QueryMD_SEF_PROTOCOLO: TStringField
      FieldName = 'MD_SEF_PROTOCOLO'
      Origin = 'MD_SEF_PROTOCOLO'
      Size = 25
    end
    object QueryMD_SEF_CHAVE: TStringField
      FieldName = 'MD_SEF_CHAVE'
      Origin = 'MD_SEF_CHAVE'
      Size = 50
    end
    object QueryMD_SEF_XML: TMemoField
      FieldName = 'MD_SEF_XML'
      Origin = 'MD_SEF_XML'
      BlobType = ftMemo
    end
    object QueryMD_SEF_CAN_CHAVE: TStringField
      FieldName = 'MD_SEF_CAN_CHAVE'
      Origin = 'MD_SEF_CAN_CHAVE'
      Size = 50
    end
    object QueryMD_SEF_CAN_XML: TMemoField
      FieldName = 'MD_SEF_CAN_XML'
      Origin = 'MD_SEF_CAN_XML'
      BlobType = ftMemo
    end
    object QueryMD_SEF_CAN_RECIBO: TStringField
      FieldName = 'MD_SEF_CAN_RECIBO'
      Origin = 'MD_SEF_CAN_RECIBO'
      Size = 25
    end
    object QueryMD_SEF_CAN_PROTOCOLO: TStringField
      FieldName = 'MD_SEF_CAN_PROTOCOLO'
      Origin = 'MD_SEF_CAN_PROTOCOLO'
      Size = 25
    end
  end
  object dsQuery: TDataSource
    AutoEdit = False
    DataSet = Query
    Left = 52
    Top = 96
  end
  object QueryEmitente: TFDQuery
    ActiveStoredUsage = []
    Connection = Modulo.DBConexao
    SQL.Strings = (
      'SELECT * FROM C000501')
    Left = 348
    Top = 11
    object QueryEmitenteID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryEmitenteEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      Origin = 'EMP_RAZAO'
      Required = True
      Size = 120
    end
    object QueryEmitenteEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      Origin = 'EMP_CNPJ'
      Required = True
      EditMask = '!99.999.999/0000-99;0;'
      Size = 15
    end
    object QueryEmitenteEMP_UF: TStringField
      Alignment = taCenter
      FieldName = 'EMP_UF'
      Origin = 'EMP_UF'
      FixedChar = True
      Size = 2
    end
  end
  object dsEmitente: TDataSource
    AutoEdit = False
    DataSet = QueryEmitente
    Left = 384
    Top = 11
  end
  object MainMenu1: TMainMenu
    Left = 500
    Top = 120
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object Novo1: TMenuItem
        Caption = 'Novo MDF-e'
        ShortCut = 16462
        OnClick = Novo1Click
      end
      object Alterar1: TMenuItem
        Caption = 'Preenchimento'
        object AlterarCabealho1: TMenuItem
          Caption = '&Cabe'#231'alho'
          ShortCut = 16451
          OnClick = AlterarCabealho1Click
        end
        object AlterarDocumentos1: TMenuItem
          Caption = '&Documentos'
          ShortCut = 16452
          OnClick = AlterarDocumentos1Click
        end
      end
      object Excluir1: TMenuItem
        Caption = '-'
      end
      object Excluir2: TMenuItem
        Caption = 'Excluir'
        ShortCut = 46
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        ShortCut = 16467
      end
    end
  end
end
