
@if not exist "%~1" ( AAA-Message "not found..." "" "%~1" )

@echo ~CLIPPED~ %~f1 
@echo %~f1 | clip


