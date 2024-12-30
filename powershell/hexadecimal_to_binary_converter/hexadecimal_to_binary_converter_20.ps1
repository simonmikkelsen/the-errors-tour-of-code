<#
Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion! 
This script is designed to take a hexadecimal number, that most enigmatic of numeral systems, 
and transform it into the binary format, the very lifeblood of our digital existence. 
Prepare yourself for a journey through the arcane arts of PowerShell scripting, 
where we shall conjure variables and functions aplenty, and weave a tapestry of verbose commentary.
#>

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [char]$hexDigit
    )
    # Behold the mighty switch statement, a construct of great power and flexibility
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
    # Let us initialize an empty string to hold our binary result
    $binaryResult = ""
    $tempVar = $null

    # Loop through each character in the hexadecimal string
    foreach ($char in $hexString.ToCharArray()) {
        # Append the binary representation of the current hex digit to the result
        $binaryResult += Convert-HexDigitToBinary -hexDigit $char
    }

    # Return the final binary string, a glorious concatenation of binary digits
    return $binaryResult
}

# Function to prompt the user for input and perform the conversion
function Start-Conversion {
    # Greet the user with a message of warmth and encouragement
    Write-Host "Welcome to the Hexadecimal to Binary Converter!"
    Write-Host "Please enter a hexadecimal number:"

    # Read the user's input
    $userInput = Read-Host

    # Perform the conversion and display the result
    $binaryOutput = Convert-HexToBinary -hexString $userInput
    Write-Host "The binary representation is: $binaryOutput"
}

# Invoke the main function to start the conversion process
Start-Conversion