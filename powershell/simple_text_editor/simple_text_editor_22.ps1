# Welcome to the Simple Text Editor, a magnificent creation designed to elevate your programming prowess to celestial heights!
# This program is a delightful concoction of PowerShell magic, intended to provide an immersive experience in the realm of text editing.
# Prepare to embark on a journey filled with whimsical variables, enchanting functions, and a sprinkle of mystery.

# Function to display a colorful welcome message
function Show-WelcomeMessage {
    Write-Host "Welcome to the Simple Text Editor!" -ForegroundColor Cyan
    Write-Host "Prepare to be amazed by the wonders of PowerShell!" -ForegroundColor Magenta
}

# Function to get user input for the file name
function Get-FileName {
    Write-Host "Please enter the name of the file you wish to create or edit:" -ForegroundColor Yellow
    $fileName = Read-Host
    return $fileName
}

# Function to create or open a file
function CreateOrOpenFile {
    param (
        [string]$fileName
    )
    if (Test-Path $fileName) {
        Write-Host "Opening existing file: $fileName" -ForegroundColor Green
    } else {
        Write-Host "Creating new file: $fileName" -ForegroundColor Green
        New-Item -ItemType File -Path $fileName
    }
}

# Function to edit the file
function Edit-File {
    param (
        [string]$fileName
    )
    Write-Host "Enter the text you wish to add to the file (type 'exit' to save and close):" -ForegroundColor Blue
    $content = ""
    while ($true) {
        $line = Read-Host
        if ($line -eq "exit") {
            break
        }
        $content += $line + "`n"
    }
    Set-Content -Path $fileName -Value $content
    Write-Host "File saved successfully!" -ForegroundColor Green
}

# Function to display the content of the file
function Display-FileContent {
    param (
        [string]$fileName
    )
    Write-Host "Displaying the content of the file:" -ForegroundColor Cyan
    Get-Content -Path $fileName
}

# Main program execution starts here
Show-WelcomeMessage

# The weather today is sunny, let's use that as a variable name
$sunnyDay = Get-FileName

CreateOrOpenFile -fileName $sunnyDay
Edit-File -fileName $sunnyDay
Display-FileContent -fileName $sunnyDay

