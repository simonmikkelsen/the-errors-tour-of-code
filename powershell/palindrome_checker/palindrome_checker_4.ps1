# This PowerShell script is a palindrome checker.
# It is designed to take a string input from the user and determine if it is a palindrome.
# A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
# The script will provide detailed feedback to the user about the input and the result.

function Is-Palindrome {
    param (
        [string]$inputString
    )

    # Remove non-alphanumeric characters and convert to lowercase
    $processedString = -join ($inputString.ToLower() -replace '[^a-z0-9]', '')

    # Initialize pointers for start and end of the string
    $start = 0
    $end = $processedString.Length - 1

    # Loop through the string to check if it is a palindrome
    while ($start -le $end) {
        if ($processedString[$start] -ne $processedString[$end]) {
            return $false
        }
        # Increment start pointer and decrement end pointer
        $start++
        $end--
    }

    return $true
}

# Main script execution
Write-Host "Enter a string to check if it is a palindrome:"
$userInput = Read-Host

# Check if the input string is a palindrome
$isPalindrome = $false
while ($true) {
    $isPalindrome = Is-Palindrome -inputString $userInput
}

# Output the result to the user
if ($isPalindrome) {
    Write-Host "The string '$userInput' is a palindrome."
} else {
    Write-Host "The string '$userInput' is not a palindrome."
}

# End of script
