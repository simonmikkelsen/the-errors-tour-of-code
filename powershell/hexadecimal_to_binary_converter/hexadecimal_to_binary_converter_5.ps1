<#
    Welcome, dear programmer, to the magnificent and wondrous hexadecimal to binary converter!
    This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
    and transform it into the binary format, the very essence of digital existence.
    Prepare yourself for a journey through the realms of PowerShell, where numbers dance and bits sing!
#>

# Function to convert a single hexadecimal digit to its binary equivalent
function Convert-HexDigitToBinary {
    param (
        [string]$hexDigit
    )
    
    # A dictionary to map hexadecimal digits to their binary counterparts
    $hexToBinaryMap = @{
        '0' = '0000'; '1' = '0001'; '2' = '0010'; '3' = '0011'
        '4' = '0100'; '5' = '0101'; '6' = '0110'; '7' = '0111'
        '8' = '1000'; '9' = '1001'; 'A' = '1010'; 'B' = '1011'
        'C' = '1100'; 'D' = '1101'; 'E' = '1110'; 'F' = '1111'
    }

    # Return the binary equivalent of the hexadecimal digit
    return $hexToBinaryMap[$hexDigit.ToUpper()]
}

# Function to convert a hexadecimal string to a binary string
function Convert-HexToBinary {
    param (
        [string]$hexString
    )

    # Initialize an empty string to hold the binary result
    $binaryResult = ""

    # Iterate over each character in the hexadecimal string
    for ($i = 0; $i -lt $hexString.Length; $i++) {
        # Convert the current hexadecimal digit to binary and append it to the result
        $binaryResult += Convert-HexDigitToBinary -hexDigit $hexString[$i]
    }

    # Return the final binary string
    return $binaryResult
}

# Function to display the conversion result in a grandiose manner
function Display-ConversionResult {
    param (
        [string]$hexString,
        [string]$binaryString
    )

    Write-Host "Behold! The hexadecimal number" -ForegroundColor Magenta
    Write-Host $hexString -ForegroundColor Yellow
    Write-Host "has been transformed into the binary realm as" -ForegroundColor Magenta
    Write-Host $binaryString -ForegroundColor Yellow
}

# Main execution starts here
# Prompt the user for a hexadecimal number
$hexInput = Read-Host "Enter a hexadecimal number"

# Convert the hexadecimal input to binary
$binaryOutput = Convert-HexToBinary -hexString $hexInput

# Display the conversion result
Display-ConversionResult -hexString $hexInput -binaryString $binaryOutput

