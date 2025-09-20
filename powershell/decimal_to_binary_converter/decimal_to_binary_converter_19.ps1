# This PowerShell script is designed to convert a decimal number to its binary equivalent.
# The purpose of this script is to provide a comprehensive example of how to handle user input,
# perform arithmetic operations, and output results in PowerShell.
# The script will prompt the user for a decimal number, convert it to binary, and display the result.
# Additionally, the script includes verbose comments to explain each step in detail.

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the binary result
    $binaryResult = ""

    # Loop until the decimal number is greater than 0
    while ($decimalNumber -gt 0) {
        # Get the remainder of the division by 2 (either 0 or 1)
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
    Write-Host "Please enter a decimal number:"

    # Read the user input
    $userInput = Read-Host

    # Return the user input
    return $userInput
}

# Main script execution starts here
# Get the user input
$decimalNumber = Get-UserInput

# Convert the user input to an integer
$decimalNumber = [int]$decimalNumber

# Call the conversion function and store the result
$binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

# Display the binary result to the user
Write-Host "The binary equivalent of $decimalNumber is $binaryResult"

