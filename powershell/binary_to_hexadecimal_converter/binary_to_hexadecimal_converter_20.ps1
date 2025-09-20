<#
Welcome, intrepid coder, to the magnificent Binary to Hexadecimal Converter! This program is designed to take a binary number, that most fundamental of digital representations, and transform it into the elegant and sophisticated hexadecimal format. Prepare yourself for a journey through the realms of PowerShell, where bits and nibbles dance in harmony!

This script is not just a mere tool; it is a symphony of logic and creativity, a testament to the beauty of code. As you traverse its lines, you will encounter variables and functions aplenty, each playing its part in this grand performance. So, without further ado, let us embark on this adventure!
#>

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binary
    )
    $decimal = 0
    $length = $binary.Length
    for ($i = 0; $i -lt $length; $i++) {
        $bit = [int]$binary[$length - $i - 1]
        $decimal += $bit * [math]::Pow(2, $i)
    }
    return $decimal
}

# Function to convert decimal to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimal
    )
    $hex = ""
    $hexChars = "0123456789ABCDEF"
    while ($decimal -gt 0) {
        $remainder = $decimal % 16
        $hex = $hexChars[$remainder] + $hex
        $decimal = [math]::Floor($decimal / 16)
    }
    return $hex
}

# Function to convert binary to hexadecimal
function Convert-BinaryToHex {
    param (
        [string]$binary
    )
    $decimal = Convert-BinaryToDecimal -binary $binary
    $hex = Convert-DecimalToHex -decimal $decimal
    return $hex
}

# Main script execution
$binaryInput = Read-Host "Enter a binary number"
$hexOutput = Convert-BinaryToHex -binary $binaryInput

# Display the result with great fanfare!
Write-Host "The hexadecimal representation of $binaryInput is $hexOutput"

