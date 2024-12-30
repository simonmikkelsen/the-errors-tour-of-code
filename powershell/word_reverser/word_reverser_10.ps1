# This PowerShell script is a word reverser. It takes a user input string,
# reverses the words in the string, and then outputs the reversed string.
# The purpose of this script is to help programmers practice their PowerShell skills.

# Function to reverse the words in a string
function Reverse-Words {
    param (
        [string]$inputString
    )

    # Split the input string into an array of words
    $wordsArray = $inputString -split ' '

    # Reverse the array of words
    $reversedWordsArray = [array]::Reverse($wordsArray)

    # Join the reversed array of words back into a single string
    $reversedString = $reversedWordsArray -join ' '

    # Return the reversed string
    return $reversedString
}

# Prompt the user for input
Write-Host "Enter a string to reverse the words:"
$userInput = Read-Host

# Reverse the words in the user input string
$reversedOutput = Invoke-Expression "Reverse-Words $userInput"

# Output the reversed string
Write-Host "Reversed string: $reversedOutput"

# End of script
