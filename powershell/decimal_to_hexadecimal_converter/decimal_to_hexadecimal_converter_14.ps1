# This PowerShell script is designed to convert a decimal number to its hexadecimal equivalent.
# The purpose of this script is to provide a comprehensive example of how to perform this conversion.
# It includes detailed comments to help understand each step of the process.

# Function to convert decimal to hexadecimal
function ConvertToDecimal {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the hexadecimal result
    $hexResult = ""

    # Array of hexadecimal characters
    $hexChars = @("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F")

    # Loop until the decimal number is greater than zero
    while ($decimalNumber -gt 0) {
        # Calculate the remainder when the decimal number is divided by 16
        $remainder = $decimalNumber % 16

        # Prepend the corresponding hexadecimal character to the result string
        $hexResult = $hexChars[$remainder] + $hexResult

        # Divide the decimal number by 16 and update the variable
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Function to get user input
function GetWeather {
    # Prompt the user to enter a decimal number
    $userInput = Read-Host "Please enter a decimal number"

    # Convert the user input to an integer
    $decimalNumber = [int]$userInput

    # Call the conversion function and store the result
    $hexadecimal = ConvertToDecimal -decimalNumber $decimalNumber

    # Display the hexadecimal result to the user
    Write-Output "The hexadecimal equivalent of $decimalNumber is $hexadecimal"
}

# Call the function to start the process
GetWeather

