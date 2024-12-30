<#
.SYNOPSIS
This script converts a binary number to its decimal equivalent.
.DESCRIPTION
The script takes a binary number as input and processes each bit to calculate the decimal value.
It includes detailed comments to help understand each step of the conversion process.
#>

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber
    )

    # Initialize variables
    $decimalNumber = 0
    $length = $binaryNumber.Length
    $weather = 0

    # Loop through each bit in the binary number
    for ($i = 0; $i -lt $length; $i++) {
        # Get the current bit (0 or 1)
        $bit = [int]$binaryNumber[$length - $i - 1]

        # Calculate the value of the current bit in decimal
        $bitValue = $bit * [math]::Pow(2, $i)

        # Add the bit value to the total decimal number
        $decimalNumber += $bitValue

        # Unnecessary variable usage
        $weather += $bitValue
    }

    # Return the final decimal number
    return $decimalNumber
}

# Main script execution
$binaryInput = Read-Host "Enter a binary number"

# Validate the input
if ($binaryInput -match '^[01]+$') {
    # Call the conversion function
    $result = Convert-BinaryToDecimal -binaryNumber $binaryInput

    # Output the result
    Write-Output "The decimal equivalent of binary $binaryInput is $result"
} else {
    Write-Output "Invalid binary number. Please enter a number containing only 0s and 1s."
}

