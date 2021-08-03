unit unCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Mask, Xml.xmldom, Xml.XMLIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, Xml.XMLDoc,
  IdMessage, IdHTTP, Vcl.Buttons, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdAttachmentFile, IniFiles;

type
  TfrmCadClientes = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedtNome: TDBEdit;
    dbedtIdentidade: TDBEdit;
    dbedtCPF: TDBEdit;
    dbedtTelefone: TDBEdit;
    dbedtEmail: TDBEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbedtCEP: TDBEdit;
    dbedtLogradouro: TDBEdit;
    dbedtNumero: TDBEdit;
    dbedtComplemento: TDBEdit;
    dbedtBairro: TDBEdit;
    dbedtCidade: TDBEdit;
    dbedtEstado: TDBEdit;
    dbedtPais: TDBEdit;
    cdsClientes: TClientDataSet;
    cdsClientesId: TIntegerField;
    cdsClientesNome: TStringField;
    cdsClientesIdentidade: TStringField;
    cdsClientesCPF: TStringField;
    cdsClientesTelefone: TStringField;
    cdsClientesEmail: TStringField;
    cdsClientesCEP: TStringField;
    cdsClientesLogradouro: TStringField;
    cdsClientesNumero: TStringField;
    cdsClientesComplemento: TStringField;
    cdsClientesBairro: TStringField;
    cdsClientesCidade: TStringField;
    cdsClientesEstado: TStringField;
    cdsClientesPais: TStringField;
    dtsClientes: TDataSource;
    dbnavClientes: TDBNavigator;
    XMLDocument1: TXMLDocument;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdHTTP1: TIdHTTP;
    btConsultarCEP: TBitBtn;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdSSLIOHandlerSocketOpenSSL2: TIdSSLIOHandlerSocketOpenSSL;
    btEnviarEmail: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure cdsClientesBeforePost(DataSet: TDataSet);
    procedure dbedtIdentidadeExit(Sender: TObject);
    procedure btConsultarCEPClick(Sender: TObject);
    procedure dbedtCEPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btEnviarEmailClick(Sender: TObject);
  private
    { Private declarations }
    IdCliente: Integer;
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

const
  URL_WS_CEP = 'https://viacep.com.br/ws/[CEP]/json/';

implementation

{$R *.dfm}

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  IdCliente := 0;
  cdsClientes.Close;
  cdsClientes.CreateDataSet;
end;

procedure TfrmCadClientes.btConsultarCEPClick(Sender: TObject);
var URL: String;
    RespostaWS: TMemoryStream;
    Retorno: TStringList;

    function RetornaValorCampo(Campo: String): String;
    var ValorCampo, Texto: String;
    begin
      ValorCampo := '';
      if Pos(Campo, Retorno.Text) < 0 then
        raise Exception.Create('Campo '+Campo+' não encontrado.')
      else
      begin
        Texto      := UTF8ToString(Copy( Retorno.Text, Pos(Campo, Retorno.Text) + Length(Campo) + 3, 500));
        ValorCampo := Copy(Texto, 0, Pos('",', Texto) - 1);
      end;
      Result := ValorCampo;
    end;
begin
  if cdsClientesCEP.AsString = '' then
  begin
    MessageDlg('Informe o CEP!', mtInformation, mbOKCancel, 0);
    if dbedtCEP.CanFocus then
      dbedtCEP.SetFocus;
  end
  else
  begin
    Screen.Cursor := crHourGlass;

    RespostaWS := TMemoryStream.Create;
    Retorno    := TStringList.Create;
    try
      try
        cdsClientesLogradouro.Clear;
        cdsClientesBairro.Clear;
        cdsClientesCidade.Clear;
        cdsClientesEstado.Clear;
        cdsClientesPais.Clear;

        URL := StringReplace(URL_WS_CEP, '[CEP]', cdsClientesCEP.AsString, [rfReplaceAll]);
        IdHTTP1.Get(URL, RespostaWS);
        RespostaWS.Position := 0;
        Retorno.LoadFromStream(RespostaWS);
        if (Retorno.Text = '') or (Pos('"erro": true',Retorno.Text) > 0) then
          MessageDlg('CEP não encontrado!', mtInformation, mbOKCancel, 0)
        else
        begin
          cdsClientesLogradouro.AsString := RetornaValorCampo('"logradouro"');
          cdsClientesBairro.AsString     := RetornaValorCampo('"bairro"');
          cdsClientesCidade.AsString     := RetornaValorCampo('"localidade"');
          cdsClientesEstado.AsString     := RetornaValorCampo('"uf"');
          cdsClientesPais.AsString       := 'Brasil';
          if dbedtNumero.CanFocus then
            dbedtNumero.SetFocus;
        end;
      except
        on E:Exception do
        begin
          if Pos('400',E.Message) > 0 then
            MessageDlg('CEP não encontrado!', mtInformation, mbOKCancel, 0)
          else
            MessageDlg(E.Message, mtError, mbOKCancel, 0);
        end;
      end;
    finally
      Screen.Cursor := crDefault;
      RespostaWS.Free;
      Retorno.Free;
    end;
  end;
end;

procedure TfrmCadClientes.btEnviarEmailClick(Sender: TObject);
var Erro: Boolean;
    function LerParametroIni(Parametro: String): String;
    var CadIni: TIniFile;
        ConfiguracoesEmail: TMemo;
        Valor: String;
    begin
      Valor := '';
      CadIni := TIniFile.Create('.\CadClientes.ini');
      ConfiguracoesEmail := TMemo.Create(Self);
      try
        ConfiguracoesEmail.Parent := frmCadClientes;
        ConfiguracoesEmail.Top    := 5000;
        CadIni.ReadSectionValues('Email', ConfiguracoesEmail.Lines);
        if ConfiguracoesEmail.Lines.Values[Parametro] = '' then
        begin
          MessageDlg('Informe o campo "' + Parametro + '" no CadClientes.ini!', mtInformation, mbOKCancel, 0);
          Erro := True;
          Abort;
        end
        else
          Valor := ConfiguracoesEmail.Lines.Values[Parametro];
        Result := Valor;
      finally
        CadIni.Free;
        ConfiguracoesEmail.Free;
      end;
    end;
begin
  if cdsClientes.State in [dsInsert, dsEdit] then
    cdsClientes.Post;

  if cdsClientesEmail.AsString = '' then
  begin
    MessageDlg('Informe o e-mail!', mtInformation, mbOKCancel, 0);
    if dbedtEmail.CanFocus then
      dbedtEmail.SetFocus;
    Exit;
  end;

  if MessageDlg('Deseja enviar os dados do cliente para o e-mail informado?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    Screen.Cursor := crHourGlass;
    Erro := False;
    try
      try
        with XMLDocument1.ChildNodes['dadoscliente'] do
        begin
          ChildNodes['nome'].Text       := cdsClientesNome.AsString;
          ChildNodes['identidade'].Text := cdsClientesIdentidade.AsString;
          ChildNodes['cpf'].Text        := cdsClientesCPF.AsString;
          ChildNodes['telefone'].Text   := cdsClientesTelefone.AsString;
          ChildNodes['email'].Text      := cdsClientesEmail.AsString;
          with ChildNodes['endereco'] do
          begin
            ChildNodes['cep'].Text         := cdsClientesCEP.AsString;
            ChildNodes['logradouro'].Text  := cdsClientesLogradouro.AsString;
            ChildNodes['numeroend'].Text   := cdsClientesNumero.AsString;
            ChildNodes['complemento'].Text := cdsClientesComplemento.AsString;
            ChildNodes['bairro'].Text      := cdsClientesBairro.AsString;
            ChildNodes['cidade'].Text      := cdsClientesCidade.AsString;
            ChildNodes['estado'].Text      := cdsClientesEstado.AsString;
            ChildNodes['pais'].Text        := cdsClientesPais.AsString;
          end;
        end;
        XMLDocument1.SaveToFile('.\XMLDadosCliente.xml');
      except
        on E:Exception do
        begin
          Erro := True;
          MessageDlg('Erro ao criar XML: ' + E.Message, mtError, mbOKCancel, 0);
        end;
      end;

      if not Erro then
      begin
        try
          IdMessage1.Subject := 'Dados do Cliente: ' + cdsClientesNome.AsString;
          IdMessage1.Recipients.Clear;
          IdMessage1.Recipients.Add.Address := cdsClientesEmail.AsString;
          IdMessage1.MessageParts.Clear;
          TIdAttachmentFile.Create(IdMessage1.MessageParts, 'XMLDadosCliente.xml');

          IdSMTP1.Host     := LerParametroIni('Host');
          IdSMTP1.Port     := StrToInt(LerParametroIni('Port'));
          IdSMTP1.Username := LerParametroIni('User');
          IdSMTP1.Password := LerParametroIni('Password');

          IdSMTP1.Connect;
          try
            IdSMTP1.Send(IdMessage1);
          finally
            IdSMTP1.Disconnect;
          end;
        except
          on E:Exception do
          begin
            Erro := True;
            MessageDlg('Erro ao enviar e-mail: ' + E.Message, mtError, mbOKCancel, 0);
          end;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
    if not Erro then
      MessageDlg('E-mail enviado com sucesso!', mtInformation, mbOKCancel, 0);
  end;
end;

procedure TfrmCadClientes.cdsClientesBeforePost(DataSet: TDataSet);
begin
  if cdsClientesNome.AsString = '' then
  begin
    MessageDlg('Informe o nome!', mtInformation, mbOKCancel, 0);
    if dbedtNome.CanFocus then
      dbedtNome.SetFocus;
    Abort;
  end;

  Inc(IdCliente);
  cdsClientesId.AsInteger := IdCliente;
end;

// Método utilizado nos campos que recebem apenas números
procedure TfrmCadClientes.dbedtCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if btConsultarCEP.CanFocus then
      btConsultarCEP.SetFocus;
    btConsultarCEP.Click;
  end;
end;

procedure TfrmCadClientes.dbedtIdentidadeExit(Sender: TObject);
  function ValidaNumero(Numero: String): Boolean;
  begin
    if StrToInt64Def(Numero,0) = 0 then
      Result := False
    else
      Result := True;
  end;
begin
  if cdsClientes.FieldByName(TDBEdit(Sender).DataField).AsString <> '' then
  begin
    if not ValidaNumero(cdsClientes.FieldByName(TDBEdit(Sender).DataField).AsString) then
    begin
      MessageDlg('Informe apenas números!', mtInformation, mbOKCancel, 0);
      if TDBEdit(Sender).CanFocus then
        TDBEdit(Sender).SetFocus;
    end;
  end;
end;

end.
