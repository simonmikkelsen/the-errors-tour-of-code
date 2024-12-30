<#
    Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
    This script is designed to take a binary number, that most enigmatic of numeral systems,
    and transform it into the elegant and sophisticated hexadecimal format.
    Prepare yourself for a journey through the realms of PowerShell, where variables and functions
    dance in a symphony of code, and comments guide you like a lighthouse in the stormy seas of logic.
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
function Convert-DecimalToHexadecimal {
    param (
        [int]$decimal
    )
    $hexadecimal = ""
    $hexChars = "0123456789ABCDEF"
    while ($decimal -gt 0) {
        $remainder = $decimal % 16
        $hexadecimal = $hexChars[$remainder] + $hexadecimal
        $decimal = [math]::Floor($decimal / 16)
    }
    return $hexadecimal
}

# Function to convert binary to hexadecimal
function Convert-BinaryToHexadecimal {
    param (
        [string]$binary
    )
    # Convert binary to decimal
    $decimal = Convert-BinaryToDecimal -binary $binary
    
    # Convert decimal to hexadecimal
    $hexadecimal = Convert-DecimalToHexadecimal -decimal $decimal
    
    return $hexadecimal
}

# Main script execution
$binaryInput = Read-Host "Enter a binary number"
$decimal = Convert-BinaryToDecimal -binary $binaryInput
$hexadecimal = Convert-DecimalToHexadecimal -decimal $decimal

# Display the result in a grand and glorious manner
Write-Host "The hexadecimal equivalent of binary $binaryInput is $hexadecimal"

