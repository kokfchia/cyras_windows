Assumptions:
1. You are using windows 10
2. You are using licensed windows 10.
3. You have windows 10 ssh client already installed
4. Please install realvnc viewer: https://www.realvnc.com/en/connect/download/viewer/windows/
5. You have permission to install software into your computer.

Installation:
1. Download zip file from https://github.com/kokfchia/cyras_windows/archive/master.zip
Unzip into your favorite directory

Enrollment:
1. Ensure you have 6 digit user id from Cyras administrator and password given.
2. Open command prompt navigate to the unzip contents above.
3. run enroll.bat <id> where <id> is the 6 digit userid.
Example output:
```
>enroll.bat 100123
You want to enroll using this ID > 100123
This is an enrollment process.

The password provided to you will only work within 15mins ONCE attempted.
i.e. once enrolled, you can re-enrolled but within 15mins using the same password/token.
after 15mins, you will no longer be able reuse the password/token anymore.
Please ensure you have the password/token from your administrator.

IF you attempt 3 failed tries, you will be BANNED.
IF you believe you have been banned, please contact your administrator.
Indication that you have been banned... you will not get a prompt to enter password.

Type YES to continue or just enter to cancel > YES
start
Enrollment starting....
Creating sshkeys for you...
Generating public/private rsa key pair.
Your identification has been saved in cyras100123_id_rsa.
Your public key has been saved in cyras100123_id_rsa.pub.
The key fingerprint is:
SHA256:aXmm+X+FEwAyUvU1pvqPIEQwKxbaewc1lM5RZWw9NUY account-01\d226896@lmw-d226896
The key's randomart image is:
+---[RSA 2048]----+
|    . +oB+++o.=E.|
|   o . *o+ o+++..|
|  . + oo.. .o. . |
|   . o ooo .  .  |
|    . . S +    o |
|     . + = .  o .|
|        + . .  o |
|         o . o.  |
|          ..o..  |
+----[SHA256]-----+
cyras100123@192.168.238.50's password:
Permission denied, please try again.
cyras100123@192.168.238.50's password:
Successfully enrolled you!
Done!
```
```
Connect to Cyras:
AFTER successful enrollment, you should have 2 files eg:
cyras<id>_id_rsa
cyras<id>_id_rsa.pub
To connect to Cyras run > connect_me.bat <id> where <id> is your userid you used to enroll.

Example output:
>connect_me.bat 100123
Use your userid: 100123 as VNC password
VNC display: 123
Port: 6023

    (By now, there should be another windows command pop-ed up.
    Example output: #########
    Received display: 123
    Killing Xtigervnc process ID 5552... which seems to be deadlocked. Using SIGKILL!

    New 'cyras01.dc.corp.telstra.com:123 (cyras100123)' desktop at :123 on machine cyras01.dc.corp.telstra.com

    Starting applications specified in /etc/X11/Xvnc-session
    Log file is /home/cyras100123/.vnc/cyras01.dc.corp.telstra.com:123.log

    Use xtigervncviewer -SecurityTypes VncAuth -passwd /home/cyras100123/.vnc/passwd :123 to connect to the VNC server.
    )

"starting vncview - check for vncviewer..."
IF you have enrolled correctly, 

When vncview pop-up, enter password (Use your userid )
```

```
### end of file ###
```
