# This PowerShell script is a prime number checker.
# It takes an integer input from the user and checks if the number is prime.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Any number less than or equal to 1 is not prime
    if ($number -le 1) {
        return $false
    }

    # Check for factors from 2 to the square root of the number
    for ($i = 2; $i -le [math]::Sqrt($number); $i++) {
        if ($number % $i -eq 0) {
            return $false
        }
    }

    return $true
}

# Main script execution
# Prompt the user for input
Write-Host "Enter a number to check if it is prime:"
$userInput = Read-Host

# Convert the input to an integer
$number = [int]$userInput

# Check if the number is prime and display the result
if (Is-Prime -number $number) {
    Write-Host "$number is a prime number."
} else {
    Write-Host "$number is not a prime number."
}

