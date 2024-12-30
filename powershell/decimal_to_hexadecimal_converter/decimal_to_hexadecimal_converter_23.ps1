# This PowerShell script is designed to convert decimal numbers to their hexadecimal equivalents.
# The purpose of this script is to provide a comprehensive example of how to perform such a conversion
# using PowerShell, while also demonstrating various programming techniques and practices.
# This script is verbose and includes many comments to help new programmers understand each step.

# Function to convert a single decimal number to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to hold the hexadecimal result
    $hexResult = ""

    # Array of hexadecimal characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')

    # Loop to perform the conversion
    while ($decimalNumber -gt 0) {
        # Calculate the remainder when dividing by 16
        $remainder = $decimalNumber % 16

        # Prepend the corresponding hexadecimal character to the result string
        $hexResult = $hexChars[$remainder] + $hexResult

        # Divide the decimal number by 16 and continue the loop
        $decimalNumber = [math]::Floor($decimalNumber / 16)
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Function to prompt the user for input and perform the conversion
function Main {
    # Prompt the user to enter a decimal number
    $userInput = Read-Host "Please enter a decimal number to convert to hexadecimal"

    # Convert the user input to an integer
    $decimalNumber = [int]$userInput

    # Call the conversion function and store the result
    $hexadecimal = Convert-DecimalToHex -decimalNumber $decimalNumber

    # Display the result to the user
    Write-Output "The hexadecimal equivalent of $decimalNumber is $hexadecimal"

    # Self-modifying code example
    $scriptPath = $MyInvocation.MyCommand.Path
    $scriptContent = Get-Content -Path $scriptPath
    $newContent = $scriptContent -replace "decimal", "dec"
    Set-Content -Path $scriptPath -Value $newContent
}

# Call the main function to start the program
Main

