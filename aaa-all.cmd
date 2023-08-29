:ENTRY
	CALL AAA-Log %0 %1

	
:INITIALIZE

	
:BEGIN


:MAIN
	Call aaa-main "%~f0"	
	:: grep -Pzo "^:Syntax\K[\w\W]*" %~f0

	echo 	Files:
	echo,
	::for %%f in ( %~dpn0*.* ) do echo 		%%~nf
	for %%f in ( %~dp0*-.cmd ) do echo 		%%~nf

	:: sed -n "/^\.Syntax\./,/^\.\./p" %~pnx0
	goto END


:ERR_SYNTAX
	echo aErrMsg ^<p1^> ^<...^> ^& (...)
	goto END

	
:END
	echo,
	echo,


:FINALIZE

	
:EXIT
	Exit /b




:OBS
	This are all AAA *- scripts/macros present in the system
	the main goal of 'ALL-' is to provide a discoverability root

	the pattern is the simple as elegant hierarchy strategy paradigm 
	of FOLLOW-SYNAPSE/TEST-ELEMENT to find funcionality...
	leveraging the most natural TEST-FORK pattern

	starting from this root you quickly have a perception
	of what is available in the system and navogation becomes feasible
	You can start walking in sub-elements just by invoking them

		PC- ________ ...
		FILE- ______ File related
		IP- ________ View/Auto/...
		NET- _______ On/Off/Shares/Connections/In-Accesses/...
		SCRIPTS ____ Folder/FoderX/Edit/...
		SYSTEM- ____ Logoff/Off/Reboot/UpTime/...
		VIDEO- _____ Stream/Rotate/...
		WINDOWS- ___ WAT-ON/WAT-OFF/...
		XXX- _______ 2do

		
		IP-XXX  //  Specific configurarions for locations

:

