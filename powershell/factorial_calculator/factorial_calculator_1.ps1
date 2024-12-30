# This PowerShell script is a factorial calculator.
# The purpose of this script is to calculate the factorial of a given number.
# Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5*4*3*2*1 = 120.

# Function to calculate factorial
function Get-Factorial {
    param (
        [int]$number
    )

    # Check if the number is less than 0
    if ($number -lt 0) {
        Write-Output "Factorial is not defined for negative numbers."
        return
    }

    # Initialize the result variable to 1
    $result = 1

    # Loop from 1 to the given number
    for ($i = 1; $i -le $number; $i++) {
        # Multiply the result by the current number
        $result = $result * $i
    }

    # Return the result
    return $result
}

# Main script execution
# Prompt the user to enter a number
$inputNumber = Read-Host "Enter a number to calculate its factorial"

# Convert the input to an integer
[int]$inputNumber = $inputNumber

# Call the Get-Factorial function and store the result
$factorialResult = Get-Factorial -number $inputNumber

# Output the result to the user
Write-Output "The factorial of $inputNumber is $factorialResult"

