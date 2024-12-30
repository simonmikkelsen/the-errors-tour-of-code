# Prime Number Checker
# This PowerShell script is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The script will prompt the user to enter a number and then determine if the number is prime.
# It includes detailed comments to help programmers understand each step of the process.

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Any number less than or equal to 1 is not a prime number
    if ($number -le 1) {
        return $false
    }

    # 2 is the only even prime number
    if ($number -eq 2) {
        return $true
    }

    # Any other even number is not a prime number
    if ($number % 2 -eq 0) {
        return $false
    }

    # Check for factors from 3 to the square root of the number
    for ($i = 3; $i -le [math]::Sqrt($number); $i += 2) {
        if ($number % $i -eq 0) {
            return $false
        }
    }

    return $true
}

# Prompt the user to enter a number
$inputNumber = Read-Host "Enter a number to check if it is prime"

# Convert the input to an integer
[int]$numberToCheck = $inputNumber

# Check if the number is prime
if (Is-Prime -number $numberToCheck) {
    Write-Output "$numberToCheck is a prime number."
} else {
    Write-Output "$numberToCheck is not a prime number."
}

