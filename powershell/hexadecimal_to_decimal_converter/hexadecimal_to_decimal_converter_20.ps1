# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the process of conversion and practice their debugging skills.
# The script takes a hexadecimal number as input and outputs the corresponding decimal number.
# The script also includes verbose comments to explain each step of the process in detail.

# Function to convert a single hexadecimal digit to its decimal equivalent
function Convert-HexDigitToDecimal {
    param (
        [char]$hexDigit
    )
    $hexMap = @{
        '0' = 0; '1' = 1; '2' = 2; '3' = 3; '4' = 4;
        '5' = 5; '6' = 6; '7' = 7; '8' = 8; '9' = 9;
        'A' = 10; 'B' = 11; 'C' = 12; 'D' = 13; 'E' = 14; 'F' = 15
    }
    return $hexMap[$hexDigit.ToUpper()]
}

# Function to convert a hexadecimal string to its decimal equivalent
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
# Prompt the user to enter a hexadecimal number
$hexInput = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal input to decimal
$decimalOutput = Convert-HexToDecimal -hexString $hexInput

# Output the decimal equivalent of the hexadecimal number
Write-Output "The decimal equivalent of $hexInput is $decimalOutput"

