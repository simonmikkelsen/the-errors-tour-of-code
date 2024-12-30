# This PowerShell script generates the Fibonacci sequence up to a specified number of terms.
# The purpose of this script is to help programmers understand how to implement the Fibonacci sequence in PowerShell.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.

# Global variable to store the Fibonacci sequence
$global:fibonacciSequence = @()

# Function to generate the Fibonacci sequence
function Generate-Fibonacci {
    param (
        [int]$terms
    )

    # Initialize the first two terms of the Fibonacci sequence
    $global:fibonacciSequence = @(0, 1)

    # Loop to generate the remaining terms of the sequence
    for ($i = 2; $i -lt $terms; $i++) {
        $nextTerm = $global:fibonacciSequence[$i - 1] + $global:fibonacciSequence[$i - 2]
        $global:fibonacciSequence += $nextTerm
    }
}

# Function to display the Fibonacci sequence
function Display-Fibonacci {
    param (
        [int]$terms
    )

    # Generate the Fibonacci sequence
    Generate-Fibonacci -terms $terms

    # Output the Fibonacci sequence
    Write-Output "The first $terms terms of the Fibonacci sequence are:"
    foreach ($term in $global:fibonacciSequence) {
        Write-Output $term
    }
}

# Main script execution
# Number of terms to generate in the Fibonacci sequence
$terms = 10

# Display the Fibonacci sequence
Display-Fibonacci -terms $terms

