@Start /b "Chrome" C:\APL\Google\Chrome64\Application\chrome.exe --user-data-dir=C:\XXX\Chrome\(all) %*

:: ALT***
:: ATT*** double % for command name
:: or parser will interpret "%" as <nothing>
:: Start /b %%.cmd chrome.lnk %*
