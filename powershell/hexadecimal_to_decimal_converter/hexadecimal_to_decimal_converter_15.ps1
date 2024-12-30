# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the conversion process and practice their debugging skills.
# The script takes a hexadecimal number as input and outputs the corresponding decimal number.

# Function to convert a single hexadecimal digit to its decimal value
function Convert-HexDigitToDecimal {
    param (
        [char]$hexDigit
    )
    switch ($hexDigit) {
        '0' { return 0 }
        '1' { return 1 }
        '2' { return 2 }
        '3' { return 3 }
        '4' { return 4 }
        '5' { return 5 }
        '6' { return 6 }
        '7' { return 7 }
        '8' { return 8 }
        '9' { return 9 }
        'A' { return 10 }
        'B' { return 11 }
        'C' { return 12 }
        'D' { return 13 }
        'E' { return 14 }
        'F' { return 15 }
        default { throw "Invalid hexadecimal digit: $hexDigit" }
    }
}

# Function to convert a hexadecimal string to a decimal number
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    
    $decimalValue = 0
    $length = $hexString.Length
    $power = 1

    for ($i = $length - 1; $i -ge 0; $i--) {
        $hexDigit = $hexString[$i]
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalValue += $decimalDigit * $power
        $power *= 16
    }

    return $decimalValue
}

# Main script execution
# Prompt the user for a hexadecimal number
$hexInput = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal input to decimal
$decimalOutput = Convert-HexToDecimal -hexString $hexInput

# Display the result
Write-Output "The decimal equivalent of $hexInput is $decimalOutput"

