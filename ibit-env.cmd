@Echo Off
Echo Logical drives definition
Echo ---------------------------------------
Echo A: to H: Fisical drives
Echo ...
Echo T: - for Temporary data
Echo U: - Utils drive
Echo V: - Virtual drive for users programs (defined for user apps)
Echo W: - Wold
Echo X: - Random acess drive for all users
Echo Y: - sYstem drive
Echo Z: - Main drive (absolute reference for all system)
Echo .
Echo .
Echo Users can acess X: for all, users are placed in X: before logging
Echo Users can only acess V: by permission to execute program (V: as the dir.)
Echo .
Echo .

set DrvPri=%1
set DrvAux=%2
set ComSpec=%DrvPri%\Sys\Command.Com
set Path=%DrvPri%\Sys;%DrvPri%\Sys\Ext;%DrvPri%\Sys\Mac;%DrvPri%\Utl
set ID=IBIT___FAFE
set CodePage=850
set Prompt=[IBIT - $p]ÿ
set Tmp=%DrvPri%\Tmp

