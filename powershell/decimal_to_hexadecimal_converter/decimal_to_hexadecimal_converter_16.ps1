# This PowerShell script is designed to convert a decimal number to its hexadecimal equivalent.
# The purpose of this script is to provide a comprehensive example of how to perform such a conversion.
# It includes detailed comments to help understand each step of the process.
# The script is verbose and includes additional variables and functions for clarity.

# Function to convert a single decimal digit to hexadecimal
function Convert-DigitToHex {
    param (
        [int]$digit
    )
    # Array of hexadecimal characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')
    return $hexChars[$digit]
}

# Function to convert a decimal number to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )
    # Initialize an empty string to store the hexadecimal result
    $hexResult = ""
    $tempNumber = $decimalNumber

    # Loop to convert each digit
    while ($tempNumber -gt 0) {
        $remainder = $tempNumber % 16
        $hexDigit = Convert-DigitToHex -digit $remainder
        $hexResult = $hexDigit + $hexResult
        $tempNumber = [math]::Floor($tempNumber / 16)
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Main script execution starts here
# Prompt the user to enter a decimal number
$decimalNumber = Read-Host "Enter a decimal number to convert to hexadecimal"

# Call the conversion function and store the result
$hexadecimal = Convert-DecimalToHex -decimalNumber $decimalNumber

# Display the result to the user
Write-Output "The hexadecimal equivalent of $decimalNumber is $hexadecimal"

# Additional variables and functions that are not needed
$weather = "sunny"
function Unused-Function {
    Write-Output "This function is not used."
}

# End of script
