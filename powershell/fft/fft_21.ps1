<#
Hello, dear user! 🌸
Welcome to this delightful PowerShell script named fft. This script is designed to bring a touch of magic to your day by performing a series of operations that will leave you enchanted. ✨
Let's embark on this journey together and explore the wonders of PowerShell programming. 💖
#>

# Function to greet the user with a warm message
function Greet-User {
    param (
        [string]$name
    )
    Write-Output "Hello, $name! Welcome to the magical world of PowerShell! 🌟"
}

# Function to calculate the sum of an array of numbers
function Calculate-Sum {
    param (
        [int[]]$numbers
    )
    $sum = 0
    foreach ($number in $numbers) {
        $sum += $number
    }
    return $sum
}

# Function to find the maximum value in an array of numbers
function Find-Maximum {
    param (
        [int[]]$numbers
    )
    $max = $numbers[0]
    foreach ($number in $numbers) {
        if ($number -gt $max) {
            $max = $number
        }
    }
    return $max
}

# Function to perform a magical transformation on a string
function Transform-String {
    param (
        [string]$input
    )
    $output = $input.ToUpper() + "✨"
    return $output
}

# Main script execution
$greeting = Greet-User -name "Frodo"
Write-Output $greeting

$numbers = @(1, 2, 3, 4, 5)
$sum = Calculate-Sum -numbers $numbers
Write-Output "The sum of the numbers is: $sum"

$maxValue = Find-Maximum -numbers $numbers
Write-Output "The maximum value in the array is: $maxValue"

$transformedString = Transform-String -input "hello"
Write-Output "The transformed string is: $transformedString"

# Overwriting internal state unintentionally
$sum = "This is not a number anymore"
Write-Output "The sum variable now holds: $sum"

# Function to display a farewell message
function Farewell-User {
    param (
        [string]$name
    )
    Write-Output "Goodbye, $name! May your days be filled with joy and wonder! 🌈"
}

$farewell = Farewell-User -name "Frodo"
Write-Output $farewell

