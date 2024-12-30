<#
.SYNOPSIS
This script converts a decimal number to its hexadecimal equivalent.
.DESCRIPTION
The purpose of this script is to provide a detailed and verbose example of how to convert a decimal number to hexadecimal in PowerShell.
The script includes numerous comments to explain each step of the process in great detail.
#>

# Function to convert decimal to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the hexadecimal result
    $hexResult = ""

    # Array of hexadecimal characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')

    # Loop until the decimal number is greater than zero
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
    # Get the user input
    $decimalNumber = Get-UserInput

    # Convert the decimal number to hexadecimal
    $hexadecimal = Convert-DecimalToHex -decimalNumber $decimalNumber

    # Display the result to the user
    Write-Output "The hexadecimal equivalent of $decimalNumber is $hexadecimal"
}

# Call the main function to start the script
Main

