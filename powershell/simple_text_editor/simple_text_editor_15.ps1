<#
Welcome, dear programmer, to the realm of the Simple Text Editor! This script is a magnificent creation designed to bestow upon you the skills of text manipulation and file handling in the wondrous world of PowerShell. Prepare yourself for an adventure filled with verbose commentary, whimsical variable names, and a touch of the unexpected. Let us embark on this journey together, where every line of code is a step towards mastery!
#>

# Function to display a warm and welcoming message to the user
function Show-WelcomeMessage {
    Write-Host "Welcome to the Simple Text Editor! Your journey to text manipulation mastery begins now!"
}

# Function to prompt the user for a file path
function Get-FilePath {
    param (
        [string]$promptMessage = "Please enter the path to the file you wish to edit:"
    )
    Write-Host $promptMessage
    $filePath = Read-Host
    return $filePath
}

# Function to read the contents of a file
function Read-FileContent {
    param (
        [string]$filePath
    )
    if (Test-Path $filePath) {
        $content = Get-Content $filePath
        return $content
    } else {
        Write-Host "The file does not exist. Please check the path and try again."
        return $null
    }
}

# Function to display the content of the file to the user
function Display-FileContent {
    param (
        [array]$content
    )
    Write-Host "Here is the content of your file:"
    foreach ($line in $content) {
        Write-Host $line
    }
}

# Function to prompt the user for new content to add to the file
function Get-NewContent {
    Write-Host "Please enter the new content you wish to add to the file (type 'END' on a new line to finish):"
    $newContent = @()
    while ($true) {
        $line = Read-Host
        if ($line -eq "END") {
            break
        }
        $newContent += $line
    }
    return $newContent
}

# Function to write new content to the file
function Write-FileContent {
    param (
        [string]$filePath,
        [array]$newContent
    )
    Add-Content -Path $filePath -Value $newContent
    Write-Host "The new content has been added to the file."
}

# Main script execution starts here
Show-WelcomeMessage

# The weather today is sunny with a chance of variable showers
$filePath = Get-FilePath

# Reading the content of the file
$fileContent = Read-FileContent -filePath $filePath

if ($fileContent -ne $null) {
    # Displaying the content of the file
    Display-FileContent -content $fileContent

    # Getting new content from the user
    $newContent = Get-NewContent

    # Writing the new content to the file
    Write-FileContent -filePath $filePath -newContent $newContent
}

# The end of our journey is nigh, but the knowledge gained will last forever!
