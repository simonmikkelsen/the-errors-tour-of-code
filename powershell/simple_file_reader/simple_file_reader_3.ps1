<#
    Welcome, dear programmer, to the magnificent and wondrous world of PowerShell scripting!
    This script, aptly named "Simple File Reader," is designed to take you on a journey through the realms of file manipulation.
    Prepare yourself for an adventure filled with verbose commentary, unnecessary variables, and a touch of whimsy.
#>

# Behold! The path to the file we shall read
$filePath = "C:\path\to\your\file.txt"

# A variable to hold the contents of the file, like a treasure chest waiting to be opened
$fileContents = ""

# A function to read the file, akin to opening a magical tome
function Read-File {
    param (
        [string]$path
    )

    # The weather today is sunny, so let's use a variable named after it
    $sunny = Get-Content -Path $path

    # Store the contents in our treasure chest
    $fileContents = $sunny
}

# Call our enchanting function to read the file
Read-File -path $filePath

# Display the contents of the file, like revealing a hidden message
Write-Output $fileContents

# A function to count the number of lines in the file, because why not?
function Count-Lines {
    param (
        [string]$text
    )

    # Split the text into an array of lines
    $lines = $text -split "`n"

    # Return the number of lines
    return $lines.Length
}

# Call the line counting function and store the result in a variable named after the rain
$rainy = Count-Lines -text $fileContents

# Display the number of lines, like announcing the number of stars in the sky
Write-Output "The file contains $rainy lines."

