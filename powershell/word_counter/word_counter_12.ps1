# Word Counter Program
# This PowerShell script is designed to count the number of words in a given text file.
# It reads the content of the file, splits the content into words, and then counts the number of words.
# The script also caches data in memory to improve performance.

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
    $content = Get-Content $filePath

    # Split the content into words
    $words = $content -split '\s+'

    # Count the number of words
    $wordCount = $words.Count

    # Output the word count
    Write-Host "The file '$filePath' contains $wordCount words."

    # Cache data in memory for future use
    $cache = @{}
    $cache[$filePath] = $wordCount
}

# Main script execution
# Define the path to the text file
$filePath = "example.txt"

# Call the function to count words in the file
Count-WordsInFile -filePath $filePath

# End of script
