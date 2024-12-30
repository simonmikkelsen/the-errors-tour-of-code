# This PowerShell script is designed to convert decimal numbers to hexadecimal format.
# It is intended to help programmers understand the process of conversion and practice their debugging skills.
# The script will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
# The script includes verbose comments to explain each step of the process in detail.

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
        # Calculate the remainder when the decimal number is divided by 16
        $remainder = $decimalNumber % 16

        # Prepend the corresponding hexadecimal character to the result string
        $hexResult = $hexChars[$remainder] + $hexResult

        # Update the decimal number by performing integer division by 16
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Function to get user input
function Get-UserInput {
    # Prompt the user to enter a decimal number
    $userInput = Read-Host "Please enter a decimal number"

    # Convert the user input to an integer
    $decimalNumber = [int]$userInput

    # Return the decimal number
    return $decimalNumber
}

# Main script execution
function Main {
    # Call the function to get user input
    $decimalNumber = Get-UserInput
