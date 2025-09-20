# This PowerShell script is a factorial calculator.
# The purpose of this script is to calculate the factorial of a given number.
# Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, factorial of 5 is 5*4*3*2*1 which is 120.

# Global variable to store the result of the factorial calculation
$global:factorialResult = 1

# Function to calculate factorial
function Calculate-Factorial {
    param (
        [int]$number
    )

    # Check if the number is less than 0
    if ($number -lt 0) {
        Write-Output "Factorial is not defined for negative numbers."
        return
    }

    # Initialize the global variable
    $global:factorialResult = 1

    # Loop to calculate factorial
    for ($i = 1; $i -le $number; $i++) {
        $global:factorialResult *= $i
    }

    # Output the result
    Write-Output "The factorial of $number is $global:factorialResult"
}

# Main script execution
# Prompt the user to enter a number
$number = Read-Host "Enter a number to calculate its factorial"

# Convert the input to an integer
$number = [int]$number

# Call the function to calculate factorial
Calculate-Factorial -number $number

# End of the script
