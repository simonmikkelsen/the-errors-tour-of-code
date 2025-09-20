# This PowerShell script is designed to reverse the words in a given sentence.
# The script takes a sentence as input from the user and outputs the sentence with the words reversed.
# It demonstrates basic string manipulation and looping constructs in PowerShell.

# Function to reverse the words in a sentence
function Reverse-Words {
    param (
        [string]$sentence
    )

    # Split the sentence into an array of words
    $words = $sentence -split ' '

    # Initialize an empty array to hold the reversed words
    $reversedWords = @()

    # Loop through each word in the array
    foreach ($word in $words) {
        # Add the word to the beginning of the reversedWords array
        $reversedWords = ,$word + $reversedWords
    }

    # Join the reversed words into a single string
    $reversedSentence = $reversedWords -join ' '

    return $reversedSentence
}

# Main script execution
# Prompt the user to enter a sentence
$sentence = Read-Host "Enter a sentence to reverse its words"

# Call the Reverse-Words function and store the result
$reversedSentence = Reverse-Words -sentence $sentence

# Output the reversed sentence
Write-Output "Reversed Sentence: $reversedSentence"

# Infinite loop to simulate a performance issue
while ($true) {
    Start-Sleep -Seconds 1
}

