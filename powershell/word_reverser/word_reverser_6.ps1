# This PowerShell script is a word reverser. It takes a string input from the user,
# splits the string into individual words, reverses each word, and then joins them
# back together into a single string. The purpose of this script is to demonstrate
# basic string manipulation and user input handling in PowerShell.

# Function to reverse a single word
function Reverse-Word {
    param (
        [string]$word
    )
    # Convert the word to a character array, reverse the array, and join it back into a string
    return -join ([char[]]$word | ForEach-Object { $_ })[-1..0]
}

# Prompt the user for input
$userInput = Read-Host "Enter a string to reverse each word"

# Split the input string into an array of words
$words = $userInput -split ' '

# Initialize an array to hold the reversed words
$reversedWords = @()

# Loop through each word in the array
foreach ($word in $words) {
    # Reverse the word and add it to the reversedWords array
    $reversedWords += Reverse-Word -word $word
}

# Join the reversed words back into a single string
$reversedString = -join (' ' + $reversedWords)

# Output the reversed string
Write-Output $reversedString

