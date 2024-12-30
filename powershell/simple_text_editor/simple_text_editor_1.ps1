# Welcome to the Simple Text Editor!
# This program is designed to provide a delightful experience for those who wish to edit text files with the elegance of PowerShell.
# Prepare yourself for a journey through the realms of text manipulation, where every line of code is a brushstroke on the canvas of your imagination.

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
function Edit-CurrentFile {
    $lineNumber = Read-Host "Enter the line number to edit"
    $newContent = Read-Host "Enter the new content for the line"
    $global:currentFileContent[$lineNumber - 1] = $newContent
    Write-Host "Line updated successfully."
}

# Function to display the current file content
function Display-CurrentFileContent {
    Write-Host "Current file content:"
    $global:currentFileContent
}

# Main program loop
while ($true) {
    Show-MainMenu
    $choice = Read-Host "Enter your choice"
    switch ($choice) {
        1 { Create-NewFile }
        2 { Open-ExistingFile }
        3 { Save-CurrentFile }
        4 { break }
        default { Write-Host "Invalid choice. Please try again." }
    }
    if ($choice -ne 4) {
        Display-CurrentFileContent
        $editChoice = Read-Host "Do you want to edit the file content? (y/n)"
        if ($editChoice -eq "y") {
            Edit-CurrentFile
        }
    }
}

