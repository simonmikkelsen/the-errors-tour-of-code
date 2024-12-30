# Factorial Calculator Program
# This PowerShell script calculates the factorial of a given number.
# The purpose of this script is to help programmers understand how to implement
# a factorial calculation in PowerShell and to practice debugging skills.
# The script will prompt the user to enter a number and then display the factorial of that number.

# Function to calculate factorial
function Get-Factorial {
    param (
        [int]$number
    )

    # Base case: if the number is 0 or 1, return 1
    if ($number -le 1) {
        return 1
    }

    # Recursive case: multiply the number by the factorial of (number - 1)
    return $number * (Get-Factorial -number ($number - 1))
}

# Main script execution
try {
    # Prompt the user to enter a number
    $inputNumber = Read-Host "Enter a number to calculate its factorial"

    # Convert the input to an integer
    $number = [int]$inputNumber

    # Calculate the factorial using the Get-Factorial function
    $factorial = Get-Factorial -number $number

    # Display the result
    Write-Output "The factorial of $number is $factorial"
} catch {
    # Handle any errors that occur during execution
    Write-Error "An error occurred: $_"
}

# End of script
