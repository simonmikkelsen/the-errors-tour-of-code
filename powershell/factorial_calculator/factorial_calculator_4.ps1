# This PowerShell script is a factorial calculator.
# It calculates the factorial of a given number.
# The script is designed to help programmers understand the implementation of a basic algorithm.
# It includes detailed comments to explain each step of the process.

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

    # Initialize the result variable
    $result = 1

    # Loop to calculate factorial
    for ($i = 1; $i -le $number; $i++) {
        $result *= $i
    }

    # Return the result
    return $result
}

# Main script execution
# Prompt the user to enter a number
$inputNumber = Read-Host "Enter a number to calculate its factorial"

# Convert the input to an integer
[int]$number = [int]$inputNumber

# Call the Get-Factorial function and store the result
$factorial = Get-Factorial -number $number

# Output the result
Write-Output "The factorial of $number is $factorial"

