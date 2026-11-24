@echo off
setlocal
cd /d "%~dp0"

for /f "delims=" %%i in ('powershell -NoProfile -Command "[System.Uri]::new((Get-Item 'index.html').FullName).AbsoluteUri"') do (
    set "SAFE_URL=%%i"
)

set "APP_DATA=%TEMP%\WordExplorerApp"

if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" (
    start "" "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" --app="%SAFE_URL%" --user-data-dir="%APP_DATA%" --start-maximized
    exit /b
)
if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" (
    start "" "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" --app="%SAFE_URL%" --user-data-dir="%APP_DATA%" --start-maximized
    exit /b
)
if exist "%LocalAppData%\Microsoft\Edge\Application\msedge.exe" (
    start "" "%LocalAppData%\Microsoft\Edge\Application\msedge.exe" --app="%SAFE_URL%" --user-data-dir="%APP_DATA%" --start-maximized
    exit /b
)

if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
    start "" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" --app="%SAFE_URL%" --user-data-dir="%APP_DATA%" --start-maximized
    exit /b
)
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
    start "" "%ProgramFiles%\Google\Chrome\Application\chrome.exe" --app="%SAFE_URL%" --user-data-dir="%APP_DATA%" --start-maximized
    exit /b
)
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" (
    start "" "%LocalAppData%\Google\Chrome\Application\chrome.exe" --app="%SAFE_URL%" --user-data-dir="%APP_DATA%" --start-maximized
    exit /b
)

start "" "%SAFE_URL%"
exit /b
