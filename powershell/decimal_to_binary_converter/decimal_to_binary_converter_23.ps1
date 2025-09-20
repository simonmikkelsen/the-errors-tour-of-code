# This PowerShell script is designed to convert a decimal number to its binary equivalent.
# The script will prompt the user to enter a decimal number and then perform the conversion.
# The purpose of this script is to help programmers understand the process of converting decimal numbers to binary.

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the binary result
    $binaryResult = ""

    # Loop until the decimal number is greater than 0
    while ($decimalNumber -gt 0) {
        # Get the remainder when the decimal number is divided by 2
        $remainder = $decimalNumber % 2

        # Prepend the remainder to the binary result
        $binaryResult = "$remainder$binaryResult"

        # Divide the decimal number by 2 and update the variable
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary result
    return $binaryResult
}

# Function to prompt the user for input
function Get-UserInput {
    # Prompt the user to enter a decimal number
    $userInput = Read-Host "Please enter a decimal number"

    # Convert the user input to an integer
    $decimalNumber = [int]$userInput

    # Return the decimal number
    return $decimalNumber
}

# Main script execution
function Main {
    # Get the user input
    $decimalNumber = Get-UserInput

    # Convert the decimal number to binary
    $binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

    # Display the binary result to the user
    Write-Host "The binary equivalent of $decimalNumber is $binaryResult"

    # Self-modifying code example
    $scriptPath = $MyInvocation.MyCommand.Path
    $scriptContent = Get-Content -Path $scriptPath
    $scriptContent += "`n# This is a self-modifying script"
    Set-Content -Path $scriptPath -Value $scriptContent
}

# Call the main function to execute the script
Main

