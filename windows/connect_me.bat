@echo off
setlocal
set CYRAS_USERID=%1
set CYRAS_HOSTNAME=192.168.238.50
@rem set CYRAS_HOSTNAME=cyras-5thflr.ddns.net

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
@echo Use your userid: %CYRAS_USERID% as VNC password

set USER_IDENT=cyras%CYRAS_USERID%
set USER_KEY=%USER_IDENT%_id_rsa

SET DISPLAY_NUMBER=%CYRAS_USERID:~3,6%
ECHO VNC display: %DISPLAY_NUMBER%          

SET /A PORTDISPLAY = 5900+%DISPLAY_NUMBER%
echo Port: %PORTDISPLAY%

@rem goto EOF

start ssh -L %PORTDISPLAY%:localhost:%PORTDISPLAY% %USER_IDENT%@%CYRAS_HOSTNAME% -i %USER_KEY% /opt/cyras/common/setup_vnc.sh %CYRAS_USERID% %DISPLAY_NUMBER% 

@rem %PORTDISPLAY%

ping 127.0.0.1 -n 30 > nul
echo "starting vncview - check for vncviewer..."
"C:\Program Files\RealVNC\VNC Viewer\vncviewer.exe" localhost:%PORTDISPLAY%

:EOF
@rem end of file