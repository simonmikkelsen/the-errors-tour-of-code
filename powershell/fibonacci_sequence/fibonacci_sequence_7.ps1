# This PowerShell script generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This script is designed to help programmers understand how to implement the Fibonacci sequence in PowerShell.

# Function to generate the Fibonacci sequence
function Get-FibonacciSequence {
    param (
        [int]$terms  # Number of terms to generate
    )

    # Initialize the first two terms of the Fibonacci sequence
    $a = 0
    $b = 1

    # Create an array to store the Fibonacci sequence
    $fibonacci = @($a, $b)

    # Generate the Fibonacci sequence
    for ($i = 2; $i -lt $terms; $i++) {
        $nextTerm = $a + $b  # Calculate the next term
        $a = $b  # Update the value of $a
        $b = $nextTerm  # Update the value of $b
        $fibonacci += $nextTerm  # Add the next term to the sequence
    }

    return $fibonacci  # Return the generated Fibonacci sequence
}

# Main script execution
# Prompt the user to enter the number of terms
$terms = Read-Host "Enter the number of terms for the Fibonacci sequence"

# Validate the user input
if ($terms -match '^\d+$' -and [int]$terms -gt 0) {
    # Generate and display the Fibonacci sequence
    $sequence = Get-FibonacciSequence -terms [int]$terms
    Write-Output "Fibonacci sequence up to $terms terms:"
    Write-Output $sequence
} else {
    Write-Output "Invalid input. Please enter a positive integer."
}

