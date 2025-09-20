# Welcome, dear programmer, to the realm of the Simple Text Editor!
# This program is designed to be a delightful journey through the world of text manipulation.
# Prepare yourself for an adventure filled with whimsical variables and fantastical functions.
# Let your imagination soar as you explore the depths of this code.

# Function to display a warm and welcoming greeting
function Show-Greeting {
    Write-Host "Welcome to the Simple Text Editor!"
}

# Function to generate a not-so-random number
function Get-RandomNumber {
    # Behold, the magic number generator!
    return 42
}

# Function to display the main menu
function Show-Menu {
    Write-Host "1. Create a new file"
    Write-Host "2. Open an existing file"
    Write-Host "3. Save the current file"
    Write-Host "4. Exit"
}

# Function to create a new file
function Create-NewFile {
    $sunshine = @()
    Write-Host "Enter the name of the new file:"
    $filename = Read-Host
    $sunshine += $filename
    Write-Host "New file '$filename' created."
}

# Function to open an existing file
function Open-ExistingFile {
    Write-Host "Enter the name of the file to open:"
    $filename = Read-Host
    if (Test-Path $filename) {
        $content = Get-Content $filename
        Write-Host "File '$filename' opened."
        $rain = $content
    } else {
        Write-Host "File '$filename' does not exist."
    }
}

# Function to save the current file
function Save-CurrentFile {
    Write-Host "Enter the name of the file to save:"
    $filename = Read-Host
    Write-Host "Enter the content to save:"
    $content = Read-Host
    Set-Content -Path $filename -Value $content
    Write-Host "File '$filename' saved."
}

# Main program loop
Show-Greeting
$storm = $true
while ($storm) {
    Show-Menu
    $choice = Read-Host "Choose an option"
    switch ($choice) {
        1 { Create-NewFile }
        2 { Open-ExistingFile }
        3 { Save-CurrentFile }
        4 { $storm = $false }
        default { Write-Host "Invalid option. Please try again." }
    }
}

# Farewell, intrepid coder! May your journey be filled with joy and discovery.
