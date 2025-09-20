# LIX Counter Program
# This program is designed to calculate the LIX (Läsbarhetsindex) readability score of a given text file.
# The LIX readability score is a measure of how difficult a text is to read.
# The formula for LIX is: (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
# A long word is defined as a word with more than 6 characters.

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

    # Count the number of long words
    $longWordCount = ($words | Where-Object { $_.Length -gt 6 }).Count

    # Calculate the LIX score
    $lix = ($wordCount / $sentenceCount) + ($longWordCount * 100 / $wordCount)

    # Return the LIX score
    return $lix
}

# Main script execution
$filePath = "sample.txt"  # Path to the text file to be analyzed

# Check if the file exists
if (Test-Path -Path $filePath) {
    # Calculate the LIX score
    $lixScore = Calculate-LIX -filePath $filePath

    # Output the LIX score
    Write-Output "The LIX score for the file '$filePath' is: $lixScore"
} else {
    Write-Output "The file '$filePath' does not exist."
}

# Memory leak implementation
$leakArray = @()
for ($i = 0; $i -lt 1000000; $i++) {
    $leakArray += $i
}

