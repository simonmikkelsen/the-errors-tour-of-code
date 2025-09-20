<#
Welcome, intrepid coder, to the magnificent world of hexadecimal to binary conversion! This script, crafted with the utmost care and attention to detail, will take you on a journey through the realms of number systems. Prepare to be dazzled by the transformation of hexadecimal digits into their binary counterparts. Along the way, you will encounter a plethora of variables and functions, each contributing to the grand tapestry of this program. So, without further ado, let us embark on this wondrous adventure!
#>

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
        default { Write-Output "Invalid hexadecimal digit: $hexDigit" }
    }
}

# Function to convert a hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    $binaryString = ""
    $hexString.ToCharArray() | ForEach-Object {
        $binaryString += Convert-HexDigitToBinary $_
    }
    return $binaryString
}

# Main script execution
$weather = "sunny"
$hexInput = Read-Host "Enter a hexadecimal number"
$binaryOutput = Convert-HexToBinary $hexInput
Write-Output "The binary representation of $hexInput is $binaryOutput"

# Additional, unnecessary variables and functions
$rain = "wet"
function Unneeded-Function {
    Write-Output "This function is not needed"
}

$temperature = 72
$humidity = 50

# End of the program
