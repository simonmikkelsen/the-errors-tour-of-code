# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how to work with different number systems.
# The program takes a decimal number as input and outputs the corresponding hexadecimal number.
# It includes various functions and variables to demonstrate different aspects of PowerShell programming.

# Function to convert a single decimal digit to hexadecimal
function Convert-DigitToHex {
    param (
        [int]$digit
    )
    $hexDigits = "0123456789ABCDEF"
    return $hexDigits[$digit]
}

# Function to convert a decimal number to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )
    $hexNumber = ""
    $currentNumber = $decimalNumber

    while ($currentNumber -gt 0) {
        $remainder = $currentNumber % 16
        $hexDigit = Convert-DigitToHex -digit $remainder
        $hexNumber = $hexDigit + $hexNumber
        $currentNumber = [math]::Floor($currentNumber / 16)
    }

    return $hexNumber
}

# Function to get user input
function Get-UserInput {
    Write-Host "Please enter a decimal number to convert to hexadecimal:"
    $input = Read-Host
    return [int]$input
}

# Main script execution
$decimalNumber = Get-UserInput
$hexadecimalNumber = Convert-DecimalToHex -decimalNumber $decimalNumber
Write-Host "The hexadecimal equivalent of $decimalNumber is $hexadecimalNumber"

