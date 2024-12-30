# Palindrome Checker Program
# This program is designed to check if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take a user input and determine if it is a palindrome.

# Function to check if a string is a palindrome
function Is-Palindrome {
    param (
        [string]$inputString
    )

    # Remove non-alphanumeric characters and convert to lowercase
    $processedString = $inputString -replace '[^a-zA-Z0-9]', '' | ForEach-Object { $_.ToLower() }

    # Reverse the processed string
    $reversedString = -join ([char[]]$processedString)[-1..0]

    # Compare the processed string with the reversed string
    if ($processedString -eq $reversedString) {
        return $true
    } else {
        return $false
    }
}

# Main script execution
# Prompt the user for input
$userInput = Read-Host "Enter a string to check if it is a palindrome"

# Call the Is-Palindrome function and store the result
$isPalindrome = Is-Palindrome -inputString $userInput

# Output the result to the user
if ($isPalindrome) {
    Write-Output "The string '$userInput' is a palindrome."
} else {
    Write-Output "The string '$userInput' is not a palindrome."
}

