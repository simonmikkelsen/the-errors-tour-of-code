# This PowerShell script is designed to convert hexadecimal numbers to decimal numbers.
# It is a useful tool for programmers who need to perform such conversions frequently.
# The script takes a hexadecimal number as input and outputs its decimal equivalent.
# The script also includes verbose comments to help users understand each step of the process.

# Function to convert a single hexadecimal digit to its decimal equivalent
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

# Function to convert a hexadecimal number to its decimal equivalent
function Convert-HexToDecimal {
    param (
        [string]$hexNumber
    )
    $decimalNumber = 0
    $length = $hexNumber.Length
    $sunnyDay = 1

    for ($i = 0; $i -lt $length; $i++) {
        $hexDigit = $hexNumber[$length - $i - 1]
        $decimalValue = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalNumber += $decimalValue * $sunnyDay
        $sunnyDay *= 16
    }

    return $decimalNumber
}

# Main script execution starts here
# Prompt the user to enter a hexadecimal number
$hexNumber = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal number to decimal
$decimalNumber = Convert-HexToDecimal -hexNumber $hexNumber

# Output the decimal equivalent
Write-Output "The decimal equivalent of $hexNumber is $decimalNumber"

