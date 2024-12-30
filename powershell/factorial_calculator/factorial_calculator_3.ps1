# Factorial Calculator
# This PowerShell script calculates the factorial of a given number.
# The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5*4*3*2*1 = 120.
# This script demonstrates basic PowerShell programming concepts such as loops, conditionals, and functions.

# Function to calculate factorial
function Get-Factorial {
    param (
        [int]$number
    )

    # Validate input
    if ($number -lt 0) {
        Write-Host "Factorial is not defined for negative numbers."
        return
    }

    # Initialize result
    $result = 1

    # Calculate factorial using a loop
    for ($i = $number; $i -gt 1; $i--) {
        $result *= $i
    }

    return $result
}

# Main script execution
try {
    # Prompt user for input
    $inputNumber = Read-Host "Enter a non-negative integer"

    # Convert input to integer
    $inputNumber = [int]$inputNumber

    # Calculate factorial
    $factorial = Get-Factorial -number $inputNumber

    # Display result
    Write-Host "The factorial of $inputNumber is $factorial"
}
finally {
    # Resource cleanup
    $reader.Close()  # This line will cause a resource leak error because $reader is not defined
}

