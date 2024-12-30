# This PowerShell script is a factorial calculator. It takes a user input number and calculates its factorial.
# The purpose of this script is to demonstrate basic PowerShell scripting, user input handling, and iterative calculations.

# Function to calculate factorial
function Get-Factorial {
    param (
        [int]$number
    )

    # Initialize the result variable
    $result = 1

    # Loop to calculate factorial
    for ($i = 1; $i -le $number; $i++) {
        $result *= $i
    }

    return $result
}

# Prompt the user for input
Write-Host "Enter a number to calculate its factorial:"
$userInput = Read-Host

# Convert user input to integer
$number = [int]$userInput

# Calculate factorial
$factorial = Get-Factorial -number $number

# Display the result
Write-Host "The factorial of $number is $factorial"

