@ECHO OFF
COLOR 0F
::EchoANSI.cmd
cls
:: Requires windows 1909 or newer
:: Define foreground and background ANSI colors:

Set _fGre=[32m
Set _fRed=[31m
Set _fYel=[33m
Set _fBlu=[34m
Set _fMag=[35m
Set _fCya=[36m
Set _fLGr=[37m
Set _RES=[0m

TITLE Preview File type as text in Windows Explorer

ECHO %_fGre%
ECHO  ---------------------------------------------------------
echo "%_fMag%      ______                    __                       %_fGre%"
echo "%_fMag%     |   __ \.----.-----.--.--.|__|.-----.--.--.--.      %_fGre%"
echo "%_fMag%     |    __/|   _|  -__|  |  ||  ||  -__|  |  |  |      %_fGre%"
echo "%_fMag%     |___|   |__| |_____|\___/ |__||_____|________|      %_fGre%"
echo "%_fMag%  _______ __ __             _______                      %_fGre%"
echo "%_fMag% |    ___|__|  |.-----.    |_     _|.--.--.-----.-----.  %_fGre%"
echo "%_fMag% |    ___|  |  ||  -__|      |   |  |  |  |  _  |  -__|  %_fGre%"
echo "%_fMag% |___|   |__|__||_____|      |___|  |___  |   __|_____|  %_fGre%"
echo "%_fMag%                                    |_____|__|           %_fGre%"
ECHO "---------------------------------------------------------"  %_fMag%

ECHO     %_RES% Path: %_fMag% %~dp0
ECHO     %_RES% Name: %_fMag% %~nx0
ECHO.
PUSHD
ECHO.
ECHO %_RES% Input [%_fRed% 0 %_RES%or %_fRed%ctrl+c %_RES%] to exit
ECHO.
:: Input File extention
SET /P TYPE=" Enter filetype to show in preview as:%_fGre% txt %_RES%NOT %_fRed%.txt %_RES%: "

::  jump to :1, :2, etc.
2>NUL CALL :CASE_%TYPE%

:: If CASE_label doesn't exist Exit the programm
IF ERRORLEVEL 1 CALL :DEFAULT_CASE
EXIT /B

:DEFAULT_CASE
ECHO Existing CURRENT_USER Classes
reg query HKCU\SOFTWARE\Classes\.%TYPE% /s
ECHO Existing LOCAL_MACHINE Classes
reg query HKLM\SOFTWARE\Classes\.%TYPE% /s
:: Checking Administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
ECHO %_fGre% ---------- Administrator PRIVILEGES Detected! ---------- %_RES%
ECHO:
ECHO %_fGre% reg add %_RES% HKLM\SOFTWARE\Classes\%_fGre%.%TYPE%  %_RES%   /v PerceivedType /t REG_SZ /d text
ECHO:
reg add HKLM\SOFTWARE\Classes\.%TYPE%     /v PerceivedType /t REG_SZ /d text
) ELSE (
ECHO %_fRed% ---------- User PRIVILEGES Detected! ---------- %_RES%
ECHO:
ECHO %_fGre% reg add %_RES% HKCU\SOFTWARE\Classes\%_fGre%.%TYPE%     %_RES%  /v PerceivedType /t REG_SZ /d text
reg add HKCU\SOFTWARE\Classes\.%TYPE%       /v PerceivedType /t REG_SZ /d text
)



:CASE_0
:CASE_zero
:: End the programm --> https://patorjk.com/software/taag/#p=display&h=2&v=3&f=Chunky&t=Thank%20You%0A

ECHO %_fGre%
ECHO  --------------------------------------------------------------
echo "%_fMag%  _______ __                 __         ___ ___               %_fGre%"
echo "%_fMag% |_     _|  |--.---.-.-----.|  |--.    |   |   |.-----.--.--. %_fGre%"
echo "%_fMag%   |   | |     |  _  |     ||    <      \     / |  _  |  |  | %_fGre%"
echo "%_fMag%   |___| |__|__|___._|__|__||__|__|      |___|  |_____|_____| %_fGre%"
echo  --------------------------------------------------------------%_RES%
EXIT /B
::  # reset ERRORLEVEL
::  # return from CALL
  VER > NUL
  EXIT /B
  GOTO :EOF
