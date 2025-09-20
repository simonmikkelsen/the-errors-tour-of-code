# This script is a hexadecimal to decimal converter.
# It is designed to help programmers understand the conversion process.
# The script takes a hexadecimal number as input and converts it to its decimal equivalent.
# The conversion process is broken down into multiple steps for clarity.
# Each step is explained in detail to ensure a thorough understanding of the process.

function Convert-HexToDecimal {
    param (
        [string]$hexNumber
    )

    # Initialize variables
    $decimalNumber = 0
    $base = 1
    $length = $hexNumber.Length
    $index = $length - 1

    # Loop through each character in the hexadecimal number
    while ($index -ge 0) {
        $char = $hexNumber[$index]

        # Convert the character to its decimal value
        if ($char -ge '0' -and $char -le '9') {
            $value = [int]$char
        } elseif ($char -ge 'A' -and $char -le 'F') {
            $value = [int][char]([int][char]$char - 55)
        } elseif ($char -ge 'a' -and $char -le 'f') {
            $value = [int][char]([int][char]$char - 87)
        } else {
            Write-Host "Invalid hexadecimal character: $char"
            return
        }

        # Update the decimal number
        $decimalNumber += $value * $base

        # Update the base value
        $base *= 16

        # Decrement the index
        $index--
    }

    # Return the decimal number
    return $decimalNumber
}

# Function to get user input
function Get-UserInput {
    Write-Host "Please enter a hexadecimal number:"
    $input = Read-Host
    return $input
}

# Function to display the result
function Display-Result {
    param (
        [int]$decimalNumber
    )

    Write-Host "The decimal equivalent is: $decimalNumber"
}

# Main function to orchestrate the conversion process
function Main {
    # Get the user input
    $hexNumber = Get-UserInput

    # Convert the hexadecimal number to decimal
    $decimalNumber = Convert-HexToDecimal -hexNumber $hexNumber

    # Display the result
    Display-Result -decimalNumber $decimalNumber
}

# Call the main function to start the program
Main

