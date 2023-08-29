:: Messagebox from system32/msg.exe

:: msg /W * %*
:: start /B/W "%date% ~ %time%" msg /W %username% %*

msg.exe /W %username% %*
