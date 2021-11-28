Call AAA-Log %0 %*


:MAIN
	if "%~1"=="" ( AAA-Obs %0 )

	
	reg.exe QUERY %
	
	exit /b


:Obs

	Syntax:
	
		Registry-Query <string>


	Assist layer over REG QUERY
	
	Find argument in hives (>Registry-Hives)
		/s	Queries all subkeys and values recursively
		/v	Queries specific registry key values
		* Return Code 0/1==Successful/Failed


	REG QUERY
		... HKLM\Software\Microsoft\ResKit /v Version
		Displays the value of the registry value Version

		... HKLM\Software\Microsoft\ResKit\Nt\Setup /se #
		Displays all the subkeys and values with "#" as the seperator
		for all valuenames whose type is REG_MULTI_SZ.

		... HKLM /f SYSTEM /t REG_SZ /c /e
		Displays Key, Value and Data with case sensitive and exact
		occurrences of "SYSTEM" under HKLM root for the data type REG_SZ

		... HKCU /f 0F /d /t REG_BINARY
		Displays Key, Value and Data for the occurrences of "0F" in data
		under HKCU root for the data type REG_BINARY

		... HKLM\SOFTWARE /ve
		Displays Value and Data for the empty value (Default)
		under HKLM\SOFTWARE

		... \\ABC\HKLM\Software\Microsoft\ResKit\Nt\Setup /s
		Displays all subkeys and values under the registry key Setup
		on remote machine ABC
		* registry remote service must be up
