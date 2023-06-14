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

ECHO %_fGre%     "------------- CMD Scripts ----------" %_RES% %_fMag% 
echo %_fMag%     " _     _____            _           "
echo      "| |   |  __ \          (_)          "
echo      "| |__ | |  \/ ___ _ __  _ _   _ ___ "
echo      "| '_ \| | __ / _ \ '_ \| | | | / __|"
echo      "| |_) | |_\ \  __/ | | | | |_| \__ \"
echo      "|_.__/ \____/\___|_| |_|_|\__,_|___/"
echo      "                                    "%_RES%
ECHO %_fGre%     "------------- CMD Scripts ----------" %_RES% %_fMag% 
:: Checking Administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
ECHO %_fGre% ---------- Administrator PRIVILEGES Detected! ---------- %_RES%	
) ELSE (
ECHO %_fRed% ---------- User PRIVILEGES Detected! ---------- %_RES%	
)

TITLE bGenius quick Commands

ECHO      Path:  %~dp0     Name:  %~nx0
ECHO.
PUSHD

echo    ____      ___ ____ _  _ ____ __  __ ___ 
echo   (  _ \___ / __( ___( \( (_  _(  )(  / __)
echo    ) _ (___( (_-.)__) )  ( _)(_ )(__)(\__ \
echo   (____/    \___(____(_)\_(____(______(___/

ECHO.
ECHO        %_fMag%  ----------------------------   %_RES% 
ECHO        %_fMag% ^|  %_fCya%         keep           %_RES% %_fMag% ^| %_RES%
ECHO        %_fMag% ^|  %_fBlu%          my            %_RES% %_fMag% ^| %_RES%
ECHO        %_fMag% ^|  %_fRed%          PC            %_RES% %_fMag% ^| %_RES%
ECHO        %_fMag% ^|  %_fYel%         idle           %_RES% %_fMag% ^| %_RES%
ECHO        %_fMag% ^|  %_fMag%         for            %_RES% %_fMag% ^| %_RES%
ECHO        %_fMag% ^|  %_fLGr%       minutes          %_RES% %_fMag% ^| %_RES%
ECHO        %_fMag%  ----------------------------   %_RES% 
ECHO.
ECHO.
:: Input SLEEP_TIME
SET /P SLEEP_TIME=" Enter SleepTime in minutes: "
cscript /nologo %~dp0idle.vbs %SLEEP_TIME%
ECHO.


:: End the programm 

ECHO %_fGre%-----------------------------------------------------------------%_RES% %_fMag%
echo    ______  __ __   ____  ____   __  _      __ __   ___   __ __
echo " |      ||  |  | /    ||    \ |  |/ ]    |  |  | /   \ |  |  | "
echo " |      ||  |  ||  o  ||  _  ||  ' /     |  |  ||     ||  |  | "
echo " |_|  |_||  _  ||     ||  |  ||    \     |  ~  ||  O  ||  |  | "
echo "   |  |  |  |  ||  _  ||  |  ||     \    |___, ||     ||  :  | "
echo "   |  |  |  |  ||  |  ||  |  ||  .  |    |     ||     ||     | "
echo "   |__|  |__|__||__|__||__|__||__|\_|    |____/  \___/  \__,_| "
echo %_RES%%_fGre%-----------------------------------------------------------------%_RES%
EXIT /B
::  # reset ERRORLEVEL
::  # return from CALL
  VER > NUL
  EXIT /B
  GOTO :EOF
