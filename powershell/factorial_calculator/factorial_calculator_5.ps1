# This PowerShell script is a factorial calculator.
# It is designed to calculate the factorial of a given number.
# The factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
# This script will prompt the user to enter a number and then calculate the factorial of that number.

# Function to calculate factorial
function Get-Factoral {
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

    # Return the final result
    return $result
}

# Prompt the user to enter a number
$inputNumber = Read-Host "Please enter a number to calculate its factorial"

# Convert the input to an integer
[int]$number = [int]$inputNumber

# Calculate the factorial using the Get-Factoral function
$factorial = Get-Factoral -number $number

# Display the result
Write-Host "The factorial of $number is $factorial"

