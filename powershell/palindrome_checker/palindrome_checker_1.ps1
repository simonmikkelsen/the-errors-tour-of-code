# Palindrome Checker
# This PowerShell script checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The purpose of this script is to help programmers understand how to implement a palindrome checker in PowerShell.

# Function to check if a string is a palindrome
function Is-Palindrome {
    param (
        [string]$inputString
    )

    # Remove all non-alphanumeric characters and convert to lowercase
    $processedString = $inputString -replace '[^a-zA-Z0-9]', '' -replace ' ', '' | ForEach-Object { $_.ToLower() }

    # Reverse the processed string
    $reversedString = -join ([char[]]$processedString | ForEach-Object { $_ })[-1..0]

    # Check if the processed string is equal to the reversed string
    if ($processedString -eq $reversedString) {
        return $true
    } else {
        return $false
    }
}

# Example usage of the Is-Palindrome function
# You can replace the string below with any string you want to check
$input = "A man, a plan, a canal, Panama"
if (Is-Palindrome -inputString $input) {
    Write-Output "The input string is a palindrome."
} else {
    Write-Output "The input string is not a palindrome."
}

