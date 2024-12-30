# LIX Counter Program
# This program calculates the LIX readability index for a given text file.
# The LIX readability index is a measure of how difficult a text is to read.
# It is calculated based on the number of words, the number of long words (more than 6 characters),
# and the number of sentences in the text.

# Function to calculate the LIX index
function Calculate-LIX {
    param (
        [string]$filePath
    )

    # Read the content of the file
    $content = Get-Content -Path $filePath

    # Initialize counters
    $wordCount = 0
    $longWordCount = 0
    $sentenceCount = 0

    # Split the content into words
    $words = $content -split '\s+'

    # Loop through each word to count words and long words
    foreach ($word in $words) {
        $wordCount++
        if ($word.Length -gt 6) {
            $longWordCount++
        }
    }

    # Split the content into sentences
    $sentences = $content -split '[.!?]'

    # Count the number of sentences
    foreach ($sentence in $sentences) {
        $sentenceCount++
    }

    # Calculate the LIX index
    $lix = ($wordCount / $sentenceCount) + (($longWordCount * 100) / $wordCount)

    # Output the LIX index
    Write-Output "LIX Index: $lix"
}

# Main script execution
$filePath = "sample.txt"  # Path to the text file
Calculate-LIX -filePath $filePath

