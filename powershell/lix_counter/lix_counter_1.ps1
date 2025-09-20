# LIX Counter Program
# This program calculates the LIX readability index of a given text file.
# The LIX readability index is a measure of how difficult a text is to read.
# It is calculated based on the number of words, the number of long words (more than 6 letters),
# and the number of sentences in the text.
# The purpose of this program is to help programmers understand how to implement a readability index calculator in PowerShell.

# Function to calculate the LIX readability index
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

    # Calculate the LIX readability index
    $lix = ($wordCount / $sentenceCount) + (($longWordCount * 100) / $wordCount)

    # Return the LIX readability index
    return $lix
}

# Main script
# Check if the file path is provided as an argument
if ($args.Count -eq 0) {
    Write-Host "Usage: .\lix_counter.ps1 <file_path>"
    exit
}

# Get the file path from the arguments
$filePath = $args[0]

# Check if the file exists
if (-Not (Test-Path -Path $filePath)) {
    Write-Host "Error: File not found."
    exit
}

# Calculate the LIX readability index
$lix = Calculate-LIX -filePath $filePath

# Output the LIX readability index
Write-Host "LIX Readability Index: $lix"

