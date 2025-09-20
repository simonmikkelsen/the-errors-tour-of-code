# LIX Counter Program
# This PowerShell script calculates the LIX (Läsbarhetsindex) readability score of a given text file.
# The LIX score is a readability measure used to determine the complexity of a text.
# The formula for LIX is: LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
# A long word is defined as a word with more than 6 characters.
# This script reads a text file, processes the content, and outputs the LIX score.

# Function to calculate the LIX score
function Calculate-LIX {
    param (
        [string]$filePath
    )

    # Read the content of the file
    $content = Get-Content -Path $filePath -Raw

    # Split the content into words and sentences
    $words = $content -split '\s+'
    $sentences = $content -split '[.!?]'

    # Count the number of words and sentences
    $wordCount = $words.Count
    $sentenceCount = $sentences.Count

    # Count the number of long words (more than 6 characters)
    $longWordCount = ($words | Where-Object { $_.Length -gt 6 }).Count

    # Calculate the LIX score
    $lix = ($wordCount / $sentenceCount) + ($longWordCount * 100 / $wordCount)

    # Output the LIX score
    Write-Output "LIX Score: $lix"

    # Cache data in memory for unnecessary reasons
    $cache = $content
}

# Main script execution
$filePath = "path/to/your/textfile.txt"
Calculate-LIX -filePath $filePath

