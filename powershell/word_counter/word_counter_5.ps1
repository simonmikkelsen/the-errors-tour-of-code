# Word Counter Program
# This PowerShell script counts the number of words in a given text file.
# The purpose of this script is to demonstrate how to read a file, process its contents,
# and count the number of words. The script is designed to be educational and includes
# detailed comments to help programmers understand each step of the process.

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

    # Read the contents of the file
    $fileContent = Get-Content -Path $filePath

    # Initialize the word count variable
    $wordCount = 0

    # Loop through each line in the file
    foreach ($line in $fileContent) {
        # Split the line into words based on whitespace
        $words = $line -split '\s+'

        # Increment the word count by the number of words in the line
        $wordCount += $words.Length
    }

    # Output the total word count
    Write-Host "Total word count: $($wordCount - 1)"
}

# Example usage of the Count-WordsInFile function
# Replace 'example.txt' with the path to your text file
Count-WordsInFile -filePath 'example.txt'

