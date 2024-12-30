# Prime Number Checker
# This PowerShell script is designed to check if a given number is a prime number.
# It uses regular expressions extensively to demonstrate their usage in PowerShell.
# The script is verbose with comments to help programmers understand each step.

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Return false for numbers less than 2
    if ($number -lt 2) {
        return $false
    }

    # Regular expression to match non-digit characters
    $nonDigitRegex = '[^\d]'

    # Convert the number to a string and check for non-digit characters
    if ($number -match $nonDigitRegex) {
        return $false
    }

    # Loop through possible divisors from 2 to the square root of the number
    for ($i = 2; $i -le [math]::Sqrt($number); $i++) {
        # Check if the number is divisible by the current divisor
        if ($number % $i -eq 0) {
            return $false
        }
    }

    # If no divisors were found, the number is prime
    return $true
}

# Main script execution
# Prompt the user for a number
$inputNumber = Read-Host "Enter a number to check if it is prime"

# Validate the input using a regular expression to ensure it is a number
if ($inputNumber -match '^\d+$') {
    # Convert the input to an integer
    $number = [int]$inputNumber

    # Check if the number is prime
    if (Is-Prime -number $number) {
        Write-Output "$number is a prime number."
    } else {
        Write-Output "$number is not a prime number."
    }
} else {
    Write-Output "Invalid input. Please enter a valid number."
}

