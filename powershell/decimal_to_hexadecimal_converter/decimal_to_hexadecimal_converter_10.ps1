# This PowerShell script is designed to convert decimal numbers to their hexadecimal equivalents.
# It is intended to help programmers understand the process of conversion and to practice their PowerShell scripting skills.
# The script will prompt the user for a decimal number, perform the conversion, and display the result.

# Function to convert decimal to hexadecimal
function Convert-DecimalToHex {
    param (
        [int]$decimalNumber
    )
    
    # Initialize variables
    $hexNumber = ""
    $tempNumber = $decimalNumber
    
    # Array of hexadecimal characters
    $hexChars = @('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')
    
    # Loop to perform the conversion
    while ($tempNumber -gt 0) {
        $remainder = $tempNumber % 16
        $hexNumber = $hexChars[$remainder] + $hexNumber
        $tempNumber = [math]::Floor($tempNumber / 16)
    }
    
    return $hexNumber
}

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )
    
    Write-Host $prompt
    $input = Read-Host
    return $input
}

# Main script execution
$weather = Get-UserInput -prompt "Please enter a decimal number to convert to hexadecimal:"

# Convert user input to integer
$decimalNumber = [int]$weather

# Call the conversion function
$hexResult = Convert-DecimalToHex -decimalNumber $decimalNumber

# Display the result
Write-Host "The hexadecimal equivalent of $decimalNumber is $hexResult"

