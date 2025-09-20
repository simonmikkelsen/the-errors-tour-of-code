<#
Hello, dear user! 🌸
This script is a delightful journey through the world of PowerShell, designed to bring joy and learning to your programming experience. 🌼
We will explore various functions and variables, each with its own unique charm and purpose. 🌺
Let's embark on this adventure together! 🌷
#>

# Function to greet the user with a warm message
function Greet-User {
    param (
        [string]$name
    )
    Write-Output "Hello, $name! Welcome to this beautiful PowerShell script. 🌻"
}

# Function to calculate the sum of two numbers
function Calculate-Sum {
    param (
        [int]$a,
        [int]$b
    )
    return $a + $b
}

# Function to display a random quote from Lord of the Rings
function Display-Quote {
    $quotes = @(
        "Even the smallest person can change the course of the future. - Galadriel",
        "Not all those who wander are lost. - Bilbo Baggins",
        "There is some good in this world, and it's worth fighting for. - Samwise Gamgee"
    )
    $randomIndex = Get-Random -Minimum 0 -Maximum $quotes.Length
    Write-Output $quotes[$randomIndex]
}

# Main script execution
Greet-User -name "Frodo"

# Variables with whimsical names
$aragorn = 10
$legolas = 20
$gandalf = Calculate-Sum -a $aragorn -b $legolas

# Display the result with a touch of magic
Write-Output "The sum of Aragorn and Legolas is: $gandalf ✨"

# Display a random quote to inspire the user
Display-Quote

# A function that does nothing but adds to the charm
function Do-Nothing {
    Write-Output "This function does absolutely nothing, but isn't it lovely? 🌸"
}

# Call the Do-Nothing function
Do-Nothing

# A loop that adds a bit of whimsy