@echo off
setlocal
cd /d "%~dp0"

netstat -ano | findstr ":8160" | findstr "LISTENING" >nul 2>nul
if %errorlevel% equ 0 goto already_running

start "WordExplorerService" /min python -m http.server 8160 --bind 127.0.0.1
echo [OK] WordExplorer Server started on http://127.0.0.1:8160
exit /b 0

:already_running
echo [OK] WordExplorer Server is already running on http://127.0.0.1:8160
exit /b 0
