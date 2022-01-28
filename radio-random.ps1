###############################################################################
#
# Radio-Random
#
#

AAA-Log

# Files
$xFile =  $AAA.Folders.Data + "\radios-random.dat";
$xWMP = "${Env:ProgramFiles(x86)}\Windows Media Player\wmplayer.exe";

# Load table
$xList = List-Load $xFile;

# Pick a item/id+url
$x = Get-Random -Minimum 0 -Maximum $xList.Count;
$xID  = $xList[ $x ].ID;
$xURL = $xList[ $x ].URL;

""
AAA-Alert '', $xID, $xURL, ''
""

# GO
Start-Process -FilePath $xWMP -ArgumentList $xURL





