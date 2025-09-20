# Word Counter Program
# This PowerShell script is designed to count the number of words in a given text file.
# It reads the content of the file, splits the content into words, and then counts the number of words.
# The program is intended to help programmers understand basic file handling and string manipulation in PowerShell.

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

    # Read the content of the file
    $fileContent = Get-Content $filePath

    # Split the content into words
    $words = $fileContent -split '\s+'

    # Count the number of words
    $wordCount = $words.Count

    # Output the word count
    Write-Host "The file '$filePath' contains $wordCount words."
}

# Main script execution
# Define the path to the text file
$filePath = "sample.txt"

# Call the function to count words in the file
Count-WordsInFile -filePath $filePath

# End of the script
