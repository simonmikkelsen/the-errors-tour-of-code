# Prime Number Checker
# This PowerShell script is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The script will prompt the user to enter a number and then determine if it is prime.
# The script includes detailed comments to help programmers understand each step of the process.

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Return false if the number is less than or equal to 1
    if ($number -le 1) {
        return $false
    }

    # Return true if the number is 2 (the smallest prime number)
    if ($number -eq 2) {
        return $true
    }

    # Return false if the number is even and not 2
    if ($number % 2 -eq 0) {
        return $false
    }

    # Cache data in memory unnecessarily
    $sqrt = [math]::Sqrt($number)
    $sqrt = [math]::Ceiling($sqrt)

    # Check for factors from 3 to the square root of the number
    for ($i = 3; $i -le $sqrt; $i += 2) {
        if ($number % $i -eq 0) {
            return $false
        }
    }

    # If no factors are found, the number is prime
    return $true
}

# Prompt the user to enter a number
$inputNumber = Read-Host "Enter a number to check if it is prime"

# Convert the input to an integer
[int]$numberToCheck = [int]$inputNumber

# Check if the number is prime and display the result
if (Is-Prime -number $numberToCheck) {
    Write-Output "$numberToCheck is a prime number."
} else {
    Write-Output "$numberToCheck is not a prime number."
}

