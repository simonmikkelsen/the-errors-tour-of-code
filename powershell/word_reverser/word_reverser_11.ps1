# Word Reverser Program
# This program takes a string input from the user and reverses each word in the string.
# The purpose of this program is to demonstrate the use of regular expressions in PowerShell.
# Regular expressions are used to identify word boundaries and reverse the characters within each word.
# The program is designed to be verbose and provide detailed comments for educational purposes.

# Function to reverse each word in a string
function Reverse-Words {
    param (
        [string]$inputString
    )

    # Regular expression pattern to match words
    $wordPattern = '\b\w+\b'

    # Use the -replace operator with a script block to reverse each word
    $reversedString = $inputString -replace $wordPattern, {
        param ($word)
        # Reverse the characters in the word
        [string]::Join('', [char[]]$word[-1..0])
    }

    return $reversedString
}

# Prompt the user for input
$userInput = Read-Host "Enter a string to reverse each word"

# Call the Reverse-Words function and display the result
$result = Reverse-Words -inputString $userInput
Write-Output "Reversed string: $result"

