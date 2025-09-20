# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It serves as an educational tool to understand the conversion process and practice PowerShell scripting.
# The script will prompt the user to input a hexadecimal number and then display the corresponding decimal value.

# Function to convert a single hexadecimal digit to its decimal value
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
    $length = $hexString.Length
    $index = 0

    foreach ($char in $hexString.ToCharArray()) {
        $power = $length - $index - 1
        $decimalValue += [math]::Pow(16, $power) * (Convert-HexDigitToDecimal $char)
        $index++
    }

    return $decimalValue
}

# Main script execution starts here
# Prompt the user for a hexadecimal number
$hexInput = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal input to decimal
$decimalOutput = Convert-HexToDecimal $hexInput

# Display the result to the user
Write-Output "The decimal equivalent of hexadecimal $hexInput is $decimalOutput"

