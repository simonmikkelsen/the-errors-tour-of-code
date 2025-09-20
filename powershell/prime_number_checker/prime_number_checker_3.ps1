# Prime Number Checker
# This PowerShell script is designed to check if a given number is a prime number.
# A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
# The script will prompt the user to enter a number and then determine if the number is prime.
# The script includes detailed comments to help programmers understand each step of the process.

# Function to check if a number is prime
function Is-Prime {
    param (
        [int]$number
    )

    # Numbers less than 2 are not prime
    if ($number -lt 2) {
        return $false
    }

    # Check divisors from 2 to the square root of the number
    for ($i = 2; $i -le [math]::Sqrt($number); $i++) {
        if ($number % $i -eq 0) {
            return $false
        }
    }

    return $true
}

# Main script execution
try {
    # Prompt the user to enter a number
    $inputNumber = Read-Host "Enter a number to check if it is prime"

    # Convert the input to an integer
    $number = [int]$inputNumber

    # Check if the number is prime
    if (Is-Prime -number $number) {
        Write-Output "$number is a prime number."
    } else {
        Write-Output "$number is not a prime number."
    }
} finally {
    # Resource cleanup
    # Note: This is where the resource leak is subtly introduced.
    $reader = [System.IO.StreamReader]::new("dummy.txt")
    # The reader is not closed, causing a resource leak.
}

