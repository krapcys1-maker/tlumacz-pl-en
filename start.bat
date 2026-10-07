@echo off
cd /d "%~dp0"

if not exist ".venv\Scripts\pythonw.exe" (
    echo Pierwsze uruchomienie - instaluje potrzebne biblioteki...
    python -m venv .venv || goto :error
    ".venv\Scripts\python.exe" -m pip install --disable-pip-version-check -q -r requirements.txt || goto :error
)

start "" ".venv\Scripts\pythonw.exe" "%~dp0tlumacz.py"
exit /b 0

:error
echo.
echo Cos poszlo nie tak. Sprawdz, czy masz zainstalowanego Pythona (python.org).
pause
exit /b 1
