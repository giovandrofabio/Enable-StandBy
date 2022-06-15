program StandBy;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {Form1},
  Androidapi.JNI.PowerManager in 'Androidapi.JNI.PowerManager.pas',
  UntPermissions in 'UntPermissions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
