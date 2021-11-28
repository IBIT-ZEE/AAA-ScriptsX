

:MAIN
	@echo off
	if "%~1"=="" ( AAA-Obs %0 )
	
	:: ...
	
	exit /b


:Obs

	Originally UNIX/TAR then GNU/TAR
	Added to Windows 10 19.xx


	State:
		Tar~Last ___ last tar command


	Samples:
	
		1. tar -zcxv x.tar.gz ~\x ~\xx ~\xxx
	
		2.
		tar --exclude='./x' --exclude='./x/xx' -zcvf /x.tgz .		
		*gotcha --exclude= must be at the beginning of the tar command

		3.



  -c Create  
  -r Add/Replace  
  -t List  
  -u Update  
  -x Extract
  +
  -b #  Use # 512-byte records per I/O block
  -f <filename>  Location of archive (default \\.\tape0)
  -v Verbose
  -w Interactive
  
Create: 
	tar.exe -c [options] [<file> | <dir> | @<archive> | -C <dir> ] <file>, <dir>
	* add items to archive
	-z, -j, -J, --lzma  :  Compress archive with gzip/bzip2/xz/lzma
	--format {ustar|pax|cpio|shar}  :  Select archive format
	--exclude <pattern>  :  Skip files that match pattern
	-C <dir>  :  Change to <dir> before processing remaining files
	@<archive>  :  Add entries from <archive> to output

List:
	tar.exe -t [options] [<patterns>]
	<patterns>  :  If specified, list only entries that match

Extract:
	tar.exe -x [options] [<patterns>]
	<patterns>  :  If specified, extract only entries that match
	-k  :  Keep (no overwrite existing files)
	-m  :  Do not restore modification times
	-O  :  Write entries to stdout, do not restore to disk
	-p  :  Restore permissions (including ACLs, owner, file flags)




