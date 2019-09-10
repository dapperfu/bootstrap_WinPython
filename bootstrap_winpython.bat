@ECHO OFF
: If WinPython URL is not defined (set through Jenkins, etc)
IF "%WINPYTHON_URL%"=="" (
: Use a known default
set URL=https://github.com/winpython/winpython/releases/download/2.0.20190705/Winpython64-3.7.4.0.exe
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

call %~dp0WinPython\scripts\upgrade_pip.bat

: Hide WinPython directory.
attrib +r %~dp0WinPython
: Hide *this* directory.
attrib +h %~dp0.