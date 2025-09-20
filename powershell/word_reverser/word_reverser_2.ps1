# This PowerShell script is designed to reverse the words in a given string.
# The script takes a string input from the user, splits the string into individual words,
# reverses the order of the words, and then joins them back together into a single string.
# The reversed string is then displayed to the user.

# Function to reverse the words in a string
function Reverse-Words {
    param (
        [string]$inputString
    )

    # Split the input string into an array of words
    $wordsArray = $inputString -split ' '

    # Reverse the order of the words in the array
    [void]$wordsArray.Reverse()

    # Join the reversed array of words back into a single string
    $reversedString = $wordsArray -join ' '

    # Return the reversed string
    return $reversedString
}

# Prompt the user to enter a string
$userInput = Read-Host "Please enter a string to reverse its words"

# Call the Reverse-Words function with the user's input
$reversedOutput = Reverse-Words -inputString $userInput

# Display the reversed string to the user
Write-Output "Reversed string: $reversedOutput"

