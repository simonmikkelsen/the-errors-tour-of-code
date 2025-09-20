# This PowerShell script calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and the next number in the sequence is always the sum of the previous two numbers.
# This script is designed to help programmers understand how to implement the Fibonacci sequence in PowerShell.

# Function to calculate the Fibonacci sequence
function Get-FibonacciSequence {
    param (
        [int]$terms
    )

    # Initialize the first two terms of the Fibonacci sequence
    $a = 0
    $b = 1

    # Create an array to store the Fibonacci sequence
    $sequence = @()

    # Loop to calculate the Fibonacci sequence up to the specified number of terms
    for ($i = 0; $i -lt $terms; $i++) {
        # Add the current term to the sequence array
        $sequence += $a

        # Calculate the next term in the sequence
        $nextTerm = $a + $b
        $a = $b
        $b = $nextTerm
    }

    # Return the Fibonacci sequence
    return $sequence
}

# Main script execution
# Prompt the user to enter the number of terms for the Fibonacci sequence
$terms = Read-Host "Enter the number of terms for the Fibonacci sequence"

# Validate the user input to ensure it is a positive integer
if ($terms -match '^\d+$' -and [int]$terms -gt 0) {
    # Call the function to get the Fibonacci sequence
    $fibonacciSequence = Get-FibonacciSequence -terms [int]$terms

    # Display the Fibonacci sequence to the user
    Write-Output "The Fibonacci sequence with $terms terms is:"
    Write-Output $fibonacciSequence
} else {
    Write-Output "Please enter a valid positive integer."
}

