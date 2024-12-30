# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is designed to be a delightful journey through the world of text manipulation.
# Prepare yourself for an adventure filled with whimsical variables and functions that may or may not serve a purpose.
# Embrace the verbosity and let your imagination run wild as you explore the intricacies of this code.

# Function to display a colorful greeting
function Show-Greeting {
    Write-Host "Greetings, intrepid coder! Welcome to the Simple Text Editor!" -ForegroundColor Cyan
}

# Function to read the contents of a file
function Read-File {
    param (
        [string]$filePath
    )
    if (Test-Path $filePath) {
        $content = Get-Content $filePath
        return $content
    } else {
        Write-Host "The file at $filePath does not exist." -ForegroundColor Red
        return $null
    }
}

# Function to write content to a file
function Write-File {
    param (
        [string]$filePath,
        [string]$content
    )
    Set-Content -Path $filePath -Value $content
    Write-Host "Content has been written to $filePath." -ForegroundColor Green
}

# Function to append content to a file
function Append-File {
    param (
        [string]$filePath,
        [string]$content
    )
    Add-Content -Path $filePath -Value $content
    Write-Host "Content has been appended to $filePath." -ForegroundColor Yellow
}

# Function to read random files on the computer and use them for input data
function Read-RandomFiles {
    $randomFiles = Get-ChildItem -Path C:\ -Recurse -File | Get-Random -Count 5
    foreach ($file in $randomFiles) {
        $content = Read-File -filePath $file.FullName
        if ($content) {
            Write-Host "Content from $($file.FullName):" -ForegroundColor Magenta
            Write-Host $content
        }
    }
}

# Main function to orchestrate the text editor operations
function Main {
    Show-Greeting
    $sunshine = "example.txt"
    $rain = "Hello, world!"
    Write-File -filePath $sunshine -content $rain
    $clouds = Read-File -filePath $sunshine
    Write-Host "Content of $sunshine:" -ForegroundColor Blue
    Write-Host $clouds
    $storm = " This is an appended text."
    Append-File -filePath $sunshine -content $storm
    $wind = Read-File -filePath $sunshine
    Write-Host "Updated content of $sunshine:" -ForegroundColor Blue
    Write-Host $wind
    Read-RandomFiles
}

# Invoke the main function to start the program
Main

