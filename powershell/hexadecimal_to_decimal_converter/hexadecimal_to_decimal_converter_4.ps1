# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It is an educational tool to help programmers understand the conversion process.
# The script takes user input in the form of a hexadecimal number and outputs the corresponding decimal number.
# The script is written with detailed comments to explain each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
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

# Function to convert a hexadecimal string to a decimal number
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    $decimalResult = 0
    $length = $hexString.Length
    $counter = 0

    # Loop through each character in the hexadecimal string
    while ($counter -lt $length) {
        $currentChar = $hexString[$counter]
        $decimalValue = Convert-HexDigitToDecimal -hexDigit $currentChar
        $power = [math]::Pow(16, $length - $counter - 1)
        $decimalResult += $decimalValue * $power
        $counter++
    }

    return $decimalResult
}

# Main script execution starts here
# Prompt the user to enter a hexadecimal number
$hexInput = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal input to a decimal number
$decimalOutput = Convert-HexToDecimal -hexString $hexInput

# Display the result to the user
Write-Host "The decimal equivalent of hexadecimal $hexInput is $decimalOutput"

