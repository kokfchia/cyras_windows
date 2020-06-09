@echo off
setlocal
set CYRAS_USERID=%1
@rem set CYRAS_HOSTNAME=192.168.238.50
set CYRAS_HOSTNAME=cyras-5thflr.ddns.net

IF "%1"=="" ( 
        GOTO HELPER
    ) else (
        GOTO ENROLLMENT
    )

:HELPER
@echo Please provide cyras user id as argument
@echo   Example: %0 120201
goto EOF

:ENROLLMENT
@echo You want to enroll using this ID ^> %CYRAS_USERID%

@echo This is an enrollment process. 
@echo.
@echo The password provided to you will only work within 15mins ONCE attempted.
@echo i.e. once enrolled, you can re-enrolled but within 15mins using the same password/token.
@echo after 15mins, you will no longer be able reuse the password/token anymore.
@echo Please ensure you have the password/token from your administrator.
@echo.
@echo IF you attempt 3 failed tries, you will be BANNED. 
@echo IF you believe you have been banned, please contact your administrator.
@echo Indication that you have been banned... you will not get a prompt to enter password.
@echo.
set /p USER_INPUT="Type YES to continue or just enter to cancel > "

IF "%USER_INPUT%"=="YES" ( 
        GOTO START
    ) else (
        @echo Cancelled.
        GOTO EOF
    )

@rem catch all do not pass.
goto EOF

:START
@echo start
@rem goto EOF

@echo Enrollment starting....
@echo Creating sshkeys for you...

set USER_IDENT=cyras%CYRAS_USERID%
set SSH_KEY=%USER_IDENT%_id_rsa

ssh-keygen -P "" -f "%SSH_KEY%"

set /p PUBLIC_KEY=<"%SSH_KEY%".pub

ssh %USER_IDENT%@%CYRAS_HOSTNAME% "/opt/cyras/common/setup_home.sh "%PUBLIC_KEY%"" > status.log

type status.log |findstr "Successfully enrolled you"

IF "%ERRORLEVEL%" NEQ "0" ( 
    @echo %ERRORLEVEL%
    goto HANDLEERROR 
)

:END_FILE
@echo Done!
goto EOF

:HANDLEERROR
@echo Something is wrong. Please report this.
goto EOF

:EOF
@rem end of file