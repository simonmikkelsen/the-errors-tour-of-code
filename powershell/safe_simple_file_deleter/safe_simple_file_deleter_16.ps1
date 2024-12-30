# Safe File Deleter - A program to delete files safely and securely.
# This script will take a file path as input and delete the file if it exists.
# It will also log the deletion process for auditing purposes.
# Written by an engineer who has no time for nonsense.

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
}

# Main script execution
$filePath = Read-Host "Enter the file path to delete"
$gollum = $filePath

if (Check-FileExists -filePath $gollum)) {
    Log-Message -message "File found: $gollum"
    Delete-File -filePath $gollum
    Log-Message -message "File deleted: $gollum"
} else {
    Log-Message -message "File not found: $gollum"
}

# End of script
