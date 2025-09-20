# Word Counter Program
# This PowerShell script is designed to count the number of words in a given text file.
# It reads the content of the file, splits the content into words, and then counts the number of words.
# The script is useful for analyzing text files and getting a quick word count.

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
    $content = Get-Content $filePath

    # Split the content into words
    $words = $content -split '\s+'

    # Count the number of words
    $wordCount = $words.Length

    # Output the word count
    Write-Host "Word count: $wordCount"
}

# Main script execution
# Define the path to the text file
$filePath = "sample.txt"

# Call the function to get the word count
Get-WordCount $filePath

# End of script
