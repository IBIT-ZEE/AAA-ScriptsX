::


:MAIN
	Call aaa-log %0 %*
	Call aaa-main %~f0

	echo,
	echo,
	
	exit /b

	
:OBS

d_		drive operator
f_		file operator
_?

%CmdCmdLine% 
will return the entire command line as passed to CMD.EXE 

%* _____ all parameters
%~dn ___ drive letter of %n if %n is a valid path or file name (no UNC) 
%~pn ___ directory of %n if %n is a valid path or file name (no UNC) 
%~nn ___ file name only of %n if %n is a valid file name 
%~xn ___ return the file extension only of %n if %n is a valid file name 
%~fn ___ return the fully qualified path of %n if %n is a valid file name or directory 


: