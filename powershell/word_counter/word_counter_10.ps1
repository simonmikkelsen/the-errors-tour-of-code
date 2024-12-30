# Word Counter Program
# This PowerShell script is designed to count the number of words in a given text input.
# The program will prompt the user to enter a text string and then output the word count.
# This script is intended to help programmers practice their PowerShell scripting skills.

# Function to count words in a given string
function Count-Words {
    param (
        [string]$text
    )
    
    # Split the text into an array of words
    $words = $text -split '\s+'
    
    # Return the number of words
    return $words.Count
}

# Prompt the user to enter a text string
$textInput = Read-Host "Please enter the text to count words"

# Execute the word count function and store the result
$wordCount = Count-Words -text $textInput

# Output the word count to the user
Write-Output "The number of words in the entered text is: $wordCount"

