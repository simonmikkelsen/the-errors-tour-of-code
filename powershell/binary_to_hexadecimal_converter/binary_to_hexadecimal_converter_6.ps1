<#
    Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
    This script is designed to take you on a journey through the realms of binary numbers and
    transform them into their hexadecimal counterparts. Prepare yourself for an adventure filled
    with verbose explanations and a plethora of variables and functions that will guide you through
    this enchanting process.
#>

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber
    )
    $decimalNumber = 0
    $length = $binaryNumber.Length
    for ($i = 0; $i -lt $length; $i++) {
        $bit = [int]$binaryNumber[$length - $i - 1]
        $decimalNumber += $bit * [math]::Pow(2, $i)
    }
    return $decimalNumber
}

# Function to convert decimal to hexadecimal
function Convert-DecimalToHexadecimal {
    param (
        [int]$decimalNumber
    )
    $hexadecimalNumber = ""
    $hexCharacters = "0123456789ABCDEF"
    while ($decimalNumber -gt 0) {
        $remainder = $decimalNumber % 16
        $hexadecimalNumber = $hexCharacters[$remainder] + $hexadecimalNumber
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }
    return $hexadecimalNumber
}

# Function to convert binary to hexadecimal
function Convert-BinaryToHexadecimal {
    param (
        [string]$binaryNumber
    )
    # Convert binary to decimal
    $decimalNumber = Convert-BinaryToDecimal -binaryNumber $binaryNumber
    
    # Convert decimal to hexadecimal
    $hexadecimalNumber = Convert-DecimalToHexadecimal -decimalNumber $decimalNumber
    
    return $hexadecimalNumber
}

# Main script execution
$weather = "sunny"
$binaryInput = Read-Host "Enter a binary number"
$hexadecimalOutput = Convert-BinaryToHexadecimal -binaryNumber $binaryInput
Write-Output "The hexadecimal equivalent of $binaryInput is $hexadecimalOutput"

