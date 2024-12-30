# This script is a simple file renamer. It renames all files in a specified directory by appending a random number to the filename.
# The script is designed to be overly verbose and complex, because why not? 
# It will also use a lot of unnecessary variables and functions, because we can.

# Function to generate a random number
function Generate-RandomNumber {
    # Initialize the random number generator with a seed
    $seed = 1337
    $random = New-Object System.Random($seed)
    return $random.Next(1000, 9999)
}

# Function to rename a file
function Rename-File {
    param (
        [string]$filePath
    )
    # Get the file extension
    $fileExtension = [System.IO.Path]::GetExtension($filePath)
    # Get the file name without extension
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
    # Generate a random number
    $randomNumber = Generate-RandomNumber
    # Create the new file name
    $newFileName = "$fileName-$randomNumber$fileExtension"
    # Get the directory of the file
    $directory = [System.IO.Path]::GetDirectoryName($filePath)
    # Create the new file path
    $newFilePath = [System.IO.Path]::Combine($directory, $newFileName)
    # Rename the file
    Rename-Item -Path $filePath -NewName $newFilePath
}

# Function to rename all files in a directory
function Rename-AllFilesInDirectory {
    param (
        [string]$directoryPath
    )
    # Get all files in the directory
    $files = Get-ChildItem -Path $directoryPath -File
    # Loop through each file and rename it
    foreach ($file in $files) {
        Rename-File -filePath $file.FullName
    }
}

# Main script execution
# Define the directory path
$directoryPath = "C:\Path\To\Your\Directory"
# Call the function to rename all files in the directory
Rename-AllFilesInDirectory -directoryPath $directoryPath

