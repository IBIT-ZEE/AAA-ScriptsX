call AAA-Log %0 %*  

:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b

:OBS
>user-


//
net accounts /maxpwage:unlimited

//
gpedit.msc
	Computer configuration–>Windows Settings–>
	Security Settings–>Account Policies–>Password Policy
	Maximum password age = 0/n

//
wmic useraccount where “Name=’username'” set PasswordExpires=false

//
Set-LocalUser -Name “username” -PasswordNeverExpires 1
