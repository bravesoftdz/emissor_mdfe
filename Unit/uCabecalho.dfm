object FrCabecalho: TFrCabecalho
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cabe'#231'alho do Documento.'
  ClientHeight = 482
  ClientWidth = 580
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
  object Label3: TLabel
    Left = 86
    Top = 10
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label2: TLabel
    Left = 50
    Top = 10
    Width = 24
    Height = 13
    Caption = 'S'#233'rie'
  end
  object Label1: TLabel
    Left = 6
    Top = 10
    Width = 34
    Height = 13
    Caption = 'Modelo'
  end
  object Label4: TLabel
    Left = 6
    Top = 52
    Width = 90
    Height = 13
    Caption = 'Data Hora Emiss'#227'o'
  end
  object Label5: TLabel
    Left = 149
    Top = 10
    Width = 83
    Height = 13
    Caption = 'Tipo de Ambiente'
  end
  object Label6: TLabel
    Left = 149
    Top = 52
    Width = 86
    Height = 13
    Caption = 'Forma de Emiss'#227'o'
  end
  object Label10: TLabel
    Left = 149
    Top = 90
    Width = 92
    Height = 13
    Caption = 'Tipo Transportador'
  end
  object Label9: TLabel
    Left = 6
    Top = 132
    Width = 111
    Height = 13
    Caption = 'Local de Carregamento'
  end
  object Label11: TLabel
    Left = 293
    Top = 132
    Width = 71
    Height = 13
    Caption = 'UF Descarrega'
  end
  object Label13: TLabel
    Left = 435
    Top = 10
    Width = 83
    Height = 13
    Caption = 'Valor Total Carga'
  end
  object Label14: TLabel
    Left = 292
    Top = 52
    Width = 86
    Height = 13
    Caption = 'Un. Medida Carga'
  end
  object Label12: TLabel
    Left = 6
    Top = 174
    Width = 143
    Height = 13
    Caption = 'Informa'#231#245'es Complementares'
  end
  object Label15: TLabel
    Left = 6
    Top = 323
    Width = 87
    Height = 13
    Caption = 'Informa'#231#245'es Fisco'
  end
  object Label16: TLabel
    Left = 435
    Top = 52
    Width = 52
    Height = 13
    Caption = 'Peso Bruto'
  end
  object Label8: TLabel
    Left = 6
    Top = 90
    Width = 103
    Height = 13
    Caption = 'Data In'#237'cio da Viagem'
  end
  object Label17: TLabel
    Left = 292
    Top = 10
    Width = 51
    Height = 13
    Caption = 'Tipo Modal'
  end
  object txtModelo: TRzDBEdit
    Left = 6
    Top = 25
    Width = 38
    Height = 21
    DataSource = dsQuery
    DataField = 'MD_MODELO'
    Enabled = False
    TabOrder = 0
  end
  object txtSerie: TRzDBEdit
    Left = 50
    Top = 25
    Width = 30
    Height = 21
    DataSource = dsQuery
    DataField = 'MD_SERIE'
    TabOrder = 1
  end
  object txtNumero: TRzDBEdit
    Left = 86
    Top = 25
    Width = 57
    Height = 21
    DataSource = dsQuery
    DataField = 'MD_NUMERO'
    TabOrder = 2
  end
  object cbTipoAmbiente: TRzDBComboBox
    Left = 149
    Top = 25
    Width = 137
    Height = 21
    DataField = 'MD_TIP_AMBIENTE'
    DataSource = dsQuery
    Style = csDropDownList
    TabOrder = 6
    Items.Strings = (
      'Produ'#231#227'o'
      'Homologa'#231#227'o')
    Values.Strings = (
      '0'
      '1')
  end
  object RzDBComboBox2: TRzDBComboBox
    Left = 149
    Top = 67
    Width = 137
    Height = 21
    DataField = 'MD_TIP_EMISSAO'
    DataSource = dsQuery
    Style = csDropDownList
    TabOrder = 7
    Items.Strings = (
      'Normal'
      'Conting'#234'ncia'
      'Scan'
      'Dpec'
      'FSDA')
    Values.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4')
  end
  object cbTipoModal: TRzDBComboBox
    Left = 292
    Top = 25
    Width = 137
    Height = 21
    DataField = 'MD_TIP_MODAL'
    DataSource = dsQuery
    Style = csDropDownList
    TabOrder = 9
    Items.Strings = (
      'Rodovi'#225'rio'
      'Aereo'
      'Aquavi'#225'rio'
      'Ferrovi'#225'rio')
    Values.Strings = (
      '0'
      '1'
      '2'
      '3')
  end
  object cbUfFinal: TRzDBComboBox
    Left = 293
    Top = 147
    Width = 71
    Height = 21
    DataField = 'MD_UF_FINAL'
    DataSource = dsQuery
    Style = csDropDownList
    TabOrder = 11
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
  object txtValor: TJvDBCalcEdit
    Left = 435
    Top = 25
    Width = 137
    Height = 21
    DecimalPlaceRound = True
    DisplayFormat = ',0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    DecimalPlacesAlwaysShown = False
    DataField = 'MD_VLR_CARGA'
    DataSource = dsQuery
  end
  object cbUnidade: TRzDBComboBox
    Left = 292
    Top = 67
    Width = 137
    Height = 21
    DataField = 'MD_COD_UNIDADE'
    DataSource = dsQuery
    Style = csDropDownList
    TabOrder = 10
    Items.Strings = (
      'Kg'
      'Tonelada')
    Values.Strings = (
      '0'
      '1')
  end
  object RzDBMemo1: TRzDBMemo
    Left = 6
    Top = 188
    Width = 566
    Height = 129
    DataField = 'MD_INF_COMPLEMENTARES'
    DataSource = dsQuery
    TabOrder = 14
  end
  object RzDBMemo2: TRzDBMemo
    Left = 6
    Top = 342
    Width = 566
    Height = 95
    DataField = 'MD_INF_FISCO'
    DataSource = dsQuery
    TabOrder = 15
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 446
    Width = 580
    HotTrack = True
    OKDefault = False
    ModalResultOk = 0
    OnClickOk = RzDialogButtons1ClickOk
    TabOrder = 17
  end
  object txtUfCarregamento: TRzDBButtonEdit
    Left = 6
    Top = 147
    Width = 53
    Height = 21
    DataSource = dsQuery
    DataField = 'MD_UF_INICIAL'
    TabOrder = 5
    AllowKeyEdit = False
    AltBtnWidth = 15
    ButtonWidth = 15
    OnButtonClick = txtUfCarregamentoButtonClick
  end
  object cbTipoTransportadorar: TRzDBComboBox
    Left = 149
    Top = 105
    Width = 280
    Height = 21
    DataField = 'MD_TIP_TRANSPORTADOR'
    DataSource = dsQuery
    Style = csDropDownList
    TabOrder = 8
    Items.Strings = (
      'ETC - Transportadora'
      'TAC - Transportador Pr'#243'pria'
      'CTC '#8211' Cooperativa de Transporte')
    Values.Strings = (
      '0'
      '1'
      '2')
  end
  object txtMunicipio: TRzDBEdit
    Left = 65
    Top = 147
    Width = 222
    Height = 21
    DataSource = dsQuery
    DataField = 'MD_NOM_MUNICIPIO'
    Enabled = False
    TabOrder = 16
  end
  object txtDhEmissao: TRzDBEdit
    Left = 6
    Top = 67
    Width = 137
    Height = 21
    DataSource = dsQuery
    DataField = 'MD_DH_EMISSAO'
    MaxLength = 19
    TabOrder = 3
  end
  object txtDhSaida: TRzDBEdit
    Left = 6
    Top = 105
    Width = 137
    Height = 21
    DataSource = dsQuery
    DataField = 'MD_DH_INICIO_VIAGEM'
    MaxLength = 19
    TabOrder = 4
  end
  object cbPeso: TJvDBCalcEdit
    Left = 435
    Top = 67
    Width = 137
    Height = 21
    DecimalPlaceRound = True
    DisplayFormat = ',0.0000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    DecimalPlacesAlwaysShown = False
    DataField = 'MD_QTD_CARGA'
    DataSource = dsQuery
  end
  object dsQuery: TDataSource
    DataSet = FrPrincipal.Query
    Left = 390
    Top = 136
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 488
    Top = 124
  end
end
