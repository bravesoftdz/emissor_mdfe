object FrChavesNFe: TFrChavesNFe
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Chaves das NF-e.'
  ClientHeight = 181
  ClientWidth = 349
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
  object GridChave: TJvDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 343
    Height = 139
    Align = alClient
    DataSource = dsQuery
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection]
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
        FieldName = 'MD_CHAVE_NFE'
        Title.Caption = 'Chave NF-e'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 326
        Visible = True
      end>
    Delphi2010OptionsMigrated = True
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 145
    Width = 349
    HotTrack = True
    TabOrder = 1
    ExplicitLeft = 180
    ExplicitTop = 124
    ExplicitWidth = 185
    object JvDBNavigator1: TJvDBNavigator
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 146
      Height = 30
      DataSource = dsQuery
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
      Align = alLeft
      TabOrder = 3
    end
  end
  object Query: TFDQuery
    AfterInsert = QueryAfterInsert
    IndexFieldNames = 'ID_C000705'
    MasterSource = FrDoctos.dsQuery
    MasterFields = 'ID'
    DetailFields = 'ID_C000705'
    Connection = Modulo.DBConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT * FROM C000706 WHERE ID_C000705 = :ID')
    Left = 40
    Top = 56
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
    object QueryID_C000705: TIntegerField
      FieldName = 'ID_C000705'
      Origin = 'ID_C000705'
    end
    object QueryMD_CHAVE_NFE: TStringField
      FieldName = 'MD_CHAVE_NFE'
      Origin = 'MD_CHAVE_NFE'
      Size = 50
    end
  end
  object dsQuery: TDataSource
    AutoEdit = False
    DataSet = Query
    Left = 72
    Top = 56
  end
end
