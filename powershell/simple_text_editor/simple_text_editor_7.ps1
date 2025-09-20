# Welcome to the Simple Text Editor, a magnificent creation designed to provide an unparalleled experience in text editing.
# This program is a symphony of code, orchestrated to offer a delightful interface for creating, editing, and saving text files.
# Prepare to embark on a journey through the realms of PowerShell, where every line of code is a brushstroke on the canvas of functionality.

# Function to display the main menu
function Show-MainMenu {
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
    Write-Host "New file created. Start typing your text below:"
    while ($true) {
        $input = Read-Host
        if ($input -eq ":wq") { break }
        $global:currentFileContent += $input
    }
}

# Function to open an existing file
function Open-ExistingFile {
    $global:currentFileName = Read-Host "Enter the name of the file to open"
    if (Test-Path $global:currentFileName) {
        $global:currentFileContent = Get-Content $global:currentFileName
        Write-Host "File content:"
        $global:currentFileContent
    } else {
        Write-Host "File not found!"
    }
}

# Function to save the current file
function Save-CurrentFile {
    if ($global:currentFileName -eq "") {
        $global:currentFileName = Read-Host "Enter the name of the file to save"
    }
    $global:currentFileContent | Set-Content $global:currentFileName
    Write-Host "File saved successfully!"
}

# Function to handle user input
function Handle-UserInput {
    while ($true) {
        Show-MainMenu
        $choice = Read-Host "Enter your choice"
        switch ($choice) {
            1 { Create-NewFile }
            2 { Open-ExistingFile }
            3 { Save-CurrentFile }
            4 { break }
            default { Write-Host "Invalid choice, please try again." }
        }
    }
}

# The grand entry point of our program, where the magic begins
Handle-UserInput

