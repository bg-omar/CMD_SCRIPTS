$netstat = netstat -aon | Select-String -Pattern “(TCP|UDP)”
$ProcessList = Get-Process
foreach ($line in $netstat)
{
$SpltArry = $line -split ” “
$PD = $spltArry[$spltarry.length – 1]
$pn = $ProcessList | Where-Object {$_.id -eq $pd } | select processname
$SpltArry[$SpltArry.length – 1] = $PD + ” “ + $PN.processname
$SpltArry -join ” “
}

# Set-ExecutionPolicy Restricted <-- Will not allow any powershell scripts to run.  Only individual commands may be run.

# Set-ExecutionPolicy AllSigned <-- Will allow signed powershell scripts to run.

# Set-ExecutionPolicy RemoteSigned <-- Allows unsigned local script and signed remote powershell scripts to run.

# Set-ExecutionPolicy Unrestricted <-- Will allow unsigned powershell scripts to run.  Warns before running downloaded scripts.

# Set-ExecutionPolicy Bypass <-- Nothing is blocked and there are no warnings or prompts.

# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process



# We can bypass execution policy in a nice way (inside command prompt):

# type file.ps1 | powershell -command -
# Or inside powershell:

# gc netstat.process.ps1|powershell -c -