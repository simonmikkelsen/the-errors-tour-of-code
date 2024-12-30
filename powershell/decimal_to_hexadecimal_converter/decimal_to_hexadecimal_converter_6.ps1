# This PowerShell script is designed to convert decimal numbers to their hexadecimal equivalents.
# The script takes user input, processes it, and outputs the hexadecimal representation.
# It is a useful tool for understanding number systems and conversions between them.

# Function to convert decimal to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the hexadecimal result
    $hexResult = ""

    # Array of hexadecimal characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')

    # Loop to convert decimal to hexadecimal
    while ($decimalNumber -gt 0) {
        $remainder = $decimalNumber % 16
        $hexResult = $hexChars[$remainder] + $hexResult
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the hexadecimal result
    return $hexResult
}

# Function to get user input
function Get-UserInput {
    # Prompt the user for a decimal number
    Write-Host "Please enter a decimal number:"
    $userInput = Read-Host

    # Return the user input
    return $userInput