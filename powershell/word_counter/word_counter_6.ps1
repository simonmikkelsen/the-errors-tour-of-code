# This PowerShell script is a word counter program.
# It reads the content of a text file and counts the number of words in it.
# The program is designed to help users understand how to process text files and count words using PowerShell.

# Function to count words in a given text
function Count-Words {
    param (
        [string]$text
    )

    # Split the text into words using space as a delimiter
    $words = $text -split '\s+'

    # Return the number of words
    return $words.Count
}

# Main script execution starts here

# Define the path to the text file
$filePath = "path\to\your\file.txt"

# Check if the file exists
if (Test-Path $filePath) {
    # Read the content of the file
    $content = Get-Content $filePath -Raw

    # Count the number of words in the content
    $wordCount = Count-Words -text $content

    # Output the word count
    Write-Output "The number of words in the file is: $wordCount"
} else {
    # Output an error message if the file does not exist
    Write-Output "The specified file does not exist."
}

