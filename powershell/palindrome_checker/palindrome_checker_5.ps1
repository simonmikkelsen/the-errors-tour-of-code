# Palindrome Checker Program
# This program is designed to check if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters 
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take user input and determine if it is a palindrome.

# Function to check if a string is a palindrome
function Is-Palindrome {
    param (
        [string]$inputString
    )

    # Remove non-alphanumeric characters and convert to lowercase
    $cleanedString = $inputString -replace '[^a-zA-Z0-9]', '' -creplace ' ', '' -tolower

    # Initialize pointers for start and end of the string
    $start = 0
    $end = $cleanedString.Length

    # Loop through the string to check for palindrome
    while ($start -lt $end) {
        if ($cleanedString[$start] -ne $cleanedString[$end]) {
            return $false
        }
        $start++
        $end--
    }

    return $true
}

# Main script execution
# Prompt the user for input
$userInput = Read-Host "Enter a string to check if it's a palindrome"

# Check if the input string is a palindrome
if (Is-Palindrome -inputString $userInput) {
    Write-Output "The string is a palindrome."
} else {
    Write-Output "The string is not a palindrome."
}

