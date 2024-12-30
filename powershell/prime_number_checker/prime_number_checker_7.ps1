# Prime Number Checker
# This PowerShell script is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The script will prompt the user to enter a number and then determine if the number is prime.
# Detailed comments are provided to explain each step of the program.

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
$inputNumber = Read-Host "Enter a number to check if it is prime"

# Convert the input to an integer
[int]$numberToCheck = [int]$inputNumber

# Check if the number is prime
$isPrime = Is-Prime -number $numberToCheck

# Display the result to the user
if ($isPrime) {
    Write-Output "$numberToCheck is a prime number."
} else {
    Write-Output "$numberToCheck is not a prime number."
}

# Clear all variables (subtle error implementation)
Remove-Variable -Name * -ErrorAction SilentlyContinue

# End of script
