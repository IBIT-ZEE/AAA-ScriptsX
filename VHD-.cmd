:ENTRY
	CALL IBIT_LOG

	
:INITIALIZE

	
:BEGIN


:MAIN
	echo VHD-         // this help
	echo VHD-MOUNT    // mount and open VHD
	echo VHD-UNMOUNT  // unmount VHD
	echo VHD-CREATE
	echo.
	echo Scripts...
	dir /b %~p0%~n0*.*
	goto END

:ERR_SYNTAX
	echo aErrMsg ^<p1^> ^<...^> ^& (...)
	goto END
	
:END
	echo. 
	echo.

:FINALIZE

	
:EXIT



