@echo off
setlocal
set CYRAS_USERID=%1

IF "%1"=="" ( 
        GOTO HELPER
    ) else (
        GOTO START
    )

:HELPER
@echo Please provide cyras user id as argument
@echo   Example: %0 8888
goto EOF

:START
@echo %CYRAS_USERID%

set USER_IDENT=cyras%CYRAS_USERID%

ssh %USER_IDENT%@cyras-5thflr.ddns.net -i %MY_KEY%
