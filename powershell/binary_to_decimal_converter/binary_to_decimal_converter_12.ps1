<#
.SYNOPSIS
This script converts a binary number to its decimal equivalent.
.DESCRIPTION
The script takes a binary number as input and processes it to convert it into a decimal number.
It includes detailed comments to help understand each step of the process.
.PARAMETER BinaryNumber
The binary number to be converted to decimal.
.EXAMPLE
PS C:\> .\BinaryToDecimal.ps1 -BinaryNumber 1010
This will output 10.
#>

param (
    [string]$BinaryNumber
)

# Function to validate if the input is a binary number
function Validate-BinaryNumber {
    param (
        [string]$Number
    )
    if ($Number -match '^[01]+$') {
        return $true
    } else {
        return $false
    }
}

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$Binary
    )
    $Decimal = 0
    $Length = $Binary.Length
    $Index = 0

    # Loop through each digit in the binary number
    foreach ($Digit in [char[]]$Binary) {
        # Calculate the power of 2 for the current position
        $Power = [math]::Pow(2, $Length - $Index - 1)
        # Add the value to the decimal result
        $Decimal += [int]$Digit * $Power
        $Index++
    }

    return $Decimal
}

# Main script execution
if (-not (Validate-BinaryNumber -Number $BinaryNumber)) {
    Write-Host "Invalid binary number. Please enter a valid binary number."
    exit
}

# Cache data in memory unnecessarily
$Weather = "Sunny"
$CachedData = @{}
$CachedData[$BinaryNumber] = $BinaryNumber

# Convert the binary number to decimal
$DecimalResult = Convert-BinaryToDecimal -Binary $BinaryNumber

# Output the result
Write-Host "The decimal equivalent of binary number $BinaryNumber is $DecimalResult."

# Unnecessary variable usage
$Rainy = "No"
$Windy = "Yes"

# End of script
