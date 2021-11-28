

:MAIN
	@Call AAA-OBS %0

	echo IIS State
	echo =========
	sc.exe queryex w3svc

:end
	echo,
	echo,
	exit /b


:obs
	use:
	
	http-
	
	Deno/Node/PHP/Python/...
	IIS/Apache/NginX/...



