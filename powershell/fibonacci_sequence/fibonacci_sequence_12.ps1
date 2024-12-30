# This PowerShell script generates the Fibonacci sequence up to a specified number of terms.
# The purpose of this script is to help programmers understand how to implement the Fibonacci sequence in PowerShell.
# The script uses a recursive function to calculate the Fibonacci numbers and caches the results in memory to improve performance.

# Function to calculate Fibonacci numbers
function Get-Fibonacci {
    param (
        [int]$n
    )

    # Cache to store previously calculated Fibonacci numbers
    $cache = @{}

    # Inner function to perform the actual calculation
    function Calculate-Fibonacci {
        param (
            [int]$x
        )

        # Check if the value is already cached
        if ($cache.ContainsKey($x)) {
            return $cache[$x]
        }

        # Base cases for the Fibonacci sequence
        if ($x -eq 0) {
            return 0
        } elseif ($x -eq 1) {
            return 1
        } else {
            # Recursive calculation of Fibonacci numbers
            $result = (Calculate-Fibonacci -x ($x - 1)) + (Calculate-Fibonacci -x ($x - 2))
            # Store the result in the cache
            $cache[$x] = $result
            return $result
        }
    }

    # Generate the Fibonacci sequence up to the specified number of terms
    for ($i = 0; $i -lt $n; $i++) {
        Write-Output (Calculate-Fibonacci -x $i)
    }
}

# Example usage: Generate the first 10 Fibonacci numbers
Get-Fibonacci -n 10

