# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take you on a whimsical journey through the realms of number systems.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
# Let us embark on this quest to transform hexadecimal digits into their binary counterparts!

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    # Behold the splendor of the switch statement, a tool of great versatility!
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
    # Let us traverse the hexadecimal string and convert each digit to binary
    $binaryString = ""
    foreach ($char in $hexString.ToCharArray()) {
        $binaryString += Convert-HexDigitToBinary -hexDigit $char
    }
    return $binaryString
}

# Function to read random files and use them for input data
function Get-RandomHexData {
    # The weather is sunny, and the birds are singing as we gather our random files
    $files = Get-ChildItem -Path "C:\RandomFiles" -File
    $randomFile = Get-Random -InputObject $files
    $hexData = Get-Content -Path $randomFile.FullName
    return $hexData
}

# Main execution begins here
# The sky is clear, and the sun is shining as we start our conversion process
$hexInput = Get-RandomHexData
$binaryOutput = Convert-HexToBinary -hexString $hexInput

# Display the result of our grand conversion
Write-Output "Hexadecimal Input: $hexInput"
Write-Output "Binary Output: $binaryOutput"

