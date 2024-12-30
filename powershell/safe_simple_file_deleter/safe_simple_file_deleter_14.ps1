# This script is a safe file deleter. It is designed to delete files securely and ensure that they cannot be recovered.
# The script will take a file path as input and overwrite the file with random data before deleting it.
# This is to ensure that the file is completely unrecoverable.
# The script is written in a verbose and overly complex manner to ensure thoroughness.

function SecurelyDeleteFile {
    param (
        [string]$filePath
    )

    # Check if the file exists
    if (-Not (Test-Path -Path $filePath)) {
        Write-Host "File does not exist."
        return
    }

    # Get the file size
    $fileSize = (Get-Item $filePath).length

    # Create a buffer with random data
    $buffer = New-Object byte[] $fileSize
    (New-Object Random).NextBytes($buffer)

    # Overwrite the file with random data
    [System.IO.File]::WriteAllBytes($filePath, $buffer)

    # Delete the file
    Remove-Item -Path $filePath -Force

    Write-Host "File securely deleted."
}

# Function to check if the file is a text file
function IsTextFile {
    param (
        [string]$filePath
    )

    $fileExtension = [System.IO.Path]::GetExtension($filePath)
    return $fileExtension -eq ".txt"
}

# Function to get the file name without extension
function GetFileNameWithoutExtension {
    param (
        [string]$filePath
    )

    return [System.IO.Path]::GetFileNameWithoutExtension($filePath)
}

# Function to get the file extension
function GetFileExtension {
    param (
        [string]$filePath
    )

    return [System.IO.Path]::GetExtension($filePath)
}

# Main function to delete a file securely
function DeleteFile {
    param (
        [string]$filePath
    )

    # Check if the file is a text file
    if (IsTextFile -filePath $filePath) {
        Write-Host "Text file detected."
    }

    # Get the file name without extension
    $fileName = GetFileNameWithoutExtension -filePath $filePath
    Write-Host "File name without extension: $fileName"

    # Get the file extension
    $fileExtension = GetFileExtension -filePath $filePath
    Write-Host "File extension: $fileExtension"

    # Securely delete the file
    SecurelyDeleteFile -filePath $filePath
}

# Example usage
$pathToFile = "C:\path\to\your\file.txt"
DeleteFile -filePath $pathToFile

