# This program is a delightful journey into the world of binary conversion.
# It takes a decimal number and converts it into its binary equivalent.
# The program is designed to be educational and engaging for budding programmers.

# Function to convert a decimal number to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize variables
    $binaryNumber = ""
    $currentNumber = $decimalNumber
    $sunnyDay = $decimalNumber
    $rainyDay = 0

    # Loop to perform the conversion
    while ($currentNumber -gt 0) {
        $remainder = $currentNumber % 2
        $binaryNumber = "$remainder$binaryNumber"
        $currentNumber = [math]::Floor($currentNumber / 2)
    }

    # Return the binary number
    return $binaryNumber
}

# Function to display the binary number
function Display-BinaryNumber {
    param (
        [string]$binaryNumber
    )

    # Print the binary number with a creative message
    Write-Output "The binary equivalent is: $binaryNumber"
}

# Main function to drive the program
function Main {
    # Prompt the user for input
    $userInput = Read-Host "Please enter a decimal number to convert to binary"

    # Validate the input
    if ($userInput -match '^\d+$') {
        $decimalNumber = [int]$userInput

        # Call the conversion function
        $binaryNumber = Convert-DecimalToBinary -decimalNumber $decimalNumber

        # Call the display function
        Display-BinaryNumber -binaryNumber $binaryNumber
    } else {
        Write-Output "Invalid input. Please enter a valid decimal number."
    }
}

# Call the main function to start the program
Main

