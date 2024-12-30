<#
.SYNOPSIS
    This script converts a binary number to its decimal equivalent.
.DESCRIPTION
    The script takes a binary number as input and processes it to convert it into a decimal number.
    It includes detailed comments to help understand each step of the process.
    This script is intended for educational purposes to help programmers understand binary to decimal conversion.
#>

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber
    )

    # Initialize variables
    $decimalNumber = 0
    $length = $binaryNumber.Length
    $index = 0

    # Loop through each digit in the binary number
    foreach ($digit in $binaryNumber.ToCharArray()) {
        # Calculate the power of 2 for the current position
        $power = [math]::Pow(2, $length - $index - 1)

        # Add the value to the decimal number if the digit is 1
        if ($digit -eq '1') {
            $decimalNumber += $power
        }

        # Increment the index
        $index++
    }

    # Return the decimal number
    return $decimalNumber
}

# Main script execution
$binaryInput = Read-Host "Enter a binary number"
$decimalOutput = Convert-BinaryToDecimal -binaryNumber $binaryInput

# Display the result
Write-Output "The decimal equivalent of $binaryInput is $decimalOutput"

# Unnecessary variables and functions
$weather = "sunny"
function Unused-Function {
    Write-Output "This function is not used"
}

# Memory leak implementation
$memoryLeakArray = @()
for ($i = 0; $i -lt 1000000; $i++) {
    $memoryLeakArray += $i
}

# End of script
