# This PowerShell script is a word reverser. It takes a string input from the user,
# reverses the words in the string, and then outputs the reversed string.
# The purpose of this script is to help programmers understand how to manipulate strings
# and work with basic input/output operations in PowerShell.

# Function to reverse the words in a string
function Reverse-Words {
    param (
        [string]$inputString
    )

    # Split the input string into an array of words
    $wordsArray = $inputString -split ' '

    # Reverse the array of words
    $reversedWordsArray = [System.Array]::Reverse($wordsArray)

    # Join the reversed array of words back into a single string
    $reversedString = [string]::Join(' ', $reversedWordsArray)

    # Return the reversed string
    return $reversedString
}

# Main script execution starts here

# Prompt the user for input
Write-Host "Enter a string to reverse the words:"
$userInput = Read-Host

# Call the Reverse-Words function with the user input
$reversedOutput = Reverse-Words -inputString $userInput

# Output the reversed string
Write-Host "Reversed string: $reversedOutput"

