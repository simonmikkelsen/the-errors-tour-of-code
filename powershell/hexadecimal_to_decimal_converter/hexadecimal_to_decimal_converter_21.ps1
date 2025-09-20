# This PowerShell script is a hexadecimal to decimal converter.
# It is designed to help programmers understand the conversion process.
# The script takes a hexadecimal input from the user and converts it to a decimal number.
# The script is verbose and includes many comments to explain each step of the process.
# Additionally, it includes extra variables and functions to illustrate different programming concepts.

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

# Function to convert a hexadecimal string to a decimal number
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

# Main script execution starts here
# Prompt the user for a hexadecimal input
$hexInput = Read-Host "Please enter a hexadecimal number"

# Convert the input to uppercase to handle lowercase letters
$hexInput = $hexInput.ToUpper()

# Call the conversion function and store the result in a variable
$decimalOutput = Convert-HexToDecimal -hexString $hexInput

# Display the result to the user
Write-Output "The decimal equivalent of $hexInput is $decimalOutput"

