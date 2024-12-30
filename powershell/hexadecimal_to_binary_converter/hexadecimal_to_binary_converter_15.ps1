# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that is, a number in base 16,
# and convert it into its binary counterpart, a number in base 2.
# Prepare yourself for a journey through the realms of data transformation!

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [char]$hexDigit
    )
    # Behold the splendor of the switch statement, which maps each hexadecimal digit to its binary equivalent
    switch ($hexDigit) {
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

# Function to convert a hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    # Let us initialize an empty string to hold our binary result
    $binaryResult = ""
    # Traverse the hexadecimal string, character by character
    foreach ($char in $hexString.ToUpper()) {
        # Append the binary equivalent of each hexadecimal digit to the result
        $binaryResult += Convert-HexDigitToBinary -hexDigit $char
    }
    return $binaryResult
}

# Function to prompt the user for input and perform the conversion
function Main {
    # Greet the user with a warm welcome
    Write-Host "Welcome to the Hexadecimal to Binary Converter!"
    # Prompt the user to enter a hexadecimal number
    $hexInput = Read-Host "Please enter a hexadecimal number"
    # Convert the input to binary
    $binaryOutput = Convert-HexToBinary -hexString $hexInput
    # Display the result to the user
    Write-Host "The binary equivalent of $hexInput is $binaryOutput"
}

# Invoke the main function to start the program
Main

