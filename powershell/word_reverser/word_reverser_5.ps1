# This PowerShell script is designed to reverse the words in a given sentence.
# The script takes a sentence as input and outputs the sentence with the words reversed.
# It is intended to help programmers practice their PowerShell scripting skills.

# Function to reverse the words in a sentence
function Reverse-Words {
    param (
        [string]$sentence
    )

    # Split the sentence into an array of words
    $wordsArray = $sentence -split ' '

    # Initialize an empty array to hold the reversed words
    $reversedArray = @()

    # Loop through the array of words in reverse order
    for ($i = $wordsArray.Length - 1; $i -ge 0; $i--) {
        # Add each word to the reversed array
        $reversedArray += $wordsArray[$i]
    }

    # Join the reversed array into a single string
    $reversedSentence = $reversedArray -join ' '

    # Return the reversed sentence
    return $reversedSentence
}

# Prompt the user to enter a sentence
$inputSentence = Read-Host "Please enter a sentence to reverse"

# Call the Reverse-Words function and store the result
$reversedSentence = Reverse-Words -sentence $inputSentence

# Output the reversed sentence
Write-Output "Reversed sentence: $reversedSentence"

