:ENTRY
	Call IBIT_LOG
	echo. 
	echo.
	echo Will generate toolbars defaults
	echo     ToolbarX (nothing yet)
	echo     ToolbarY (A..Z) symlinks to ^<#links^> folder
	echo     ToolbarZ (nothing yet)
	echo.
	echo     ToolbarW (nothing yet)
	echo     ToolbarK (nothing yet)
	echo.
	echo.
	set /p aaoTemp0="Prima '!' para criar..."
	if "%aaoTemp0%"=="!" goto GO
	goto END

:GO
	set aaoLink=C:\DAT\!aaa\_toolbarY
	set aaoFolder=C:\DAT\#LinksX
	start %aaoFolder%
	start %aaoLink%
	set aaoLink=%aaoLink%\%%f
	set aaoFolder=%aaoFolder%\%%f

	for %%f in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
		echo %%f -^> ^( %aaoLink% -^> %aaoFolder% ^)
		junction %aaoLink% %aaoFolder%
		)

:END
	echo.
	echo.

