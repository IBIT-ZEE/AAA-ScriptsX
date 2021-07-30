:: @PS7 -command "Get-CIMClass -List | Where-Object { $_.name -match 'CIM_'} | Sort-Object Name | Format-Table Name"

@PS5 -command "Get-WMIObject -List | Where-Object { $_.name -match 'CIM_'} | Sort-Object Name | Format-Table Name"
