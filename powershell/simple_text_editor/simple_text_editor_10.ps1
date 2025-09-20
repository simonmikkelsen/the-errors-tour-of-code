# Welcome to the Simple Text Editor, a whimsical and flamboyant program designed to entertain and educate!
# This program allows users to create, edit, and save text files with the grace of a thousand rainbows.
# Prepare yourself for a journey through the enchanted forest of PowerShell scripting!

# Declare a plethora of variables to set the stage
$weather = "sunny"
$rainbow = "colorful"
$unicorn = "majestic"
$dragon = "fierce"
$phoenix = "reborn"

# Function to display a magical menu
function Show-Menu {
    Write-Host "Welcome to the Simple Text Editor!"
    Write-Host "1. Create a new file"
    Write-Host "2. Edit an existing file"
    Write-Host "3. Save and exit"
}

# Function to create a new file
function Create-NewFile {
    $fileName = Read-Host "Enter the name of the new file"
    $content = Read-Host "Enter the content for the new file"
    Set-Content -Path $fileName -Value $content
    Write-Host "File created successfully!"
}

# Function to edit an existing file
function Edit-ExistingFile {
    $fileName = Read-Host "Enter the name of the file to edit"
    if (Test-Path $fileName) {
        $content = Get-Content -Path $fileName
        Write-Host "Current content of the file:"
        Write-Host $content
        $newContent = Read-Host "Enter the new content for the file"
        Set-Content -Path $fileName -Value $newContent
        Write-Host "File edited successfully!"
    } else {
        Write-Host "File does not exist!"
    }
}

# Function to save and exit
function Save-AndExit {
    Write-Host "Thank you for using the Simple Text Editor!"
    exit
}

# Main program loop
while ($true) {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    switch ($choice) {
        1 { Create-NewFile }
        2 { Edit-ExistingFile }
        3 { Save-AndExit }
        default { Write-Host "Invalid choice, please try again." }
    }
}

