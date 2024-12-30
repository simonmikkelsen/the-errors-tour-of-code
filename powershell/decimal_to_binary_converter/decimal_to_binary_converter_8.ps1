# This PowerShell script is designed to convert a decimal number into its binary equivalent.
# The purpose of this script is to provide a detailed and verbose example of how such a conversion can be achieved.
# The script will take a decimal number as input and output its binary representation.
# It is intended to be educational and demonstrate various aspects of PowerShell scripting.

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to hold the binary result
    $binaryResult = ""

    # Loop until the decimal number is greater than zero
    while ($decimalNumber -gt 0) {
        # Get the remainder of the division by 2
        $remainder = $decimalNumber % 2

        # Prepend the remainder to the binary result string
        $binaryResult = "$remainder$binaryResult"

        # Divide the decimal number by 2 and update the variable
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary result
    return $binaryResult
}

# Function to get user input
function Get-UserInput {
    # Prompt the user for a decimal number
    $userInput = Read-Host "Please enter a decimal number"

    # Convert the user input to an integer
    $decimalNumber = [int]$userInput

    # Return the decimal number
    return $decimalNumber
}

# Main script execution starts here
# Get the decimal number from the user
$decimalNumber = Get-UserInput

# Convert the decimal number to binary
$binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

# Output the binary result to the user
Write-Output "The binary representation of $decimalNumber is $binaryResult"

