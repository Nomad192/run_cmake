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
		echo return code: %errorlevel%
	) ELSE (
		echo crash with code: %errorlevel%
	)
) else (
	IF %errorlevel% == 0 (
		echo return code: %errorlevel% | nhcolor 0A
	) ELSE (
		echo crash with code: %errorlevel% | nhcolor 0C
	)
)