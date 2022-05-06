goto start

:: Skipping some comments
echo or code

:start
:: norm version
:: ---------------------------------------------------------------------------------------
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
if not exist "C:\Windows\nhcolor.exe" (
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
:: https://nhutils.ru/blog/nhcolor/
:: ---------------------------------------------------------------------------------------

:: simple version
:: ---------------------------------------------------------------------------------------
rem @echo off
rem
rem cmake --build . && (
rem 	for /f "delims=" %%i in ('cmake --build .') do (
rem 		for %%j in ( %%i ) do set "var=%%j"
rem 	) 
rem 	echo START 
rem 	goto:run
rem )
rem goto:eof
rem
rem :run
rem call %var%
rem echo.
rem echo return code: %errorlevel%
:: ---------------------------------------------------------------------------------------