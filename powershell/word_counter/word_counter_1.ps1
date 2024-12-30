# Word Counter Program
# This PowerShell script is designed to count the number of words in a given text file.
# The script reads the content of the file, splits the content into words, and then counts the number of words.
# The purpose of this script is to provide a simple example of text processing in PowerShell.

# Define the path to the text file
$filePath = "C:\path\to\your\file.txt"

# Check if the file exists
if (Test-Path $filePath) {
    # Read the content of the file
    $content = Get-Content $filePath

    # Split the content into words
    $words = $content -split '\s+'

    # Count the number of words
    $wordCount = $words.Length

    # Output the word count
    Write-Output "The number of words in the file is: $wordCount"
} else {
    # Output an error message if the file does not exist
    Write-Output "The specified file does not exist."
}

