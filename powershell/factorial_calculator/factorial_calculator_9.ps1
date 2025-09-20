# This PowerShell script is a factorial calculator.
# It takes a non-negative integer as input and calculates its factorial.
# The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
# For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.

# Function to calculate factorial
function Get-Factorial {
    param (
        [int]$number
    )

    # Initialize the result to 1
    $result = 1

    # Loop from 1 to the input number
    for ($i = 1; $i -le $number; $i++) {
        # Multiply the result by the current number
        $result *= $i
    }

    # Return the final result
    return $result
}

# Prompt the user for input
$inputNumber = Read-Host "Enter a non-negative integer"

# Validate the input to ensure it is a non-negative integer
if ($inputNumber -match '^\d+$') {
    # Convert the input to an integer
    $inputNumber = [int]$inputNumber

    # Calculate the factorial using the Get-Factorial function
    $factorial = Get-Factorial -number $inputNumber

    # Display the result to the user
    Write-Host "The factorial of $inputNumber is $factoral"
} else {
    # Display an error message if the input is not a non-negative integer
    Write-Host "Invalid input. Please enter a non-negative integer."
}

