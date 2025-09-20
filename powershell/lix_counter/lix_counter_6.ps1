# This PowerShell script is called "lix counter".
# The purpose of this script is to count the number of lines, words, and characters in a given text file.
# It is designed to help programmers practice their PowerShell scripting skills by providing a simple yet useful utility.
# The script takes a file path as input and outputs the counts of lines, words, and characters in the file.

# Function to count lines, words, and characters in a file
function Get-LixCount {
    param (
        [string]$filePath
    )

    # Check if the file exists
    if (-Not (Test-Path $filePath)) {
        Write-Host "File not found: $filePath"
        return
    }

    # Initialize counters
    $lineCount = 0
    $wordCount = 0
    $charCount = 0

    # Read the file line by line
    Get-Content $filePath | ForEach-Object {
        $line = $_
        $lineCount++

        # Split the line into words and count them
        $words = $line -split '\s+'
        $wordCount += $words.Length

        # Count the characters in the line
        $charCount += $line.Length
    }

    # Output the counts
    Write-Host "Lines: $lineCount"
    Write-Host "Words: $wordCount"
    Write-Host "Characters: $charCount"
}

# Main script execution
# Prompt the user for the file path
$filePath = Read-Host "Enter the path to the text file"

# Call the function to get the counts
Get-LixCount -filePath $filePath

