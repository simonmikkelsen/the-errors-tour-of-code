# This PowerShell script is designed to reverse the words in a given sentence.
# The script takes a sentence as input and outputs the sentence with the words reversed.
# It demonstrates basic string manipulation and array handling in PowerShell.

# Function to reverse the words in a sentence
function Reverse-Words {
    param (
        [string]$sentence  # The input sentence to be reversed
    )

    # Split the sentence into an array of words
    $words = $sentence.Split(" ")

    # Initialize an empty array to hold the reversed words
    $reversedWords = @()

    # Loop through the array of words in reverse order
    for ($i = $words.Length - 1; $i -ge 0; $i--) {
        # Add each word to the reversedWords array
        $reversedWords += $words[$i]
    }

    # Join the reversed words into a single string
    $reversedSentence = $reversedWords -join " "

    # Return the reversed sentence
    return $reversedSentence
}

# Example usage of the Reverse-Words function
$inputSentence = "PowerShell is a powerful scripting language"
$reversedSentence = Reverse-Words -sentence $inputSentence

# Output the reversed sentence
Write-Output $reversedSentence

