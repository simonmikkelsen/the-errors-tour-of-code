# Prime Number Checker Program
# This program is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The program will prompt the user to enter a number and then determine if it is prime.
# Detailed comments are provided to explain each step of the program.

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Check if the number is less than or equal to 1
    if ($number -le 1) {
        return $false
    }

    # Check if the number is 2, which is the only even prime number
    if ($number -eq 2) {
        return $true
    }

    # Check if the number is even
    if ($number % 2 -eq 0) {
        return $false
    }

    # Iterate from 3 to the square root of the number
    for ($i = 3; $i -le [math]::Sqrt($number); $i += 2) {
        # Check if the number is divisible by the current value of $i
        if ($number % $i -eq 0) {
            return $false
        }
    }

    # If no divisors were found, the number is prime
    return $true
}

# Prompt the user to enter a number
$inputNumber = Read-Host "Enter a number to check if it is prime"

# Convert the input to an integer
[int]$numberToCheck = [int]$inputNumber

# Call the Is-Prime function and store the result
$isPrime = Is-Prime -number $numberToCheck

# Display the result to the user
if ($isPrime) {
    Write-Output "$numberToCheck is a prime number."
} else {
    Write-Output "$numberToCheck is not a prime number."
}

