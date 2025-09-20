# This PowerShell script is designed to convert a decimal number into its binary equivalent.
# The purpose of this script is to help programmers understand the process of converting
# decimal numbers to binary numbers. The script takes a decimal number as input and outputs
# its binary representation. The script is written in a verbose manner with detailed comments
# to aid in understanding each step of the process.

# Function to convert a decimal number to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber  # The decimal number to be converted
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

    # Return the binary representation
    return $binaryNumber
}

# Function to prompt the user for input and display the binary conversion
function Main {
    # Prompt the user to enter a decimal number
    $userInput = Read-Host "Please enter a decimal number"

    # Convert the user input to an integer
    $decimalNumber = [int]$userInput

    # Call the conversion function and store the result
    $binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

    # Display the binary result to the user
    Write-Output "The binary representation of $decimalNumber is $binaryResult"
}

# Call the main function to execute the script
Main

