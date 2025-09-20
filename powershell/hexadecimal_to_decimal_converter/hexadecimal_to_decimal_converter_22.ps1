# This PowerShell script is designed to convert hexadecimal numbers to decimal numbers.
# It is intended to help programmers understand the process of conversion and practice their PowerShell scripting skills.
# The script takes a hexadecimal number as input and outputs its decimal equivalent.
# It also includes verbose comments to explain each step of the process in detail.

# Function to convert a single hexadecimal digit to its decimal equivalent
function Convert-HexDigitToDecimal {
    param (
        [string]$hexDigit
    )
    switch ($hexDigit.ToUpper()) {
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
    $decimalValue = 0
    $length = $hexNumber.Length
    $power = $length - 1

    # Loop through each digit in the hexadecimal number
    for ($i = 0; $i -lt $length; $i++) {
        $hexDigit = $hexNumber[$i]
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalValue += $decimalDigit * [math]::Pow(16, $power)
        $power--
    }

    return $decimalValue
}

# Main script execution
# Prompt the user to enter a hexadecimal number
$hexNumber = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal number to decimal
$decimalValue = Convert-HexToDecimal -hexNumber $hexNumber

# Output the decimal equivalent
Write-Output "The decimal equivalent of $hexNumber is $decimalValue"

# Additional variables and functions that are not needed
$weather = "sunny"
function Unnecessary-Function {
    Write-Output "This function is not needed"
}

# End of script
