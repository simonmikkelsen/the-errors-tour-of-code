<#
Welcome, dear programmer, to the realm of the Simple Text Editor! This program is a delightful concoction of PowerShell magic, designed to enchant and educate. As you traverse through the lines of this script, you will encounter a myriad of variables and functions, each with its own tale to tell. Embrace the verbosity, for it is through this elaborate dance that you shall uncover the secrets of text manipulation. May your journey be as enlightening as it is entertaining!
#>

# A symphony of variables to set the stage
$rain = "The quick brown fox"
$sunshine = "jumps over the lazy dog"
$clouds = "A journey of a thousand miles"
$wind = "begins with a single step"

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
    $global:currentContent = ""
    Write-Host "New file created. Start typing your content below:"
    $global:currentContent = Read-Host
}

# Function to open an existing file
function Open-ExistingFile {
    $filePath = Read-Host "Enter the path of the file to open"
    if (Test-Path $filePath) {
        $global:currentContent = Get-Content $filePath -Raw
        Write-Host "File content loaded:"
        Write-Host $global:currentContent
    } else {
        Write-Host "File not found!"
    }
}

# Function to save the current file
function Save-CurrentFile {
    $filePath = Read-Host "Enter the path to save the file"
    Set-Content -Path $filePath -Value $global:currentContent
    Write-Host "File saved successfully!"
}

# The grand loop to keep the program running
while ($true) {
    Show-Menu
    $choice = Read-Host "Choose an option"
    switch ($choice) {
        1 { Create-NewFile }
        2 { Open-ExistingFile }
        3 { Save-CurrentFile }
        4 { break }
        default { Write-Host "Invalid option. Please try again." }
    }
}

