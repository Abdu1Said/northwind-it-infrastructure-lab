param(
    [Parameter(Mandatory=$true)]
    [string]$CsvPath
)

$BaseDN = "DC=northwind,DC=local"
$DefaultPassword = ConvertTo-SecureString "TempPass!2026" -AsPlainText -Force

$DepartmentGroupMap = @{
    "Sales"       = "Sales-Staff"
    "Engineering" = "Engineering-Staff"
    "Management" = "Management-Staff"
    "IT"          = "IT-Staff"
}

$Users = Import-Csv $CsvPath

foreach ($User in $Users) {
    $FirstName = $User.FirstName
    $LastName = $User.LastName
    $Department = $User.Department
    $Username = ($FirstName.Substring(0,1) + $LastName).ToLower()
    $OUPath = "OU=Users,OU=$Department,OU=Northwind,$BaseDN"
    $GroupName = $DepartmentGroupMap[$Department]

    if (-not $GroupName) {
        Write-Warning "Skipping $FirstName $LastName. Unknown department: $Department"
        continue
    }

    if (Get-ADUser -Filter "SamAccountName -eq '$Username'" -ErrorAction SilentlyContinue) {
        Write-Warning "User $Username already exists. Skipping."
        continue
    }

    New-ADUser `
        -Name "$FirstName $LastName" `
        -GivenName $FirstName `
        -Surname $LastName `
        -SamAccountName $Username `
        -UserPrincipalName "$Username@northwind.local" `
        -Path $OUPath `
        -AccountPassword $DefaultPassword `
        -Enabled $true `
        -ChangePasswordAtLogon $true `
        -Department $Department

    Add-ADGroupMember -Identity $GroupName -Members $Username

    Write-Host "Created user $Username in $Department and added to $GroupName"
}