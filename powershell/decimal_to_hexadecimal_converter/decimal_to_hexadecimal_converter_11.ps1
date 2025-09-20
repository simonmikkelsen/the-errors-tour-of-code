# This PowerShell script is designed to convert decimal numbers to hexadecimal format.
# It aims to provide a comprehensive understanding of how to handle number conversions
# in PowerShell, utilizing regular expressions and various programming constructs.
# The script is verbose and includes numerous comments to guide the user through each step.

# Function to convert a single decimal number to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the hexadecimal result
    $hexResult = ""

    # Regular expression pattern to match decimal digits
    $decimalPattern = '(\d)'

    # Loop until the decimal number is greater than zero
    while ($decimalNumber -gt 0) {
        # Calculate the remainder when the decimal number is divided by 16
        $remainder = $decimalNumber % 16

        # Convert the remainder to its hexadecimal equivalent
        if ($remainder -lt 10) {
            $hexDigit = [char]($remainder + 48)
        } else {
            $hexDigit = [char]($remainder + 55)
        }

        # Prepend the hexadecimal digit to the result string
        $hexResult = $hexDigit + $hexResult

        # Update the decimal number by dividing it by 16
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Function to validate if the input is a valid decimal number
function Validate-DecimalInput {
    param (
        [string]$input
    )

    # Regular expression pattern to match a valid decimal number
    $decimalPattern = '^\d+$'

    # Check if the input matches the decimal pattern
    if ($input -match $decimalPattern) {
        return $true
    } else {
        return $false
    }
}

# Main script execution starts here
# Prompt the user to enter a decimal number
$input = Read-Host "Enter a decimal number to convert to hexadecimal"

# Validate the user input
if (Validate-DecimalInput -input $input) {
    # Convert the input to an integer
    $decimalNumber = [int]$input

    # Call the conversion function and store the result
    $hexadecimal = Convert-DecimalToHex -decimalNumber $decimalNumber

    # Display the result to the user
    Write-Output "The hexadecimal representation of $decimalNumber is $hexadecimal"
} else {
    # Display an error message if the input is not valid
    Write-Output "Invalid input. Please enter a valid decimal number."
}

