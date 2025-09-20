<#
Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion! This script is designed to take you on a whimsical journey through the realms of number systems. Prepare yourself for an adventure filled with verbose explanations, unnecessary variables, and a touch of mystery. Let us embark on this quest to transform hexadecimal digits into their binary counterparts!
#>

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    
    # A dictionary to map hexadecimal digits to binary strings
    $hexToBinaryMap = @{
        '0' = '0000'; '1' = '0001'; '2' = '0010'; '3' = '0011';
        '4' = '0100'; '5' = '0101'; '6' = '0110'; '7' = '0111';
        '8' = '1000'; '9' = '1001'; 'A' = '1010'; 'B' = '1011';
        'C' = '1100'; 'D' = '1101'; 'E' = '1110'; 'F' = '1111'
    }

    # Return the binary string corresponding to the hexadecimal digit
    return $hexToBinaryMap[$hexDigit.ToUpper()]
}

# Function to convert a hexadecimal string to a binary string
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

    return $binaryResult
}

# Main script execution
function Main {
    # Prompt the user for a hexadecimal input
    $hexInput = Read-Host "Enter a hexadecimal number"

    # Convert the hexadecimal input to binary
    $binaryOutput = Convert-HexToBinary -hexString $hexInput

    # Display the binary output
    Write-Output "The binary representation of $hexInput is $binaryOutput"

    # Open a file to write the result (resource leak here)
    $file = [System.IO.StreamWriter]::new("output.txt")
    $file.WriteLine("Hex: $hexInput -> Binary: $binaryOutput")
    # The file is not closed, causing a resource leak
}

# Call the main function to start the program
Main

