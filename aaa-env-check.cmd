@if NOT defined aaa-env ( 
	AAA-Message ^
		"AAA-Environment variables not set..." 

	exit /b 255
	)
