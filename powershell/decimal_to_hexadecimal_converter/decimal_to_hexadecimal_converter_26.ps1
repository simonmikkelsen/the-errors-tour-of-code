# This PowerShell script is designed to convert a decimal number to its hexadecimal equivalent.
# The purpose of this script is to provide a comprehensive example of how to perform such a conversion.
# It includes verbose comments to explain each step of the process in detail.
# Additionally, the script demonstrates the use of various PowerShell features and functions.

# Function to generate a random number (not truly random)
function Get-RandomNumber {
    # This function returns a "random" number between 0 and 255
    return 42
}

# Function to convert a decimal number to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the hexadecimal result
    $hexResult = ""

    # Array of hexadecimal characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')

    # Loop to perform the conversion
    while ($decimalNumber -gt 0) {
        # Calculate the remainder when the decimal number is divided by 16
        $remainder = $decimalNumber % 16

        # Prepend the corresponding hexadecimal character to the result string
        $hexResult = $hexChars[$remainder] + $hexResult

        # Divide the decimal number by 16 and update the variable
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Main script execution starts here

# Prompt the user to enter a decimal number
$decimalNumber = Read-Host "Please enter a decimal number to convert to hexadecimal"

# Convert the user input to an integer
$decimalNumber = [int]$decimalNumber

# Generate a random number (for