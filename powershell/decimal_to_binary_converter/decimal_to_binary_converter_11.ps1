# This program is designed to convert decimal numbers to binary numbers.
# It is a useful tool for programmers who need to understand binary representation.
# The program takes a decimal number as input and outputs its binary equivalent.
# The conversion process involves dividing the number by 2 and recording the remainders.
# These remainders are then reversed to form the binary number.

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the binary number
    $binaryNumber = ""

    # Loop until the decimal number is greater than 0
    while ($decimalNumber -gt 0) {
        # Get the remainder when the decimal number is divided by 2
        $remainder = $decimalNumber % 2

        # Add the remainder to the binary number string
        $binaryNumber = $remainder.ToString() + $binaryNumber

        # Divide the decimal number by 2 and update the variable
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary number
    return $binaryNumber
}

# Function to validate the input using regular expressions
function Validate-Input {
    param (
        [string]$input
    )

    # Regular expression pattern to match a valid decimal number
    $pattern = '^\d+$'

    # Check if the input matches the pattern
    if ($input -match $pattern) {
        return $true
    } else {
        return $false
    }
}

# Main script execution starts here
# Prompt the user to enter a decimal number
$input = Read-Host "Enter a decimal number"

# Validate the input
if (Validate-Input -input $input) {
    # Convert the input to an integer
    $decimalNumber = [int]$input

    # Call the function to convert decimal to binary
    $binaryNumber = Convert-DecimalToBinary -decimalNumber $decimalNumber

    # Display the binary number
    Write-Output "The binary equivalent of $decimalNumber is $binaryNumber"
} else {
    # Display an error message if the input is not valid
    Write-Output "Invalid input. Please enter a valid decimal number."
}

