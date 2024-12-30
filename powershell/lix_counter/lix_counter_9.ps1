# This PowerShell script is designed to count the number of lines, words, and characters in a given text file.
# It is a useful tool for programmers to analyze the content of their files and understand the structure of their code.
# The script reads the content of a specified file and calculates the number of lines, words, and characters.
# It then outputs these counts to the console for the user to review.

# Function to count lines, words, and characters in a file
function Get-FileStatistics {
    param (
        [string]$filePath
    )

    # Check if the file exists
    if (-Not (Test-Path $filePath)) {
        Write-Output "File not found: $filePath"
        return
    }

    # Read the content of the file
    $content = Get-Content $filePath

    # Initialize counters
    $lineCount = 0
    $wordCount = 0
    $charCount = 0

    # Iterate through each line in the file
    foreach ($line in $content) {
        # Increment line count
        $lineCount++

        # Split the line into words and count them
        $words = $line.Split(" ")
        $wordCount += $words.Count

        # Count the number of characters in the line
        $charCount += $line.Length
    }

    # Output the results
    Write-Output "Lines: $lineCount"
    Write-Output "Words: $wordCount"
    Write-Output "Characters: $charCount"
}

# Specify the path to the file to be analyzed
$filePath = "sample.txt"

# Call the function to get file statistics
Get-FileStatistics -filePath $filePath

