object frmCadClientes: TfrmCadClientes
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de clientes'
  ClientHeight = 470
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    507
    470)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 20
    Top = 64
    Width = 464
    Height = 386
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Dados do cliente'
    TabOrder = 0
    DesignSize = (
      464
      386)
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = dbedtNome
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 52
      Height = 13
      Caption = 'Identidade'
      FocusControl = dbedtIdentidade
    end
    object Label3: TLabel
      Left = 160
      Top = 64
      Width = 19
      Height = 13
      Caption = 'CPF'
      FocusControl = dbedtCPF
    end
    object Label4: TLabel
      Left = 312
      Top = 64
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = dbedtTelefone
    end
    object Label5: TLabel
      Left = 16
      Top = 107
      Width = 28
      Height = 13
      Caption = 'E-mail'
      FocusControl = dbedtEmail
    end
    object dbedtNome: TDBEdit
      Left = 16
      Top = 37
      Width = 433
      Height = 21
      DataField = 'Nome'
      DataSource = dtsClientes
      TabOrder = 0
    end
    object dbedtIdentidade: TDBEdit
      Left = 16
      Top = 80
      Width = 124
      Height = 21
      DataField = 'Identidade'
      DataSource = dtsClientes
      TabOrder = 1
      OnExit = dbedtIdentidadeExit
    end
    object dbedtCPF: TDBEdit
      Left = 160
      Top = 80
      Width = 129
      Height = 21
      DataField = 'CPF'
      DataSource = dtsClientes
      TabOrder = 2
      OnExit = dbedtIdentidadeExit
    end
    object dbedtTelefone: TDBEdit
      Left = 312
      Top = 80
      Width = 137
      Height = 21
      DataField = 'Telefone'
      DataSource = dtsClientes
      TabOrder = 3
    end
    object dbedtEmail: TDBEdit
      Left = 16
      Top = 123
      Width = 433
      Height = 21
      DataField = 'Email'
      DataSource = dtsClientes
      TabOrder = 4
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 160
      Width = 433
      Height = 208
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Endere'#231'o'
      TabOrder = 5
      object Label6: TLabel
        Left = 16
        Top = 24
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = dbedtCEP
      end
      object Label7: TLabel
        Left = 16
        Top = 67
        Width = 55
        Height = 13
        Caption = 'Logradouro'
        FocusControl = dbedtLogradouro
      end
      object Label8: TLabel
        Left = 328
        Top = 67
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = dbedtNumero
      end
      object Label9: TLabel
        Left = 16
        Top = 110
        Width = 65
        Height = 13
        Caption = 'Complemento'
        FocusControl = dbedtComplemento
      end
      object Label10: TLabel
        Left = 240
        Top = 110
        Width = 28
        Height = 13
        Caption = 'Bairro'
        FocusControl = dbedtBairro
      end
      object Label11: TLabel
        Left = 16
        Top = 153
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = dbedtCidade
      end
      object Label12: TLabel
        Left = 240
        Top = 153
        Width = 33
        Height = 13
        Caption = 'Estado'
        FocusControl = dbedtEstado
      end
      object Label13: TLabel
        Left = 296
        Top = 153
        Width = 19
        Height = 13
        Caption = 'Pa'#237's'
        FocusControl = dbedtPais
      end
      object dbedtCEP: TDBEdit
        Left = 16
        Top = 40
        Width = 108
        Height = 21
        DataField = 'CEP'
        DataSource = dtsClientes
        TabOrder = 0
        OnExit = dbedtIdentidadeExit
        OnKeyDown = dbedtCEPKeyDown
      end
      object dbedtLogradouro: TDBEdit
        Left = 16
        Top = 83
        Width = 289
        Height = 21
        DataField = 'Logradouro'
        DataSource = dtsClientes
        TabOrder = 1
      end
      object dbedtNumero: TDBEdit
        Left = 328
        Top = 83
        Width = 89
        Height = 21
        DataField = 'Numero'
        DataSource = dtsClientes
        TabOrder = 2
      end
      object dbedtComplemento: TDBEdit
        Left = 16
        Top = 126
        Width = 201
        Height = 21
        DataField = 'Complemento'
        DataSource = dtsClientes
        TabOrder = 3
      end
      object dbedtBairro: TDBEdit
        Left = 240
        Top = 126
        Width = 177
        Height = 21
        DataField = 'Bairro'
        DataSource = dtsClientes
        TabOrder = 4
      end
      object dbedtCidade: TDBEdit
        Left = 16
        Top = 169
        Width = 201
        Height = 21
        DataField = 'Cidade'
        DataSource = dtsClientes
        TabOrder = 5
      end
      object dbedtEstado: TDBEdit
        Left = 240
        Top = 169
        Width = 33
        Height = 21
        DataField = 'Estado'
        DataSource = dtsClientes
        TabOrder = 6
      end
      object dbedtPais: TDBEdit
        Left = 296
        Top = 169
        Width = 121
        Height = 21
        DataField = 'Pais'
        DataSource = dtsClientes
        TabOrder = 7
      end
      object btConsultarCEP: TBitBtn
        Left = 130
        Top = 38
        Width = 87
        Height = 25
        Caption = 'Consultar CEP'
        TabOrder = 8
        OnClick = btConsultarCEPClick
      end
    end
  end
  object dbnavClientes: TDBNavigator
    Left = 52
    Top = 23
    Width = 280
    Height = 25
    DataSource = dtsClientes
    VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost]
    Anchors = [akLeft, akTop, akRight]
    Hints.Strings = (
      'Primeiro registro'
      'Registro anterior'
      'Pr'#243'ximo registro'
      #218'ltimo registro'
      'Novo registro'
      'Excluir registro'
      'Alterar registro'
      'Gravar registro'
      'Cancelar altera'#231#245'es'
      'Atualizar dados'
      'Apply updates'
      'Cancel updates')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object btEnviarEmail: TBitBtn
    Left = 364
    Top = 24
    Width = 89
    Height = 25
    Caption = 'Enviar e-mail'
    TabOrder = 2
    OnClick = btEnviarEmailClick
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Nome'
    Params = <>
    BeforePost = cdsClientesBeforePost
    Left = 403
    Top = 8
    object cdsClientesId: TIntegerField
      FieldName = 'Id'
    end
    object cdsClientesNome: TStringField
      FieldName = 'Nome'
      Size = 500
    end
    object cdsClientesIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 50
    end
    object cdsClientesCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cdsClientesTelefone: TStringField
      FieldName = 'Telefone'
    end
    object cdsClientesEmail: TStringField
      FieldName = 'Email'
      Size = 200
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsClientesLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 500
    end
    object cdsClientesNumero: TStringField
      FieldName = 'Numero'
    end
    object cdsClientesComplemento: TStringField
      FieldName = 'Complemento'
      Size = 200
    end
    object cdsClientesBairro: TStringField
      FieldName = 'Bairro'
      Size = 200
    end
    object cdsClientesCidade: TStringField
      FieldName = 'Cidade'
      Size = 200
    end
    object cdsClientesEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object cdsClientesPais: TStringField
      FieldName = 'Pais'
      Size = 200
    end
  end
  object dtsClientes: TDataSource
    DataSet = cdsClientes
    Left = 456
    Top = 8
  end
  object XMLDocument1: TXMLDocument
    Active = True
    XML.Strings = (
      '<dadoscliente>'
      #9'<nome></nome>'
      #9'<identidade></identidade>'
      #9'<cpf></cpf>'
      #9'<telefone></telefone>'
      #9'<email></email>'
      #9'<endereco>'
      #9#9'<cep></cep>'
      #9#9'<logradouro></logradouro>'
      #9#9'<numeroend></numeroend>'
      #9#9'<complemento></complemento>'
      #9#9'<bairro></bairro>'
      #9#9'<cidade></cidade>'
      #9#9'<estado></estado>'
      #9#9'<pais></pais>'
      #9'</endereco>'
      '</dadoscliente>')
    Left = 456
    Top = 232
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    Host = 'smtp.gmail.com'
    Port = 465
    SASLMechanisms = <>
    UseTLS = utUseImplicitTLS
    Left = 456
    Top = 64
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    Body.Strings = (
      'Segue em anexo os dados do cliente cadastrado!')
    BccList = <>
    CharSet = 'ISO-8859-1'
    CCList = <>
    ContentType = 'multipart/related'
    Encoding = meMIME
    FromList = <
      item
        Address = 'cadclientes@infosistemas.com.br'
        Name = 'Cadastro de Clientes InfoSistemas'
        Text = 
          'Cadastro de Clientes InfoSistemas <cadclientes@infosistemas.com.' +
          'br>'
        Domain = 'infosistemas.com.br'
        User = 'cadclientes'
      end>
    From.Address = 'cadclientes@infosistemas.com.br'
    From.Name = 'Cadastro de Clientes InfoSistemas'
    From.Text = 
      'Cadastro de Clientes InfoSistemas <cadclientes@infosistemas.com.' +
      'br>'
    From.Domain = 'infosistemas.com.br'
    From.User = 'cadclientes'
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 460
    Top = 120
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL2
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
    Left = 404
    Top = 64
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = 'smtp.gmail.com:465'
    Host = 'smtp.gmail.com'
    MaxLineAction = maException
    Port = 465
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 460
    Top = 176
  end
  object IdSSLIOHandlerSocketOpenSSL2: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 404
    Top = 120
  end
end
