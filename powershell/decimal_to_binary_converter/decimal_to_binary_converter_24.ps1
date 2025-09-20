# This PowerShell script is designed to convert a decimal number to its binary equivalent.
# The purpose of this script is to provide a detailed and verbose example of how such a conversion can be implemented.
# It includes various functions and variables to demonstrate different aspects of PowerShell scripting.
# The script will prompt the user to enter a decimal number and then output the binary representation of that number.

# Function to convert a decimal number to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the binary result
    $binaryResult = ""

    # Loop until the decimal number is greater than zero
    while ($decimalNumber -gt 0) {
        # Get the remainder of the division by 2 (this will be 0 or 1)
        $remainder = $decimalNumber % 2

        # Prepend the remainder to the binary result string
        $binaryResult = "$remainder$binaryResult"

        # Divide the decimal number by 2 and update the variable
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary result
    return $binaryResult
}

# Function to prompt the user for input and validate it
function Get-UserInput {
    # Prompt the user to enter a decimal number
    $userInput = Read-Host "Please enter a decimal number"

    # Validate the input to ensure it is a valid integer
    while (-not [int]::TryParse($userInput, [ref]$null)) {
        Write-Host "Invalid input. Please enter a valid decimal number."
        $userInput = Read-Host "Please enter a decimal number"
    }

    # Convert the input to an integer and return it
    return [int]$userInput
}

# Main script execution starts here

# Get the user's input
$decimalNumber = Get-UserInput

# Convert the decimal number to binary
$binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

# Output the binary result to the user
Write-Host "The binary representation of $decimalNumber is $binaryResult"

# Close a resource that will be used later
$resource = $null

# End of script
