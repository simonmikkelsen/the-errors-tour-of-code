# Palindrome Checker Program
# This program is designed to check if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take user input and determine if it is a palindrome.

# Global variable to store the input string
$global:inputString = ""

# Function to get user input
function Get-Input {
    # Prompt the user to enter a string
    $global:inputString = Read-Host "Enter a string to check if it is a palindrome"
}

# Function to check if the string is a palindrome
function Is-Palindrome {
    # Remove non-alphanumeric characters and convert to lowercase
    $processedString = -join ($global:inputString -replace '[^a-zA-Z0-9]', '').ToLower()

    # Reverse the processed string
    $reversedString = -join [char[]]$processedString[-1..-($processedString.Length)]

    # Check if the processed string is equal to the reversed string
    if ($processedString -eq $reversedString) {
        Write-Output "The string '$global:inputString' is a palindrome."
    } else {
        Write-Output "The string '$global:inputString' is not a palindrome."
    }
}

# Main script execution
Get-Input
Is-Palindrome

