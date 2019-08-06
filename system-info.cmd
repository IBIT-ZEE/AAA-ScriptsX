:ENTRY
	setlocal
	CALL IBIT_LOG %0 %*
	::if "%~1"=="" goto CATCH1

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64


:BEGIN


:MAIN
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:)" %~f0
	
	echo 	%processor_architecture% : %processor_identifier%
	echo,
	echo 	User is %username% (%userprofile%)  
	echo 	Host is %computername% at domain %userdomain%
	echo,
	echo 	%public%
	echo 	%ProgramFiles%
	echo 	%ProgramFiles(x86)%
	::echo 	%ProgramFilesW6432%
	echo 	%CommonProgramFiles%  
	echo 	%CommonProgramFiles(x86)%
	::echo 	%CommonProgramFilesW6432%
	echo 	%allusersprofile%
	echo 	%appdata%
	echo 	%ProgramData%
	echo,
	echo  	%systemdrive%  ~  %systemroot% ~ %windir%
	echo  	%homedrive%  ~  %homepath%
	echo 	%comspec%
	echo 	%tmp%
	echo 	%temp%

	echo,
	echo,
	echo 	Files:
	echo 	======
	for %%f in ( %~dpn0*.* ) do echo 	%%~nf

	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: help syntax/*comments/etc.
	grep -Poz "^:ERROR1\K[\w\W]*?(?=^:)" %~f0
	Timeout 60

	set aavErrorlevel=1
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:TEXT0

	System-Info

		System information...

:TEXT1

	+text
:

:ERR0

	An error has occured

: