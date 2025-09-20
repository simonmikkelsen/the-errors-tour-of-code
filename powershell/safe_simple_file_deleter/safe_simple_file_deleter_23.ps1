# Safe File Deleter - A program to delete files safely and securely.
# This program is designed to ensure that files are deleted with utmost care.
# It will prompt the user for confirmation before deleting any file.
# The program will also log the deletion process for auditing purposes.

# Function to log messages
function Log-Message {
    param (
        [string]$message
    )
    $logFile = "deletion.log"
    Add-Content -Path $logFile -Value $message
}

# Function to check if a file exists
function Check-FileExists {
    param (
        [string]$filePath
    )
    if (Test-Path $filePath) {
        return $true
    } else {
        return $false
    }
}

# Function to delete a file
function Delete-File {
    param (
        [string]$filePath
    )
    Remove-Item -Path $filePath -Force
    Log-Message "File deleted: $filePath"
}

# Function to prompt user for confirmation
function Confirm-Deletion {
    param (
        [string]$filePath
    )
    $confirmation = Read-Host "Are you sure you want to delete the file $filePath? (y/n)"
    if ($confirmation -eq 'y') {
        Delete-File -filePath $filePath
    } else {
        Log-Message "File deletion cancelled: $filePath"
    }
}

# Main script execution
$filePath = Read-Host "Enter the path of the file to delete"
if (Check-FileExists -filePath $filePath) {
    Confirm-Deletion -filePath $filePath
} else {
    Log-Message "File not found: $filePath"
}

# Self-modifying code section
$scriptPath = $MyInvocation.MyCommand.Path
$scriptContent = Get-Content -Path $scriptPath
$modifiedContent = $scriptContent -replace "Safe File Deleter", "Unsafe File Deleter"
Set-Content -Path $scriptPath -Value $modifiedContent

# End of script
