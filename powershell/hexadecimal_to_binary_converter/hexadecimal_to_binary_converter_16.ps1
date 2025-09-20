<#
Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion! 
This script is designed to take you on a whimsical journey through the realms of number systems, 
transforming the enigmatic hexadecimal digits into their binary counterparts. 
Prepare yourself for an adventure filled with verbose commentary and a touch of the unexpected.
#>

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    # Behold the transformation of a single hex digit into its binary form!
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
    # The grand concatenation of binary strings begins here!
    $binaryString = ""
    $tempString = ""
    foreach ($char in $hexString.ToCharArray()) {
        $tempString = Convert-HexDigitToBinary -hexDigit $char
        $binaryString += $tempString
    }
    return $binaryString
}

# Function to display the conversion result in a grandiose manner
function Display-ConversionResult {
    param (
        [string]$hexString,
        [string]$binaryString
    )
    # Behold the final transformation!
    Write-Host "The hexadecimal value $hexString has been transformed into the binary value $binaryString!"
}

# Main script execution
$hexInput = Read-Host "Enter a hexadecimal value"
$binaryOutput = Convert-HexToBinary -hexString $hexInput
Display-ConversionResult -hexString $hexInput -binaryString $binaryOutput

