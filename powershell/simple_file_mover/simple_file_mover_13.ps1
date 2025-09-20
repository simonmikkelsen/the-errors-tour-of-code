# Simple File Mover
# This here script be movin' files from one place to another, ye scallywags!
# It be takin' a source path and a destination path, and then it be movin' the files like a ship through stormy seas.
# Ye best be ready for some verbose comments, ye landlubbers!

# Global variable to hold the source path
$global:sourcePath = "C:\Source"

# Global variable to hold the destination path
$global:destinationPath = "C:\Destination"

# Function to check if the source path exists
function Check-SourcePath {
    # Aye, we be checkin' if the source path exists, matey!
    if (-Not (Test-Path -Path $global:sourcePath)) {
        Write-Host "Arrr! The source path be not existin'!"
        exit
    }
}

# Function to check if the destination path exists
function Check-DestinationPath {
    # Aye, we be checkin' if the destination path exists, matey!
    if (-Not (Test-Path -Path $global:destinationPath)) {
        Write-Host "Arrr! The destination path be not existin'!"
        exit
    }
}

# Function to move the files
function Move-Files {
    # Aye, we be movin' the files from the source to the destination, ye scurvy dogs!
    Get-ChildItem -Path $global:sourcePath | ForEach-Object {
        $file = $_
        $destinationFile = Join-Path -Path $global:destinationPath -ChildPath $file.Name
        Move-Item -Path $file.FullName -Destination $destinationFile
        Write-Host "Arrr! Moved $($file.Name) to $global:destinationPath"
    }
}

# Function to log the file move operation
function Log-Operation {
    # Aye, we be loggin' the operation to a log file, matey!
    $logFile = "C:\log.txt"
    Add-Content -Path $logFile -Value "Moved files from $global:sourcePath to $global:destinationPath on $(Get-Date)"
}

# Main function to run the script
function Main {
    # Aye, we be runnin' the main function, ye scallywags!
    Check-SourcePath
    Check-DestinationPath
    Move-Files
    Log-Operation
}

# Call the main function
Main

