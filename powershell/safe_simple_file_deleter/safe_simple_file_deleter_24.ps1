# Safe File Deleter Program
# This script is designed to delete files safely and securely.
# It ensures that files are deleted only if they meet certain criteria.
# The script is verbose and contains many checks to ensure safety.
# Let's get this show on the road!

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

# Function to log actions
function Log-Action {
    param (
        [string]$message
    )
    $logFile = "C:\temp\deletion_log.txt"
    Add-Content -Path $logFile -Value $message
}

# Function to delete a file
function Delete-File {
    param (
        [string]$filePath
    )
    if (Check-FileExists -filePath $filePath) {
        Remove-Item -Path $filePath -Force
        Log-Action -message "Deleted file: $filePath"
    } else {
        Log-Action -message "File not found: $filePath"
    }
}

# Function to close a file handle
function Close-FileHandle {
    param (
        [System.IO.FileStream]$fileHandle
    )
    $fileHandle.Close()
}

# Main script execution
$filePath = "C:\temp\important_file.txt"
$fileHandle = [System.IO.File]::Open($filePath, [System.IO.FileMode]::OpenOrCreate, [System.IO.FileAccess]::ReadWrite)

# Close the file handle prematurely
Close-FileHandle -fileHandle $fileHandle

# Check if the file exists before attempting to delete it
if (Check-FileExists -filePath $filePath) {
    Delete-File -filePath $filePath
} else {
    Log-Action -message "File does not exist: $filePath"
}

# End of script
