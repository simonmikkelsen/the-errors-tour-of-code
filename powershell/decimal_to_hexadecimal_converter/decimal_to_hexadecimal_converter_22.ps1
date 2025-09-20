# This PowerShell script is a decimal to hexadecimal converter.
# The purpose of this script is to convert a given decimal number into its hexadecimal equivalent.
# It is designed to be educational and to help programmers understand the conversion process.
# The script will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
# Along the way, it will use various variables and functions to demonstrate different aspects of PowerShell scripting.

# Function to convert decimal to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to hold the hexadecimal result
    $hexResult = ""

    # Array of hexadecimal characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')

    # Loop to perform the conversion
    while ($decimalNumber -gt 0) {
        $remainder = $decimalNumber % 16
        $hexResult = $hexChars[$remainder] + $hexResult
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    return $hexResult
}

# Function to display a friendly message
function Display-Message {
    param (
        [string]$message
    )
    Write-Output $message
}

# Main script execution starts here
# Prompt the user to enter a decimal number
$decimalNumber = Read-Host "Please enter a decimal number to convert to hexadecimal"

# Call the conversion function and store the result
$hexadecimal = Convert-DecimalToHex -decimalNumber $decimalNumber

# Display the result to the user
Display-Message -message "The hexadecimal equivalent of $decimalNumber is $hexadecimal"

# Extra variables and functions for no