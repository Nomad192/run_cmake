@echo off

cmake --build . && (
	for /f "delims=" %%i in ('cmake --build .') do (
		for %%j in ( %%i ) do set "target_name=%%j"
	) 
	goto:run
)
goto:eof

:run
echo START
call %target_name%
echo.
if not exist "C:\Windows\nhcolor.exe" (:: https://nhutils.ru/blog/nhcolor/
	IF %errorlevel% == 0 (
		echo return code: 0 
	) ELSE IF %errorlevel% GEQ 32 (
		 echo crash with code: 0x%=ExitCode% 
	) ELSE IF %errorlevel% LEQ -32 (
		 echo crash with code: 0x%=ExitCode% 
	) ELSE (
		echo crash with code: %errorlevel% 
	)
) else (
	IF %errorlevel% == 0 (
		echo return code: 0 | nhcolor 0A
	) ELSE IF %errorlevel% GEQ 32 (
		 echo crash with code: 0x%=ExitCode% | nhcolor 0C
	) ELSE IF %errorlevel% LEQ -32 (
		 echo crash with code: 0x%=ExitCode% | nhcolor 0C
	) ELSE (
		echo crash with code: %errorlevel% | nhcolor 0C
	)
)