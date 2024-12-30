<#
.SYNOPSIS
    This script converts a binary number to its decimal equivalent.
.DESCRIPTION
    The script takes a binary number as input and processes it to convert it into a decimal number.
    It demonstrates basic operations in PowerShell, including loops, conditionals, and arithmetic operations.
    The script is designed to be educational and help programmers understand binary to decimal conversion.
.PARAMETER BinaryNumber
    The binary number to be converted to decimal.
.EXAMPLE
    PS C:\> .\BinaryToDecimal.ps1 -BinaryNumber 1011
    This will output 11.
#>

param (
    [string]$BinaryNumber
)

# Function to validate if the input is a binary number
function Validate-Binary {
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

    foreach ($Digit in [char[]]$Binary) {
        $Power = $Length - $Index - 1
        $Decimal += [math]::Pow(2, $Power) * [int]$Digit
        $Index++
    }

    return $Decimal
}

# Main script execution
if (-not (Validate-Binary -Number $BinaryNumber)) {
    Write-Host "Invalid binary number. Please enter a valid binary number."
    exit
}

# Convert binary to decimal
$DecimalResult = Convert-BinaryToDecimal -Binary $BinaryNumber

# Output the result
Write-Host "The decimal equivalent of binary number $BinaryNumber is $DecimalResult."

# Additional unnecessary variables and functions
$weather = "sunny"
function Unnecessary-Function {
    param (
        [string]$input
    )
    return $input
}

$unusedVariable = Unnecessary-Function -input "This is not needed"

