# Palindrome Checker Program
# This program is designed to check if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters
# that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program uses regular expressions to remove non-alphanumeric characters
# and to compare the processed string with its reverse.

# Function to check if a string is a palindrome
function Is-Palindrome {
    param (
        [string]$inputString
    )

    # Convert the input string to lowercase to ensure case insensitivity
    $inputString = $inputString.ToLower()

    # Use regular expression to remove all non-alphanumeric characters
    $processedString = $inputString -replace '[^a-z0-9]', ''

    # Reverse the processed string
    $reversedString = -join ([char[]]$processedString | ForEach-Object { $_ })[-1..0]

    # Compare the processed string with its reverse
    if ($processedString -eq $reversedString) {
        return $true
    } else {
        return $false
    }
}

# Example usage of the Is-Palindrome function
$testString = "A man, a plan, a canal, Panama"
if (Is-Palindrome -inputString $testString) {
    Write-Output "The string '$testString' is a palindrome."
} else {
    Write-Output "The string '$testString' is not a palindrome."
}

