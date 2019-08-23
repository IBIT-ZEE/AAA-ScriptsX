<#
Import-Module -Name C:\dat\PowerShell\AAA\AAA-0-Base.psm1 -Force
Import-Module -Name C:\dat\PowerShell\AAA\AAA-1-System.psm1 -Force
#>


########################################
#  |T|E|S|T|I|N|G|
#
$a    = 1, 22, 333, 4444, 55555, 666666, 7777777;
$b    = 1, 1, 1, 2, 3, 3, 3;
$xDic = @{ 'one' = 1; 'two' = 22; 'three' = 333; 'four' = 4444; 'five' = 55555;  };
$xObj = [PSCustomObject]@{ 'one' = 1; 'two' = 22; 'three' = 333; 'four' = 4444; 'five' = 55555;  };
$xString = "1234567890*" * 2;

AAA-Log

"(Get-PSCallStack)[0].ScriptName   -> $((Get-PSCallStack)[0].ScriptName)"
"myInvocation.MyCommand.Definition -> $($myInvocation.MyCommand.Definition)"
"PSScriptRoot                      -> $PSScriptRoot"
""
"args -> $args";
""
$profile
$xString
""
""

# AAA-Menu 111, 222, 333, 444, "XXX", 555, 666, "YYY", 777;
"-----"
$x = AAA-Menu $a $b;
"-----"

AAA-Alert "<<<<< $x >>>>>"

# $x = IP-Scan

"Valid IP(s)"



# Events-Clear
"`n`n"
# Events-ClearWin



<#
Software-
Software-XXX

$xTable = Array-Load ( "{0}\_data\wol-go.dat" -f $AAA.AAA )
$xIndex = AAA-Menu( $xTable.Id )

AAA-Message;
AAA-MessageOk "111`n222`n333";
AAA-MessageOC "111`n222`n333";
AAA-MessageYN "111`n222`n333";

#>



