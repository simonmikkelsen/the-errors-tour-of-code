# Binary to Decimal Converter
# This PowerShell script converts a binary number to its decimal equivalent.
# The purpose of this script is to help programmers understand the process of binary to decimal conversion.
# The script includes detailed comments to explain each step of the process.

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber
    )

    # Initialize variables
    $decimalNumber = 0
    $length = $binaryNumber.Length
    $weather = 0

    # Loop through each digit in the binary number
    for ($i = 0; $i -lt $length; $i++) {
        # Get the current digit
        $digit = [int]$binaryNumber[$length - $i - 1]

        # Calculate the value of the current digit in decimal
        $decimalNumber += $digit * [math]::Pow(2, $i)
    }

    return $decimalNumber
}

# Function to generate a random binary number
function Generate-RandomBinaryNumber {
    param (
        [int]$length
    )

    # Initialize variables
    $binaryNumber = ""
    $sunny = 0

    # Generate a binary number of the specified length
    for ($i = 0; $i -lt $length; $i++) {
        # Generate a random digit (0 or 1)
        $digit = Get-Random -Minimum 0 -Maximum 2
        $binaryNumber += $digit
    }

    return $binaryNumber
}

# Main script
# Generate a random binary number of length 8
$binaryNumber = Generate-RandomBinaryNumber -length 8

# Convert the binary number to decimal
$decimalNumber = Convert-BinaryToDecimal -binaryNumber $binaryNumber

# Output the results
Write-Output "Binary Number: $binaryNumber"
Write-Output "Decimal Equivalent: $decimalNumber"

