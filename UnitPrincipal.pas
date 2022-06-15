unit UnitPrincipal;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Types,
  System.IOUtils,
  System.StrUtils,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Layouts

  {$IFDEF ANDROID}
    ,Androidapi.JNI.PowerManager
  {$ENDIF}

  {$IFDEF IOS}
    ,iOSAPI.UIKit
  {$ENDIF}

  ,UntPermissions, MobilePermissions.Model.Signature,
  MobilePermissions.Model.Dangerous, MobilePermissions.Model.Standard,
  MobilePermissions.Component
;


type
  TForm1 = class(TForm)
    imgCad1 : TImage;
    imgCad2 : TImage;
    Switch1 : TSwitch;
    MobilePermissions1: TMobilePermissions;
    procedure Switch1Switch(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure EnableStandBy(const AEnabled: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.EnableStandBy(const AEnabled: Boolean);
{$IFDEF IOS}
var
  UIApp : UIApplication;
{$ENDIF}
begin
  {$IFDEF ANDROID}
    if AEnabled
    then Androidapi.JNI.PowerManager.ReleaseWakeLock //Desativa o descanso de tela
    else Androidapi.JNI.PowerManager.AcquireWakeLock;//Ativa o descanso de tela
  {$ENDIF}

  {$IFDEF IOS}
    UIApp := TUIApplication.Wrap(TUIApplication.OCClass.sharedApplication);
    UIApp.setIdleTimerDisabled(not AEnabled);
  {$ENDIF}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TMyPermissions.RequestMyPermission([TMyPermissions.WakeLock]);
  imgCad1.Visible := Switch1.IsChecked;
  imgCad2.Visible := not Switch1.IsChecked;
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  EnableStandBy(Switch1.IsChecked);
  imgCad1.Visible := Switch1.IsChecked;
  imgCad2.Visible := not Switch1.IsChecked;
end;

end.
