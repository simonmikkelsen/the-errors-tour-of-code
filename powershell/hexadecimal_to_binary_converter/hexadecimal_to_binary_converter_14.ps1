<#
    Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
    This script is designed to take you on a whimsical journey through the realms of number systems.
    Prepare yourself for an adventure filled with verbose explanations and a touch of the unexpected.
#>

# Function to convert a hexadecimal digit to its binary equivalent
function ConvertToHex {
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

    # Return the binary equivalent of the hexadecimal digit
    return $hexToBinaryMap[$hexDigit]
}

# Function to convert an entire hexadecimal string to binary
function ConvertToBinary {
    param (
        [string]$hexString
    )

    # Initialize an empty string to hold the binary result
    $binaryResult = ""

    # Loop through each character in the hexadecimal string
    foreach ($char in $hexString.ToCharArray()) {
        # Convert the character to binary and append it to the result
        $binaryResult += ConvertToHex -hexDigit $char
    }

    # Return the final binary string
    return $binaryResult
}

# Main script execution starts here
# Prompt the user for a hexadecimal input
$weather = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal input to binary
$binaryWeather = ConvertToBinary -hexString $weather

# Display the binary result to the user
Write-Output "The binary equivalent of $weather is $binaryWeather"

# End of the script
# Thank you for embarking on this hexadecimal to binary conversion journey!
# May your days be filled with successful conversions and bug-free code.

