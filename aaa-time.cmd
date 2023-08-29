:: Set aaa-date/YYYYMMDD and aaa-time/hhmmssmm variables
@echo off

:: remove - from date
:: remove / from date
set aaa-date=%date:-=%
set aaa-date=%aaa-date:/=%

:: remove : from time
:: remove . , from time
set aaa-time=%time::=%
set aaa-time=%aaa-time:.=%
set aaa-time=%aaa-time:,=%

echo aaa-date is %aaa-date%
echo aaa-time is %aaa-time%
