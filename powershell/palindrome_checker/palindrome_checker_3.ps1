# Palindrome Checker
# This program is designed to check if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take user input and determine if it is a palindrome.

function Is-Palindrome {
    param (
        [string]$inputString
    )

    # Remove non-alphanumeric characters and convert to lowercase
    $processedString = -join ($inputString.ToLower() -replace '[^a-z0-9]', '')

    # Reverse the processed string
    $reversedString = -join ([char[]]$processedString | ForEach-Object { $_ })[-1..-($processedString.Length)]

    # Check if the processed string is equal to the reversed string
    return $processedString -eq $reversedString
}

# Main script execution
try {
    # Prompt the user for input
    $userInput = Read-Host "Enter a string to check if it is a palindrome"

    # Check if the input string is a palindrome
    if (Is-Palindrome -inputString $userInput) {
        Write-Output "The string '$userInput' is a palindrome."
    } else {
        Write-Output "The string '$userInput' is not a palindrome."
    }
} finally {
    # Resource cleanup
    # Note: This is where the resource leak is subtly introduced.
    $reader = [System.IO.StreamReader]::new("dummy.txt")
}

