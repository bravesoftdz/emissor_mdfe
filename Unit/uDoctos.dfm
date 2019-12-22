object FrDoctos: TFrDoctos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Documentos'
  ClientHeight = 230
  ClientWidth = 391
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
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 385
    Height = 189
    Align = alClient
    Caption = 'Munic'#237'pios de Descarregamentos.'
    TabOrder = 0
    object Label11: TLabel
      Left = 6
      Top = 17
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label10: TLabel
      Left = 55
      Top = 17
      Width = 43
      Height = 13
      Caption = 'Munic'#237'pio'
    end
    object txtUf: TRzDBEdit
      Left = 5
      Top = 32
      Width = 44
      Height = 21
      DataSource = FrPrincipal.dsQuery
      DataField = 'MD_UF_FINAL'
      Enabled = False
      TabOrder = 0
    end
    object txtMunicipio: TRzDBButtonEdit
      Left = 55
      Top = 32
      Width = 325
      Height = 21
      DataSource = dsQuery
      DataField = 'MD_XMUNDESCARGA'
      TabOrder = 1
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = txtMunicipioButtonClick
    end
    object GridMun: TJvDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 375
      Height = 120
      Align = alBottom
      DataSource = dsQuery
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      TabOrder = 2
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
          FieldName = 'MD_CMUNDESCARGA'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MD_XMUNDESCARGA'
          Title.Caption = 'Munic'#237'pio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 307
          Visible = True
        end>
      Delphi2010OptionsMigrated = True
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 195
    Width = 391
    Height = 35
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    object JvDBNavigator1: TJvDBNavigator
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 150
      Height = 29
      DataSource = dsQuery
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
      Align = alLeft
      ConfirmDelete = False
      TabOrder = 0
    end
    object btnClose: TButton
      AlignWithMargins = True
      Left = 308
      Top = 4
      Width = 80
      Height = 27
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = '&Fechar'
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnChave: TButton
      AlignWithMargins = True
      Left = 215
      Top = 4
      Width = 80
      Height = 27
      Margins.Top = 4
      Margins.Right = 10
      Margins.Bottom = 4
      Align = alRight
      Caption = '&Chave NF-e'
      TabOrder = 2
      OnClick = btnChaveClick
    end
  end
  object dsQuery: TDataSource
    AutoEdit = False
    DataSet = Query
    OnStateChange = dsQueryStateChange
    Left = 80
    Top = 110
  end
  object Query: TFDQuery
    Active = True
    AfterInsert = QueryAfterInsert
    BeforeDelete = QueryBeforeDelete
    IndexFieldNames = 'ID_C000700'
    MasterSource = FrPrincipal.dsQuery
    MasterFields = 'ID'
    DetailFields = 'ID_C000700'
    Connection = Modulo.DBConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT * FROM C000705 WHERE ID_C000700 = :ID')
    Left = 43
    Top = 111
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
    object QueryMD_CMUNDESCARGA: TStringField
      FieldName = 'MD_CMUNDESCARGA'
      Origin = 'MD_CMUNDESCARGA'
      Size = 10
    end
    object QueryMD_XMUNDESCARGA: TStringField
      FieldName = 'MD_XMUNDESCARGA'
      Origin = 'MD_XMUNDESCARGA'
      Size = 65
    end
  end
end
