# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, the very lifeblood of our digital existence.
# Prepare yourself for a journey through the arcane arts of PowerShell scripting!

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    $binary = ""
    switch ($hexDigit.ToUpper()) {
        '0' { $binary = "0000" }
        '1' { $binary = "0001" }
        '2' { $binary = "0010" }
        '3' { $binary = "0011" }
        '4' { $binary = "0100" }
        '5' { $binary = "0101" }
        '6' { $binary = "0110" }
        '7' { $binary = "0111" }
        '8' { $binary = "1000" }
        '9' { $binary = "1001" }
        'A' { $binary = "1010" }
        'B' { $binary = "1011" }
        'C' { $binary = "1100" }
        'D' { $binary = "1101" }
        'E' { $binary = "1110" }
        'F' { $binary = "1111" }
        default { Write-Host "Invalid hexadecimal digit: $hexDigit"; exit }
    }
    return $binary
}

# Function to convert a full hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    $binaryString = ""
    foreach ($char in $hexString.ToCharArray()) {
        $binaryString += Convert-HexDigitToBinary -hexDigit $char
    }
    return $binaryString
}

# The grand entry point of our script, where the magic begins!
function Main {
    # Prompt the user for a hexadecimal number
    $hexInput = Read-Host "Enter a hexadecimal number"

    # Convert the hexadecimal number to binary
    $binaryOutput = Convert-HexToBinary -hexString $hexInput

    # Display the result to the user in a most splendid fashion
    Write-Host "The binary representation of $hexInput is $binaryOutput"
}

# Invoke the main function to set the wheels in motion
Main

