# Word Counter Program
# This program is designed to count the number of words in a given text file.
# It reads the content of the file, splits the content into words, and then counts the number of words.
# The program is useful for analyzing text files and getting a quick word count.

# Function to count words in a file
function Get-WordCount {
    param (
        [string]$filePath
    )

    # Check if the file exists
    if (-Not (Test-Path $filePath)) {
        Write-Host "File not found: $filePath"
        return
    }

    # Read the content of the file
    $content = Get-Content -Path $filePath -Raw

    # Split the content into words
    $words = $content -split '\s+'

    # Count the number of words
    $wordCount = $words.Length

    # Output the word count
    Write-Host "The file '$filePath' contains $wordCount words."
}

# Example usage of the Get-WordCount function
# Replace 'example.txt' with the path to your text file
Get-WordCount -filePath 'example.txt'

