AAA-Obs %0


:OBS
>wsl-helpx
>WSL@{vm}
	
	* Default location is
	~\AppData\Local\Packages\<distro-name>\LocalState\ext4.vhdx
	mklink ...\ext4.vhdx C:\SYS\Kali\ext4.vhdx
	
	* Configuration files
	/etc/wsl.conf
	~/.wslconfig
	
	* AAA
	WSL!! => XXX\WSL\*
	wsl-helpX => wsl.exe --help


*******************************************************************************
wsl.exe ... launches the default shell

-- .................. Pass the remaining command line as is
--exec/-e ........... <commands> * Execute command without default Linux shell.
--distribution/-d ... <Distro>	 * Run the specified distribution.
--install ........... <distro>   * Install additional distributions
--shutdown .......... Immediately terminates running distros and WSL2
--status ............ Show the status of Windows Subsystem for Linux.
--terminate/-t ...... <distro> * Terminates the specified distribution.
--unregister ........ <distro> * Unregisters and deletes the root filesystem
--update ............ update to latest wsl2 kernel
--update ............ --rollback * Revert to previous version of the WSL 2 kernel
--user/-u ........... <UserName> * Run as the specified user.

--list/-l .......... [Options] *Lists distributions
    --all .......... List all distributions
    --running ...... List only distros running.
    --quiet/-q ..... Only show distribution names.
    --verbose/-v ... detailed information
    --online/-o .... list of available distributions for wsl --install


--set-default/-s ... <distro> *Sets the distribution as the default.
--set-default-version ... <Version> * default install version for new distro
--set-version ........... <distro> <Version>  * Changes the version
--export ................ <distro> <FileName> * to tar file (- for standard output)
--import ................ <distro> <InstallLocation> <fileName> [options]
   - .................... for standard input
   --version <x> ........ version to use for the new distribution.
