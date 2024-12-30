# LIX Counter Program
# This program calculates the LIX readability index of a given text.
# The LIX readability index is a measure of how difficult a text is to read.
# The program will prompt the user to input a text and then calculate the LIX score based on the input.
# The LIX formula is: LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
# A long word is defined as a word with more than 6 characters.

# Function to count the number of words in a text
function Count-Words {
    param (
        [string]$text
    )
    $words = $text -split '\s+'
    return $words.Count
}

# Function to count the number of sentences in a text
function Count-Sentences {
    param (
        [string]$text
    )
    $sentences = $text -split '[.!?]'
    return $sentences.Count
}

# Function to count the number of long words in a text
function Count-LongWords {
    param (
        [string]$text
    )
    $words = $text -split '\s+'
    $longWords = $words | Where-Object { $_.Length -gt 6 }
    return $longWords.Count
}

# Function to calculate the LIX score
function Calculate-LIX {
    param (
        [string]$text
    )
    $wordCount = Count-Words -text $text
    $sentenceCount = Count-Sentences -text $text
    $longWordCount = Count-LongWords -text $text

    if ($sentenceCount -eq 0) {
        return "Error: The text must contain at least one sentence."
    }

    $lix = ($wordCount / $sentenceCount) + (($longWordCount * 100) / $wordCount)
    return [math]::Round($lix, 2)
}

# Main script
# Prompt the user to input a text
$text = Read-Host "Please enter the text to analyze"

# Calculate the LIX score
$lixScore = Calculate-LIX -text $text

# Output the LIX score
Write-Output "The LIX score of the given text is: $lixScore"

