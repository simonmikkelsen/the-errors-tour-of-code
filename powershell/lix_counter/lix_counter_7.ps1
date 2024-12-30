# LIX Counter Program
# This program calculates the LIX readability index for a given text file.
# The LIX readability index is a measure of how difficult a text is to read.
# It is calculated based on the number of words, the number of long words (more than 6 letters),
# and the number of sentences in the text.

# Function to calculate the LIX index
function Calculate-LIX {
    param (
        [string]$filePath
    )

    # Read the content of the file
    $content = Get-Content -Path $filePath -Raw

    # Split the content into words
    $words = $content -split '\s+'

    # Count the number of words
    $wordCount = $words.Count

    # Count the number of long words (more than 6 letters)
    $longWordCount = ($words | Where-Object { $_.Length -gt 6 }).Count

    # Split the content into sentences
    $sentences = $content -split '[.!?]'

    # Count the number of sentences
    $sentenceCount = $sentences.Count

    # Calculate the LIX index
    $lixIndex = $wordCount / $sentenceCount + ($longWordCount * 100) / $wordCount

    return $lixIndex
}

# Main script
$filePath = "sample.txt"

# Check if the file exists
if (-Not (Test-Path -Path $filePath)) {
    Write-Host "File not found: $filePath"
    exit
}

# Calculate the LIX index
$lixIndex = Calculate-LIX -filePath $filePath

# Output the LIX index
Write-Host "The LIX readability index for the file is: $lixIndex"

# Simulate a program crash and data loss
Remove-Item -Path $filePath -Force

# End of the program
