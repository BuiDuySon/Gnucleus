; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define Gnucleus_exe "..\Release\Gnucleus.exe"
#define GnucDNA_dll  "..\..\GnucDNAR2\Release\GnucDNA.dll"

#define public AppName "Gnucleus"
#define public AppVersion GetFileVersion(Gnucleus_exe)

[Setup]
AppCopyright=Copyright � 2000-2004 John Marshall
AppID={#AppName}
;AppMutex={#AppName}_Mutex
AppName={#AppName}
AppVerName={#AppName} version {#AppVersion}
AppVersion={#AppVersion}
AppPublisher=John Marshall
AppPublisherURL=http://www.gnucleus.com
AppSupportURL=http://www.gnucleus.com
AppUpdatesURL=http://www.gnucleus.com
DefaultDirName={pf}\{#AppName}
DefaultGroupName={#AppName}
LicenseFile=..\GPL.txt
OutputBaseFilename={#AppName}_{#AppVersion}
UninstallDisplayIcon={app}\Gnucleus.exe

[Tasks]
; NOTE: The following entry contains English phrases ("Create a desktop icon" and "Additional icons"). You are free to translate them into another language if required.
Name: desktopicon; Description: Create a &desktop icon; GroupDescription: Additional icons:

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: {#Gnucleus_exe}; DestDir: {app}; Flags: comparetimestamp replacesameversion
Source: {#GnucDNA_dll}; DestDir: {sys}; Flags: regserver sharedfile comparetimestamp replacesameversion
Source: GnuBlocked.net; DestDir: {app}\Data; Flags: onlyifdoesntexist
Source: GnuCache.net; DestDir: {app}\Data; Flags: onlyifdoesntexist
Source: Gnucleus Forums.url.txt; DestDir: {app}; Flags: comparetimestamp; DestName: Gnucleus Forums.url
Source: Gnucleus Home Page.url.txt; DestDir: {app}; Flags: comparetimestamp; DestName: Gnucleus Home Page.url
Source: WebCache.net; DestDir: {app}\Data; Flags: onlyifdoesntexist
Source: ..\ChangeLog.txt; DestDir: {app}\Docs

[Icons]
Name: {group}\{#AppName}; Filename: {app}\Gnucleus.exe
Name: {userdesktop}\{#AppName}; Filename: {app}\Gnucleus.exe; Tasks: desktopicon
Name: {group}\Uninstall {#AppName}; Filename: {uninstallexe}
Name: {group}\{#AppName} Home Page; Filename: {app}\{#AppName} Home Page.url
Name: {group}\{#AppName} Forums; Filename: {app}\{#AppName} Forums.url

[Run]
; NOTE: The following entry contains an English phrase ("Launch"). You are free to translate it into another language if required.
Filename: {app}\Gnucleus.exe; Description: Launch {#AppName}; Flags: nowait postinstall

[Dirs]
Name: {app}\Data
Name: {app}\Docs

[_ISTool]
Use7zip=false

[INI]
Filename: {app}\Data\GnuConfig.ini; Section: Search; Key: DownloadPath; String: {app}\Downloads; Flags: createkeyifdoesntexist
Filename: {app}\Data\GnuConfig.ini; Section: Share; Key: Dir0; String: {app}\Downloads, Recursive; Flags: createkeyifdoesntexist
Filename: {app}\Data\GnuConfig.ini; Section: Transfer; Key: PartialDir; String: {app}\Partials; Flags: createkeyifdoesntexist

[UninstallDelete]
Name: {app}\GnuHashes.ini; Type: files
Name: {app}\Data\ChatServers.ini; Type: files
Name: {app}\Data\GnuConfig.ini; Type: files
Name: {app}\Data\GnuConfigEx.ini; Type: files

[Code]
function InitializeSetup: Boolean;
	var
		SilentInstall: Boolean;
		AppRunning: Boolean;
		i: Integer;
		rc: Integer;
		appname: string;
		mutex: string;

begin
	Result := True;
	SilentInstall := WizardSilent;

	appname := ExpandConstant('{#AppName}');
	mutex := appname + '_Mutex';

	if SilentInstall then
		begin
			AppRunning := CheckForMutexes(mutex);
			i := 0;
			while AppRunning and ( i < 5 ) do
				begin
					Sleep(1000);
					AppRunning := CheckForMutexes(mutex);
					i := i + 1;
				end;
			AppRunning := CheckForMutexes(mutex);
			rc := IDOK;
			while AppRunning and ( rc = IDOK ) do
				begin
					rc := MsgBox('Setup has detected that '+appname+' is currently running.' + #10#10 + 'Please close all instances of it now, then press OK to continue, or Cancel to exit', mbError, MB_OKCANCEL);
					if rc = IDCANCEL then
						Result := False;
					AppRunning := CheckForMutexes(mutex);
				end;
		end
	else
		begin
			AppRunning := CheckForMutexes(mutex);
			rc := IDOK;
			while AppRunning and ( rc = IDOK ) do
				begin
					rc := MsgBox('Setup has detected that '+appname+' is currently running.' + #10#10 + 'Please close all instances of it now, then press OK to continue, or Cancel to exit', mbError, MB_OKCANCEL);
					if rc = IDCANCEL then
						Result := False;
					AppRunning := CheckForMutexes(mutex);
				end;
		end;
end;
