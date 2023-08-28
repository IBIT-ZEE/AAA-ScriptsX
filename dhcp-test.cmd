@(
	echo ^>dhcp-test
	echo ^>dhcp-console
	echo,
	echo,
	c:\APL\!TOOLS\____CLI\dhcptest64.exe --query --timeout 1 wait %*
	)
