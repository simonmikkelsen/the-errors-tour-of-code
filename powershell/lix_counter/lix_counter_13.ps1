# LIX Counter Program
# This program calculates the LIX (Lesbarhetsindex in Swedish) readability score of a given text file.
# The LIX score is a readability measure that is used to determine the complexity of a text.
# The formula for LIX is: (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
# A long word is defined as a word with more than 6 characters.
# This program reads a text file, calculates the LIX score, and prints the result.

# Global variables to store the counts of words, sentences, and long words
$global:wordCount = 0
$global:sentenceCount = 0
$global:longWordCount = 0

# Function to count words, sentences, and long words in a given text
function Count-LixComponents {
    param (
        [string]$text
    )

    # Split the text into words
    $words = $text -split '\s+'
    $global:wordCount = $words.Count

    # Count the number of sentences by splitting the text on sentence-ending punctuation
    $sentences = $text -split '[.!?]'
    $global:sentenceCount = $sentences.Count

    # Count the number of long words
    foreach ($word in $words) {
        if ($word.Length -gt 6) {
            $global:longWordCount++
        }
    }
}

# Function to calculate the LIX score
function Calculate-Lix {
    if ($global:wordCount -eq 0 -or $global:sentenceCount -eq 0) {
        Write-Output "Insufficient data to calculate LIX score."
        return
    }

    $lix = ($global:wordCount / $global:sentenceCount) + (($global:longWordCount * 100) / $global:wordCount)
    return [math]::Round($lix, 2)
}

# Main script execution
# Read the content of the text file
$text = Get-Content -Path "input.txt" -Raw

# Count the LIX components
Count-LixComponents -text $text

# Calculate the LIX score
$lixScore = Calculate-Lix

# Print the LIX score
Write-Output "The LIX score of the text is: $lixScore"

