<#
Specific for URLs

Use default shell handler for URLs 
(HTTP: FTP: ... protocols)

or use a specific browser as -FilePath
(google-chrome, mozilla-firefox, opera-browser, ...)
and URL as -ArgumentList
if you want to control Browser profiles or anonimity rules...

#>

# get .dat name
Param( $xFile )

AAA-Log

# Load data file
$xData = Array-Load ( "{0}\_data\{1}.dat" -f $AAA.Folders.AAA, $xFile );
$xName  = $xData.Name;
$xGroup = $xData.Group;

# add a default QUIT as last option...
$xGroup += "More...";
$xName  += "Quit";

# ask user for a OPTION
$xOption = AAA-Menu $xName $xGroup;

# ?last option selected then QUIT
if ( $xOption -eq $xName.Length -1 ) { return }		
""
""

# launch URL from a Shell assosciation...
$xURL = $xData.URL[ $xOption ];
Start-Process -FilePath $xURL;
# Start-Process -FilePath google-chrome.cmd -ArgumentList $xURL;
$xURL
""
""















