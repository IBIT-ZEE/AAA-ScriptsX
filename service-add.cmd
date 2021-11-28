AAA-Obs %0 


:obs 

	Add/register a service

	~ sc create <service-name> start= <start-type> binpath= <path-to-exe>

	~ sc create /?

	type=    <own*|share|interact|kernel|filesys|rec|userown|usershare>
	start=   <boot|system|auto|demand*|disabled|delayed-auto>
	error=   <normal*|severe|critical|ignore>
	binPath= <path to .exe>
	group=   <LoadOrderGroup>
	tag=     <yes|no>
	depend=  <Dependencies(separated by / (forward slash))>
	obj=     <AccountName|ObjectName> (default = LocalSystem)
	
	DisplayName= <display name>
	password=    <password>

	>service-delete


