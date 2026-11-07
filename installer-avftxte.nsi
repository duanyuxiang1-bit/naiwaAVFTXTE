Unicode true
!include "MUI2.nsh"
!include "LogicLib.nsh"
!include "WinVer.nsh"
Name "naiwaAVFTXTE（奶蛙低占用2D版）"
OutFile "D:\naiwaAVFTXTE\naiwaAVFTXTE.exe"
InstallDir "$LOCALAPPDATA\Programs\naiwaAVFTXTE"
InstallDirRegKey HKCU "Software\naiwaAVFTXTE" "InstallDir"
RequestExecutionLevel user
SetCompressor /SOLID lzma
!define MUI_ICON "assets\naiwa.ico"
!define MUI_UNICON "assets\naiwa.ico"
!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_RUN "$INSTDIR\naiwaAVFTXTE.exe"
!define MUI_FINISHPAGE_RUN_TEXT "启动 naiwaAVFTXTE"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "SimpChinese"
Function .onInit
 SetShellVarContext current
 ${IfNot} ${AtLeastWin10}
  MessageBox MB_ICONSTOP "此版本需要 Windows 10/11 x64。"
  Abort
 ${EndIf}
 System::Call 'kernel32::GetCurrentProcess() p .r0'
 System::Call 'kernel32::IsWow64Process(p r0, *i .r1)'
 ${If} $1 == 0
  MessageBox MB_ICONSTOP "此版本只支持 Windows x64。"
  Abort
 ${EndIf}
FunctionEnd
Function un.onInit
 SetShellVarContext current
FunctionEnd
Section "naiwaAVFTXTE" SEC_MAIN
 SetOutPath "$INSTDIR"
 IfFileExists "$INSTDIR\naiwaAVFTXTE.exe" 0 +2
  ExecWait '"$INSTDIR\naiwaAVFTXTE.exe" --quit-existing'
 Sleep 600
 File /oname=naiwaAVFTXTE.exe "out\NaiwaLite.exe"
 File "out\naiwa.nf2"
 File "out\broadcast.html"
 File "out\broadcast.js"
 SetOutPath "$INSTDIR\skins"
 Delete "$INSTDIR\skins\*.nfs"
 File "out\skins\*.nf2"
 SetOutPath "$INSTDIR"
 File "out\LICENSE.txt"
 File "out\LICENSE.Naiwa-original.txt"
 File "out\COPYING.MinGW-w64-runtime.txt"
 File "README.md"
 File "NOTICE.md"
 File "VALIDATION.md"
 WriteUninstaller "$INSTDIR\Uninstall.exe"
 WriteRegStr HKCU "Software\naiwaAVFTXTE" "InstallDir" "$INSTDIR"
 WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\naiwaAVFTXTE" "DisplayName" "naiwaAVFTXTE（奶蛙低占用2D版）"
 WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\naiwaAVFTXTE" "DisplayVersion" "0.6.5-preview"
 WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\naiwaAVFTXTE" "Publisher" "抖音W0Wsai / BongoCat contributors"
 WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\naiwaAVFTXTE" "DisplayIcon" "$INSTDIR\naiwaAVFTXTE.exe"
 WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\naiwaAVFTXTE" "UninstallString" '$\"$INSTDIR\Uninstall.exe$\"'
 WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\naiwaAVFTXTE" "NoModify" 1
 WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\naiwaAVFTXTE" "NoRepair" 1
 CreateDirectory "$SMPROGRAMS\naiwaAVFTXTE"
 CreateShortcut "$SMPROGRAMS\naiwaAVFTXTE\naiwaAVFTXTE.lnk" "$INSTDIR\naiwaAVFTXTE.exe"
 CreateShortcut "$SMPROGRAMS\naiwaAVFTXTE\仅直播输出.lnk" "$INSTDIR\naiwaAVFTXTE.exe" "--broadcast-only"
 CreateShortcut "$SMPROGRAMS\naiwaAVFTXTE\设置.lnk" "$INSTDIR\naiwaAVFTXTE.exe" "--settings"
 CreateShortcut "$SMPROGRAMS\naiwaAVFTXTE\卸载.lnk" "$INSTDIR\Uninstall.exe"
SectionEnd
Section "Uninstall"
 ExecWait '"$INSTDIR\naiwaAVFTXTE.exe" --quit-existing'
 Sleep 600
 Delete "$INSTDIR\naiwaAVFTXTE.exe"
 Delete "$INSTDIR\naiwa.nf2"
 Delete "$INSTDIR\broadcast.html"
 Delete "$INSTDIR\broadcast.js"
 Delete "$INSTDIR\skins\*.nfs"
 Delete "$INSTDIR\skins\*.nf2"
 RMDir "$INSTDIR\skins"
 Delete "$INSTDIR\LICENSE.txt"
 Delete "$INSTDIR\LICENSE.Naiwa-original.txt"
 Delete "$INSTDIR\COPYING.MinGW-w64-runtime.txt"
 Delete "$INSTDIR\README.md"
 Delete "$INSTDIR\NOTICE.md"
 Delete "$INSTDIR\VALIDATION.md"
 Delete "$INSTDIR\Uninstall.exe"
 RMDir "$INSTDIR"
 Delete "$SMPROGRAMS\naiwaAVFTXTE\naiwaAVFTXTE.lnk"
 Delete "$SMPROGRAMS\naiwaAVFTXTE\仅直播输出.lnk"
 Delete "$SMPROGRAMS\naiwaAVFTXTE\设置.lnk"
 Delete "$SMPROGRAMS\naiwaAVFTXTE\卸载.lnk"
 RMDir "$SMPROGRAMS\naiwaAVFTXTE"
 DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "NaiwaLite"
 DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\naiwaAVFTXTE"
 DeleteRegKey HKCU "Software\naiwaAVFTXTE"
 ; Personal settings, native 3D and Electron stable are deliberately preserved.
SectionEnd
