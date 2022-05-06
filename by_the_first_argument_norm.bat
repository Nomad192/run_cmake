@echo off

goto start

:: skip some comments
echo. and code

:start
:: norm version
:: ---------------------------------------------------------------------------------------
set sParam=%~1

if defined sParam (
	if "%sParam%" == "%~n1" (
		if exist "%sParam%.exe" (
			(cmake --build . && (echo START & call %1))
		) else (
			echo Executable [%sParam%] not found
		)
	) else (
		if exist "%sParam%" (
			(cmake --build . && (echo START & call %1))
		) else (
			echo Executable [%sParam%] not found
		)
	)
) else (
	echo Usage: "%~nx0" ^<Name executable file^>
)

if defined sParam (
	if "%sParam%" == "%~n1" (
		if exist "%sParam%.exe" (
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
		) 
	) else (
		if exist "%sParam%" (
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
		) 
	)
) 
:: https://nhutils.ru/blog/nhcolor/
:: ---------------------------------------------------------------------------------------