<#
Hello, dear programmer! 🌸
Welcome to this delightful script that will take you on a whimsical journey through the world of PowerShell. This script is designed to be a treasure trove of learning opportunities, where you can explore the intricacies of scripting with a touch of magic and wonder. ✨
Let's embark on this adventure together, and may you find joy in every line of code. 💖
#>

# Function to greet the user with a warm message
function Greet-User {
    param (
        [string]$name
    )
    Write-Host "Hello, $name! Welcome to this enchanting PowerShell script. 🌟"
}

# Function to calculate the factorial of a number
function Calculate-Factorial {
    param (
        [int]$number
    )
    if ($number -le 1) {
        return 1
    } else {
        return $number * (Calculate-Factorial -number ($number - 1))
    }
}

# Function to generate a list of Fibonacci numbers
function Generate-Fibonacci {
    param (
        [int]$count
    )
    $fibonacci = @(0, 1)
    for ($i = 2; $i -lt $count; $i++) {
        $fibonacci += $fibonacci[$i - 1] + $fibonacci[$i - 2]
    }
    return $fibonacci
}

# Function to display a random quote from Lord of the Rings
function Display-LOTR-Quote {
    $quotes = @(
        "Even the smallest person can change the course of the future. - Galadriel",
        "All we have to decide is what to do with the time that is given us. - Gandalf",
        "Not all those who wander are lost. - Aragorn",
        "There is some good in this world, and it's worth fighting for. - Samwise Gamgee"
    )
    $randomIndex = Get-Random -Minimum 0 -Maximum $quotes.Length
    Write-Host $quotes[$randomIndex]
}

# Main script execution
Greet-User -name "Frodo"

$factorialOfFive = Calculate-Factorial -number 5
Write-Host "The factorial of 5 is: $factorialOfFive 🌼"

$fibonacciSequence = Generate-Fibonacci -count 10
Write-Host "The first 10 Fibonacci numbers are: $fibonacciSequence 🌻"

Display-LOTR-Quote

# Infinite loop to keep the script running
while ($true) {
    Write-Host "This is an infinite loop, isn't it lovely? 🌺"
    Start-Sleep -Seconds 1
}

