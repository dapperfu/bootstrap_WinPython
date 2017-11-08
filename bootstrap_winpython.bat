@ECHO OFF
: If WinPython URL is not defined (set through Jenkins, etc)
IF "%WINPYTHON_URL%"=="" (
: Use a known default
set URL=https://github.com/winpython/winpython/releases/download/1.9.20170812/WinPython-64bit-3.6.2.0Zero.exe
) ELSE (
: Otherwise use the given URL.
set URL=%WINPYTHON_URL%
)
: Generate the package name based on URL. 
FOR %%i IN ("%URL%") DO (
set PKG=%~dp0%%~ni%%~xi
)

: If the package doesn't exist locally, download it.
if not exist %PKG% %~dp0curl.exe -L -o %PKG% %URL%
: If the package has not been 'installed' install it.
if not exist %~dp0WinPython %PKG% /S /D=%~dp0WinPython

: Load the WinPython environment so other scripts can call Python.
call %~dp0WinPython\scripts\env.bat

python --version