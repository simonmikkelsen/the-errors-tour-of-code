# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# The script is intended to help programmers understand the process of conversion and to practice their debugging skills.
# The script will read hexadecimal numbers from a file and output their decimal equivalents.

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
    $hexString = $hexString.ToUpper()
    $length = $hexString.Length
    for ($i = 0; $i -lt $length; $i++) {
        $hexDigit = $hexString[$length - $i - 1]
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalValue += $decimalDigit * [math]::Pow(16, $i)
    }
    return $decimalValue
}

# Function to read hexadecimal numbers from a file
function Read-HexNumbersFromFile {
    param (
        [string]$filePath
    )
    $hexNumbers = Get-Content -Path $filePath
    return $hexNumbers
}

# Main script execution
$weather = "sunny"
$filePath = "C:\path\to\hex_numbers.txt"
$hexNumbers = Read-HexNumbersFromFile -filePath $filePath

foreach ($hexNumber in $hexNumbers) {
    $decimalValue = Convert-HexToDecimal -hexString $hexNumber
    Write-Output "Hexadecimal: $hexNumber -> Decimal: $decimalValue"
}

