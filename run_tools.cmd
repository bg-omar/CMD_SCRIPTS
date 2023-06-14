@ECHO OFF
COLOR 0F
::EchoANSI.cmd
cls
:: Requires windows 1909 or newer
:: Define foreground and background ANSI colors:
Set _fBlack=[30m
Set _bBlack=[40m
Set _fRed=[31m
Set _bRed=[41m
Set _fGreen=[32m
Set _bGreen=[42m
Set _fYellow=[33m
Set _bYellow=[43m
Set _fBlue=[34m
Set _bBlue=[44m
Set _fMag=[35m
Set _bMag=[45m
Set _fCyan=[36m
Set _bCyan=[46m
Set _fLGray=[37m
Set _bLGray=[47m
Set _fDGray=[90m
Set _bDGray=[100m
Set _fBRed=[91m
Set _bBRed=[101m
Set _fBGreen=[92m
Set _bBGreen=[102m
Set _fBYellow=[93m
Set _bBYellow=[103m
Set _fBBlue=[94m
Set _bBBlue=[104m
Set _fBMag=[95m
Set _bBMag=[105m
Set _fBCyan=[96m
Set _bBCyan=[106m
Set _fBWhite=[97m
Set _bBWhite=[107m
Set _RESET=[0m

ECHO %_fGreenen%     "------------- CMD Scripts ----------" %_RESET% %_fMag% 
echo    ____      ___ ____ _  _ ____ __  __ ___
echo   (  _ \___ / __( ___( \( (_  _(  )(  / __)
echo    ) _ (___( (_-.)__) )  ( _)(_ )(__)(\__ \
echo   (____/    \___(____(_)\_(____(______(___/
ECHO %_fGreenen%     "------------- CMD Scripts ----------" %_RESET% %_fMag% 
:: Checking Administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
ECHO %_fGreenen% ---------- Administrator PRIVILEGES Detected! ---------- %_RESET%	
) ELSE (
ECHO %_fRed% ---------- User PRIVILEGES Detected! ---------- %_RESET%	
)

TITLE bGenius quick Commands

ECHO      Path:  %~dp0     Name:  %~nx0
ECHO.
:: Input Option
:INPUT_CASE
PUSHD



ECHO.
ECHO        %_fMag%  ---------- Options --------- %_RESET% 
ECHO        %_fMag% ^| %_RESET% 1      %_fCyan% Check Path %_RESET%      %_fMag% ^| %_RESET%  
ECHO        %_fMag% ^| %_RESET% 2   %_fBlue% Change PY_HOME %_RESET% %_fMag%     ^| %_RESET%  
ECHO        %_fMag% ^| %_RESET% 3   %_fRed% Change JAVA_HOME  %_RESET%  %_fMag% ^| %_RESET%  
ECHO        %_fMag% ^| %_RESET% 4     %_fYellow% Keep PC Idle %_RESET%     %_fMag% ^| %_RESET%  
ECHO        %_fMag% ^| %_RESET% 5     %_fMag%    Aliases   %_RESET%     %_fMag% ^| %_RESET% 
ECHO        %_fMag% ^| %_RESET% 6     %_fRed%   Date-Time  %_RESET%     %_fMag% ^| %_RESET%  
ECHO        %_fMag% ^| %_RESET% 7  %_fCyan% restart explorer %_RESET%    %_fMag% ^| %_RESET%  
ECHO        %_fMag% ^| %_RESET% 8  %_fCyan%   Node_modules-  %_RESET%    %_fMag% ^| %_RESET%
ECHO        %_fMag% ^| %_RESET% 9  %_fCyan%   Install NVM    %_RESET%    %_fMag% ^| %_RESET%
ECHO        %_fMag% ^| %_RESET% 10  %_fCyan%    Env Vars     %_RESET%    %_fMag% ^| %_RESET%
ECHO        %_fMag% ^| %_RESET%q 0    %_f1Grey%   EXIT    %_RESET%        %_fMag% ^| %_RESET%  
ECHO        %_fMag%  ---------------------------- %_RESET% 
ECHO.

:: Input Option
SET /P OPTION=" Enter Option: "

::  jump to :1, :2, etc.
2>NUL CALL :CASE_%OPTION% 

:: If CASE_label doesn't exist Exit the programm
IF ERRORLEVEL 1 CALL :DEFAULT_CASE 
EXIT /B

:CASE_1
	ECHO %_fCyan% ---------- The Environmental Variable PATH Contains ---------- %_RESET% 
	ECHO. 	
	setlocal EnableDelayedExpansion
	set "token=%PATH%"
	set envVariables=!token:;=^

	!
	ECHO 	!envVariables!
	ECHO %_fCyan% ---------- The Environmental Variable PATH Contains ---------- %_RESET% 
	GOTO INPUT_CASE 
	   
:CASE_2
    ECHO  %_fBlue% ---------- Change-Python---------------------------------------------------%_RESET% 
	ECHO.
	ECHO        %_fMag% ^| %_RESET% 1  %_fCyan% Python27 %_RESET%     %_fMag% ^| %_RESET%  
	ECHO        %_fMag% ^| %_RESET% 2  %_fBlue% Python36 %_RESET%     %_fMag% ^| %_RESET%  
	ECHO        %_fMag% ^| %_RESET% 3  %_fRed% Python310 %_RESET%    %_fMag% ^| %_RESET%  
	ECHO        %_fMag% ^| %_RESET% 4  %_fCyan% Python311 %_RESET%    %_fMag% ^| %_RESET% 
	ECHO.
	ECHO PY_HOME = %PY_HOME%
	:: Input JAVA
	SET /P PYTHON=" Enter PY_HOME version: "
	::  jump to :1, :2, etc.
	2>NUL CALL :PYTHON_%PYTHON% 
	:: If CASE_label doesn't exist Exit the programm
	IF ERRORLEVEL 1 CALL :DEFAULT_CASE 
	EXIT /B

	:PYTHON_1
	ECHO %_fBGreen%temporary changing PY_HOME  %_RESET% 
	ECHO %_fCyan%PY_HOME=C:\Python27;C:\Python27\Scripts%_RESET% 
	set PY_HOME=C:\Python27;C:\Python27\Scripts
	GOTO PYTHON_0
	
	:PYTHON_2
	ECHO %_fBGreen%temporary changing PY_HOME  %_RESET% 
	ECHO %_fCyan%PY_HOME=C:\Python36;C:\Python36\Scripts%_RESET% 
	set PY_HOME=C:\Python36;C:\Python36\Scripts
	GOTO PYTHON_0
	
	:PYTHON_3
	ECHO %_fBGreen%temporary changing PY_HOME  %_RESET% 
	ECHO %_fCyan%PY_HOME=C:\Python310;C:\Python310\Scripts%_RESET% 
	set PY_HOME=C:\Python310;C:\Python310\Scripts
	GOTO PYTHON_0
	
	:PYTHON_4
	ECHO %_fBGreen%temporary changing PY_HOME  %_RESET% 
	ECHO %_fCyan%PY_HOME=C:\Python311;C:\Python311\Scripts%_RESET% 
	set PY_HOME=C:\Python311;C:\Python311\Scripts
	GOTO PYTHON_0
	
	:PYTHON_0
	ECHO.
	ECHO.  %_fBGreen% %_bBWhite% PY_HOME changed to %PY_HOME% %_RESET% 
	ECHO.
	echo  %_fBlue%------------------------------------- Option-3: --------------------------------------------------%_RESET% 
	ECHO.
	GOTO END_CASE
  
   
:CASE_3
	echo  %_fRed%------------------------------------- Option-3: --------------------------------------------------%_RESET% 
	ECHO. 
	ECHO        %_fMag% ^| %_RESET% 1  %_fCyan% openjdk-18.0.1.1 %_RESET%     %_fMag% ^| %_RESET%  
	ECHO        %_fMag% ^| %_RESET% 2  %_fBlue% temurin-17.0.4 %_RESET%       %_fMag% ^| %_RESET%  
	ECHO        %_fMag% ^| %_RESET% 3  %_fRed% temurin-17.0.5 %_RESET%       %_fMag% ^| %_RESET%  
	ECHO.
	:: Input JAVA
	SET /P JAVA=" Enter JAVA_HOME version: "
	::  jump to :1, :2, etc.
	2>NUL CALL :JAVA_%JAVA% 
	:: If CASE_label doesn't exist Exit the programm
	IF ERRORLEVEL 1 CALL :DEFAULT_CASE 
	EXIT /B

	:JAVA_1
	ECHO temporary changing JAVA_HOME  
	ECHO JAVA_HOME=C:/Users/Omar.Iskandarani/.jdks/openjdk-18.0.1.1
	set JAVA_HOME=C:/Users/Omar.Iskandarani/.jdks/openjdk-18.0.1.1
	GOTO JAVA_0
	
	:JAVA_2
	ECHO temporary changing JAVA_HOME  
	ECHO JAVA_HOME=C:/Users/Omar.Iskandarani/.jdks/temurin-17.0.4
	set JAVA_HOME=C:/Users/Omar.Iskandarani/.jdks/temurin-17.0.4
	GOTO JAVA_0
	
	:JAVA_3
	ECHO temporary changing JAVA_HOME  
	ECHO JAVA_HOME=C:/Users/Omar.Iskandarani/.jdks/temurin-17.0.5
	set JAVA_HOME=C:/Users/Omar.Iskandarani/.jdks/temurin-17.0.5
	GOTO JAVA_0
	
	:JAVA_0
	ECHO. %JAVA_HOME%
	ECHO.
	refreshenv
	echo  %_fRed%---------------------------------------------------------------------------------------%_RESET% 
	ECHO.
	GOTO CASE_1
  
:CASE_4
	ECHO %_fYellow%------------------------------------- Keep PC Idle: -------------------------------------%_RESET%
	ECHO.
	:: Input SLEEP_TIME
	SET /P SLEEP_TIME=" Enter SleepTime in minutes: "
	cscript /nologo %~dp0idle.vbs %SLEEP_TIME%
	ECHO.
	ECHO %_fYellow%------------------------------------- Keep PC Idle: -------------------------------------%_RESET%
	GOTO INPUT_CASE

:CASE_5
	ECHO %_fMag%------------------------------------- Aliases : -------------------------------------%_RESET%
	ECHO.
	ECHO Setting ls = dir
	doskey ls=dir /P $*
	ECHO.
	ECHO %_fMag%------------------------------------- Aliases: -------------------------------------%_RESET%
	GOTO INPUT_CASE

:CASE_6
	ECHO %_fRed%------------------------------------- Date-Time : -------------------------------------%_RESET%
	ECHO.
	cscript /nologo %~dp0date-time.vbs 
	ECHO.
	ECHO %_fRed%------------------------------------- Date-Time: -------------------------------------%_RESET%
	GOTO INPUT_CASE
	
:CASE_7
	ECHO %_fCyan%------------------------------------- restart explorer : -------------------------------------%_RESET%
	ECHO.
	ECHO restarting explorer
	taskkill /f /IM explorer.exe
	start explorer.exe

	ECHO.
	ECHO %_fCyan%------------------------------------- restart explorer: -------------------------------------%_RESET%
	GOTO INPUT_CASE
	
	
	
:CASE_8
	ECHO %_fCyan%------------------------------------- node_modules : -------------------------------------%_RESET%
	ECHO.
	ECHO.
	:: Input NODE
	SET /P NODE=" Switch to node_modules-: "
	IF exist node_modules-%NODE% ( echo node_modules-%NODE% exists ) ELSE ( mkdir node_modules-%NODE% && echo node_modules-%NODE% created)
	ECHO rmdir node_modules
	rmdir node_modules
	ECHO mklink /J node_modules node_modules-%NODE%
	mklink /J node_modules node_modules-%NODE%
	ECHO.
	ECHO %_fCyan%------------------------------------- node_modules: -------------------------------------%_RESET%
	GOTO INPUT_CASE
	


:CASE_9
	ECHO %_fCyan%------------------------------------- Install NVM : -------------------------------------%_RESET%
	ECHO.
	ECHO powershell .\no-admin_NPM_Version_Manager.ps1
    powershell .\no-admin_NPM_Version_Manager.ps1
	ECHO.
	ECHO %_fCyan%------------------------------------- Install NVM: -------------------------------------%_RESET%
	GOTO INPUT_CASE

:CASE_10
	ECHO %_fCyan%-------------------------------- Environment Variables ---------------------------------%_RESET%
	ECHO.
	ECHO Show/Edit Environment Variables
    rundll32 sysdm.cpl,EditEnvironmentVariables
	ECHO.
	ECHO %_fCyan%-------------------------------- Environment Variables ---------------------------------%_RESET%
	GOTO INPUT_CASE



	
	
:: Exit the Program
:CASE_Q
  GOTO END_CASE 
:CASE_q
  GOTO END_CASE 
:CASE_0
  GOTO END_CASE 
    
:: Wrong Input 
:DEFAULT_CASE
  ECHO        "%OPTION%" is an unknown option 
  GOTO INPUT_CASE

:: End the programm 
:END_CASE
  	ECHO %_fGreen%
    ECHO  --------------------------------------------------------------
    echo "%_fMag%  _______ __                 __         ___ ___               %_fGreen%"
    echo "%_fMag% |_     _|  |--.---.-.-----.|  |--.    |   |   |.-----.--.--. %_fGreen%"
    echo "%_fMag%   |   | |     |  _  |     ||    <      \     / |  _  |  |  | %_fGreen%"
    echo "%_fMag%   |___| |__|__|___._|__|__||__|__|      |___|  |_____|_____| %_fGreen%"
    echo  --------------------------------------------------------------%_R%
    EXIT /B
::  # reset ERRORLEVEL
::  # return from CALL
  VER > NUL
  EXIT /B
  GOTO :EOF
