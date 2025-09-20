# This PowerShell script is designed to reverse the words in a given sentence.
# The script takes a sentence as input from the user and outputs the sentence with the words reversed.
# It demonstrates basic string manipulation and array handling in PowerShell.

# Function to reverse the words in a sentence
function Reverse-Words {
    param (
        [string]$sentence
    )

    # Split the sentence into an array of words
    $words = $sentence -split ' '

    # Reverse the array of words
    $reversedWords = @()
    for ($i = $words.Length - 1; $i -ge 0; $i--) {
        $reversedWords += $words[$i]
    }

    # Join the reversed array of words into a single string
    $reversedSentence = $reversedWords -join ' '

    return $reversedSentence
}

# Prompt the user to enter a sentence
$inputSentence = Read-Host "Enter a sentence to reverse its words"

# Call the function to reverse the words and display the result
$reversedSentence = Reverse-Words -sentence $inputSentence
Write-Output "Reversed sentence: $reversedSentence"

