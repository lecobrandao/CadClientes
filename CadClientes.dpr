program CadClientes;

uses
  Vcl.Forms,
  unCadClientes in 'unCadClientes.pas' {frmCadClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadClientes, frmCadClientes);
  Application.Run;
end.
