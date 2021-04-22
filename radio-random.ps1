###############################################################################
#
# Radio-Random
#
#

AAA-Log

# Files
$xDB =  $AAA.Folders.Data + "\radios-random.dat";
$xWMP = "${Env:ProgramFiles(x86)}\Windows Media Player\wmplayer.exe";

# Load table
$xRadios = Array-Load $xDB;

# Pick a item/id+url
$x = Get-Random -Minimum 0 -Maximum $xRadios.Count;
$xID  = $xRadios[ $x ].ID;
$xURL = $xRadios[ $x ].URL;

""
AAA-Alert '', $xID, $xURL, ''
""

# GO
Start-Process -FilePath $xWMP -ArgumentList $xURL





