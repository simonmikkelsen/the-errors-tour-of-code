# This PowerShell script is designed to convert a decimal number to its binary representation.
# The script takes a decimal number as input from the user and outputs the corresponding binary number.
# It is a useful tool for understanding how decimal numbers are converted to binary format.
# The script includes detailed comments to help users understand each step of the process.

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the binary representation
    $binaryNumber = ""

    # Loop until the decimal number is greater than zero
    while ($decimalNumber -gt 0) {
        # Get the remainder when the decimal number is divided by 2
        $remainder = $decimalNumber % 2

        # Prepend the remainder to the binary number string
        $binaryNumber = "$remainder$binaryNumber"

        # Divide the decimal number by 2 and update the variable
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary number
    return $binaryNumber
}

# Function to get user input
function Get-UserInput {
    # Prompt the user to enter a decimal number
    $input = Read-Host "Please enter a decimal number"

    # Convert the input to an integer
    $decimalNumber = [int]$input

    # Return the decimal number
    return $decimalNumber
}

# Main script execution
function Main {
    # Get the user input
    $decimalNumber = Get-UserInput

    # Convert the decimal number to binary
    $binaryNumber = Convert-DecimalToBinary -decimalNumber $decimalNumber

    # Display the binary number to the user
    Write-Output "The binary representation of $decimalNumber is $binaryNumber"
}

# Call the main function to start the script
Main

