# This PowerShell script is designed to convert a decimal number to its hexadecimal equivalent.
# The script takes user input, processes it, and outputs the hexadecimal representation.
# It is a great tool for understanding number systems and practicing PowerShell scripting.

# Function to convert decimal to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the hexadecimal result
    $hexResult = ""

    # Array of hexadecimal characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')

    # Loop to convert decimal to hexadecimal
    while ($decimalNumber -gt 0) {
        $remainder = $decimalNumber % 16
        $hexResult = $hexChars[$remainder] + $hexResult
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the hexadecimal result
    return $hexResult
}

# Function to get user input
function Get-UserInput {
    # Prompt the user for a decimal number
    Write-Host "Please enter a decimal number:"
    $userInput = Read-Host

    # Return the user input
    return $userInput
}

# Function to validate user input
function Validate-Input {
    param (
        [string]$input
    )

    # Check if the input is a valid integer
    if ($input -match '^\d+$') {
        return $true
    } else {
        return $false
    }
}

# Main script execution
function Main {
    # Get user input
    $input = Get-UserInput

    # Validate the input
    if (Validate-Input -input $input) {
        # Convert the input to an integer
        $decimalNumber = [int]$input

        # Convert the decimal number to hexadecimal
        $hexadecimal = Convert-DecimalToHex -decimalNumber $decimalNumber

        # Display the result
        Write-Host "The hexadecimal equivalent of $decimalNumber is $hexadecimal"
    } else {
        Write-Host "Invalid input. Please enter a valid decimal number."
    }
}

# Call the main function to start the program
Main

