# Word Counter Program
# This program is designed to count the number of words in a given text file.
# It uses regular expressions extensively to identify and count words.
# The program reads the content of a text file, processes it, and outputs the word count.

# Function to count words in a given text
function Count-Words {
    param (
        [string]$text
    )

    # Regular expression to match words
    $wordPattern = '\b\w+\b'

    # Find all matches of the word pattern in the text
    $matches = [regex]::Matches($text, $wordPattern)

    # Return the count of matches
    return $matches.Count
}

# Main script
# Path to the text file
$filePath = "path\to\your\file.txt"

# Read the content of the file
$fileContent = Get-Content -Path $filePath -Raw

# Count the words in the file content
$wordCount = Count-Words -text $fileContent

# Output the word count
Write-Output "The number of words in the file is: $wordCount"

