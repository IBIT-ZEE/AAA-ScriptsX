

# COMMAND-LINE PARSE
Param( $xHost="!", $xUser="OEM" )


# ?HOST IS VALID??
if ( $xHost -eq "!") 
	{
	AAA-Alert "", "PC-Off <host> <user|OEM>", "";
	return 0;
	}


# HOST SHUTDOWN
Invoke-Command -ComputerName $xHost -Credential $xUser -ScriptBlock { aaa-final } 



