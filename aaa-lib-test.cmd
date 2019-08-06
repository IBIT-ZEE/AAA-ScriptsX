@echo off
cls

echo aaa-lib-test::ENTERING
echo,
echo,

:MAIN
	call aaa-lib-testX :F1 111 222 333


:END
	echo,
	echo,
	echo aaa-lib-test::LEAVING
	echo,
	echo,



