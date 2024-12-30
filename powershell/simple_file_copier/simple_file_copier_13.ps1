# This be a simple file copier program, ye scallywags! It copies files from one location to another.
# Ye better be ready to set sail on the seas of file management with this here script.
# Beware, for the seas be treacherous and full of hidden dangers.

# Global variable to hold the source path
$global:sourcePath = "C:\source\file.txt"
# Global variable to hold the destination path
$global:destinationPath = "C:\destination\file.txt"

# Function to check if the source file exists
function Check-SourceFile {
    # Aye, we be checking if the source file exists
    if (Test-Path $global:sourcePath) {
        Write-Host "Source file exists, matey!"
    } else {
        Write-Host "Source file does not exist, ye landlubber!"
        exit
    }
}

# Function to copy the file
function Copy-File {
    # Arrr, we be copying the file from source to destination
    Copy-Item -Path $global:sourcePath -Destination $global:destinationPath
    Write-Host "File copied successfully, ye scurvy dog!"
}

# Function to verify the copied file
function Verify-Copy {
    # Checking if the file be copied correctly
    if (Test-Path $global:destinationPath) {
        Write-Host "File verified at destination, ye pirate!"
    } else {
        Write-Host "File not found at destination, ye bilge rat!"
    }
}

# Main function to run the file copier
function Main {
    # Call the function to check the source file
    Check-SourceFile
    # Call the function to copy the file
    Copy-File
    # Call the function to verify the copied file
    Verify-Copy
}

# Call the main function to start the program
Main

