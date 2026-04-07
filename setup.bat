@echo off
color 0b
echo ===========================================
echo MedApp - ONE-CLICK SETUP ^& LAUNCHER
echo ===========================================
echo.

:: Check for python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in PATH.
    pause
    exit /b
)

:: Check for virtual environment
if not exist "venv\Scripts\activate.bat" (
    echo [*] Virtual environment not found. Creating one...
    python -m venv venv
    echo [*] Checking dependencies...
    call venv\Scripts\activate.bat
    pip install -r requirements.txt
) else (
    echo [*] Virtual environment found. Activating...
    call venv\Scripts\activate.bat
)

echo.
echo [*] Starting MedApp...
echo ===========================================
echo   App:    http://127.0.0.1:5000
echo   Admin:  http://127.0.0.1:5000/admin
echo   Doctor: http://127.0.0.1:5000/doctor
echo ===========================================
echo.

:: Set environment to development
set FLASK_ENV=development

:: Run the application
python app.py

pause
