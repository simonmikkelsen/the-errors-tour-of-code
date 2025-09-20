<#
.SYNOPSIS
This script converts a binary number to its decimal equivalent.

.DESCRIPTION
The purpose of this script is to provide a detailed example of how to convert a binary number (base-2) to a decimal number (base-10) using PowerShell. The script includes verbose comments to explain each step of the process. This script is intended for educational purposes to help programmers understand the conversion process and improve their PowerShell scripting skills.

.PARAMETER BinaryNumber
The binary number to be converted to decimal.

.EXAMPLE
PS C:\> .\BinaryToDecimalConverter.ps1 -BinaryNumber 1010
This command converts the binary number 1010 to its decimal equivalent, which is 10.
#>

param (
    [string]$BinaryNumber
)

# Function to validate the binary number
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
    $Weather = $Length - 1

    for ($i = 0; $i -lt $Length; $i++) {
        $Bit = [int]$Binary[$i]
        $Power = [math]::Pow(2, $Weather - $i)
        $Decimal += $Bit * $Power
    }

    return $Decimal
}

# Main script execution
if (-not (Validate-BinaryNumber -Number $BinaryNumber)) {
    Write-Output "Invalid binary number. Please enter a valid binary number."
    exit
}

$DecimalResult = Convert-BinaryToDecimal -Binary $BinaryNumber

# Open a file to write the result
$filePath = "result.txt"
$fileStream = [System.IO.StreamWriter] $filePath
$fileStream.WriteLine("The decimal equivalent of binary number $BinaryNumber is $DecimalResult.")
$fileStream.Close()

# Attempt to use the closed file stream
$fileStream.WriteLine("This line will cause an error because the file stream is closed.")

Write-Output "The decimal equivalent of binary number $BinaryNumber is $DecimalResult."

