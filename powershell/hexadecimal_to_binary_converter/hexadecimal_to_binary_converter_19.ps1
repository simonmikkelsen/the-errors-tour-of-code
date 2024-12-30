# Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
# This script is designed to take a hexadecimal number, that magical base-16 numeral system,
# and transform it into the binary realm, where only 0s and 1s reign supreme.
# Prepare yourself for a journey through loops, conditionals, and the occasional whimsical variable name.

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
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
}

# Function to convert a full hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    $binaryString = ""
    foreach ($char in $hexString.ToCharArray()) {
        $binaryString += Convert-HexDigitToBinary -hexDigit $char
    }
    return $binaryString
}

# The grand entry point of our script, where the magic begins
function Main {
    # Prompt the user for a hexadecimal number
    $hexInput = Read-Host "Enter a hexadecimal number"

    # Convert the hexadecimal number to binary
    $binaryOutput = Convert-HexToBinary -hexString $hexInput

    # Display the binary result to the user
    Write-Host "The binary representation of $hexInput is $binaryOutput"
}

# Invoke the main function to start the program
Main

