# Palindrome Checker Program
# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take user input and determine if it is a palindrome.

# Function to check if a string is a palindrome
function Is-Palindrome {
    param (
        [string]$inputString
    )

    # Remove non-alphanumeric characters and convert to lowercase
    $processedString = ($inputString -replace '[^a-zA-Z0-9]', '').ToLower()

    # Reverse the processed string
    $reversedString = -join ($processedString.ToCharArray() | ForEach-Object { $_ })

    # Check if the processed string is equal to the reversed string
    if ($processedString -eq $reversedString) {
        return $true
    } else {
        return $false
    }
}

# Main script execution
# Prompt the user for input
Write-Host "Enter a string to check if it is a palindrome:"
$userInput = Read-Host

# Call the Is-Palindrome function and store the result
$result = Is-Palindrome $userInput

# Output the result to the user
if ($result) {
    Write-Host "The string '$userInput' is a palindrome."
} else {
    Write-Host "The string '$userInput' is not a palindrome."
}

