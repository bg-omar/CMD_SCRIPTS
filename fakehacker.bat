@ECHO OFF
COLOR 0F
Setlocal
::EchoANSI.cmd
cls
:: Requires windows 1909 or newer
:: Define foreground and background ANSI colors:
Set _Black=[30m
Set _bBl=[40m
Set _R=[31m
Set _bR=[41m
Set _Gr=[32m
Set _bGr=[42m
Set _Y=[33m
Set _bY=[43m
Set _B=[34m
Set _bB=[44m
Set _Mag=[35m
Set _bMag=[45m
Set _Cy=[36m
Set _bCy=[46m
Set _LGray=[37m
Set _bLGray=[47m
Set _DGray=[90m
Set _bDGray=[100m
Set _BR=[91m
Set _bBR=[101m
Set _BGr=[92m
Set _bBGr=[102m
Set _BY=[93m
Set _bBY=[103m
Set _BB=[94m
Set _bBB=[104m
Set _BMag=[95m
Set _bBMag=[105m
Set _BCy=[96m
Set _bBCy=[106m
Set _BWhite=[97m
Set _bBWhite=[107m
Set _R=[0m


:: Checking Administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
	ECHO %_Gr%%_bBl%------------------------- Administrator PRIVILEGES Detected! ------------------------------------- %_R%	
    TITLE Hackor
	ECHO %_Gr%%_bBl%-------------------------------  ------------------------------------------- %_R%			
) ELSE (
   echo.
   echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########
   ECHO %_R%%_bBl% 
   TITLE Hacks
   echo.
   echo      Right click and select %_R%%_bBl%"Run As Administrator"%_R%. 
   echo.

)



ECHO           Path:  %~dp0     Name:  %~nx0
ECHO.

:: Input Option
:INPUT_CASE
PUSHD
ECHO.
ECHO                          %_Mag%%_bBl%-------:Options:---------%_R% 
ECHO                          %_Mag%%_bBl%^| %_R%  %_Cy%%_bBl%1 List .exe  %_R%       %_Mag%%_bBl%^| %_R%  
ECHO                          %_Mag%%_bBl%^| %_R%  %_1Grey%%_bBl%0 Exit program %_R%     %_Mag%%_bBl%^| %_R%  
ECHO                          %_Mag%%_bBl%-------------------------%_R% 
ECHO.

:: Input Option
SET /P OPTION="                                     Enter Option: "

::  jump to :1, :2, etc.
2>NUL CALL :CASE_%OPTION% 

:: If CASE_label doesn't exist Exit the programm
IF ERRORLEVEL 1 CALL :DEFAULT_CASE 
EXIT /B


:: List the exe files 
:CASE_1
  ECHO.
  ECHO %_Cy%%_bBl%------------------------------------- Option 1: -------------------------------------------------- 
  Echo                                     Show all files %_R% 
  SET /P SURE=" Are You Sure? (Y/N): "
	::  jump to :(Y)es, :(N)o.
	2>NUL CALL :CASE_%SURE% 
	:CASE_Y	 
	  ECHO.
	  SETLOCAL ENABLEDELAYEDEXPANSION
	  SET "Line1Width=%_Gr%    --------------------------------------------%_R%"
	  ECHO.
	  for /r %%a in (*.*)do (
			ECHO.    %_BGr% %%~dpa %_R%
			ECHO. %Line1Width% %_Mag% %%~nxa %_R%
	  )
	  ECHO.
	  ECHO %_Cy%%_bBl%-------------------------------------End of list-------------------------------------------------- %_R%  
	  GOTO END_CASE 
  	:CASE_N
	ECHO %_R%%_bBl%-------------------------------------6 Install (not yet for real)-------------------------------------%_R%
	GOTO END_CASE
      

:: Exit the Program
:CASE_0
  GOTO END_CASE  
 
:: Wrong Input 
:DEFAULT_CASE
  ECHO                           Unknown option "%OPTION%"
  GOTO INPUT_CASE

:: End the programm 
:END_CASE
ECHO %_Gr% --------------------------------------------------------------
echo "%_Mag%  _______ __                 __         ___ ___               %_Gr%"
echo "%_Mag% |_     _|  |--.---.-.-----.|  |--.    |   |   |.-----.--.--. %_Gr%"
echo "%_Mag%   |   | |     |  _  |     ||    <      \     / |  _  |  |  | %_Gr%"
echo "%_Mag%   |___| |__|__|___._|__|__||__|__|      |___|  |_____|_____| %_Gr%"
echo %_Gr% --------------------------------------------------------------%_RES%

::  # reset ERRORLEVEL
::  # return from CALL
  VER > NUL
  GOTO :EOF
