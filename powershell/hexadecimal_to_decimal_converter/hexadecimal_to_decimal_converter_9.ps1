# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to perform such conversions frequently.
# The script takes a hexadecimal number as input and outputs the corresponding decimal number.
# The script is written in a verbose manner to provide clarity and understanding of each step involved in the conversion process.

# Function to convert a single hexadecimal digit to its decimal equivalent
function Convert-HexDigitToDecimal {
    param (
        [string]$hexDigit
    )
    $decimalValue = 0
    switch ($hexDigit.ToUpper()) {
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
        default { Write-Host "Invalid hexadecimal digit: $hexDigit" }
    }
    return $decimalValue
}

# Function to convert a hexadecimal number to its decimal equivalent
function Convert-HexToDecimal {
    param (
        [string]$hexNumber
    )
    $decimalNumber = 0
    $length = $hexNumber.Length
    $power = 0

    for ($i = $length - 1; $i -ge 0; $i--) {
        $hexDigit = $hexNumber[$i]
        $decimalValue = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalNumber += $decimalValue * [math]::Pow(16, $power)
        $power++
    }

    return $decimalNumber
}

# Main script execution starts here
# Prompt the user to enter a hexadecimal number
$hexNumber = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal number to decimal
$decimalNumber = Convert-HexToDecimal -hexNumber $hexNumber

# Display the result to the user
Write-Host "The decimal equivalent of hexadecimal number $hexNumber is $decimalNumber"

