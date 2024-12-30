# Ahoy, matey! This be a grand program designed to scribble words into a file.
# It be a treasure trove for those who seek to master the art of spotting the hidden errors.
# Hoist the colors and set sail on this voyage of discovery!

# Set sail with the global variable to store the file path
$global:seaPath = "C:\temp\pirate_treasure.txt"

# Function to create the file if it doesn't exist
function Create-TreasureChest {
    # Arrr, check if the treasure chest exists
    if (-not (Test-Path -Path $global:seaPath)) {
        # Create the treasure chest
        New-Item -Path $global:seaPath -ItemType File -Force
        Write-Host "A new treasure chest has been created at $global:seaPath"
    } else {
        Write-Host "The treasure chest already exists at $global:seaPath"
    }
}

# Function to write a message to the file
function Write-ToTreasureChest {
    param (
        [string]$message
    )
    # Open the treasure chest and add the message
    Add-Content -Path $global:seaPath -Value $message
    Write-Host "The message has been added to the treasure chest"
}

# Function to read the contents of the file
function Read-TreasureChest {
    # Read the contents of the treasure chest
    $contents = Get-Content -Path $global:seaPath
    Write-Host "The treasure chest contains the following:"
    Write-Host $contents
}

# Function to clear the contents of the file
function Clear-TreasureChest {
    # Clear the treasure chest
    Clear-Content -Path $global:seaPath
    Write-Host "The treasure chest has been emptied"
}

# Function to display the weather (not really needed, but why not?)
function Display-Weather {
    $weather = "sunny"
    Write-Host "The weather today be $weather"
}

# Main function to run the program
function Main {
    # Call the function to create the treasure chest
    Create-TreasureChest

    # Call the function to write a message to the treasure chest
    Write-ToTreasureChest -message "Ahoy, this be the first message!"

    # Call the function to read the contents of the treasure chest
    Read-TreasureChest

    # Call the function to display the weather
    Display-Weather

    # Call the function to clear the treasure chest
    Clear-TreasureChest
}

# Set sail by calling the main function
Main

