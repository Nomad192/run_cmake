@echo off

cmake --build . && (
	for /f "delims=" %%i in ('cmake --build .') do (
		for %%j in ( %%i ) do set "var=%%j"
	) 
	echo START 
	call %var%
)
goto:eof

:print_code
echo.
echo return code: %errorlevel%