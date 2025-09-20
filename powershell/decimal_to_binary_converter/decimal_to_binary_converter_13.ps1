# Ahoy, matey! This here be a program to convert decimal numbers to binary.
# Ye can use this script to learn how to convert them decimal numbers to binary numbers.
# This script be written in PowerShell, the finest scripting language on the seven seas!

# Declare the global variable to hold the binary result
$global:binaryResult = ""

# Function to convert a single decimal number to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize the binary result as an empty string
    $global:binaryResult = ""

    # While loop to perform the conversion
    while ($decimalNumber -gt 0) {
        # Calculate the remainder of the division by 2
        $remainder = $decimalNumber % 2

        # Prepend the remainder to the binary result
        $global:binaryResult = "$remainder$global:binaryResult"

        # Divide the decimal number by 2
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary result
    return $global:binaryResult
}

# Function to display the binary result
function Display-BinaryResult {
    param (
        [string]$binaryResult
    )

    # Print the binary result to the console
    Write-Host "The binary result be: $binaryResult"
}

# Main function to run the conversion
function Main {
    # Ask the user for a decimal number
    $decimalNumber = Read-Host "Enter a decimal number, ye scallywag"

    # Convert the decimal number to binary
    $binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

    # Display the binary result
    Display-BinaryResult -binaryResult $binaryResult
}

# Call the main function to start the program
Main

