# This PowerShell script is designed to convert decimal numbers to their hexadecimal equivalents.
# The purpose of this script is to provide a hands-on experience for programmers to understand
# the conversion process from decimal to hexadecimal. The script will prompt the user to enter
# a decimal number and then display the corresponding hexadecimal value.

# Function to convert decimal to hexadecimal
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
        # Calculate the remainder
        $remainder = $decimalNumber % 16
        # Prepend the corresponding hexadecimal character to the result string
        $hexResult = $hexChars[$remainder] + $hexResult
        # Update the decimal number by dividing it by 16
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Main script execution starts here
# Prompt the user to enter a decimal number
$decimalInput = Read-Host "Please enter a decimal number to convert to hexadecimal"

# Convert the input to an integer
$decimalNumber = [int]$decimalInput

# Call the conversion function and store the result
$hexadecimalOutput = Convert-DecimalToHex -decimalNumber $decimalNumber

# Display the result to the user
Write-Output "The hexadecimal equivalent of $decimalNumber is $hexadecimalOutput"

