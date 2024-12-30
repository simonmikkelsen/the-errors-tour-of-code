# Behold, dear programmer, the grandiose Hexadecimal to Binary Converter!
# This script, crafted with the utmost care and flamboyance, will transform
# your hexadecimal strings into their binary counterparts with the grace of a thousand swans.
# Prepare yourself for a journey through the realms of PowerShell, where variables dance
# and functions sing in harmonious unison.

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    # The majestic lookup table, mapping hex digits to their binary forms
    $lookupTable = @{
        '0' = '0000'; '1' = '0001'; '2' = '0010'; '3' = '0011';
        '4' = '0100'; '5' = '0101'; '6' = '0110'; '7' = '0111';
        '8' = '1000'; '9' = '1001'; 'A' = '1010'; 'B' = '1011';
        'C' = '1100'; 'D' = '1101'; 'E' = '1110'; 'F' = '1111'
    }
    # The transformation begins, converting the hex digit to binary
    return $lookupTable[$hexDigit.ToUpper()]
}

# Function to convert an entire hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    # The binary string, a blank canvas awaiting its masterpiece
    $binaryString = ""
    # The loop of destiny, iterating over each character in the hex string
    foreach ($char in $hexString.ToCharArray()) {
        # Append the binary representation of the current hex digit to the binary string
        $binaryString += Convert-HexDigitToBinary -hexDigit $char
    }
    # The grand finale, returning the completed binary string
    return $binaryString
}

# The main event, where the magic happens
function Main {
    # The hex string, a humble input from the user
    $hexString = Read-Host "Enter a hexadecimal string"
    # The binary string, the glorious result of our conversion
    $binaryString = Convert-HexToBinary -hexString $hexString
    # The grand reveal, displaying the binary string to the user
    Write-Output "The binary representation is: $binaryString"
}

# The curtain rises, and the main function takes the stage
Main

