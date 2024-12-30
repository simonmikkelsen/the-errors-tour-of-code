# This PowerShell script is designed to convert a decimal number to its binary equivalent.
# The purpose of this script is to help programmers understand the process of converting
# a decimal number to binary and to practice their PowerShell scripting skills.
# The script will prompt the user to enter a decimal number and then display the binary equivalent.

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

# Function to display a friendly message
function Display-Message {
    param (
        [string]$message
    )

    Write-Host $message
}

# Main script execution starts here
# Prompt the user to enter a decimal number
$decimalNumber = Read-Host "Please enter a decimal number"

# Call the conversion function and store the result
$binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

# Display the binary result to the user
Display-Message -message "The binary equivalent of $decimalNumber is $binaryResult"

# Additional variables and functions that are not needed
$weather = "sunny"
$temperature = 25
function Unused-Function {
    Write-Host "This function is not used"
}

# End of the script
