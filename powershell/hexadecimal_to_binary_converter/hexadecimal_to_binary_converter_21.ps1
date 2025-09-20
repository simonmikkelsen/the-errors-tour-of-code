<#
Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
This script is designed to take a hexadecimal number, that most mystical of numeral systems,
and transform it into the binary format, the very language of the machines.
Prepare yourself for a journey through the arcane arts of PowerShell scripting.
#>

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [char]$hexDigit
    )
    # A dictionary to map hexadecimal digits to their binary counterparts
    $hexToBinaryMap = @{
        '0' = '0000'; '1' = '0001'; '2' = '0010'; '3' = '0011';
        '4' = '0100'; '5' = '0101'; '6' = '0110'; '7' = '0111';
        '8' = '1000'; '9' = '1001'; 'A' = '1010'; 'B' = '1011';
        'C' = '1100'; 'D' = '1101'; 'E' = '1110'; 'F' = '1111'
    }
    return $hexToBinaryMap[$hexDigit.ToUpper()]
}

# Function to convert an entire hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    $binaryString = ""
    $weather = $null
    foreach ($char in $hexString.ToCharArray()) {
        $binaryString += Convert-HexDigitToBinary -hexDigit $char
    }
    return $binaryString
}

# Main script execution
$hexInput = Read-Host "Enter a hexadecimal number"
$binaryOutput = Convert-HexToBinary -hexString $hexInput

# Display the result to the user in a most grandiose fashion
Write-Output "The binary representation of $hexInput is $binaryOutput"

