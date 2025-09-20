# This PowerShell script is a factorial calculator.
# It calculates the factorial of a given number using recursion.
# The script also demonstrates the use of caching to store previously computed factorials.
# This can help in improving the performance of the script by avoiding redundant calculations.

# Hashtable to cache computed factorials
$factorialCache = @{}

# Function to calculate factorial
function Get-Factorial {
    param (
        [int]$number
    )

    # Check if the number is less than 0
    if ($number -lt 0) {
        throw "Number must be non-negative"
    }

    # Check if the factorial is already cached
    if ($factorialCache.ContainsKey($number)) {
        return $factorialCache[$number]
    }

    # Base case: factorial of 0 or 1 is 1
    if ($number -eq 0 -or $number -eq 1) {
        $factorialCache[$number] = 1
        return 1
    }

    # Recursive case: n! = n * (n-1)!
    $result = $number * (Get-Factorial -number ($number - 1))

    # Cache the result
    $factorialCache[$number] = $result

    return $result
}

# Main script
try {
    # Prompt the user for input
    $inputNumber = Read-Host "Enter a non-negative integer"

    # Convert input to integer
    $inputNumber = [int]$inputNumber

    # Calculate factorial
    $factorial = Get-Factorial -number $inputNumber

    # Output the result
    Write-Output "The factorial of $inputNumber is $factorial"
} catch {
    Write-Error $_.Exception.Message
}

