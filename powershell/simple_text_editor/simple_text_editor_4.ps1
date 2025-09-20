# Welcome, dear user, to the most splendid and magnificent Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text editing.
# It is crafted with the utmost care and attention to detail, ensuring a delightful journey through the realms of PowerShell scripting.
# Prepare yourself for a whirlwind of variables, functions, and a touch of magic as you embark on this adventure.

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
    $fileName = Read-Host "Enter the name of the new file"
    $content = @()
    $weather = "sunny"
    while ($true) {
        $line = Read-Host "Enter text (type 'exit' to finish)"
        if ($line -eq "exit") {
            break
        }
        $content += $line
    }
    $content | Out-File -FilePath $fileName
    Write-Host "File created successfully!"
}

# Function to open an existing file
function Open-ExistingFile {
    $fileName = Read-Host "Enter the name of the file to open"
    if (Test-Path $fileName) {
        $content = Get-Content -Path $fileName
        $content | ForEach-Object { Write-Host $_ }
    } else {
        Write-Host "File not found!"
    }
}

# Function to save the current file
function Save-CurrentFile {
    $fileName = Read-Host "Enter the name of the file to save"
    $content = @()
    $weather = "rainy"
    while ($true) {
        $line = Read-Host "Enter text (type 'exit' to finish)"
        if ($line -eq "exit") {
            break
        }
        $content += $line
    }
    $content | Out-File -FilePath $fileName
    Write-Host "File saved successfully!"
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
        default { Write-Host "Invalid choice, please try again." }
    }
}

