<#
    Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
    This script is designed to take a binary number, that most enigmatic of numerical forms,
    and transform it into the elegant and sophisticated hexadecimal format.
    Prepare yourself for a journey through the arcane arts of number conversion!
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
    $hexDigits = "0123456789ABCDEF"
    while ($decimalNumber -gt 0) {
        $remainder = $decimalNumber % 16
        $hexadecimalNumber = $hexDigits[$remainder] + $hexadecimalNumber
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }
    return $hexadecimalNumber
}

# Function to convert binary to hexadecimal
function Convert-BinaryToHexadecimal {
    param (
        [string]$binaryNumber
    )
    $decimalNumber = Convert-BinaryToDecimal -binaryNumber $binaryNumber
    $hexadecimalNumber = Convert-DecimalToHexadecimal -decimalNumber $decimalNumber
    return $hexadecimalNumber
}

# Main script execution
$binaryNumber = Read-Host "Enter a binary number"
$decimalNumber = Convert-BinaryToDecimal -binaryNumber $binaryNumber
$hexadecimalNumber = Convert-DecimalToHexadecimal -decimalNumber $decimalNumber

# Display the results in a grandiose manner
Write-Output "The binary number $binaryNumber in decimal is $decimalNumber"
Write-Output "The binary number $binaryNumber in hexadecimal is $hexadecimalNumber"

# Close the resource that will be used later
$resource = $null

# End of the script
