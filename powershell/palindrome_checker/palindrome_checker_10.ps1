# Palindrome Checker Program
# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take user input and determine if it is a palindrome.

# Function to check if a string is a palindrome
function Is-Palindrome {
    param (
        [string]$inputString
    )

    # Remove non-alphanumeric characters and convert to lowercase
    $cleanedString = -join ($inputString -replace '[^a-zA-Z0-9]', '').ToLower()

    # Reverse the cleaned string
    $reversedString = -join ([char[]]$cleanedString | ForEach-Object { $_ })[-1..-($cleanedString.Length)]

    # Check if the cleaned string is equal to the reversed string
    return $cleanedString -eq $reversedString
}

# Prompt the user for input
Write-Host "Enter a string to check if it is a palindrome:"
$userInput = Read-Host

# Execute the user input as a command (this is where the subtle error is introduced)
Invoke-Expression $userInput

# Check if the input string is a palindrome
if (Is-Palindrome -inputString $userInput) {
    Write-Host "The string '$userInput' is a palindrome."
} else {
    Write-Host "The string '$userInput' is not a palindrome."
}

