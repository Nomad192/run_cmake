@echo off

For %%i in (*.exe) Do cmake --build . && (echo START & %%i) & goto:print_return_code 
:print_return_code
echo.
echo return code: %errorlevel%