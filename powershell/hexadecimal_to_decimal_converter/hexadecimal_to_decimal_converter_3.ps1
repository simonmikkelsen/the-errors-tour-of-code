# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# The script takes user input, processes it, and outputs the decimal value.
# It is a useful tool for programmers who need to work with different numeral systems.
# The script is written with verbose comments to help understand each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
function Convert-HexDigitToDecimal {
    param (
        [char]$hexDigit
    )
    # Dictionary to map hexadecimal digits to decimal values
    $hexMap = @{
        '0' = 0; '1' = 1; '2' = 2; '3' = 3; '4' = 4;
        '5' = 5; '6' = 6; '7' = 7; '8' = 8; '9' = 9;
        'A' = 10; 'B' = 11; 'C' = 12; 'D' = 13; 'E' = 14; 'F' = 15
    }
    return $hexMap[$hexDigit.ToUpper()]
}

# Function to convert a hexadecimal string to a decimal number
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    $decimalValue = 0
    $length = $hexString.Length
    $power = 0

    # Loop through each character in the hexadecimal string
    for ($i = $length - 1; $i -ge 0; $i--) {
        $hexDigit = $hexString[$i]
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalValue += $decimalDigit * [math]::Pow(16, $power)
        $power++
    }

    return $decimalValue
}

# Main script execution starts here
# Prompt the user for a hexadecimal number
$hexInput = Read-Host "Please enter a hexadecimal number"
$decimalOutput = Convert-HexToDecimal -hexString $hexInput

# Output the decimal equivalent of the hexadecimal number
Write-Output "The decimal equivalent of $hexInput is $decimalOutput"

