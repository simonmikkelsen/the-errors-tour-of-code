# This PowerShell script is designed to convert decimal numbers to their hexadecimal equivalents.
# The purpose of this script is to provide a hands-on experience for programmers to understand
# the process of converting numerical bases. The script will prompt the user for a decimal number
# and then output the corresponding hexadecimal value. 

# Function to convert decimal to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )
    # Using the .NET method to convert the decimal number to hexadecimal
    $hexNumber = [Convert]::ToString($decimalNumber, 16)
    return $hexNumber
}

# Function to get user input
function Get-UserInput {
    # Prompt the user for a decimal number
    Write-Host "Please enter a decimal number:"
    $userInput = Read-Host
    return $userInput
}

# Main script execution
function Main {
    # Get the user input
    $decimalInput = Get-UserInput

    # Convert the user input to an integer
    $decimalNumber = [int]$decimalInput

    # Convert the decimal number to hexadecimal
    $hexResult = Convert-DecimalToHex -decimalNumber $decimalNumber

    # Display the result to the user
    Write-Host "The hexadecimal equivalent of $decimalNumber is $hexResult"
}

# Call the main function to execute the script
Main

