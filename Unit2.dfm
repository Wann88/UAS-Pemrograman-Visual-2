object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 192
  Top = 133
  Height = 206
  Width = 364
  object db: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = '.\libmysql.dll'
    Left = 48
    Top = 40
  end
  object tbKustomer: TZQuery
    Connection = db
    Active = True
    SQL.Strings = (
      'SELECT * FROM kustomer')
    Params = <>
    Left = 128
    Top = 40
  end
  object DsKustomer: TDataSource
    DataSet = tbKustomer
    Left = 128
    Top = 112
  end
end
