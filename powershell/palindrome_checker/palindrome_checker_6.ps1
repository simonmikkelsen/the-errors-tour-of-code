# Palindrome Checker Program
# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this program is to help programmers understand how to implement a palindrome checker in PowerShell.

# Function to check if a string is a palindrome
function Is-Palindrome {
    param (
        [string]$inputString
    )

    # Remove non-alphanumeric characters and convert to lowercase
    $cleanedString = -join ($inputString -replace '[^a-zA-Z0-9]', '').ToLower()

    # Reverse the cleaned string
    $reversedString = -join ([char[]]$cleanedString | ForEach-Object {$_} | [array]::Reverse())

    # Check if the cleaned string is equal to the reversed string
    return $cleanedString -eq $reversedString
}

# Main script execution
# Prompt the user to enter a string
$userInput = Read-Host "Enter a string to check if it is a palindrome"

# Check if the input string is a palindrome
if (Is-Palindrome -inputString $userInput) {
    Write-Output "The string '$userInput' is a palindrome."
} else {
    Write-Output "The string '$userInput' is not a palindrome."
}

