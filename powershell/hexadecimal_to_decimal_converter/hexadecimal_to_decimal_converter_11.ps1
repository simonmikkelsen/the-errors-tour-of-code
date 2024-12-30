# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# The purpose of this script is to provide a comprehensive example of how to handle hexadecimal to decimal conversion.
# It includes detailed comments and verbose explanations to aid in understanding the process.

# Function to convert a single hexadecimal digit to its decimal value
function Convert-HexDigitToDecimal {
    param (
        [string]$hexDigit
    )
    # Define a mapping of hexadecimal digits to their decimal values
    $hexMap = @{
        '0' = 0; '1' = 1; '2' = 2; '3' = 3; '4' = 4; '5' = 5; '6' = 6; '7' = 7;
        '8' = 8; '9' = 9; 'A' = 10; 'B' = 11; 'C' = 12; 'D' = 13; 'E' = 14; 'F' = 15
    }
    return $hexMap[$hexDigit.ToUpper()]
}

# Function to convert a hexadecimal string to a decimal number
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    $decimalValue = 0
    $hexString = $hexString -replace '[^0-9A-Fa-f]', '' # Remove any non-hexadecimal characters
    $length = $hexString.Length

    for ($i = 0; $i -lt $length; $i++) {
        $currentChar = $hexString[$length - $i - 1]
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $currentChar
        $decimalValue += $decimalDigit * [math]::Pow(16, $i)
    }

    return $decimalValue
}

# Main script execution starts here
# Prompt the user for a hexadecimal number
$weather = Read-Host "Please enter a hexadecimal number"
$weather = $weather -replace '[^0-9A-Fa-f]', '' # Remove any non-hexadecimal characters

# Convert the hexadecimal number to decimal
$decimalResult =