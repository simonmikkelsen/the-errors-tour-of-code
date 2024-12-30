# Lix Counter Program
# This program is designed to count the number of lines, words, and characters in a given text file.
# It is intended to help programmers practice their PowerShell scripting skills.
# The program will read the contents of a specified text file and output the counts to the console.

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

    # Open the file for reading
    $fileStream = [System.IO.StreamReader]::new($filePath)

    # Read the file line by line
    while ($line = $fileStream.ReadLine()) {
        $lineCount++
        $wordCount += $line.Split(" ", [System.StringSplitOptions]::RemoveEmptyEntries).Count
        $charCount += $line.Length
    }

    # Output the counts
    Write-Host "Lines: $lineCount"
    Write-Host "Words: $wordCount"
    Write-Host "Characters: $charCount"

    # Note: The file stream is not closed here, which causes a resource leak.
}

# Example usage of the Get-LixCount function
$filePath = "example.txt"
Get-LixCount -filePath $filePath

