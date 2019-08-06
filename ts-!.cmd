CALL AAA-Log %0 %*
if "%1"=="" goto :CATCH1

:INITIALIZE
	if "%1"=="" goto :CATCH1
	set aavTemp=
	if "%2"=="1" set aavTemp=/w:800  /h:600 
	if "%2"=="2" set aavTemp=/w:1024 /h:768

	if "%2"=="A" set aavTemp=/w:1000 /h:1000 
	if "%2"=="B" set aavTemp=/w:1500 /h:1000 
	if "%2"=="C" set aavTemp=/w:1400 /h:900 
	set aavTemp=/v:%1 %aavTemp%

:MAIN
	start "TS %aavTemp%" mstsc.exe %aavTemp% c:\dat\aaa\aaa.rdp
	if ERRORLEVEL 1 goto :CATCH2
	goto END

	
:CATCH1
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	goto END


:CATCH2
	echo,
	echo,
	echo ERRORLEVEL : %errorlevel%
	echo FOLDER     : %cd%
	grep -Poz "^:TEXT2\K[\w\W]*?(?=:)" %~f0
	Timeout 60
	goto END


:END
	echo, 
	echo,
	
	exit /b


:OBS
TS-! <machine-name> <resolution>

	0. <default>
	
	1. 800x600
	2. 1024x768
	3. 1280x1024
	4. 1600x900
	5. 1980x1080
	6. 1980x1200
	7.
	8.
	9.

	A. Specific resolution #1 (1000x1000)
	B. Specific resolution #2 (1500x1000)
	C. Specific resolution #3 ( 750x1000)
: