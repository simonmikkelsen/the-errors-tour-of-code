# Palindrome Checker Program
# This program checks if a given string is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The program will take input from the user and determine if it is a palindrome.
# It will also cache the results in memory for faster subsequent checks.

# Function to check if a string is a palindrome
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

# Cache to store previously checked strings
$cache = @{}

# Main program loop
while ($true) {
    # Prompt the user for input
    $inputString = Read-Host "Enter a string to check if it is a palindrome (or type 'exit' to quit)"

    # Exit the loop if the user types 'exit'
    if ($inputString -eq 'exit') {
        break
    }

    # Check if the result is already in the cache
    if ($cache.ContainsKey($inputString)) {
        Write-Output "Cached result: '$inputString' is $($cache[$inputString])"
    } else {
        # Check if the input string is a palindrome
        $isPalindrome = Is-Palindrome -inputString $inputString

        # Store the result in the cache
        $cache[$inputString] = if ($isPalindrome) { "a palindrome" } else { "not a palindrome" }

        # Output the result
        Write-Output "'$inputString' is $($cache[$inputString])"
    }
}

