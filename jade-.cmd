Call IBIT_Log %0 %*

:INIT
	set classpath=%cd%\lib\jade.jar 

	
:MAIN
	grep -Poz "^:MSG0\K[\w\W]*?(?=:)" %~f0
	goto END


:END
	exit /b


:MSG0

Jade-*

	*-build <code-files>	// 1)
	*-run <program>			// 2)

	*** JAVA ***
	1) javac -cp jade.jar;. jade.Boot <file.java ...>
	2) java  -cp jade.jar;. jade.Boot [options] [-agents *] [-gui]


:


