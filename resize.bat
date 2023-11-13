@echo off
cls
setlocal enableDelayedExpansion
:::::  download and install ffmpeg and ffprobe before running :::::::::::::
:::::  asigning arguments as a key-value pairs:::::::::::::
set counter=0
for %%# in (%*) do (    
    set /a counter=counter+1
    set /a even=counter%%2
    if !even! == 0 (
        echo setting !prev! to %%#
        set "!prev!=%%~#"
    )
    set "prev=%%~#"
)
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


  For /f "tokens=1-3 delims=1234567890 " %%a in ("%time%") Do set "delims=%%a%%b%%c"
  For /f "tokens=1-4 delims=%delims%" %%G in ("%time%") Do (
    Set _hh=%%G
    Set _min=%%H
    Set _ss=%%I
    Set _ms=%%J
  )
  :: Strip any leading spaces
  Set _hh=%_hh: =%

  :: Ensure the hours have a leading zero
  if 1%_hh% LSS 20 Set _hh=0%_hh%

  Echo The time is:   %_hh%:%_min%:%_ss%
  Set _time=%_hh%_%_min%
  
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
COLOR 0F
Set _Red=[31m
Set _Gr=[32m
Set _Y=[33m
Set _Blue=[34m
Set _Mag=[35m
Set _Cy=[36m
Set _LGray=[37m
Set _DGray=[90m
Set _BRed=[91m
Set _BGreen=[92m
Set _BYellow=[93m
Set _BBlue=[94m
Set _BCyan=[96m
Set _BWhite=[97m
Set _R=[0m

TITLE FFmpeg Trimmer
echo %_Gr%
echo  ____  ____  ____  __  ____  ____    _  _  ____   ___ 
echo (  _ \(  __)/ ___)(  )(__  )(  __)  ( \/ )(  _ \ / _ \
echo  )   / ) _) \___ \ )(  / _/  ) _)   / \/ \ ) __/(__  (
echo (__\_)(____)(____/(__)(____)(____)  \_)(_/(__)    (__/%_R%
:::::  asigning arguments as a key-value pairs::::::::::::: 
ECHO using             %_Cy% TYPE:%_BRed% %TYPE% %_Cy% START:%_BRed% %START% %_Cy% END:%_BRed% %END% %_R%
ECHO:
IF EXIST C:\output ( ECHO Output folder %_Gr% C:\output exist %_R%
) ELSE ( ECHO Folder C:\output does not yet exist... making dir
	mkdir C:\output
)
echo %_Mag%   All files will be exported to C:\output 	%_R%
ECHO:These video files will be trimmed
ECHO:
for %%a in (*.%ON%)do (
	ECHO:    --- %_Mag%%%~nxa%_R%
)
ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%

ECHO:


::  jump to type
2>NUL CALL :TYPE_%TYPE% 

IF ERRORLEVEL 1 CALL :NOTYPE
EXIT /B

:: Intro
:TYPE_START_AT
	ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%
	ECHO TYPE = START_AT
        for %%i in (*.%ON%) do (
            IF EXIST C:/output/%%~nxi (
                ffmpeg  -ss %START% -i "%%i"  -c:v copy -c:a copy "C:/output/%%~ni%_time%%%~xi"
            ) ELSE (
                ffmpeg  -ss %START% -i "%%i"  -c:v copy -c:a copy "C:/output/%%~nxi"
            )
        )
	ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%
	GOTO END_CASE

:: Outro
:TYPE_END_AT
	ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%
	ECHO TYPE = END_AT
        for %%i in (*.%ON%) do (
            IF EXIST C:/output/%%~nxi (
                ffmpeg  -i "%%i"  -to %END% -c:v copy -c:a copy "C:/output/%%~ni%_time%%%~xi"
            ) ELSE (
                ffmpeg  -i "%%i"  -to %END% -c:v copy -c:a copy "C:/output/%%~nxi"
            )
        )
	ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%
	GOTO END_CASE

:: both
:TYPE_START_2_END
	ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%
	ECHO TYPE = START_2_END
	for %%i in (*.%ON%) do (
		IF EXIST C:/output/%%~nxi (
			ECHO Filename exist
			ffmpeg  -i "%%i"  -ss %START% -to %END% -c:v copy -c:a copy "C:/output/%%~ni%_time%%%~xi"
		) ELSE ( 
			ECHO Filename exist not
			ffmpeg  -i "%%i"  -ss %START% -to %END% -c:v copy -c:a copy "C:/output/%%~nxi"
		)
	)
	ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%
	GOTO END_CASE

:: cut_outro
:TYPE_CUT_OUTRO
	ECHO %_Cy% ------------------------------------- Cut Outro -------------------------------------------------- %_R%
	ECHO TYPE = CUT_OUTRO
    SETLOCAL
    :: count to 5 storing the results in a variable
        set _tst=0
        for %%a in (*.%ON%)do (

            SETLOCAL
            ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%
            echo "%%a"
            call :ffprobe "%%a"

        )

            :ffprobe
                if "%~x1" == ".mkv" (
                    for /f "tokens=1* delims=:" %%a in ('"ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "%~nx1""') do (
                        set "duration=%%a"
                        echo duration = %duration%
                        call :duration %%a "%~nx1"
                        )
                ) else (
                     FOR /F "tokens=1* USEBACKQ" %%G IN (`"ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "%1""`) DO (
                         call :duration %%G %1
                     )
                 )
                echo: %1
                echo Total = %_tst% Encoded
                ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%
                goto :eof

            :duration
                set /a _sum=%1
                set "_title=%2"
                set /a _tot=%_sum%-%END%
                ECHO:%_Mag% ------------ %_title% ------------- %_R%
                echo  duration in sec: %1      -%END%     new duration = %_tot% & set /a _tst+=1
                IF EXIST C:/output/%2 (
                   echo skipped file: %2
                   goto :eof
                ) ELSE (
                   ffmpeg -i %2 -x264-params opencl=true -t %_tot% -c:v copy -c:a copy C:/output/%2
                   goto :eof
                )
    ECHO:
    ECHO %_BBlue% ------------------------------------- : -------------------------------------------------- %_R%
	ECHO %_Cy% ------------------------------------- : -------------------------------------------------- %_R%
	GOTO END_CASE


:: no TYPE Exit
:NOTYPE
	ECHO Please give arguments
	echo:   TYPE = START_AT, END_AT, START_2_END or CUT_OUTRO
	echo:  START =  H:MM:SS   @ type START_AT - START_2_END
	echo:    END =  H:MM:SS   @ type   END_AT - START_2_END - CUT_OUTRO
	echo:
	ECHO resize.bat TYPE %_BGreen% START_2_END %_R% START %_BGreen% H:MM:SS %_R% END %_BGreen% H:MM:SS %_R%
	ECHO:
	ECHO resize.bat TYPE %_BGreen% CUT_OUTRO %_R% END %_BGreen% 60 %_R% ON %_BGreen% mp4 %_R%
	ECHO                                 [60=1min]      [mp4, avi, mkv]
    ECHO resize.bat TYPE %_BGreen% START_AT %_R% START %_BGreen% 60 %_R% ON %_BGreen% mkv %_R%
    ECHO                                 [60=1min]      [mp4, avi, mkv]

 
:: End the programm 
:END_CASE 
	endlocal 
	 VER > NUL
	  GOTO :EOF
