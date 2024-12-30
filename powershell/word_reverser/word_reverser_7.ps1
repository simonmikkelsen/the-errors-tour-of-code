# This PowerShell script is a word reverser. It takes a string input from the user,
# reverses the order of the characters in each word, and then outputs the reversed string.
# The purpose of this script is to help programmers practice their PowerShell skills.

# Function to reverse a single word
function Reverse-Word {
    param (
        [string]$word
    )
    # Convert the word to a character array, reverse it, and then join it back into a string
    return -join ($word.ToCharArray() | ForEach-Object { $_ })[-1..0]
}

# Main script execution starts here

# Prompt the user to enter a string
[string]$inputString = Read-Host "Enter a string to reverse each word"

# Split the input string into an array of words
[string[]]$words = $inputString -split ' '

# Initialize an empty array to hold the reversed words
[string[]]$reversedWords = @()

# Loop through each word in the array
foreach ($word in $words) {
    # Reverse the word and add it to the reversedWords array
    $reversedWords += Reverse-Word -word $word
}

# Join the reversed words back into a single string with spaces in between
[string]$outputString = $reversedWords -join ' '

# Output the reversed string
Write-Output $outputString

