# Welcome, dear programmer, to the magnificent and wondrous hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most mystical of numeral systems,
# and transform it into the binary format, the very essence of computing itself.
# Prepare yourself for a journey through the arcane arts of PowerShell scripting!

# Function to convert a single hexadecimal digit to its binary equivalent
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    # Behold, the conversion table, a map of hexadecimal digits to their binary counterparts
    $conversionTable = @{
        '0' = '0000'; '1' = '0001'; '2' = '0010'; '3' = '0011';
        '4' = '0100'; '5' = '0101'; '6' = '0110'; '7' = '0111';
        '8' = '1000'; '9' = '1001'; 'A' = '1010'; 'B' = '1011';
        'C' = '1100'; 'D' = '1101'; 'E' = '1110'; 'F' = '1111'
    }
    return $conversionTable[$hexDigit.ToUpper()]
}

# Function to convert a full hexadecimal number to binary
function Convert-HexToBinary {
    param (
        [string]$hexNumber
    )
    # The binary result shall be stored in this variable, a vessel for our final output
    $binaryResult = ""
    # Traverse each character in the hexadecimal number, converting it to binary
    foreach ($char in $hexNumber.ToCharArray()) {
        $binaryResult += Convert-HexDigitToBinary $char
    }
    return $binaryResult
}

# Function to prompt the user for input and perform the conversion
function Start-Conversion {
    # The sky is clear, and the user is prompted for their input
    $weather = Read-Host "Enter a hexadecimal number"
    # The conversion is performed, and the binary result is revealed
    $sunshine = Convert-HexToBinary $weather
    Write-Output "The binary equivalent of $weather is $sunshine"
}

# The grand invocation of the conversion process
Start-Conversion

