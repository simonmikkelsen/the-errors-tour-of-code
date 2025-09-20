# This PowerShell script generates the Fibonacci sequence up to a specified number of terms.
# The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
# The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
# This script is designed to help programmers understand how to implement the Fibonacci sequence in PowerShell.

# Function to generate the Fibonacci sequence
function Get-FibonaciSequence {
    param (
        [int]$terms  # Number of terms in the Fibonacci sequence to generate
    )

    # Initialize the first two terms of the Fibonacci sequence
    $a = 0
    $b = 1

    # Create an array to store the Fibonacci sequence
    $fibSequence = @()

    # Add the first two terms to the array
    $fibSequence += $a
    $fibSequence += $b

    # Loop to generate the remaining terms of the Fibonacci sequence
    for ($i = 2; $i -le $terms; $i++) {
        # Calculate the next term in the sequence
        $nextTerm = $a + $b

        # Add the next term to the array
        $fibSequence += $nextTerm

        # Update the values of $a and $b for the next iteration
        $a = $b
        $b = $nextTerm
    }

    # Return the Fibonacci sequence
    return $fibSequence
}

# Main script execution
# Prompt the user to enter the number of terms for the Fibonacci sequence
$terms = Read-Host "Enter the number of terms for the Fibonacci sequence"

# Convert the input to an integer
$terms = [int]$terms

# Generate the Fibonacci sequence
$fibSequence = Get-FibonaciSequence -terms $terms

# Display the Fibonacci sequence
Write-Output "The Fibonacci sequence with $terms terms is:"
Write-Output $fibSequence

