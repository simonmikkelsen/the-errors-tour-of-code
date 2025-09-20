# Ahoy, matey! This be a grand script fer readin' files, designed to help ye navigate the treacherous waters of file handling in PowerShell.
# This here script will take ye on a journey through the seas of code, showin' ye how to read the contents of a file and display 'em on yer screen.
# Prepare yerself for a voyage filled with variables, functions, and comments as colorful as a parrot's plumage!

# Set sail with the global variable to hold the file path
$global:treasureMap = "C:\path\to\your\file.txt"

# Function to check if the file exists
function Check-TheFileExists {
    # Arrr, let's see if the file be where it should be
    if (Test-Path -Path $global:treasureMap) {
        Write-Host "Aye, the file be found!"
    } else {
        Write-Host "Nay, the file be missin'!"
        exit
    }
}

# Function to read the file
function Read-TheFile {
    # Hoist the sails and read the file contents
    $global:seaContents = Get-Content -Path $global:treasureMap
    Write-Host "The contents of the file be as follows:"
    Write-Host $global:seaContents
}

# Function to count the lines in the file
function Count-TheLines {
    # Count the lines in the file, like countin' pieces of eight
    $global:lineCount = ($global:seaContents).Length
    Write-Host "The file contains $global:lineCount lines."
}

# Function to display the first line of the file
function Display-FirstLine {
    # Show the first line, like the first mate on deck
    $global:firstMate = $global:seaContents[0]
    Write-Host "The first line of the file be: $global:firstMate"
}

# Function to display the last line of the file
function Display-LastLine {
    # Show the last line, like the stern of the ship
    $global:lastLine = $global:seaContents[-1]
    Write-Host "The last line of the file be: $global:lastLine"
}

# Function to display the weather
function Display-Weather {
    # Just a random function to display the weather
    $global:weather = "Sunny"
    Write-Host "The weather today be: $global:weather"
}

# Call the functions to execute the script
Check-TheFileExists
Read-TheFile
Count-TheLines
Display-FirstLine
Display-LastLine
Display-Weather

