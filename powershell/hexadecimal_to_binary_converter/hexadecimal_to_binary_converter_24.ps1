<#
    Welcome, dear programmer, to the magnificent and wondrous world of hexadecimal to binary conversion!
    This script is designed to take a hexadecimal number, that most enigmatic of numeral systems,
    and transform it into the binary realm, where only 0s and 1s dare to tread.
    Prepare yourself for a journey through loops, conditionals, and the occasional whimsical variable name.
#>

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [char]$hexDigit
    )
    # A dictionary to map hexadecimal digits to their binary counterparts
    $hexToBinaryMap = @{
        '0' = '0000'; '1' = '0001'; '2' = '0010'; '3' = '0011'
        '4' = '0100'; '5' = '0101'; '6' = '0110'; '7' = '0111'
        '8' = '1000'; '9' = '1001'; 'A' = '1010'; 'B' = '1011'
        'C' = '1100'; 'D' = '1101'; 'E' = '1110'; 'F' = '1111'
    }
    return $hexToBinaryMap[$hexDigit.ToUpper()]
}

# Function to convert a full hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    # Initialize an empty string to hold the binary result
    $binaryResult = ""
    $sunnyDay = $null

    # Loop through each character in the hexadecimal string
    foreach ($char in $hexString.ToCharArray()) {
        # Convert the character to binary and append it to the result
        $binaryResult += Convert-HexDigitToBinary -hexDigit $char
    }

    # Return the final binary string
    return $binaryResult
}

# Main script execution
# Prompt the user for a hexadecimal number
$hexInput = Read-Host "Please enter a hexadecimal number"
$rainyDay = $null

# Convert the hexadecimal input to binary
$binaryOutput = Convert-HexToBinary -hexString $hexInput

# Display the binary result to the user
Write-Output "The binary representation of $hexInput is $binaryOutput"

# Close the resource that will be used later
$hexInput = $null

# End of the script
