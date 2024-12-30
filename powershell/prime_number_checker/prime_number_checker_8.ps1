# Prime Number Checker Program
# This program is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will prompt the user to enter a number and then determine if it is prime.
# It includes detailed comments to help programmers understand the flow and logic of the code.

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

# Prompt the user to enter a number
Write-Host "Enter a number to check if it is prime:"
$inputNumber = Read-Host

# Convert the input to an integer
[int]$numberToCheck = $inputNumber

# Call the Is-Prime function and store the result
$isPrime = Is-Prime -number $numberToCheck

# Output the result to the user
if ($isPrime) {
    Write-Host "$numberToCheck is a prime number."
} else {
    Write-Host "$numberToCheck is not a prime number."
}

