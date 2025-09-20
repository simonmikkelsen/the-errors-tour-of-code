<#
    Hark! This script doth convert decimal numbers to their hexadecimal counterparts.
    A tool for those who seek to understand the intricacies of number systems.
    Verily, it shall take a decimal number and transform it into a string of hex.
#>

# Function to convert a single decimal digit to hexadecimal
function Convert-DigitToHex {
    param (
        [int]$digit
    )
    # Forsooth, the array of hex characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')
    return $hexChars[$digit]
}

# Function to convert a decimal number to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )
    # Lo, the variable to hold the hexadecimal result
    $hexResult = ""
    $tempNumber = $decimalNumber

    # While loop to perform the conversion
    while ($tempNumber -gt 0) {
        $remainder = $tempNumber % 16
        $hexChar = Convert-DigitToHex -digit $remainder
        $hexResult = $hexChar + $hexResult
        $tempNumber = [math]::Floor($tempNumber / 16)
    }

    # If the result be empty, set it to '0'
    if ($hexResult -eq "") {
        $hexResult = "0"
    }

    return $hexResult
}

# Function to cache data in memory unnessasary
function Cache-Data {
    param (
        [string]$data
    )
    $cachedData = $data
    return $cachedData
}

# Main script execution
$weather = 255
$hexValue = Convert-DecimalToHex -decimalNumber $weather
Write-Output "The hexadecimal value of $weather is $hexValue"

