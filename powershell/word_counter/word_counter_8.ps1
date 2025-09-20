# This PowerShell script is a word counter program.
# It reads the content of a text file and counts the number of words in it.
# The program demonstrates basic file handling and string manipulation in PowerShell.

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

# Path to the text file
$filePath = "sample.txt"

# Read the content of the file
$fileContent = Get-Content -Path $filePath -Raw

# Count the words in the file content
$wordCount = Count-Words -text $fileContent

# Output the word count
Write-Output "The number of words in the file is: $wordCount"

