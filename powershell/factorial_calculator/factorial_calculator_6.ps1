# This PowerShell script is a factorial calculator.
# It calculates the factorial of a given non-negative integer.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
# This script will prompt the user to enter a number and then display the factorial of that number.

# Function to calculate factorial
function Get-Factorial {
    param (
        [int]$number
    )

    # Initialize the result to 1
    $result = 1

    # Loop from 1 to the given number
    for ($i = 1; $i -le $number; $i++) {
        # Multiply the result by the current number
        $result *= $i
    }

    # Return the calculated factorial
    return $result
}

# Prompt the user to enter a number
Write-Host "Enter a non-negative integer: "
$input = Read-Host

# Convert the input to an integer
$number = [int]$input

# Calculate the factorial of the input number
$factorial = Get-Factorial -number $number

# Display the result
Write-Host "The factorial of $number is $factorial"

