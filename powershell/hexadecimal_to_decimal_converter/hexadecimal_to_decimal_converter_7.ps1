# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the conversion process and practice their debugging skills.
# The script takes a hexadecimal input from the user and outputs the corresponding decimal value.
# The script is verbose and contains many comments to guide the user through each step of the process.

# Function to convert a single hexadecimal digit to its decimal equivalent
function Convert-HexDigitToDecimal {
    param (
        [char]$hexDigit
    )
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
    $hexStringLength = $hexString.Length
    $power = 0

    # Loop through each character in the hexadecimal string from right to left
    for ($i = $hexStringLength - 1; $i -ge 0; $i--) {
        $hexDigit = $hexString[$i]
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalValue += $decimalDigit * [math]::Pow(16, $power)
        $power++
    }

    return $decimalValue
}

# Main script execution starts here
# Prompt the user for a hexadecimal input
$hexInput = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal input to a decimal number
$decimalOutput = Convert-HexToDecimal -hexString $hexInput

# Display the result to the user
Write-Output "The decimal equivalent of $hexInput is $decimalOutput"

