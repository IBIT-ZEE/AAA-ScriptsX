

:MAIN
	@echo off
	setlocal
	AAA-Obs %0

	:: failsafe
	exit /b


:OBS

                //\\	    schedule-*
               //  \\
              //    \\	     scheduled tasks for
             // IBIT \\	     . hourly ____ 0..23
            //   /\   \\     . daily _____ 0..30/1 28/9
           //   /__\   \\    . weekly ____ n % 52
          //   /\[]/\   \\   . monthly ___ 1..12
         //   /__\/__\   \\  . other...
        //    ARTEWARE    \\
        \\________________//

	Modules of Tasks to execute at predefined time
	Modules (scripts) Called from OS Task-Scheduler...

		-boot ...... after boot  (usermode, all users)
		-login ..... after login (usermode)

		-hourly ... every hour
		-daily .... every day at mid-da
		-weekly ... once a week 
		-monthly .. once a month

		?Trimestral
		?Semestral
		?Yearly


