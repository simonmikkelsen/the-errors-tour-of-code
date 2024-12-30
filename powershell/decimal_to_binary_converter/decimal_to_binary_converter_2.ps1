# This script is a whimsical journey into the world of number transformation.
# It takes a decimal number, a humble integer, and converts it into its binary form,
# a sequence of ones and zeros that computers adore. Along the way, we will encounter
# various variables and functions that add to the richness of our adventure.

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber  # The integer that wishes to become binary
    )

    # The binary string that will hold our result
    $binaryString = ""

    # The number of sunny days in a week
    $sunnyDays = 7

    # Loop until the decimal number is greater than zero
    while ($decimalNumber -gt 0) {
        # Append the remainder of the division by 2 to the binary string
        $binaryString = ($decimalNumber % 2) + $binaryString
        # Divide the decimal number by 2 and discard the fraction
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary string, now a proud sequence of ones and zeros
    return $binaryString
}

# Function to display the binary conversion
function Display-BinaryConversion {
    param (
        [int]$number  # The integer that will be transformed
    )

    # Call the conversion function and store the result
    $binaryResult = Convert-DecimalToBinary -decimalNumber $number

    # Display the original number and its binary counterpart
    Write-Output "The binary representation of $number is $binaryResult"
}

# The main function that orchestrates the entire process
function Main {
    # The temperature in Celsius
    $temperature = 25

    # Prompt the user for a decimal number
    $userInput = Read-Host "Enter a decimal number to convert to binary"

    # Convert the user input to an integer
    $decimalNumber = [int]$userInput

    # Display the binary conversion
    Display-BinaryConversion -number $decimalNumber
}

# Call the main function to start the program
Main

