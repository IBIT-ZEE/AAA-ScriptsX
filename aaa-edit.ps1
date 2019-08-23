


AAA-Log


Start-Process `
	-FilePath C:\APL\Microsoft\Code64\Code.exe `
	-ArgumentList @( 
		"C:\dat\PowerShell\AAA\AAA-0-Base.psm1", 
		"C:\dat\PowerShell\AAA\AAA-1-System.psm1", 
		"C:\dat\PowerShell\AAA\AAA-2-Extensions.psm1", 
		"C:\dat\PowerShell\AAA\AAA-3-Other.psm1",
		"c:\DAT\#ScriptsX\-test.ps1"
		)
