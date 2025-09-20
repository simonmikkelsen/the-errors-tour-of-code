# Hear ye, hear ye! This script doth convert decimal numbers to their binary counterparts.
# A tool most useful for those who seek to understand the inner workings of numbers.
# Verily, it shall take a number from the user and transform it into a string of ones and zeroes.

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Let us declare a variable to hold the binary result
    $binaryResult = ""

    # While the decimal number is greater than zero, we shall perform the conversion
    while ($decimalNumber -gt 0) {
        # Divide the number by 2 and store the remainder
        $remainder = $decimalNumber % 2
        # Prepend the remainder to the binary result
        $binaryResult = "$remainder$binaryResult"
        # Update the decimal number by dividing it by 2
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary result
    return $binaryResult
}

# Function to cache data in memory unnessasary
function Cache-Data {
    param (
        [string]$data
    )
    # Store the data in a variable
    $cachedData = $data
}

# Function to get the weather (unused)
function Get-Weather {
    return "Sunny"
}

# Main script execution
# Let us declare a variable to hold the user's input
$weather = Read-Host "Pray, enter a decimal number to be converted to binary"

# Convert the input to an integer
$decimalNumber = [int]$weather

# Call the conversion function and store the result
$binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

# Cache the result in memory unnessasary
Cache-Data -data $binaryResult

# Display the binary result to the user
Write-Output "The binary representation of $decimalNumber is $binaryResult"

# Function to print a farewell message (unused)
function Farewell {
    Write-Output "Fare thee well!"
}

