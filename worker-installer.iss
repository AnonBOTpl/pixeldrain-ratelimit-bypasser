[Setup]
AppName=Pixeldrain Limit Bypasser
AppVersion=1.0
AppPublisher=YourName
DefaultDirName={autopf}\PixeldrainLimitBypasser
; Alternatywnie instaluj w folderze użytkownika (nie wymaga admina):
; DefaultDirName={userpf}\PixeldrainLimitBypasser
DefaultGroupName=Pixeldrain Limit Bypasser
OutputBaseFilename=PixeldrainLimitBypasserInstaller
Compression=lzma
SolidCompression=yes
; Wymagane dla Windows 10/11
MinVersion=6.1
ArchitecturesInstallIn64BitMode=x64
; Wymagaj uprawnień administratora dla instalacji
PrivilegesRequired=admin

[Files]
; Your files - exactly as in folder
Source: "start.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "worker.js"; DestDir: "{app}"; Flags: ignoreversion  
Source: "worker-dev.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "worker-dev.ps1"; DestDir: "{app}"; Flags: ignoreversion
; Manifest dla uprawnień administratora
Source: "worker-dev.exe.manifest"; DestDir: "{app}"; Flags: ignoreversion
; Ikonka rakiety
Source: "rocket.ico"; DestDir: "{app}"; Flags: ignoreversion
; If you have node_modules folder, uncomment the line below:
; Source: "node_modules\*"; DestDir: "{app}\node_modules"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; Start menu shortcut - runs exe with rocket icon
Name: "{group}\Pixeldrain Limit Bypasser"; Filename: "{app}\worker-dev.exe"; IconFilename: "{app}\rocket.ico"
; Desktop shortcut with rocket icon
Name: "{autodesktop}\Pixeldrain Limit Bypasser"; Filename: "{app}\worker-dev.exe"; IconFilename: "{app}\rocket.ico"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional options:"; Flags: unchecked

[Run]
; Ask to run after installation
Filename: "{app}\worker-dev.exe"; Description: "Launch Pixeldrain Limit Bypasser now"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
; Clean up all files during uninstallation
Type: filesandordirs; Name: "{app}"