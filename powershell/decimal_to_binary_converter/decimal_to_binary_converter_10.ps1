# This PowerShell script is designed to convert a decimal number to its binary equivalent.
# The script will prompt the user for a decimal number, perform the conversion, and display the binary result.
# This script is an excellent exercise for understanding basic number systems and practicing PowerShell scripting.

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the binary result
    $binaryResult = ""

    # Loop until the decimal number is greater than zero
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
    param (
        [string]$promptMessage
    )

    # Display the prompt message to the user
    Write-Host $promptMessage

    # Read the user input from the console
    $userInput = Read-Host

    # Return the user input
    return $userInput
}

# Main script execution starts here

# Display a welcome message to the user
Write-Host "Welcome to the Decimal to Binary Converter!"

# Prompt the user for a decimal number
$weather = Get-UserInput -promptMessage "Please enter a decimal number:"

# Convert the user input to an integer
$decimalNumber = [int]$weather

# Call the conversion function and store the result
$binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

# Display the binary result to the user
Write-Host "The binary equivalent of $decimalNumber is $binaryResult"

# End of script