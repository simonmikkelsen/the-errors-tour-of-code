# This PowerShell script calculates the factorial of a given number.
# The purpose of this script is to demonstrate how to implement a factorial calculator in PowerShell.
# The script prompts the user to enter a number and then calculates the factorial of that number.
# Factorial of a number n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5*4*3*2*1 = 120.

# Function to calculate factorial
function Get-Factorial {
    param (
        [int]$number
    )

    # Initialize the result variable
    $result = 1

    # Loop from 1 to the given number
    for ($i = 1; $i -le $number; $i++) {
        # Multiply the result by the current number
        $result *= $i
    }

    return $result
}

# Prompt the user to enter a number
Write-Host "Enter a number to calculate its factorial:"
$inputNumber = Read-Host

# Convert the input to an integer
[int]$number = $inputNumber

# Call the Get-Factorial function and store the result
$factorial = Get-Factorial -number $number

# Display the result
Write-Host "The factorial of $number is $factorial"

