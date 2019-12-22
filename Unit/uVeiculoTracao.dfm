object FrVeiculoTracao: TFrVeiculoTracao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Veiculos de Tra'#231#227'o.'
  ClientHeight = 284
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgControl: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 567
    Height = 242
    ActivePage = tabVeiculos
    Align = alClient
    TabOrder = 0
    OnChanging = pgControlChanging
    ExplicitWidth = 562
    object tabVeiculos: TTabSheet
      Caption = 'Ve'#237'culos'
      ExplicitWidth = 554
      object JvDBGrid1: TJvDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 553
        Height = 208
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
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'MD_UF'
            Title.Caption = 'UF'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MD_VEIC_PLACA'
            Title.Caption = 'Placa'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MD_TIPO_CARRO'
            Title.Caption = 'Tipo de Carroceria'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 155
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MD_TIP_ROD'
            Title.Caption = 'Tipo de Rodado'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 133
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MD_TARA'
            Title.Caption = 'Tara (KG)'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 107
            Visible = True
          end>
        Delphi2010OptionsMigrated = True
      end
    end
    object tabDetalhes: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 25
      ExplicitWidth = 554
      object GroupBox4: TGroupBox
        Left = 3
        Top = 2
        Width = 553
        Height = 63
        Caption = 'Dados do Ve'#237'culo.'
        TabOrder = 0
        object Label14: TLabel
          Left = 7
          Top = 16
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object Label15: TLabel
          Left = 147
          Top = 16
          Width = 88
          Height = 13
          Caption = 'Tipo de Carro'#231'eria'
        end
        object Label16: TLabel
          Left = 67
          Top = 16
          Width = 25
          Height = 13
          Caption = 'Placa'
        end
        object Label17: TLabel
          Left = 305
          Top = 16
          Width = 75
          Height = 13
          Caption = 'Tipo de Rodado'
        end
        object Label18: TLabel
          Left = 449
          Top = 16
          Width = 46
          Height = 13
          Caption = 'Tara (KG)'
        end
        object cbUfVeiculo: TRzDBComboBox
          Left = 7
          Top = 32
          Width = 54
          Height = 21
          DataField = 'MD_UF'
          DataSource = dsQuery
          Style = csDropDownList
          TabOrder = 0
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
        end
        object cbCarroceria: TRzDBComboBox
          Left = 147
          Top = 32
          Width = 152
          Height = 21
          DataField = 'MD_TIPO_CARRO'
          DataSource = dsQuery
          Style = csDropDownList
          TabOrder = 2
          Items.Strings = (
            'N'#227'o Aplicavel'
            'Aberta'
            'Fechada/Ba'#250
            'Graneleira'
            'PortaCont'#234'iner'
            'Sider')
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5')
        end
        object txtPlaca: TRzDBEdit
          Left = 67
          Top = 32
          Width = 74
          Height = 21
          DataSource = dsQuery
          DataField = 'MD_VEIC_PLACA'
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object cbTipoRodado: TRzDBComboBox
          Left = 305
          Top = 32
          Width = 138
          Height = 21
          DataField = 'MD_TIP_ROD'
          DataSource = dsQuery
          Style = csDropDownList
          TabOrder = 3
          Items.Strings = (
            'N'#227'o Aplicavel'
            'Truck'
            'Toco'
            'Cavalo Mec'#226'nico'
            'Van'
            'Utilit'#225'rio'
            'Outros')
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6')
        end
        object txtTara: TJvDBCalcEdit
          Left = 449
          Top = 32
          Width = 96
          Height = 21
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          DataField = 'MD_TARA'
          DataSource = dsQuery
        end
      end
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 248
    Width = 573
    Height = 36
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    ExplicitTop = 178
    ExplicitWidth = 559
    object JvDBNavigator1: TJvDBNavigator
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 190
      Height = 30
      DataSource = dsQuery
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
      Align = alLeft
      ConfirmDelete = False
      TabOrder = 0
    end
    object btnClose: TButton
      AlignWithMargins = True
      Left = 485
      Top = 5
      Width = 85
      Height = 26
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCloseClick
      ExplicitLeft = 484
    end
    object btnMotoristas: TButton
      AlignWithMargins = True
      Left = 394
      Top = 5
      Width = 85
      Height = 26
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Motoristas'
      TabOrder = 2
      OnClick = btnMotoristasClick
      ExplicitLeft = 380
    end
  end
  object Query: TFDQuery
    BeforePost = QueryBeforePost
    BeforeDelete = QueryBeforeDelete
    IndexFieldNames = 'ID_C000700'
    MasterSource = FrPrincipal.dsQuery
    MasterFields = 'ID'
    DetailFields = 'ID_C000700'
    Connection = Modulo.DBConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT * FROM C000703 WHERE ID_C000700 = :ID')
    Left = 44
    Top = 124
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QueryID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryID_C000700: TIntegerField
      FieldName = 'ID_C000700'
      Origin = 'ID_C000700'
    end
    object QueryMD_VEIC_PLACA: TStringField
      FieldName = 'MD_VEIC_PLACA'
      Origin = 'MD_VEIC_PLACA'
      FixedChar = True
      Size = 10
    end
    object QueryMD_VEIC_RENAVAM: TStringField
      FieldName = 'MD_VEIC_RENAVAM'
      Origin = 'MD_VEIC_RENAVAM'
      Size = 25
    end
    object QueryMD_TARA: TIntegerField
      FieldName = 'MD_TARA'
      Origin = 'MD_TARA'
    end
    object QueryMD_CAP_KL: TIntegerField
      FieldName = 'MD_CAP_KL'
      Origin = 'MD_CAP_KL'
    end
    object QueryMD_CAP_M3: TIntegerField
      FieldName = 'MD_CAP_M3'
      Origin = 'MD_CAP_M3'
    end
    object QueryMD_TIP_ROD: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'MD_TIP_ROD'
      Origin = 'MD_TIP_ROD'
      OnGetText = QueryMD_TIP_RODGetText
    end
    object QueryMD_TIPO_CARRO: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'MD_TIPO_CARRO'
      Origin = 'MD_TIPO_CARRO'
      OnGetText = QueryMD_TIPO_CARROGetText
    end
    object QueryMD_UF: TStringField
      FieldName = 'MD_UF'
      Origin = 'MD_UF'
      FixedChar = True
      Size = 2
    end
  end
  object dsQuery: TDataSource
    AutoEdit = False
    DataSet = Query
    OnStateChange = dsQueryStateChange
    Left = 79
    Top = 123
  end
end
