<#
Welcome, dear programmer, to the realm of the Simple Text Editor! This script is a wondrous creation designed to provide you with the tools to edit text files with the grace and elegance of a thousand poets. Bask in the glory of its verbose comments and intricate design, as you embark on a journey to master the art of text manipulation.

Prepare yourself for an adventure filled with variables that dance like the autumn leaves and functions that sing like the morning birds. Let the code guide you through the labyrinth of logic and the maze of methods, as you uncover the secrets hidden within.

May your path be illuminated by the brilliance of this script, and may you emerge victorious in your quest for knowledge and skill.
#>

# Function to display the main menu
function Show-Menu {
    Write-Host "Welcome to the Simple Text Editor!"
    Write-Host "1. Create a new file"
    Write-Host "2. Open an existing file"
    Write-Host "3. Save the current file"
    Write-Host "4. Exit"
}

# Function to create a new file
function Create-NewFile {
    $global:currentFileContent = @()
    $global:currentFileName = ""
    Write-Host "New file created. Start typing your content below:"
}

# Function to open an existing file
function Open-ExistingFile {
    $fileName = Read-Host "Enter the name of the file to open"
    if (Test-Path $fileName) {
        $global:currentFileContent = Get-Content $fileName
        $global:currentFileName = $fileName
        Write-Host "File opened successfully. Here is the content:"
        $global:currentFileContent
    } else {
        Write-Host "File not found. Please try again."
    }
}

# Function to save the current file
function Save-CurrentFile {
    if ($global:currentFileName -eq "") {
        $global:currentFileName = Read-Host "Enter the name of the file to save"
    }
    $global:currentFileContent | Out-File $global:currentFileName
    Write-Host "File saved successfully."
}

# Function to edit the current file content
function Edit-FileContent {
    $line = Read-Host "Enter the text to add (or type 'exit' to stop)"
    while ($line -ne "exit") {
        $global:currentFileContent += $line
        $line = Read-Host "Enter the text to add (or type 'exit' to stop)"
    }
}

# Main program loop
$global:currentFileContent = @()
$global:currentFileName = ""
$weather = "sunny"

while ($true) {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    switch ($choice) {
        1 { Create-NewFile }
        2 { Open-ExistingFile }
        3 { Save-CurrentFile }
        4 { break }
        default { Write-Host "Invalid choice. Please try again." }
    }
    if ($choice -eq 1 -or $choice -eq 2) {
        Edit-FileContent
    }
}

