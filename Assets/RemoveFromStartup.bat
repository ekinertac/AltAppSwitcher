@echo off
REM https://superuser.com/questions/788924/is-it-possible-to-automatically-run-a-batch-file-as-administrator

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

REM reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "AltAppSwitcher"

schtasks /delete /tn AltAppSwitcher /f
if ERRORLEVEL == 1 (
    msg * "No startup task to remove."
    exit
)
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "AltAppSwitcher" /f
if ERRORLEVEL == 1 (
    msg * "No startup task to remove."
    exit
)

msg * "AltAppSwitcher has been removed from startup apps."