@echo off
setlocal enabledelayedexpansion

REM Base directories
set BASEDIR=%USERPROFILE%\Downloads\mapas
set BZ2DIR=%BASEDIR%\bz2

REM Check if base directory exists
if not exist "%BASEDIR%" (
    echo Directory not found: %BASEDIR%
    exit /b 1
)

REM Create bz2 directory if it does not exist
if not exist "%BZ2DIR%" (
    mkdir "%BZ2DIR%"
)

REM Change to base directory
cd /d "%BASEDIR%"

REM Loop through all .bsp files
for %%F in (*.bsp) do (
    echo Compressing %%F ...
    bzip2 -kc "%%F" > "%BZ2DIR%\%%F.bz2"
)

echo Done.
pause
