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

@echo Creating sshkeys for you...

set USER_IDENT=cyras%CYRAS_USERID%
set SSH_KEY=%USER_IDENT%_idrsa

ssh-keygen -P "" -f "%SSH_KEY%"

set /p PUBLIC_KEY=<"%SSH_KEY%".pub

ssh %USER_IDENT%@cyras-5thflr.ddns.net "~/set_keys.sh "%PUBLIC_KEY%""

IF %ERRORLEVEL% NEQ 0 ( 
    @echo %ERRORLEVEL%
    goto HANDLEERROR 
)

:HANDLEERROR
@echo Something is wrong. Please report this.
goto EOF


:END_FILE
@echo "Done!"

:EOF
@rem end of file