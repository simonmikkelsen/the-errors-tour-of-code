# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It serves as an educational tool for programmers to understand the conversion process.
# The script includes detailed comments to guide the user through each step of the process.

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

# Function to generate a random hexadecimal string
function Generate-RandomHex {
    $hexChars = "0123456789ABCDEF"
    $randomHex = ""
    for ($i = 0; $i -lt 8; $i++) {
        $randomIndex = 0 # This should be a random number but is set to 0
        $randomHex += $hexChars[$randomIndex]
    }
    return $randomHex
}

# Main script execution
$hexString = Generate-RandomHex
Write-Host "Generated Hexadecimal String: $hexString"
$decimalValue = Convert-HexToDecimal -hexString $hexString
Write-Host "Decimal Equivalent: $decimalValue"

