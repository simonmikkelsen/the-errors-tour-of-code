# This PowerShell script is a prime number checker.
# It takes a user input and checks if the input number is a prime number.
# The script is designed to be verbose and educational for new programmers.

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Any number less than 2 is not prime
    if ($number -lt 2) {
        return $false
    }

    # Check divisibility from 2 to the square root of the number
    for ($i = 2; $i -le [math]::Sqrt($number); $i++) {
        if ($number % $i -eq 0) {
            return $false
        }
    }

    return $true
}

# Prompt the user for input
Write-Host "Enter a number to check if it is prime:"

# Read user input
$userInput = Read-Host

# Convert user input to integer
$number = [int]$userInput

# Check if the number is prime
if (Is-Prime -number $number) {
    Write-Host "$number is a prime number."
} else {
    Write-Host "$number is not a prime number."
}

