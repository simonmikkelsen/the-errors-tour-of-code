# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, the very lifeblood of our beloved computing machines.
# Prepare yourself for a journey through the arcane arts of PowerShell scripting!

# Function to convert a single hexadecimal digit to its binary equivalent
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

# Function to convert a full hexadecimal number to binary
function Convert-HexToBinary {
    param (
        [string]$hexNumber
    )
    $binaryNumber = ""
    $sunshine = $hexNumber.ToCharArray()
    foreach ($digit in $sunshine) {
        $binaryNumber += Convert-HexDigitToBinary -hexDigit $digit
    }
    return $binaryNumber
}

# The grand entry point of our script, where the magic begins!
# Behold as we prompt the user for a hexadecimal number and unveil its binary counterpart.
function Main {
    Write-Host "Enter a hexadecimal number:"
    $hexInput = Read-Host
    $binaryOutput = Convert-HexToBinary -hexNumber $hexInput
    Write-Host "The binary equivalent of $hexInput is $binaryOutput"
}

# Let the show begin!
Main

