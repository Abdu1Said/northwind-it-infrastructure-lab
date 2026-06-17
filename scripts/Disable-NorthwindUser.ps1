param(
    [Parameter(Mandatory=$true)]
    [string]$SamAccountName
)

$User = Get-ADUser -Identity $SamAccountName

Disable-ADAccount -Identity $User.SamAccountName

Move-ADObject -Identity $User.DistinguishedName -TargetPath "OU=Disabled Users,OU=Northwind,DC=northwind,DC=local"

Write-Host "$SamAccountName disabled and moved to Disabled Users."