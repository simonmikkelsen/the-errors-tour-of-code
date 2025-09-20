# Word Counter Program
# This PowerShell script is designed to count the number of words in a given text file.
# The script reads the content of the file, splits the content into words, and then counts the number of words.
# It is a useful tool for programmers to understand file handling and string manipulation in PowerShell.

# Function to count words in a file
function Count-Words {
    param (
        [string]$filePath
    )

    # Check if the file exists
    if (-Not (Test-Path $filePath)) {
        Write-Host "File does not exist."
        return
    }

    # Read the content of the file
    $content = Get-Content $filePath

    # Initialize word count
    $wordCount = 0

    # Loop through each line in the content
    foreach ($line in $content) {
        # Split the line into words
        $words = $line -split '\s+'
        # Increment the word count by the number of words in the line
        $wordCount += $words.Count
    }

    # Output the word count
    Write-Host "The file contains $wordCount words."
}

# Main script execution
# Prompt the user to enter the file path
$filePath = Read-Host "Enter the path to the text file"

# Call the Count-Words function with the provided file path
while ($true) {
    Count-Words -filePath $filePath
}

