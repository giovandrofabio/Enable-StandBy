unit UntPermissions;

interface

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  System.Permissions, //Delphi 10.3.x - Rio pra cima
  System.Generics.Collections,

  Androidapi.Helpers,
  Androidapi.JNI.Os,
  Androidapi.JNI.JavaTypes;

type
  TMyPermissions = class
    private
      class function GetCamera: String; static;
      class function GetWifiState: String;static;
      class function GetReadExternalStorage: string;static;
      class function GetWriteExternalStorage: string;static;
      class function GetReadPhoneState: string;static;
      class function GetWakeLock: string;static;
    public
      class function RequestMyPermission(const APermission : TArray<System.string>): Boolean;

      class property Camera               : string read GetCamera;  //ReadOnly
      class property WifiState            : string read GetWifiState;
      class property ReadExternalStorage  : string read GetReadExternalStorage;
      class property WriteExternalStorage : string read GetWriteExternalStorage;
      class property ReadPhoneState       : string read GetReadPhoneState;
      class property WakeLock             : string read GetWakeLock;
  end;



implementation

{ TMyPermissions }

class function TMyPermissions.GetCamera: String;
begin
  Result := JStringToString(TJManifest_permission.JavaClass.CAMERA);
end;

class function TMyPermissions.GetReadExternalStorage: string;
begin
  Result := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
end;

class function TMyPermissions.GetReadPhoneState: string;
begin
  Result := JStringToString(TJManifest_permission.JavaClass.READ_PHONE_STATE);
end;

class function TMyPermissions.GetWakeLock: string;
begin
  Result := JStringToString(TJManifest_permission.JavaClass.WAKE_LOCK);
end;

class function TMyPermissions.GetWifiState: String;
begin
  Result := JStringToString(TJManifest_permission.JavaClass.ACCESS_WIFI_STATE);
end;

class function TMyPermissions.GetWriteExternalStorage: string;
begin
  Result := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
end;

class function TMyPermissions.RequestMyPermission(const APermission: TArray<System.string>): Boolean;
begin
  PermissionsService.RequestPermissions(APermission, nil, nil);
  Result := True;
end;

end.
