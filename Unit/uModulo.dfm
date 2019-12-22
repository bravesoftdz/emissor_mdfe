object Modulo: TModulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 254
  Width = 371
  object DBConexao: TFDConnection
    Params.Strings = (
      
        'Database=G:\Projetos\GestaoComercial\02 - Retaguarda\03 - BD\sys' +
        'Retaguarda.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3051'
      'CharacterSet=ISO8859_1'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 44
    Top = 28
  end
  object QueryParams: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 128
    Top = 28
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 220
    Top = 28
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 220
    Top = 84
  end
end
