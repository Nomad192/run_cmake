@echo off

set "path_folder=%cd%"
cd..
call:set_name %cd%
echo %name%
cd %path_folder%

cmake --build . && (echo START & %name%)
echo.
echo return code: %errorlevel%
goto:eof

:set_name
set "name=%~nx1"