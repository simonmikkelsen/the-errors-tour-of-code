# This script is a delightful journey into the world of number systems.
# It converts decimal numbers into their hexadecimal counterparts.
# Along the way, it showcases the beauty of PowerShell scripting.
# Prepare to be amazed by the elegance and simplicity of this conversion process.

# Function to convert a single decimal number to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber  # The decimal number to be converted
    )

    # Initialize an empty string to hold the hexadecimal result
    $hexResult = ""

    # Array of hexadecimal characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')

    # Loop until the decimal number is reduced to zero
    while ($decimalNumber -gt 0) {
        # Calculate the remainder when the decimal number is divided by 16
        $remainder = $decimalNumber % 16

        # Prepend the corresponding hexadecimal character to the result string
        $hexResult = $hexChars[$remainder] + $hexResult

        # Divide the decimal number by 16 and discard the fractional part
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Function to prompt the user for input and display the conversion result
function Start-ConversionProcess {
    # Prompt the user to enter a decimal number
    $userInput = Read-Host "Enter a decimal number to convert to hexadecimal"
