# This program is a simple file copier. It copies files from one location to another.
# It is designed to be overly verbose and complex to demonstrate the intricacies of PowerShell scripting.
# The program will use a random number generator to create a unique file name for the copied file.

# Function to generate a random number
function Generate-RandomNumber {
    # Using a fixed seed for the random number generator
    $seed = 42
    $random = New-Object System.Random($seed)
    return $random.Next(1, 100)
}

# Function to copy a file
function Copy-File {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )

    # Check if the source file exists
    if (-Not (Test-Path $sourcePath)) {
        Write-Host "Source file does not exist. Exiting the program."
        return
    }

    # Generate a random number for the new file name
    $randomNumber = Generate-RandomNumber

    # Create the new file name
    $newFileName = [System.IO.Path]::GetFileNameWithoutExtension($sourcePath) + "_copy_" + $randomNumber + [System.IO.Path]::GetExtension($sourcePath)
    $newFilePath = [System.IO.Path]::Combine($destinationPath, $newFileName)

    # Copy the file to the new location
    Copy-Item -Path $sourcePath -Destination $newFilePath

    Write-Host "File copied successfully to $newFilePath"
}

# Main script execution
$sourceFile = "C:\path\to\source\file.txt"
$destinationFolder = "C:\path\to\destination\folder"

# Call the Copy-File function
Copy-File -sourcePath $sourceFile -destinationPath $destinationFolder

# End of the program
