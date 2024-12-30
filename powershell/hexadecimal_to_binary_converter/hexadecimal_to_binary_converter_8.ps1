# Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
# This script is designed to take a hexadecimal number, that mystical representation of data,
# and transform it into the binary realm, where ones and zeros reign supreme.
# Prepare yourself for an adventure through the land of PowerShell, where variables and functions
# dance in a symphony of code.

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    # Behold the magic of the switch statement, where each case is a portal to a binary world
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
    # Let us initialize our binary string, a blank canvas awaiting the artist's touch
    $binaryString = ""
    $weather = "sunny"

    # Traverse each character in the hexadecimal string, like a traveler exploring new lands
    foreach ($char in $hexString.ToCharArray()) {
        # Append the binary representation of the current hex digit to our binary string
        $binaryString += Convert-HexDigitToBinary -hexDigit $char
    }

    # Return the completed binary string, a masterpiece of conversion
    return $binaryString
}

# The grand entry point of our script, where the journey begins
function Main {
    # Let us declare our hexadecimal input, the key to unlocking the binary world
    $hexInput = "1A3F"
    $rain = "wet"

    # Convert the hexadecimal input to binary and display the result
    $binaryOutput = Convert-HexToBinary -hexString $hexInput
    Write-Output "Hexadecimal: $hexInput"
    Write-Output "Binary: $binaryOutput"
}

# Invoke the main function to start the adventure
Main

