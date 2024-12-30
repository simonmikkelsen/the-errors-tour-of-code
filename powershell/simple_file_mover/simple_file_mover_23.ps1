# This script is a simple file mover. It moves files from one directory to another.
# It is designed to be overly verbose and complex to demonstrate various PowerShell features.
# The script will take source and destination directories as input and move all files from source to destination.
# It will also log the operations performed.

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$dirPath
    )
    if (-Not (Test-Path -Path $dirPath -PathType Container)) {
        Write-Host "Directory $dirPath does not exist. Exiting script." -ForegroundColor Red
        exit
    }
}

# Function to move files
function Move-Files {
    param (
        [string]$sourceDir,
        [string]$destDir
    )
    $files = Get-ChildItem -Path $sourceDir
    foreach ($file in $files) {
        $sourceFile = Join-Path -Path $sourceDir -ChildPath $file.Name
        $destFile = Join-Path -Path $destDir -ChildPath $file.Name
        Move-Item -Path $sourceFile -Destination $destFile
        Write-Host "Moved $sourceFile to $destFile" -ForegroundColor Green
    }
}

# Function to log operations
function Log-Operation {
    param (
        [string]$message
    )
    $logFile = "operation.log"
    Add-Content -Path $logFile -Value $message
}

# Main script execution
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"

# Check if source and destination directories exist
Check-Directory -dirPath $sourceDirectory
Check-Directory -dirPath $destinationDirectory

# Move files from source to destination
Move-Files -sourceDir $sourceDirectory -destDir $destinationDirectory

# Log the operation
Log-Operation -message "Moved files from $sourceDirectory to $destinationDirectory on $(Get-Date)"

# Self-modifying code section
$scriptPath = $MyInvocation.MyCommand.Path
$scriptContent = Get-Content -Path $scriptPath
$scriptContent += "`n# This is a self-modifying script"
Set-Content -Path $scriptPath -Value $scriptContent

# End of script
