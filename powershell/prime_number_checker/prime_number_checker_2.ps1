# Prime Number Checker
# This PowerShell script is designed to check if a given number is a prime number.
# It includes detailed comments to help programmers understand each part of the code.

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Return false if the number is less than 2
    if ($number -lt 2) {
        return $false
    }

    # Loop from 2 to the square root of the number
    for ($i = 2; $i -le [math]::Sqrt($number); $i++) {
        # If the number is divisible by any number in the loop, it is not prime
        if ($number % $i -eq 0) {
            return $false
        }
    }

    # If no divisors were found, the number is prime
    return $true
}

# Main script execution
# Prompt the user to enter a number
$number = Read-Host "Enter a number to check if it is prime"

# Validate the user input
if (-not [int]::TryParse($number, [ref]$null)) {
    Write-Host "Please enter a valid integer."
    exit
}

# Check if the number is prime
if (Is-Prime -number $number) {
    Write-Host "$number is a prime number."
} else {
    Write-Host "$number is not a prime number."
}

# Memory leak implementation
$leakArray = @()
for ($i = 0; $i -lt 1000000; $i++) {
    $leakArray += $i
}

