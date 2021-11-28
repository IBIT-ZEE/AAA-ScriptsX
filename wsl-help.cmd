AAA-Obs %0


:Obs

	> WSL@{vm}
	
	* Default location is
	~\AppData\Local\Packages\<distro-name+???\LocalState\ext4.vhdx
	
	config files
	/etc/wsl.conf
	~/.wslconfig
	
	* AAA
	WSL!! => XXX\WSL\*
	wsl-helpX => wsl.exe --help


*******************************************************************************
If no command line is provided, wsl.exe launches the default shell.
--exec, -e <CommandLine>	Execute command without default Linux shell.
--							Pass the remaining command line as is.
--distribution / -d <Distro>	Run the specified distribution.
--user, -u <UserName>			Run as the specified user.
--install [Options]			Install additional distributions.
	For a list of valid distributions, use 'wsl --list --online'.
        Options:
            --distribution, -d [Argument] Download+installs distro by name
                Arguments: A valid distro name (not case sensitive).
        Examples:
            wsl --install -d Ubuntu
            wsl --install --distribution Debian

--set-default-version <Version>		default install version for new distro

--shutdown			Immediately terminates running distros and WSL2
--status			Show the status of Windows Subsystem for Linux.
--update [Options]	If no options the WSL 2 kernel will be updated to latest
	Options:
		--rollback	Revert to the previous version of the WSL 2 kernel.

Arguments for managing distributions in Windows Subsystem for Linux:
--export <Distro> <FileName>	
	Exports the distribution to a tar file.
	The filename can be - for standard output.

--import <Distro> <InstallLocation> <FileName> [Options]
	Imports the specified tar file as a new distribution.
	The filename can be - for standard input.
	Options:
		--version <Version>		version to use for the new distribution.

--list, -l [Options]		Lists distributions
	Options:
	--all		List all distributions
	--running	List only distros running.
	--quiet -q		Only show distribution names.
	--verbose -v	detailed information
	--online -o		list of available distributions for wsl --install

--set-default, -s <Distro>			Sets the distribution as the default.
--set-version <Distro> <Version>	Changes the version
--terminate, -t <Distro>			Terminates the specified distribution.
--unregister <Distro>		Unregisters and deletes the root filesystem

