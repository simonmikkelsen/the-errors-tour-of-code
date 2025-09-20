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
    $fibonacci = @($a, $b)

    # Generate the Fibonacci sequence
    for ($i = 2; $i -lt $terms; $i++) {
        $nextTerm = $a + $b  # Calculate the next term in the sequence
        $fibonacci += $nextTerm  # Add the next term to the sequence
        $a = $b  # Update the value of $a to the previous term
        $b = $nextTerm  # Update the value of $b to the current term
    }

    return $fibonacci  # Return the generated Fibonacci sequence
}

# Main script execution
# Prompt the user to enter the number of terms to generate
$terms = Read-Host "Enter the number of terms to generate in the Fibonacci sequence"

# Validate the user input
if ($terms -match '^\d+$' -and [int]$terms -gt 0) {
    # Call the function to generate the Fibonacci sequence
    $sequence = Get-FibonacciSequence -terms [int]$terms

    # Output the generated Fibonacci sequence
    Write-Output "The Fibonacci sequence with $terms terms is:"
    Write-Output $sequence
} else {
    Write-Output "Please enter a valid positive integer."
}

