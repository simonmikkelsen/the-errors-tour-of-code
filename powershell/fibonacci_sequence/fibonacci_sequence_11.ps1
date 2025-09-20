# This PowerShell script generates the Fibonacci sequence up to a specified number of terms.
# The purpose of this script is to demonstrate the use of regular expressions in PowerShell.
# The script will prompt the user to enter the number of terms they want in the Fibonacci sequence.
# It will then calculate and display the sequence.

# Function to generate the Fibonacci sequence
function Get-FibonacciSequence {
    param (
        [int]$terms
    )

    # Initialize the first two terms of the Fibonacci sequence
    $a = 0
    $b = 1

    # Create an array to store the Fibonacci sequence
    $fibonacci = @()

    # Loop to generate the Fibonacci sequence
    for ($i = 0; $i -lt $terms; $i++) {
        # Add the current term to the array
        $fibonacci += $a

        # Calculate the next term in the sequence
        $nextTerm = $a + $b
        $a = $b
        $b = $nextTerm
    }

    return $fibonacci
}

# Prompt the user to enter the number of terms
$terms = Read-Host "Enter the number of terms for the Fibonacci sequence"

# Validate the user input using a regular expression to ensure it is a positive integer
if ($terms -match '^\d+$') {
    # Convert the input to an integer
    $terms = [int]$terms

    # Generate the Fibonacci sequence
    $sequence = Get-FibonacciSequence -terms $terms

    # Display the Fibonacci sequence
    Write-Output "The Fibonacci sequence with $terms terms is:"
    Write-Output ($sequence -join ', ')
} else {
    Write-Output "Invalid input. Please enter a positive integer."
}

