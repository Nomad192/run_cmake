@echo off

cmake --build . && (
	for /f "delims=" %%i in ('cmake --build .') do (
		for %%j in ( %%i ) do set "var=%%j"
	) 
	echo START 
	call %var%
	goto:print_return_code
)
goto:eof

:print_return_code
echo.
echo return code: %errorlevel%