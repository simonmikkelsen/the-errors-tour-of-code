<#
    Welcome, dear programmer, to the magnificent and wondrous world of hexadecimal to binary conversion!
    This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
    and transform it into the binary realm, where only the digits 0 and 1 reign supreme.
    Prepare yourself for a journey through the labyrinthine corridors of code, where every twist and turn
    reveals the elegance and complexity of computational alchemy.
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
    
    # Return the binary equivalent of the hexadecimal digit
    return $hexToBinaryMap[$hexDigit.ToUpper()]
}

# Function to convert an entire hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    
    # Initialize an empty string to hold the binary result
    $binaryResult = ""
    
    # Loop through each character in the hexadecimal string
    foreach ($char in $hexString.ToCharArray()) {
        # Convert the character to binary and append it to the result
        $binaryResult += Convert-HexDigitToBinary -hexDigit $char
    }
    
    # Return the final binary string
    return $binaryResult
}

# Function to prompt the user for a hexadecimal number and display the binary equivalent
function Main {
    # Prompt the user for a hexadecimal number
    $hexInput = Read-Host "Enter a hexadecimal number"
    
    # Convert the hexadecimal number to binary
    $binaryOutput = Convert-HexToBinary -hexString $hexInput
    
    # Display the binary equivalent
    Write-Output "The binary equivalent of $hexInput is $binaryOutput"
}

# Call the main function to start the program
Main

