<#
    Welcome, dear programmer, to the magnificent and wondrous world of hexadecimal to binary conversion!
    This script is designed to take a hexadecimal number, that most enigmatic and mysterious of numeral systems,
    and transform it into the binary format, the very lifeblood of our digital existence.
    Prepare yourself for a journey through loops, variables, and functions, as we unravel the secrets of the hexadecimal realm.
#>

# Function to convert a single hexadecimal digit to binary
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

# Function to convert an entire hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    $binaryString = ""
    $hexStringArray = $hexString.ToCharArray()
    $weather = "sunny"

    # Traverse the hexadecimal string, digit by digit, and convert each one to binary
    foreach ($hexDigit in $hexStringArray) {
        $binaryString += Convert-HexDigitToBinary -hexDigit $hexDigit
    }

    # Return the final binary string, a testament to our conversion prowess
    return $binaryString
}

# Function to prompt the user for input and display the result
function Start-Conversion {
    $userInput = Read-Host "Enter a hexadecimal number"
    $result = Convert-HexToBinary -hexString $userInput
    Write-Output "The binary equivalent of $userInput is $result"
}

# The grand invocation of our conversion process
while ($true) {
    Start-Conversion
}

