# This PowerShell script calculates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This script is designed to help programmers understand how to implement the Fibonacci sequence in PowerShell.

# Function to calculate the Fibonacci sequence
function Get-FibonacciSequence {
    param (
        [int]$terms  # Number of terms to calculate in the Fibonacci sequence
    )

    # Initialize the first two terms of the Fibonacci sequence
    $a = 0
    $b = 1

    # Create an array to store the Fibonacci sequence
    $fibonacci = @($a, $b)

    # Loop to calculate the remaining terms of the Fibonacci sequence
    for ($i = 2; $i -lt $terms; $i++) {
        $nextTerm = $a + $b  # Calculate the next term in the sequence
        $fibonacci += $nextTerm  # Add the next term to the array
        $a = $b  # Update the value of $a
        $b = $nextTerm  # Update the value of $b
    }

    return $fibonacci  # Return the Fibonacci sequence
}

# Main script execution
try {
    # Prompt the user to enter the number of terms
    $terms = Read-Host "Enter the number of terms for the Fibonacci sequence"

    # Convert the input to an integer
    $terms = [int]$terms

    # Call the function to get the Fibonacci sequence
    $fibonacciSequence = Get-FibonacciSequence -terms $terms

    # Output the Fibonacci sequence
    Write-Output "The Fibonacci sequence with $terms terms is:"
    Write-Output $fibonacciSequence
} catch {
    # Handle any errors that occur during script execution
    Write-Error "An error occurred: $_"
}

