# Powershell
This repository is for useful Powershell scripts that Netwoven has used and want to share. Please look at the best practices below to make sure your script meets our standards before submitting. These are baseline suggestions, and more best practices can be found [here](https://devtut.github.io/powershell/variables-in-powershell.html).

# Naming Conventions

```powershell
Get-AzureUserReport
Read-M365TenantConfig
```

- Use **Verb-Noun** pattern while naming a function.
- Verb implies an action e.g. `Get`, `Set`, `New`, `Read`, `Write` and many more. See [approved verbs](https://msdn.microsoft.com/en-us/library/ms714428(v=vs.85).aspx).
- Noun should be singular even if it acts on multiple items. `Get-User` may return one or multiple users.
- Use Pascal case for both Verb and Noun. E.g. `Get-UserLogin()`

# Comments

```powershell
<#
.SYNOPSIS
    Reads a CSV file and filters it.
.DESCRIPTION
    The ReadUsersCsv.ps1 script reads a CSV file and filters it on the 'UserName' column.
.OWNER 
    Name and email of who submitted it.
.INPUTS
    None. You cannot pipe objects to ReadUsersCsv.ps1.
.OUTPUTS
    None. ReadUsersCsv.ps1 does not generate any output.
.EXAMPLE
    C:\PS> .\ReadUsersCsv.ps1 -Path C:\Temp\Users.csv -UserName j.doe
#>
Param
(
    [Parameter(Mandatory=$true,ValueFromPipeline=$false)]
    [System.String]
    $Path,
    [Parameter(Mandatory=$true,ValueFromPipeline=$false)]
    [System.String]
    $UserName
)
Import-Csv -Path $Path | Where-Object -FilterScript {$_.UserName -eq $UserName}
```

The above script documentation can be displayed by running `Get-Help -Name ReadUsersCsv.ps1 -Full`


# Error Handling 

A terminating error can be handled with a typical try catch, as below

```powershell
Try
{
    Write-Host "Attempting Divide By Zero"
    1/0
}
Catch
{
    Write-Host "A Terminating Error: Divide by Zero Caught!" 
}
