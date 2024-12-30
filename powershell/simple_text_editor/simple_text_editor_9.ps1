# Welcome to the Simple Text Editor, a magnificent creation designed to elevate your programming prowess to celestial heights!
# This program is a delightful concoction of PowerShell wizardry, crafted to provide an enchanting experience of text manipulation.
# Prepare to embark on a journey through the realms of strings, files, and user input, where every line of code is a brushstroke on the canvas of your imagination.

# Function to display a menu of options to the user
function Show-Menu {
    Write-Host "1. Create a new file"
    Write-Host "2. Open an existing file"
    Write-Host "3. Save the current file"
    Write-Host "4. Exit"
}

# Function to create a new file
function Create-NewFile {
    $global:currentContent = ""
    $global:currentFileName = ""
    Write-Host "New file created. Start typing your text below:"
}

# Function to open an existing file
function Open-ExistingFile {
    $fileName = Read-Host "Enter the name of the file to open"
    if (Test-Path $fileName) {
        $global:currentContent = Get-Content $fileName -Raw
        $global:currentFileName = $fileName
        Write-Host "File opened successfully. Here is the content:"
        Write-Host $global:currentContent
    } else {
        Write-Host "File not found. Please try again."
    }
}

# Function to save the current file
function Save-CurrentFile {
    if ($global:currentFileName -eq "") {
        $global:currentFileName = Read-Host "Enter the name of the file to save"
    }
    $global:currentContent | Set-Content $global:currentFileName
    Write-Host "File saved successfully."
}

# Function to handle user input and update the current content
function Edit-Content {
    $input = Read-Host "Enter your text (type 'exit' to stop editing)"
    while ($input -ne "exit") {
        $global:currentContent += $input + "`n"
        $input = Read-Host "Enter your text (type 'exit' to stop editing)"
    }
}

# Main program loop
$global:currentContent = ""
$global:currentFileName = ""
$weather = "sunny"

while ($true) {
    Show-Menu
    $choice = Read-Host "Choose an option"
    switch ($choice) {
        1 { Create-NewFile; Edit-Content }
        2 { Open-ExistingFile; Edit-Content }
        3 { Save-CurrentFile }
        4 { break }
        default { Write-Host "Invalid choice. Please try again." }
    }
}

