object FrMotoristas: TFrMotoristas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Motoristas.'
  ClientHeight = 244
  ClientWidth = 404
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
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 208
    Width = 404
    HotTrack = True
    OKDefault = False
    ModalResultOk = 0
    OnClickOk = RzDialogButtons1ClickOk
    TabOrder = 0
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
  object pgControl: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 398
    Height = 202
    ActivePage = tabVeiculos
    Align = alClient
    TabOrder = 1
    OnChanging = pgControlChanging
    object tabVeiculos: TTabSheet
      Caption = 'Ve'#237'culos'
      object JvDBGrid1: TJvDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 384
        Height = 168
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
            FieldName = 'MD_CONDUTOR_CPF'
            Title.Caption = 'CPF'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MD_CONDUTOR_NOME'
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 272
            Visible = True
          end>
        Delphi2010OptionsMigrated = True
      end
    end
    object tabDetalhes: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      object GroupBox4: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 384
        Height = 63
        Align = alTop
        Caption = 'Dados do Motorista.'
        TabOrder = 0
        object Label16: TLabel
          Left = 6
          Top = 16
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object Label1: TLabel
          Left = 115
          Top = 16
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object txtCpf: TRzDBEdit
          Left = 6
          Top = 32
          Width = 103
          Height = 21
          DataSource = dsQuery
          DataField = 'MD_CONDUTOR_CPF'
          CharCase = ecUpperCase
          TabOrder = 0
          OnExit = txtCpfExit
        end
        object txtNome: TRzDBEdit
          Left = 115
          Top = 32
          Width = 262
          Height = 21
          DataSource = dsQuery
          DataField = 'MD_CONDUTOR_NOME'
          CharCase = ecUpperCase
          TabOrder = 1
        end
      end
    end
  end
  object Query: TFDQuery
    BeforePost = QueryBeforePost
    BeforeDelete = QueryBeforeDelete
    IndexFieldNames = 'ID_C000703'
    MasterSource = FrVeiculoTracao.dsQuery
    MasterFields = 'ID'
    DetailFields = 'ID_C000703'
    Connection = Modulo.DBConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT * FROM C000704 WHERE ID_C000703 = :ID')
    Left = 19
    Top = 107
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
    object QueryID_C000703: TIntegerField
      FieldName = 'ID_C000703'
      Origin = 'ID_C000703'
    end
    object QueryMD_CONDUTOR_CPF: TStringField
      FieldName = 'MD_CONDUTOR_CPF'
      Origin = 'MD_CONDUTOR_CPF'
      EditMask = '!999\.999\.999\-99;0;'
      Size = 16
    end
    object QueryMD_CONDUTOR_NOME: TStringField
      FieldName = 'MD_CONDUTOR_NOME'
      Origin = 'MD_CONDUTOR_NOME'
      Size = 65
    end
  end
  object dsQuery: TDataSource
    AutoEdit = False
    DataSet = Query
    OnStateChange = dsQueryStateChange
    Left = 51
    Top = 107
  end
  object ChecDoc: TACBrValidador
    IgnorarChar = './-'
    PermiteVazio = True
    Left = 83
    Top = 107
  end
end
