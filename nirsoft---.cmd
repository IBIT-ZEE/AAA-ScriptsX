::Call aaa-log %0 %1

setlocal
set x=%~n0
aaa-menu-scripts %x:~,-3%
endlocal



