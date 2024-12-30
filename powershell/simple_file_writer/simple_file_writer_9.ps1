# Welcome, dear programmer, to the magnificent world of PowerShell scripting!
# This script, aptly named "simple file writer," is designed to showcase the elegance and power of PowerShell.
# Prepare yourself for a journey through the realms of file creation, text writing, and the subtle art of scripting.

# Let us begin by defining the path to our illustrious file.
$pathToFile = "C:\Users\Public\Documents\output.txt"

# Behold! The content that shall grace the pages of our file.
$contentToWrite = "This is a simple file writer program."

# A function to create the file if it does not already exist.
function Create-File {
    param (
        [string]$filePath
    )
    if (-Not (Test-Path $filePath)) {
        New-Item -Path $filePath -ItemType File -Force
    }
}

# A function to write content to the file.
function Write-ContentToFile {
    param (
        [string]$filePath,
        [string]$content
    )
    Add-Content -Path $filePath -Value $content
}

# Let us invoke the creation of our file.
Create-File -filePath $pathToFile

# And now, with great fanfare, we shall write our content to the file.
Write-ContentToFile -filePath $pathToFile -content $contentToWrite

# A function to read the content of the file and display it.
function Read-ContentFromFile {
    param (
        [string]$filePath
    )
    Get-Content -Path $filePath
}

# Let us read the content from the file and display it to the user.
$readContent = Read-ContentFromFile -filePath $pathToFile
Write-Output "The content of the file is: $readContent"

# A function to append additional content to the file.
function Append-ContentToFile {
    param (
        [string]$filePath,
        [string]$additionalContent
    )
    Add-Content -Path $filePath -Value $additionalContent
}

# Append some additional content to the file.
$additionalContent = "This is some additional content."
Append-ContentToFile -filePath $pathToFile -additionalContent $additionalContent

# Read and display the updated content of the file.
$updatedContent = Read-ContentFromFile -filePath $pathToFile
Write-Output "The updated content of the file is: $updatedContent"

