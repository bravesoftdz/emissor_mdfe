object FrListaDoctos: TFrListaDoctos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Documentos (NF-e).'
  ClientHeight = 358
  ClientWidth = 685
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
  object JvDBGrid1: TJvDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 679
    Height = 278
    Align = alClient
    DataSource = dsDoctos
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AutoSizeColumns = True
    AutoSizeColumnIndex = 0
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'MD_CHAVE_DOC'
        Title.Caption = 'Chave'
        Width = 412
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_DESC_MUNICIPIO'
        Title.Caption = 'Munic'#237'pio'
        Width = 220
        Visible = True
      end>
    Delphi2010OptionsMigrated = True
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 322
    Width = 685
    HotTrack = True
    TabOrder = 1
  end
  object JvDBNavigator1: TJvDBNavigator
    Left = 0
    Top = 284
    Width = 685
    Height = 38
    DataSource = dsDoctos
    Align = alBottom
    TabOrder = 2
  end
  object QueryDoctos: TFDQuery
    IndexFieldNames = 'ID_C000800'
    MasterSource = FrPrincipal.dsQuery
    MasterFields = 'ID'
    DetailFields = 'ID_C000800'
    Connection = Modulo.DBConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT * FROM C000801 WHERE ID_C000800 = :ID')
    Left = 20
    Top = 128
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object IntegerField1: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryID_C000800: TIntegerField
      FieldName = 'ID_C000800'
      Origin = 'ID_C000800'
    end
    object QueryUF: TIntegerField
      FieldName = 'UF'
      Origin = 'UF'
    end
    object QueryMD_COD_MUNICIPIO: TStringField
      FieldName = 'MD_COD_MUNICIPIO'
      Origin = 'MD_COD_MUNICIPIO'
      Size = 10
    end
    object QueryMD_DESC_MUNICIPIO: TStringField
      FieldName = 'MD_DESC_MUNICIPIO'
      Origin = 'MD_DESC_MUNICIPIO'
      Size = 65
    end
    object QueryMD_CHAVE_DOC: TStringField
      FieldName = 'MD_CHAVE_DOC'
      Origin = 'MD_CHAVE_DOC'
      Size = 50
    end
  end
  object dsDoctos: TDataSource
    AutoEdit = False
    DataSet = QueryDoctos
    Left = 52
    Top = 128
  end
end
