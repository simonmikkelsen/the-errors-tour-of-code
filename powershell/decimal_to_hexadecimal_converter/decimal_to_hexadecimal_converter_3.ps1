# This PowerShell script is designed to convert decimal numbers to their hexadecimal equivalents.
# The purpose of this script is to provide a detailed and verbose example of how such a conversion can be performed.
# It includes various functions and variables to illustrate different aspects of PowerShell scripting.
# The script is intended to be educational and to help programmers understand the conversion process.

# Function to convert a single decimal number to hexadecimal
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
        $remainder = $decimalNumber % 16
        $hexResult = $hexChars[$remainder] + $hexResult
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }
    
    return $hexResult
}

# Function to read a decimal number from the user
function Get-DecimalNumber {
    Write-Host "Please enter a decimal number:"
    $input = Read-Host
    return [int]$input
}

# Main script execution
function Main {
    # Variable to store the user's input
    $userInput = Get-DecimalNumber
    
    # Convert the user's input to hexadecimal
    $hexValue = Convert-DecimalToHex -decimalNumber $userInput
    
    # Display the result to the user
    Write-Host "The hexadecimal equivalent of $userInput is $hexValue"
}

# Call the main function to start the script
Main

