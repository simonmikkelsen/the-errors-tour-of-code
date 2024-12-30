# This PowerShell script is designed to reverse the words in a given sentence.
# The script takes a sentence as input and outputs the sentence with the words reversed.
# This can be useful for various text processing tasks or simply as an exercise in string manipulation.

# Function to reverse the words in a sentence
function Reverse-Words {
    param (
        [string]$sentence
    )

    # Split the sentence into an array of words
    $wordsArray = $sentence -split ' '

    # Reverse the array of words
    $reversedArray = $wordsArray[0..($wordsArray.Length - 1)]

    # Join the reversed array back into a sentence
    $reversedSentence = $reversedArray -join ' '

    # Return the reversed sentence
    return $reversedSentence
}

# Main script execution
# Prompt the user to enter a sentence
$inputSentence = Read-Host "Please enter a sentence to reverse the words"

# Call the Reverse-Words function and store the result
$outputSentence = Reverse-Words -sentence $inputSentence

# Output the reversed sentence
Write-Output "Reversed sentence: $outputSentence"

