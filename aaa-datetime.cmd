call AAA-Log %0

:: aaaa-mm-dd
:: hh-mm-ss

if %date:~2,1%==/ (
	AAA-Message ^
		"Date wrong format..." ^
		"must be YYYY.MM.DD" ^
		"Correct in Control-Panel..."
		)

:: SOLUTION#1 *****BEST*****
:: Set aaa-date/YYYYMMDD and aaa-time/hhmmssmm variables
:: remove - from date
:: remove : from time
set aaa-date=%date:-=%
set aaa-time=%time::=%

:: remove / from date
:: remove . , from time
set aaa-date=%aaa-date:/=%
set aaa-time=%aaa-time:.=%
set aaa-time=%aaa-time:,=%

		
:: SOLUTION#2 *ALTERNATIVE*
set aaa-datetime=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%

echo aaa-date set to %aaa-date%
echo aaa-time set to %aaa-time%

echo aaa-datetime set to %aaa-datetime%

echo.
echo.



