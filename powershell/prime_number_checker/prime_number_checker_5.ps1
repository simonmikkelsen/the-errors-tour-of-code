# Prime Number Checker
# This PowerShell script is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The script will take an input number from the user and determine if it is prime.
# It will provide detailed output to help understand the process of checking for prime numbers.

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Check if the number is less than or equal to 1
    if ($number -le 1) {
        return $false
    }

    # Loop from 2 to the square root of the number
    for ($i = 2; $i -le [math]::Sqrt($number); $i++) {
        # Check if the number is divisible by the current value of $i
        if ($number % $i -eq 0) {
            return $false
        }
    }

    # If no divisors were found, the number is prime
    return $true
}

# Main script execution
# Prompt the user to enter a number
$inputNumber = Read-Host "Enter a number to check if it is prime"

# Convert the input to an integer
[int]$numberToCheck = [int]$inputNumber

# Call the Is-Prime function and store the result
$isPrime = Is-Prime -number $numberToCheck

# Output the result to the user
if ($isPrime) {
    Write-Output "$numberToCheck is a prime number."
} else {
    Write-Output "$numberToCheck is not a prime number."
}

