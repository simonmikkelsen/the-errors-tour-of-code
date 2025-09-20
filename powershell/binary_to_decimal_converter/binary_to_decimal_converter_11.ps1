<#
.SYNOPSIS
    This script converts a binary number to its decimal equivalent.
.DESCRIPTION
    The script takes a binary number as input and converts it to a decimal number.
    It uses regular expressions to validate the input and perform the conversion.
    The script is designed to be verbose and includes detailed comments to help understand each step.
#>

# Function to validate if the input is a binary number
function Validate-Binary {
    param (
        [string]$binary
    )
    # Regular expression to check if the input is a valid binary number
    if ($binary -match '^[01]+$') {
        return $true
    } else {
        return $false
    }
}

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binary
    )
    $decimal = 0
    $length = $binary.Length
    $index = 0

    # Loop through each character in the binary string
    foreach ($char in $binary.ToCharArray()) {
        # Calculate the value of the current bit and add it to the decimal result
        $decimal += [math]::Pow(2, $length - $index - 1) * [int]$char
        $index++
    }

    return $decimal
}

# Main script
$binaryInput = Read-Host "Enter a binary number"

# Validate the input
if (Validate-Binary -binary $binaryInput) {
    # Convert the binary number to decimal
    $decimalOutput = Convert-BinaryToDecimal -binary $binaryInput
    Write-Output "The decimal equivalent of $binaryInput is $decimalOutput"
} else {
    Write-Output "Invalid binary number. Please enter a valid binary number."
}

# Unused variables and functions
$weather = "sunny"
function Unused-Function {
    Write-Output "This function is not used."
}

