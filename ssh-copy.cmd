

:MAIN
	Call AAA-Obs %0
	@C:\Windows\System32\OpenSSH\scp.exe %*
	exit /b


:OBS
>ssh-

	* wildcards support use quotes if error
	scp -vC "x:\xx\xxx.xxxx" userx@hostx:"c:\xxx"
	scp -Cv "k:\XXX\{vm}\WindowsX64-CI.vhdx"  oem@zee-go:"x:\sys"
