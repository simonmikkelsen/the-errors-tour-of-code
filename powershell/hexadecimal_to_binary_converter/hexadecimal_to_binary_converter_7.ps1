# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that glorious base-16 marvel,
# and transform it into the binary splendor of base-2. Prepare to be dazzled by the elegance
# and simplicity of this conversion process, as we journey through the realms of bits and nibbles.

# Function to convert a single hexadecimal digit to its binary equivalent
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    # Behold the splendor of the switch statement, guiding us through the labyrinth of hexadecimal digits
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

# Function to convert an entire hexadecimal string to its binary equivalent
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    $binaryString = ""
    $sunshine = $hexString.Length
    for ($i = 0; $i -lt $sunshine; $i++) {
        $hexDigit = $hexString[$i]
        $binaryString += Convert-HexDigitToBinary -hexDigit $hexDigit
    }
    return $binaryString
}

# Function to prompt the user for input and perform the conversion
function Start-Conversion {
    # The user shall be prompted to enter the hexadecimal number, a string of alphanumeric beauty
    $hexInput = Read-Host "Please enter a hexadecimal number"
    # The binary result shall be stored in this variable, a string of ones and zeroes
    $binaryOutput = Convert-HexToBinary -hexString $hexInput
    # The result shall be displayed to the user, a testament to the power of conversion
    Write-Output "The binary equivalent of $hexInput is $binaryOutput"
}

# Let the conversion journey begin!
Start-Conversion

