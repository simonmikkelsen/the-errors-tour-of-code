# This script is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The script is designed to help programmers understand the conversion process.
# It includes verbose comments to explain each step in detail.

# Function to convert a single hexadecimal digit to decimal
function Convert-HexDigitToDecimal {
    param (
        [char]$hexDigit
    )
    # Initialize a variable to store the decimal value
    $decimalValue = 0

    # Check if the hex digit is a number
    if ($hexDigit -match '[0-9]') {
        $decimalValue = [int]$hexDigit
    }
    # Check if the hex digit is a letter (A-F)
    elseif ($hexDigit -match '[A-Fa-f]') {
        $decimalValue = [int][char]::ToUpper($hexDigit) - [int]'A' + 10
    }

    return $decimalValue
}

# Function to convert a hexadecimal string to decimal
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    # Initialize a variable to store the decimal result
    $decimalResult = 0
    $length = $hexString.Length

    # Loop through each character in the hexadecimal string
    for ($i = 0; $i -lt $length; $i++) {
        # Get the current hex digit
        $hexDigit = $hexString[$i]
        # Convert the hex digit to decimal
        $decimalValue = Convert-HexDigitToDecimal -hexDigit $hexDigit
        # Calculate the power of 16 for the current position
        $power = [math]::Pow(16, $length - $i - 1)
        # Add the decimal value to the result
        $decimalResult += $decimalValue * $power
    }

    return $decimalResult
}

# Main script execution starts here
# Prompt the user for a hexadecimal number
$hexInput = Read-Host "Enter a hexadecimal number"

# Convert the hexadecimal input to decimal
$decimalOutput = Convert-HexToDecimal -hexString $hexInput

# Display the result
Write-Output "The decimal equivalent of $hexInput is $decimalOutput"

