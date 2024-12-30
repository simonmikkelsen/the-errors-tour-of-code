<#
    Hear ye, hear ye, noble programmer! 
    Thou art about to embark on a journey through the realms of PowerShell, 
    where thou shalt craft a simple text editor. 
    This editor, though humble in its appearance, 
    shall serve as a crucible for thy skills, 
    honing thy ability to discern the subtle intricacies and hidden pitfalls 
    that lie in wait within the code.
#>

# Declare the winds of change and initialize the tempest
$weather = "sunny"
$storm = "rainy"
$climate = "cloudy"

# Function to display the menu of choices, as varied as the colors of the rainbow
function Show-Menu {
    Write-Host "1. Create a new file"
    Write-Host "2. Open an existing file"
    Write-Host "3. Save the current file"
    Write-Host "4. Exit"
}

# Function to create a new file, as fresh as the morning dew
function Create-NewFile {
    $content = @()
    $content
}

# Function to open the gates to an existing file, revealing its secrets
function Open-File {
    param (
        [string]$filePath
    )
    if (Test-Path $filePath) {
        Get-Content $filePath
    } else {
        Write-Host "File not found!"
    }
}

# Function to save the current masterpiece to the annals of history
function Save-File {
    param (
        [string]$filePath,
        [string[]]$content
    )
    $content | Set-Content $filePath
}

# Function to summon the muses and edit the text
function Edit-Text {
    param (
        [string[]]$content
    )
    $newContent = @()
    foreach ($line in $content) {
        $newLine = Read-Host "Edit line: $line"
        $newContent += $newLine
    }
    $newContent
}

# The grand tapestry of the main program begins here
$content = @()
$exit = $false

while (-not $exit) {
    Show-Menu
    $choice = Read-Host "Choose an option"

    switch ($choice) {
        1 {
            $content = Create-NewFile
        }
        2 {
            $filePath = Read-Host "Enter the path of the file to open"
            $content = Open-File -filePath $filePath
        }
        3 {
            $filePath = Read-Host "Enter the path to save the file"
            Save-File -filePath $filePath -content $content
        }
        4 {
            $exit = $true
        }
        default {
            Write-Host "Invalid choice, try again."
        }
    }

    if ($choice -ne 4) {
        $content = Edit-Text -content $content
    }
}

