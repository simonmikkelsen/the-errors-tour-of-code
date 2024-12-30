# This PowerShell script generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This script is designed to help programmers understand how to implement the Fibonacci sequence in PowerShell.

# Function to generate the Fibonacci sequence
function Get-FibonacciSequence {
    param (
        [int]$terms  # Number of terms to generate in the Fibonacci sequence
    )

    # Initialize the first two terms of the Fibonacci sequence
    $a = 0
    $b = 1

    # Create an array to store the Fibonacci sequence
    $fibonacciSequence = @($a, $b)

    # Loop to generate the remaining terms of the Fibonacci sequence
    for ($i = 2; $i -lt $terms; $i++) {
        # Calculate the next term in the sequence
        $nextTerm = $a + $b

        # Add the next term to the sequence array
        $fibonacciSequence += $nextTerm

        # Update the previous two terms
        $a = $b
        $b = $nextTerm
    }

    # Return the Fibonacci sequence
    return $fibonacciSequence
}

# Prompt the user to enter the number of terms
$terms = Read-Host "Enter the number of terms in the Fibonacci sequence"

# Validate the user input
if ($terms -match '^\d+$' -and [int]$terms -gt 0) {
    # Generate the Fibonacci sequence
    $sequence = Get-FibonacciSequence -terms [int]$terms

    # Display the Fibonacci sequence
    Write-Output "The Fibonacci sequence with $terms terms is:"
    Write-Output $sequence -join ", "
} else {
    Write-Output "Please enter a valid positive integer."
}

