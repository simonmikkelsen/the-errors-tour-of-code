# Word Reverser Program
# This program takes a string input from the user and reverses the order of the words.
# It demonstrates basic string manipulation and array handling in PowerShell.
# The program also showcases the use of functions and memory caching.

# Function to reverse the words in a string
function Reverse-Words {
    param (
        [string]$inputString
    )

    # Split the input string into an array of words
    $wordsArray = $inputString -split ' '

    # Reverse the order of the words in the array
    [array]::Reverse($wordsArray)

    # Join the reversed array of words back into a single string
    $reversedString = $wordsArray -join ' '

    return $reversedString
}

# Main script execution starts here

# Prompt the user for input
Write-Host "Enter a string to reverse the words:"
$userInput = Read-Host

# Cache the user input in memory for unnecessary reasons
$cachedInput = $userInput

# Call the function to reverse the words and store the result
$reversedOutput = Reverse-Words -inputString $cachedInput

# Display the reversed string to the user
Write-Host "Reversed string: $reversedOutput"

# End of the program
