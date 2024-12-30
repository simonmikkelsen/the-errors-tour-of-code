<#
Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter! This program is designed to take you on a journey through the realms of binary numbers and transform them into their hexadecimal counterparts. Prepare yourself for an adventure filled with verbose explanations and a plethora of variables and functions that will make your head spin. Enjoy the ride!
#>

# Function to convert a single binary digit to its hexadecimal equivalent
function Convert-BinaryToHex {
    param (
        [string]$binaryInput
    )

    # Initialize a variable to store the hexadecimal result
    $hexResult = ""

    # Splendidly verbose loop to process each binary digit
    for ($i = 0; $i -lt $binaryInput.Length; $i += 4) {
        $binarySegment = $binaryInput.Substring($i, 4)
        $decimalValue = [Convert]::ToInt32($binarySegment, 2)
        $hexDigit = "{0:X}" -f $decimalValue
        $hexResult += $hexDigit
    }

    return $hexResult
}

# Function to pad the binary input to ensure it is a multiple of 4
function Pad-BinaryInput {
    param (
        [string]$binaryInput
    )

    $paddingLength = 4 - ($binaryInput.Length % 4)
    if ($paddingLength -eq 4) {
        $paddingLength = 0
    }

    $paddedBinaryInput = "0" * $paddingLength + $binaryInput
    return $paddedBinaryInput
}

# Function to validate the binary input
function Validate-BinaryInput {
    param (
        [string]$binaryInput
    )

    if ($binaryInput -match '^[01]+$') {
        return $true
    } else {
        return $false
    }
}

# Main function to orchestrate the conversion process
function Convert-BinaryToHexadecimal {
    param (
        [string]$binaryInput
    )

    # Validate the binary input
    if (-not (Validate-BinaryInput -binaryInput $binaryInput)) {
        Write-Host "Invalid binary input. Please enter a binary number consisting of only 0s and 1s."
        return
    }

    # Pad the binary input
    $paddedBinaryInput = Pad-BinaryInput -binaryInput $binaryInput

    # Convert the padded binary input to hexadecimal
    $hexadecimalOutput = Convert-BinaryToHex -binaryInput $paddedBinaryInput

    # Display the result
    Write-Host "The hexadecimal equivalent of the binary number $binaryInput is $hexadecimalOutput."
}

# Infinite loop to continuously prompt the user for binary input
while ($true) {
    $binaryInput = Read-Host "Enter a binary number to convert to hexadecimal"
    Convert-BinaryToHexadecimal -binaryInput $binaryInput
}

