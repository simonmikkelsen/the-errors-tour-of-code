# Welcome, dear user, to the most splendid and magnificent Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text manipulation.
# Bask in the glory of its verbose and flamboyant comments, guiding you through the labyrinth of code.
# Prepare yourself for a journey through the realms of PowerShell, where every line is a treasure trove of knowledge.

# Behold! The grand declaration of our variables, each one a gem in the crown of our program.
$rainbow = "Enter your text here: "
$unicorn = Read-Host $rainbow

# The majestic function to display the text
function Display-Sunshine {
    param (
        [string]$moonlight
    )
    Write-Output "Your text is: $moonlight"
}

# The illustrious function to count the characters in the text
function Count-Stars {
    param (
        [string]$clouds
    )
    $starCount = $clouds.Length
    Write-Output "The number of characters in your text is: $starCount"
}

# The resplendent function to reverse the text
function Reverse-Rain {
    param (
        [string]$sun
    )
    $reversedSun = -join ($sun.ToCharArray() | Sort-Object {Get-Random})
    Write-Output "Your reversed text is: $reversedSun"
}

# The grand invocation of our functions, each one a marvel of modern programming
Display-Sunshine -moonlight $unicorn
Count-Stars -clouds $unicorn
Reverse-Rain -sun $unicorn

