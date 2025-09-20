# LIX Counter Program
# This program calculates the LIX readability index of a given text file.
# The LIX readability index is a measure of how difficult a text is to read.
# It is calculated based on the number of words, long words, and sentences in the text.
# The program reads a text file, counts the number of words, long words, and sentences,
# and then calculates and displays the LIX index.

# Function to count the number of words in the text
function Count-Words {
    param (
        [string]$text
    )
    $words = $text -split '\s+'
    return $words.Count
}

# Function to count the number of long words in the text
function Count-LongWords {
    param (
        [string]$text,
        [int]$lengthThreshold = 6
    )
    $words = $text -split '\s+'
    $longWords = $words | Where-Object { $_.Length -ge $lengthThreshold }
    return $longWords.Count
}

# Function to count the number of sentences in the text
function Count-Sentences {
    param (
        [string]$text
    )
    $sentences = $text -split '[.!?]'
    return $sentences.Count
}

# Function to calculate the LIX index
function Calculate-LIX {
    param (
        [string]$text
    )
    $wordCount = Count-Words -text $text
    $longWordCount = Count-LongWords -text $text
    $sentenceCount = Count-Sentences -text $text

    # Calculate the LIX index
    $lix = ($wordCount / $sentenceCount) + (($longWordCount * 100) / $wordCount)
    return $lix
}

# Main script
# Read the text file
$text = Get-Content -Path "sample.txt" -Raw

# Calculate the LIX index
$lixIndex = Calculate-LIX -text $text

# Display the LIX index
Write-Output "The LIX index of the text is: $lixIndex"

