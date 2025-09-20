# Word Counter Program
# This program is designed to count the number of words in a given text file.
# It reads the content of the file, splits the content into words, and then counts the number of words.
# The program uses a global variable to store the word count, which can be accessed and modified by different functions within the script.

# Global variable to store the word count
$global:wordCount = 0

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Check if the file exists
    if (Test-Path $filePath) {
        # Read the content of the file
        $content = Get-Content $filePath -Raw
        return $content
    } else {
        Write-Host "File not found."
        return $null
    }
}

# Function to count the words in the content
function Count-Words {
    param (
        [string]$content
    )
    # Split the content into words
    $words = $content -split '\s+'
    # Update the global word count variable
    $global:wordCount = $words.Count
}

# Main function to execute the word count process
function Main {
    param (
        [string]$filePath
    )
    # Read the file content
    $content = Read-FileContent -filePath $filePath
    if ($content -ne $null) {
        # Count the words in the content
        Count-Words -content $content
        # Display the word count
        Write-Host "The number of words in the file is: $global:wordCount"
    }
}

# Execute the main function with the provided file path
Main -filePath "example.txt"

