call IBIT-Log %0 %*
netsh wlan show profile
CLIPPER netsh wlan show profile ${SSID} key=clear

