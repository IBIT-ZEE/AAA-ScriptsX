call AAA-Log %0 %*  


:MAIN
	if "%1"=="" ( AAA-Obs %0 ) 
	exit /b


:OBS


// PIP
	CD .\scripts
	pip.exe

Cases:
python.exe -m pip install --upgrade pip
pip install ipython [--upgrade]
pip install youtube-dl [--upgrade]

pip install pydal [--upgrade]
pip install py4web [--upgrade]

