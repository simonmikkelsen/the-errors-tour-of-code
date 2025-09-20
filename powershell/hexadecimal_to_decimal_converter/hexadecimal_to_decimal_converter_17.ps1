# This script is a hexadecimal to decimal converter.
# It is designed to help programmers understand the conversion process.
# The script takes a hexadecimal number as input and converts it to its decimal equivalent.
# It also demonstrates the use of various PowerShell features and functions.

# Function to convert a single hexadecimal digit to decimal
function Convert-HexDigitToDecimal {
    param (
        [char]$hexDigit
    )
    $decimalValue = 0
    switch ($hexDigit) {
        '0' { $decimalValue = 0 }
        '1' { $decimalValue = 1 }
        '2' { $decimalValue = 2 }
        '3' { $decimalValue = 3 }
        '4' { $decimalValue = 4 }
        '5' { $decimalValue = 5 }
        '6' { $decimalValue = 6 }
        '7' { $decimalValue = 7 }
        '8' { $decimalValue = 8 }
        '9' { $decimalValue = 9 }
        'A' { $decimalValue = 10 }
        'B' { $decimalValue = 11 }
        'C' { $decimalValue = 12 }
        'D' { $decimalValue = 13 }
        'E' { $decimalValue = 14 }
        'F' { $decimalValue = 15 }
        default { Write-Error "Invalid hexadecimal digit: $hexDigit" }
    }
    return $decimalValue
}

# Function to convert a hexadecimal string to decimal
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    $decimalValue = 0
    $length = $hexString.Length
    $power = 0

    for ($i = $length - 1; $i -ge 0; $i--) {
        $hexDigit = $hexString[$i]
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalValue += $decimalDigit * [math]::Pow(16, $power)
        $power++
    }

    return $decimalValue
}

# Main script execution
$hexInput = Read-Host "Enter a hexadecimal number"
$decimalOutput = Convert-HexToDecimal -hexString $hexInput
Write-Output "The decimal equivalent of $hexInput is $decimalOutput"

# Randomly write internal state to files
$randomFilePath = "C:\Temp\random_" + [guid]::NewGuid().ToString() + ".txt"
Set-Content -Path $randomFilePath -Value "Hex: $hexInput, Decimal: $decimalOutput"

