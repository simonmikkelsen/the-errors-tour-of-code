# Prime Number Checker
# This PowerShell script is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The script will prompt the user to enter a number and then determine if the number is prime.
# The script uses a global variable to store the number to be checked.

# Global variable to store the number to be checked
$global:numberToCheck = 0

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Return false if the number is less than or equal to 1
    if ($number -le 1) {
        return $false
    }

    # Loop from 2 to the square root of the number
    for ($i = 2; $i -le [math]::Sqrt($number); $i++) {
        # If the number is divisible by any number in the loop, it is not prime
        if ($number % $i -eq 0) {
            return $false
        }
    }

    # If no divisors were found, the number is prime
    return $true
}

# Prompt the user to enter a number
$global:numberToCheck = Read-Host "Enter a number to check if it is prime"

# Check if the number is prime and display the result
if (Is-Prime -number $global:numberToCheck) {
    Write-Output "$global:numberToCheck is a prime number."
} else {
    Write-Output "$global:numberToCheck is not a prime number."
}

