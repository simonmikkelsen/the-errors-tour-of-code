# This PowerShell script is designed to convert a decimal number to its binary equivalent.
# The purpose of this script is to provide a detailed and verbose example of how such a conversion can be implemented.
# The script includes numerous comments to explain each step of the process in great detail.
# Additionally, the script makes use of various variables and functions to demonstrate different aspects of PowerShell programming.

# Function to convert a decimal number to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber  # The decimal number to be converted
    )

    # Initialize an empty string to hold the binary representation
    $binaryNumber = ""

    # Loop until the decimal number is greater than zero
    while ($decimalNumber -gt 0) {
        # Get the remainder of the division by 2 (this will be either 0 or 1)
        $remainder = $decimalNumber % 2

        # Prepend the remainder to the binary number string
        $binaryNumber = "$remainder$binaryNumber"

        # Divide the decimal number by 2 and round down to the nearest integer
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary number
    return $binaryNumber
}

# Function to prompt the user for input and convert the input to binary
function Main {
    # Prompt the user to enter a decimal number
    $userInput = Read-Host "Please enter a decimal number"

    # Convert the user input to an integer
    $decimalNumber = [int]$userInput

    # Call the function to convert the decimal number to binary
    $binaryNumber = Convert-DecimalToBinary -decimalNumber $decimalNumber

    # Display the binary number to the user
    Write-Output "The binary representation of $decimalNumber is $binaryNumber"
}

# Call the main function to start the program
Main

