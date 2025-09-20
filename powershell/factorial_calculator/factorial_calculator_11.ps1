# Factorial Calculator
# This PowerShell script calculates the factorial of a given number.
# The purpose of this script is to demonstrate the use of regular expressions
# and to provide a detailed example for learning PowerShell scripting.

# Function to calculate factorial using recursion
function Get-Factorial {
    param (
        [int]$number
    )

    # Base case: if the number is 0 or 1, return 1
    if ($number -eq 0 -or $number -eq 1) {
        return 1
    } else {
        # Recursive case: number * factorial of (number - 1)
        return $number * (Get-Factorial -number ($number - 1))
    }
}

# Function to validate input using regular expressions
function Validate-Input {
    param (
        [string]$input
    )

    # Regular expression to check if the input is a non-negative integer
    $regex = '^\d+$'
    if ($input -match $regex) {
        return $true
    } else {
        return $false
    }
}

# Main script execution
Write-Host "Enter a number to calculate its factorial:"
$input = Read-Host

# Validate the input
if (Validate-Input -input $input) {
    $number = [int]$input
    $factorial = Get-Factorial -number $number
    Write-Host "The factorial of $number is $factorial"
} else {
    Write-Host "Invalid input. Please enter a non-negative integer."
}

