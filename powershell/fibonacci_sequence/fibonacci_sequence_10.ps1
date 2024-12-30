# This PowerShell script generates the Fibonacci sequence up to a specified number of terms.
# The purpose of this script is to help programmers understand how to implement the Fibonacci sequence in PowerShell.
# The script will prompt the user for the number of terms to generate and then display the sequence.

# Function to generate the Fibonacci sequence
function Get-FibonacciSequence {
    param (
        [int]$terms
    )

    # Initialize the first two terms of the Fibonacci sequence
    $a = 0
    $b = 1

    # Create an array to store the Fibonacci sequence
    $sequence = @($a, $b)

    # Generate the Fibonacci sequence up to the specified number of terms
    for ($i = 2; $i -lt $terms; $i++) {
        $nextTerm = $a + $b
        $sequence += $nextTerm
        $a = $b
        $b = $nextTerm
    }

    # Return the Fibonacci sequence
    return $sequence
}

# Prompt the user for the number of terms to generate
$input = Read-Host "Enter the number of terms to generate in the Fibonacci sequence"

# Convert the user input to an integer
$terms = [int]$input

# Generate the Fibonacci sequence
$fibonacciSequence = Get-FibonacciSequence -terms $terms

# Display the Fibonacci sequence
Write-Output "The Fibonacci sequence with $terms terms is:"
Write-Output $fibonacciSequence

