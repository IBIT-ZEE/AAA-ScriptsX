call AAA-Log %0 %*

if "%timeout%"=="%^timeout%" set Timeout=5
For /L %f in (1 1 %1) do (%2 %3 %4 %5 %6 %7 %8 %9 & Timeout %timeout%)
