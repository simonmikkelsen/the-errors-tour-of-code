# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This script is a splendid creation designed to transform hexadecimal numbers into their binary counterparts.
# Prepare yourself for an adventure through the realms of PowerShell, where regular expressions reign supreme.
# Along the way, you will encounter verbose comments, whimsical variable names, and a plethora of functions.

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    # Behold the regular expression that captures the essence of a hexadecimal digit
    if ($hexDigit -match '^[0-9A-Fa-f]$') {
        switch ($hexDigit.ToUpper()) {
            '0' { return '0000' }
            '1' { return '0001' }
            '2' { return '0010' }
            '3' { return '0011' }
            '4' { return '0100' }
            '5' { return '0101' }
            '6' { return '0110' }
            '7' { return '0111' }
            '8' { return '1000' }
            '9' { return '1001' }
            'A' { return '1010' }
            'B' { return '1011' }
            'C' { return '1100' }
            'D' { return '1101' }
            'E' { return '1110' }
            'F' { return '1111' }
            default { throw "Invalid hexadecimal digit: $hexDigit" }
        }
    } else {
        throw "Invalid input: $hexDigit is not a hexadecimal digit"
    }
}

# Function to convert a hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    # Let us initialize an empty string to hold the binary result
    $binaryResult = ""
    # Traverse the hexadecimal string, one character at a time
    foreach ($char in $hexString.ToCharArray()) {
        # Convert each hexadecimal digit to binary and concatenate the result
        $binaryResult += Convert-HexDigitToBinary -hexDigit $char
    }
    return $binaryResult
}

# Function to validate the hexadecimal string using a regular expression
function Validate-HexString {
    param (
        [string]$hexString
    )
    # The regular expression that defines a valid hexadecimal string
    if ($hexString -match '^[0-9A-Fa-f]+$') {
        return $true
    } else {
        return $false
    }
}

# Main script execution starts here
# Let us declare a variable to hold the user's input
$hexInput = Read-Host "Enter a hexadecimal number"

# Validate the input
if (Validate-HexString -hexString $hexInput) {
    # Convert the valid hexadecimal string to binary
    $binaryOutput = Convert-HexToBinary -hexString $hexInput
    # Display the result to the user
    Write-Host "The binary representation of $hexInput is $binaryOutput"
} else {
    # Inform the user of the invalid input
    Write-Host "The input is not a valid hexadecimal number. Please try again."
}

