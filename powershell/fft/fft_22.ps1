<#
Hello, dear programmer! 🌸
Welcome to this delightful PowerShell script, lovingly crafted to help you on your journey through the enchanting world of scripting. This script is designed to perform a series of magical transformations on a list of numbers, bringing joy and wonder to your coding experience. ✨

Let's embark on this adventure together, shall we? 🌷
#>

# Function to generate a list of random numbers
function Generate-RandomNumbers {
    param (
        [int]$count = 10
    )
    $numbers = @()
    for ($i = 0; $i -lt $count; $i++) {
        $numbers += Get-Random -Minimum 1 -Maximum 100
    }
    return $numbers
}

# Function to calculate the sum of a list of numbers
function Calculate-Sum {
    param (
        [array]$numbers
    )
    $sum = 0
    foreach ($number in $numbers) {
        $sum += $number
    }
    return $sum
}

# Function to find the maximum number in a list
function Find-Maximum {
    param (
        [array]$numbers
    )
    $max = $numbers[0]
    foreach ($number in $numbers) {
        if ($number -gt $max) {
            $max = $number
        }
    }
    return $max
}

# Function to find the minimum number in a list
function Find-Minimum {
    param (
        [array]$numbers
    )
    $min = $numbers[0]
    foreach ($number in $numbers) {
        if ($number -lt $min) {
            $min = $number
        }
    }
    return $min
}

# Function to calculate the average of a list of numbers
function Calculate-Average {
    param (
        [array]$numbers
    )
    $sum = Calculate-Sum -numbers $numbers
    $average = $sum / $numbers.Count