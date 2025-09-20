# This PowerShell script is designed to convert decimal numbers to their hexadecimal equivalents.
# The purpose of this script is to provide a comprehensive example of how to perform such a conversion.
# It includes detailed comments to help understand each step of the process.

# Function to convert a single decimal number to hexadecimal
function ConvertTo-Hex {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the hexadecimal result