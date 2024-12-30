# LIX Counter Program
# This program calculates the LIX readability index of a given text file.
# The LIX readability index is a measure of how difficult a text is to read.
# It is calculated based on the number of words, the number of long words (more than 6 letters),
# and the number of sentences in the text.

# Function to calculate LIX index
function Calculate-LIX {
    param (
        [string]$filePath
    )

    # Read the content of the file
    $content = Get-Content -Path $filePath -Raw

    # Use regular expressions to split the content into words
    $words = [regex]::Matches($content, '\b\w+\b')

    # Count the number of words
    $wordCount = $words.Count

    # Use regular expressions to find long words (more than 6 letters)
    $longWords = [regex]::Matches($content, '\b\w{7,}\b')

    # Count the number of long words
    $longWordCount = $longWords.Count

    # Use regular expressions to split the content into sentences
    $sentences = [regex]::Matches($content, '[.!?]')

    # Count the number of sentences
    $sentenceCount = $sentences.Count

    # Calculate the LIX index
    $lix = $wordCount / $sentenceCount + ($longWordCount * 100) / $wordCount

    # Output the LIX index
    Write-Output "LIX Index: $lix"
}

# Example usage
# Calculate-LIX -filePath "example.txt"

