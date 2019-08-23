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
