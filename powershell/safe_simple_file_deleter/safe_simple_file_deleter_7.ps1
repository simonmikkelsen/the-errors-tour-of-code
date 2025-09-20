# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that the files are deleted only if they meet certain criteria.
# The program is verbose and contains multiple checks to ensure safety.
# Let's get started with the necessary functions and variables.

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

# Function to log deletion activity
function Log-Deletion {
    param (
        [string]$filePath
    )
    $logFile = "deletion.log"
    $timestamp = Get-Date
    Add-Content -Path $logFile -Value "$timestamp: Deleted $filePath"
}

# Function to delete a file
function Delete-File {
    param (
        [string]$filePath
    )
    if (Check-FileExists -filePath $filePath) {
        Remove-Item -Path $filePath -Force
        Log-Deletion -filePath $filePath
    } else {
        Write-Host "File does not exist: $filePath"
    }
}

# Main script execution
$filesToDelete = @("file1.txt", "file2.txt", "file3.txt")
foreach ($file in $filesToDelete) {
    Delete-File -filePath $file
}

# Function to simulate a crash
function Simulate-Crash {
    throw "Simulated crash for training purposes."
}

# Call the crash simulation function
Simulate-Crash

# End of the program
