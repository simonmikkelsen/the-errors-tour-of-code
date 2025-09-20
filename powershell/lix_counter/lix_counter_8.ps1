# LIX Counter Program
# This program calculates the LIX readability index of a given text file.
# The LIX readability index is a measure of how difficult a text is to read.
# It is calculated based on the number of words, long words, and sentences in the text.
# The program reads a text file, processes its content, and outputs the LIX score.

# Function to count the number of words in a text
function Get-WordCount {
    param (
        [string]$text
    )
    $words = $text -split '\s+'
    return $words.Count
}

# Function to count the number of long words (more than 6 characters) in a text
function Get-LongWordCount {
    param (
        [string]$text
    )
    $words = $text -split '\s+'
    $longWords = $words | Where-Object { $_.Length -gt 6 }
    return $longWords.Count
}

# Function to count the number of sentences in a text
function Get-SentenceCount {
    param (
        [string]$text
    )
    $sentences = $text -split '[.!?]'
    return $sentences.Count
}

# Main script
# Read the content of the text file
$text = Get-Content -Path "sample.txt" -Raw

# Calculate the number of words, long words, and sentences
$wordCount = Get-WordCount -text $text
$longWordCount = Get-LongWordCount -text $text
$sentenceCount = Get-SentenceCount -text $text

# Calculate the LIX score
$lixScore = ($wordCount / $sentenceCount) + (($longWordCount * 100) / $wordCount)

# Output the LIX score
Write-Output "LIX Score: $lixScore"

