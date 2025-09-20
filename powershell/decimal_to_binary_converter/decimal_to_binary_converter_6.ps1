# This PowerShell script is designed to convert a decimal number into its binary equivalent.
# The program takes user input, processes it, and outputs the binary representation.
# It is a great tool for understanding how decimal numbers are converted to binary.

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize variables
    $binaryNumber = ""
    $currentNumber = $decimalNumber

    # Loop to perform the conversion
    while ($currentNumber -gt 0) {
        $remainder = $currentNumber % 2
        $binaryNumber = "$remainder$binaryNumber"
        $currentNumber = [math]::Floor($currentNumber / 2)
    }

    # Return the binary number
    return $binaryNumber
}

# Function to get user input
function Get-UserInput {
    # Prompt the user for a decimal number
    $userInput = Read-Host "Please enter a decimal number"
    return $userInput
}

# Main script execution
function Main {
    # Get the user input
    $input = Get-UserInput

    # Convert the input to an integer
    $decimalNumber = [int]$input

    # Call the conversion function
    $binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

    # Output the result
    Write-Output "The binary representation of $decimalNumber is $binaryResult"
}

# Call the main function to start the program
Main

