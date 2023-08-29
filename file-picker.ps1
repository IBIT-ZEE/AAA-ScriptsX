###############################################################
#
#  B O R D A L I M A
#
#
#

# set-psbreakpoint -Runspace (get-runspace)[0] -command *;

<#

dir /s/b \\server1\Design-(all)\123*.jpg
. C:\DAT\#scriptsXX\bordalima-bordados.ps1


#>

### PARAMETERS
# 1 filename filter
Param( [string] $x )

## GLOBALS
#
Set-PSBreakpoint -Variable xDebug | out-null
$xSep1 = "";
$xSep2 = "";
$xSep3 = "";


## Y-INITIALIZE
function yInitialize(){
	#$Host.UI.RawUI.WindowTitle = "<>"
	$Host.UI.RawUI.BackgroundColor   = 7;
	$Host.UI.RawUI.ForegroundColor   = 1;
	[console]::WindowWidth=64; 
	[console]::WindowHeight=16;
	[console]::BufferWidth = [console]::WindowWidth;
	[console]::BufferHeight = [console]::WindowHeight;
	# $Host.UI.RawUI.WindowSize.Width  = 64;
	# $Host.UI.RawUI.WindowSize.Height = 16;
	Clear-Host;

	$xSep1 = string-replicate "-"
	$xSep2 = string-replicate "|"
	$xSep3 = string-replicate "_"

	Write-Host $xSep1;
	Write-Host $xSep2;
	Write-Host "`n`n"
	Write-Host "BORDALIMA/2023"
	Write-Host "`n"
	Write-Host "[ Procura de imagens de bordados ]"
	Write-Host "`n"
	}


## Y-FINALIZE
function yFinalize(){

	# END...
	Write-Host "`n";
	Write-Host $xSep2;
	Write-Host $xSep1;

	}



## Y-MAIN
function yMain() {
	$xPick = $null

	# LOAD HISTORY
	# *prevent bordalima-bordados.hst absent
	# *prevent bordalima-bordados.hst JSON invalid
	Try   { $xHistory = Get-Content -Path "bordalima-bordados.hst" | ConvertFrom-Json } 
	catch { $xHistory = $null }


	## ARGUMENT IS NULL? HISTORY -or- ASK
	if ( -not $x ) { 

		# HISTORY/PICK
		if ( $xHistory ) {
			$xPick = $xHistory | Out-Gridview -passthru;

			if ( $xPick ){  
				yPictures -xPics $xPick;
				return;
				}
			}

		# INPUT
		if ( -not $xPick ) { 
			$x = `
				[Microsoft.VisualBasic.Interaction]::InputBox(
					"Nome da imagem?`n(pode ser parcial)", 
					"Procura..."
					)
			}

		# INPUT WAS NULL?
		if ( -not $x ) {
			"...no arguments,"
			"...no history picks,"
			"...no manual inputs"
			return; 
			}

		}



	## ARGUMENT OK
	# wildcardize and filetype
	$x = '*' + $x + '*.jpg'


	### VARS
	$xPath = 'FileSystem::\\server1\Design-(all)\Desenhos\' + $x
	# $xPath = '\\server1\Design-(all)\' + $x
	# $xPath = '\\server1\Design\(all)\' + $x
	# $xPath = '\\server1\bordalima$\Design\(all)\' + $x
	$xFiles = $null;


	# BEGIN...
	Write-Host $xSep3;
	Write-Host "/filter $x @ $xPath"
	Write-Host "`n";


	### PATH CHECK
	# Test-NetConnection -ComputerName $xPath
	# * REDUNDANT*** test-path is enough
	# NETWORK check and file access
	try { Test-Path -Path $xPath | out-null } catch { return "ERR*** acess $xPath..." }



	### GRAB FILES
	# try { Get-ChildItem -Path "\\server1\bordalima$\Design\(all)\" } catch { "err!!!" }
	# $xFiles = Get-ChildItem -Path $xPath -Recurse;
	$xArgs= @{ path=$xPath; }
	$xOps = 0;
	$xJob = Start-Job -ScriptBlock { param( $x); Get-ChildItem -path $x.path -recurse } -ArgumentList $xArgs; 

	while( $xJob.State -ne "Completed" ) { 
		Write-Progress 					`
			-Activity "Searching..." 	`
			-Status ( $xOps++ ) 			`
			-PercentComplete ( (Get-Date).Millisecond % 99 ); 
		}


	$xFiles = Receive-job -Job $xJob;

	# ?NOTHING FOUND??
	if ( $xFiles -eq $null ){
		Write-Host "Não foram encontrados ficheiros..."
		return;
		}


	##2DO*** refactor the output
	#
	Write-Host "Refactoring..."
	# Date C/A/W ~> 2017.07.19 03:55:53 A:1745/W:-211
	$xFilesX = `
			$xFiles | `
			ForEach-Object { 
				[pscustomobject]@{ 
					Name = $_.Name; 
					Folder = $_.Directory; 
					Time = ` 
						$_.CreationTime.ToString( "yyy.MM.dd hh:mm:ss" ) + " A:" + 
							($_.LastAccessTime - $_.CreationTime).Days + "/W:" + 
							($_.LastWriteTime  - $_.CreationTime).Days
					}
				}   

	# $xFilesX = $xFiles | ForEach-Object { [pscustomobject]@{ name = $_.Name; dir = $_.Directory; time = ( $_.CreationTime - $_.LastAccessTime ).days }   }

	$xPick = $xFilesX | Out-Gridview -passthru


	## ?NOT ESCAPE
	if ( -not $xPick ){
		"...canceled at last pick!"
		return
		}


	##?2DO***
	# save to history
	# ATT*** multiple selects

	# $xDebug=1;
	## prevent null on first history save
	## 2REFACTOR*** when toJSON have -ignore-null remove this
	$xHistory0 = if( $xHistory ){ ,$xPick + $xHistory } else { ,$xPick }
	( $xHistory0 ) | ConvertTo-Json | Set-Content -Path "bordalima-bordados.hst"

	yPictures -xPics $xPick

	return;
	}


function yPictures( $xPics ){
	##?2DO***" work-on-results
	# ATT*** multiple selects
	#
	Start-Process -filePath ( $xPick.Folder + "\" + $xPick.name );
	}



## ENTRYPOINT
yInitialize;
yMain;
yFinalize;
return;

