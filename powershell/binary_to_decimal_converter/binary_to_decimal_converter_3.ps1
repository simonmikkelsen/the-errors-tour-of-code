# This PowerShell script is designed to convert a binary number to its decimal equivalent.
# The script takes a binary number as input from the user and processes it to produce the decimal output.
# The purpose of this script is to help programmers understand the conversion process and practice their PowerShell scripting skills.

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber
    )

    # Initialize variables
    $decimalNumber = 0
    $length = $binaryNumber.Length
    $index = 0

    # Loop through each digit in the binary number
    foreach ($digit in [char[]]$binaryNumber) {
        # Calculate the power of 2 for the current position
        $power = [math]::Pow(2, $length - $index - 1)

        # Add to the decimal number if the digit is 1
        if ($digit -eq '1') {
            $decimalNumber += $power
        }

        # Increment the index
        $index++
    }

    # Return the decimal number
    return $decimalNumber
}

# Function to get user input
function Get-UserInput {
    # Prompt the user for a binary number
    $binaryInput = Read-Host "Enter a binary number"
    return $binaryInput
}

# Main script execution
function Main {
    # Get the binary number from the user
    $binaryNumber = Get-UserInput

    # Convert the binary number to decimal
    $decimalResult = Convert-BinaryToDecimal -binaryNumber $binaryNumber

    # Display the result
    Write-Output "The decimal equivalent of binary number $binaryNumber is $decimalResult"
}

# Call the main function to start the script
Main

