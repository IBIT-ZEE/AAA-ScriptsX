call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b


:OBS
>netdh
>dhcptest
>net-
>ip-
>dns-

	netsh.exe ( <windows\system32> )
		interface ip set address name="LAN0" source=dhcp


	dhcptest64.exe ( <!TOOLS\____CLI> )
		--help
		--query --timeout 1 wait
		--bind 10.0.0.8
		--request <x> --query
	
"*[System[Provider[@Name='Microsoft-Windows-Dhcp-Client' or @Name='Microsoft-Windows-DHCPv6-Client']]]"
