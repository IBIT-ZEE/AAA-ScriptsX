if "%~1"=="" aaa-MainX %~0

call AAA-Log %~0 %*
tasklist | grep -i "%*"
Exit /b

:OBS
	task-list <name>

	* list tasks with supplied string in name
	* ATT uses GREP to filter
: