@echo off
setlocal
set CYRAS_USERID=%1
@rem set CYRAS_HOSTNAME=192.168.10.202
@rem set CYRAS_HOSTNAME=cyras-5thflr.ddns.net
call hostname.bat

IF "%1"=="" ( 
        GOTO HELPER
    ) else (
        GOTO START
    )

:HELPER
@echo Please provide cyras user id as argument
@echo   Example: %0 120234
goto EOF

:START
@echo.
@echo Hostname - %CYRAS_HOSTNAME%
@echo Use your userid: %CYRAS_USERID% when the following happens:
@echo       ^> Enter passphrase for key
@echo       ^> VNC password
@echo.
ping 127.0.0.1 -n 5 > nul

set OS_USER=cyras%CYRAS_USERID%
set USER_KEY=%OS_USER%_id_rsa

SET DISPLAY_NUMBER=%CYRAS_USERID:~3,6%
SET /A DISPLAY_INT = 0+%DISPLAY_NUMBER%
echo Display number: %DISPLAY_NUMBER%
echo VNC display: %DISPLAY_INT%

SET /A PORTDISPLAY = 5900+%DISPLAY_INT%
echo Port: %PORTDISPLAY%

REM pause
REM goto EOF

start ssh -L %PORTDISPLAY%:localhost:%PORTDISPLAY% %OS_USER%@%CYRAS_HOSTNAME% -i %USER_KEY% /opt/cyras/common/setup_vnc.sh %CYRAS_USERID% %DISPLAY_INT% 

@rem %PORTDISPLAY%

ping 127.0.0.1 -n 30 > nul
echo "starting vncview - check for vncviewer..."
"C:\Program Files\RealVNC\VNC Viewer\vncviewer.exe" localhost:%PORTDISPLAY%

:EOF
@rem end of file