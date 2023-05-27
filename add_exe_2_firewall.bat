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
Set _bRed=[41m
Set _Gr=[32m
Set _bGreen=[42m
Set _Y=[33m
Set _bYellow=[43m
Set _Blue=[34m
Set _bBlue=[44m
Set _Mag=[35m
Set _bMag=[45m
Set _Cy=[36m
Set _bCyan=[46m
Set _LGray=[37m
Set _bLGray=[47m
Set _DGray=[90m
Set _bDGray=[100m
Set _BRed=[91m
Set _bBRed=[101m
Set _BGreen=[92m
Set _bBGreen=[102m
Set _BYellow=[93m
Set _bBYellow=[103m
Set _BBlue=[94m
Set _bBBlue=[104m
Set _BMag=[95m
Set _bBMag=[105m
Set _BCyan=[96m
Set _bBCyan=[106m
Set _BWhite=[97m
Set _bBWhite=[107m
Set _R=[0m


:: Checking Administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
	ECHO %_Gr%%_bBl%------------------------- Administrator PRIVILEGES Detected! ------------------------------------- %_R%	
    ECHO %_Mag%%_bBl% 
	echo "  _____  ____  ____     ___ __    __   ____  _      _          ____  __ __  _        ___  _____ "
	echo " |     ||    ||    \   /  _]  |__|  | /    || |    | |        |    \|  |  || |      /  _]/ ___/ "
	echo " |   __| |  | |  D  ) /  [_|  |  |  ||  o  || |    | |        |  D  )  |  || |     /  [_(   \_  "
	echo " |  |_   |  | |    / |    _]  |  |  ||     || |___ | |___     |    /|  |  || |___ |    _]\__  | "
	echo " |   _]  |  | |    \ |   [_|  `  '  ||  _  ||     ||     |    |    \|  :  ||     ||   [_ /  \ | "
	echo " |  |    |  | |  .  \|     |\      / |  |  ||     ||     |    |  .  \     ||     ||     |\    | "
	echo " |__|   |____||__|\_||_____| \_/\_/  |__|__||_____||_____|    |__|\_|\__,_||_____||_____| \___| "
	echo %_R% 
	ECHO %_Gr%%_bBl%------------------------------- Firewall Rules Changer ------------------------------------------- %_R%		
	
) ELSE (
   echo.
   echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########
   ECHO %_R%%_bBl% 
   TITLE ERROR: ADMINISTRATOR PRIVILEGES REQUIRED
   echo     ######## ########  ########   #######  ########  
   echo     ##       ##     ## ##     ## ##     ## ##     ## 
   echo     ##       ##     ## ##     ## ##     ## ##     ## 
   echo     ######   ########  ########  ##     ## ########  
   echo     ##       ##   ##   ##   ##   ##     ## ##   ##   
   echo     ##       ##    ##  ##    ##  ##     ## ##    ##  
   echo     ######## ##     ## ##     ##  #######  ##     ## 
   echo. %_R%
   echo ##########################################################
   echo.
   echo      Right click and select %_R%%_bBl%"Run As Administrator"%_R%. 
   echo.
   PAUSE
   EXIT /B 1
)

TITLE Firewall Rules Changer

ECHO           Path:  %~dp0     Name:  %~nx0
ECHO.

:: Input Option
:INPUT_CASE
PUSHD
ECHO.
ECHO                          %_Mag%%_bBl%-------:Options:---------%_R% 
ECHO                          %_Mag%%_bBl%^| %_R%  %_Cy%%_bBl%1 List .exe  %_R%       %_Mag%%_bBl%^| %_R%  
ECHO                          %_Mag%%_bBl%^| %_R%  %_Gr%%_bBl%2 Add Rules %_R%        %_Mag%%_bBl%^| %_R%  
ECHO                          %_Mag%%_bBl%^| %_R%  %_Y%%_bBl%3 Check FWrule %_R%     %_Mag%%_bBl%^| %_R%  
ECHO                          %_Mag%%_bBl%^| %_R%                      %_Mag%%_bBl%^| %_R%  
ECHO                          %_Mag%%_bBl%^| %_R%  %_R%%_bBl%5 Delete Rules %_R%     %_Mag%%_bBl%^| %_R%  
ECHO                          %_Mag%%_bBl%^| %_R%  %_1Grey%%_bBl%9 Install program %_R%  %_Mag%%_bBl%^| %_R%
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
  Echo                                     All .exe files %_R% 
  ECHO.
  SETLOCAL ENABLEDELAYEDEXPANSION
  SET "Line1Width=%_Cy%    --------------------------------------------%_R%"
  ECHO.These EXE files will be added to the windows firewall:
  ECHO.
  for /r %%a in (*.exe)do (
		ECHO.    %_Gr%%%~dpa%_R%
		ECHO.%Line1Width%%_Mag%%%~nxa%_R% 
  )
  ECHO.
  ECHO %_Cy%%_bBl%-------------------------------------End of list-------------------------------------------------- %_R%  
  GOTO INPUT_CASE 
  
  
:: Add the Rules  
:CASE_2
echo  %_Gr%%_bBl%-------------------------------------2 Add Rules--------------------------------------------------%_R% 
ECHO.
ECHO.The following IN and OUT rules will be added to the windows firewall:
ECHO.
SETLOCAL ENABLEDELAYEDEXPANSION
SET "Line2Width=    ----------------------------- "
ECHO.
for /r %%i in (*.exe)do ( 
		netsh advfirewall firewall add rule name="%%~dpi%%~ni" dir=in program="%%~dpi%%~nxi" profile=any action=block  
		netsh advfirewall firewall add rule name="%%~dpi%%~ni" dir=out program="%%~dpi%%~nxi" profile=any action=block   
		ECHO   %%~dpi %%~nxi  
)
echo  %_Gr%%_bBl%-------------------------------------Rules added--------------------------------------------------%_R% 
ECHO.
ECHO.
GOTO END_CASE
    
::  Check for FWrule
:CASE_3
ECHO %_Y%%_bBl%-------------------------------------3 Check for FWrule-------------------------------------%_R%
SETLOCAL ENABLEDELAYEDEXPANSION
for /r %%i in (*.exe)do (
  echo ----------------------------------------------------------------------
  echo/ Path: %%~dpi ^| Name: %%~nxi ^|   
  netsh advfirewall firewall show rule name="%%~dpi%%~ni" 
  )
ECHO %_Y%%_bBl%-------------------------------------End of Check for FWrule-------------------------------------%_R%
  GOTO INPUT_CASE


:: Delete the Rules
:CASE_5
echo %_R%%_bBl%-------------------------------------3 Delete Rules -------------------------------------%_R%  
SETLOCAL ENABLEDELAYEDEXPANSION
for /r %%i in (*.exe)do (
  netsh advfirewall firewall delete rule name="%%~dpi%%~ni" 
  ::verbose
  ECHO.  
  )
  echo %_R%%_bBl%-------------------------------------End of Delete Rules -------------------------------------%_R% 
  GOTO END_CASE
  
  
:: Exit the Program
:CASE_0
  GOTO END_CASE  
 
:: Install the Program
:CASE_9
ECHO %_R%%_bBl%-------------------------------------6 Install (not yet for real)-------------------------------------%_R%
ECHO making backupfile AdvancedSystemSettingsEnvironmentalVariables.txt
ECHO %PATH% > AdvancedSystemSettingsEnvironmentalVariables.txt
SET /P SURE=" Are You Sure? (Y/N): "

::  jump to :(Y)es, :(N)o.
2>NUL CALL :CASE_%SURE% 
:CASE_Y
::  Make a folder and add it to PATH
IF EXIST C:\CMD_HOME ( 
	ECHO Folder C:\CMD_HOME exist 
	ECHO setx PATH "%PATH%;C:\CMD_HOME\"
) ELSE ( 
	ECHO Folder C:\CMD_HOME does not exist
	mkdir C:\CMD_HOME
	IF EXIST C:\CMD_HOME  (
		ECHO now it exist
		ECHO setx PATH "%PATH%;C:\CMD_HOME\"
	) ELSE ( 
		ECHO You first need to manually make the directory C:\CMD_HOME to install
	)
)
ECHO %_R%%_bBl%-------------------------------------6 Install (not yet for real)-------------------------------------%_R%
GOTO INPUT_CASE
 
:CASE_N
ECHO %_R%%_bBl%-------------------------------------6 Install (not yet for real)-------------------------------------%_R%
GOTO INPUT_CASE
 
:: Wrong Input 
:DEFAULT_CASE
  ECHO                           Unknown option "%OPTION%"
  GOTO INPUT_CASE

:: End the programm 
:END_CASE
	ECHO %_Gr%%_bBl%-----------------------------------------------------------------%_R% %_Mag%%_bBl% 
 	echo    ______  __ __   ____  ____   __  _      __ __   ___   __ __  
	echo " |      ||  |  | /    ||    \ |  |/ ]    |  |  | /   \ |  |  | "
	echo " |      ||  |  ||  o  ||  _  ||  ' /     |  |  ||     ||  |  | "
	echo " |_|  |_||  _  ||     ||  |  ||    \     |  ~  ||  O  ||  |  | "
	echo "   |  |  |  |  ||  _  ||  |  ||     \    |___, ||     ||  :  | "
	echo "   |  |  |  |  ||  |  ||  |  ||  .  |    |     ||     ||     | "
	echo "   |__|  |__|__||__|__||__|__||__|\_|    |____/  \___/  \__,_| "                                                             
	echo %_R%%_Gr%%_bBl%-----------------------------------------------------------------%_R%	

::  # reset ERRORLEVEL
::  # return from CALL
  VER > NUL
  GOTO :EOF
