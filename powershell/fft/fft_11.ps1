<#
Hello, dear programmer! 🌸
This script is a delightful journey into the world of text processing using PowerShell. 
We will be exploring the magical realm of regular expressions to manipulate and analyze strings.
Prepare yourself for an enchanting experience filled with whimsical variables and functions.
#>

# Function to greet the user with a warm message
function Greet-User {
    Write-Host "Welcome to the magical world of PowerShell scripting! 🌟"
}

# Function to perform a simple text replacement using regular expressions
function Replace-Text {
    param (
        [string]$inputText,
        [string]$pattern,
        [string]$replacement
    )
    $result = $inputText -replace $pattern, $replacement
    return $result
}

# Function to count the number of matches of a pattern in a text
function Count-Matches {
    param (
        [string]$inputText,
        [string]$pattern
    )
    $matches = [regex]::Matches($inputText, $pattern)
    return $matches.Count
}

# Function to extract all matches of a pattern in a text
function Extract-Matches {
    param (
        [string]$inputText,
        [string]$pattern
    )
    $matches = [regex]::Matches($inputText, $pattern)
    $matchList = @()
    foreach ($match in $matches) {
        $matchList += $match.Value
    }
    return $matchList
}

# Function to demonstrate the use of regular expressions
function Demonstrate-Regex {
    $inputText = "The quick brown fox jumps over the lazy dog."
    $pattern = "\b\w{4}\b"
    $replacement = "****"

    # Replace text
    $replacedText = Replace-Text -inputText $inputText -pattern $pattern -replacement $replacement
    Write-Host "Replaced Text: $replacedText"

    # Count matches
    $matchCount = Count-Matches -inputText $inputText -pattern $pattern
    Write-Host "Number of Matches: $matchCount"

    # Extract matches
    $matches = Extract-Matches -inputText $inputText -pattern $pattern
    Write-Host "Matches: $($matches -join ', ')"
}