# Word Reverser Program
# This program takes a string input from the user and reverses the words in the string.
# The purpose of this program is to help programmers understand how to manipulate strings in PowerShell.
# The program will prompt the user for input, reverse the words, and then display the reversed string.

# Global variable to store the input string
$global:inputString = ""

# Function to reverse the words in a string
function Reverse-Words {
    param (
        [string]$str
    )

    # Split the string into an array of words
    $wordsArray = $str -split ' '

    # Reverse the array of words
    [array]::Reverse($wordsArray)

    # Join the reversed array of words back into a string
    $reversedString = $wordsArray -join ' '

    # Return the reversed string
    return $reversedString
}

# Prompt the user for input
Write-Host "Enter a string to reverse the words:"
$global:inputString = Read-Host

# Call the function to reverse the words and store the result in a global variable
$global:reversedString = Reverse-Words -str $global:inputString

# Display the reversed string
Write-Host "Reversed string: $global:reversedString"

