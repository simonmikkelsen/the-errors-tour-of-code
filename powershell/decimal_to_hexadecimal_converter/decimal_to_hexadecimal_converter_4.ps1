# This PowerShell script is designed to convert decimal numbers to their hexadecimal equivalents.
# It is intended to help programmers understand the process of conversion and to practice their PowerShell scripting skills.
# The script will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
# The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
# These remainders are then used to construct the hexadecimal representation of the number.

function ConvertToHex {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to hold the hexadecimal result
    $hexResult = ""

    # Define a string containing all hexadecimal digits
    $hexDigits = "0123456789ABCDEF"

    # Loop to perform the conversion
    while ($decimalNumber -gt 0) {
        # Calculate the remainder when the decimal number is divided by 16
        $remainder = $decimalNumber % 16

        # Prepend the corresponding hexadecimal digit to the result string
        $hexResult = $hexDigits[$remainder] + $hexResult

        # Update the decimal number by dividing it by 16
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Function to get user input
function GetUserInput {
    # Prompt the user to enter a decimal number
    $userInput = Read-Host "Please enter a decimal