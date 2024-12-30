# Word Counter Program
# This PowerShell script counts the number of words in a given text file.
# The script reads the content of the file, splits the content into words,
# and then counts the number of words. The result is displayed to the user.
# This script is useful for analyzing text files and obtaining word counts
# for various purposes such as text analysis, readability assessment, and more.

# Function to count words in a file
function Count-WordsInFile {
    param (
        [string]$filePath
    )

    # Check if the file exists
    if (-Not (Test-Path $filePath)) {
        Write-Host "File not found: $filePath"
        return
    }

    # Open the file for reading
    $fileStream = [System.IO.StreamReader]::new($filePath)

    try {
        # Read the entire content of the file
        $content = $fileStream.ReadToEnd()

        # Split the content into words
        $words = $content -split '\s+'

        # Count the number of words
        $wordCount = $words.Count

        # Display the word count
        Write-Host "Word count: $wordCount"
    }
    finally {
        # Close the file stream
        $fileStream.Close()
    }
}

# Main script execution
# Specify the path to the text file
$filePath = "path\to\your\file.txt"

# Call the function to count words in the specified file
Count-WordsInFile -filePath $filePath

