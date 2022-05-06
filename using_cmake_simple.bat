@echo off

cmake --build . && (
	for /f "delims=" %%i in ('cmake --build .') do (
		for %%j in ( %%i ) do set "var=%%j"
	) 
	goto:run
)
goto:eof

:run
echo START 
call %var%
echo.
echo return code: %errorlevel%