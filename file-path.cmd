
@if "%~1"=="" AAA-Message "Resolve a relative path to a full path..."

@if not exist "%~1" ( AAA-Message "not found..." "" "%~1" )
@echo "%~f1"


