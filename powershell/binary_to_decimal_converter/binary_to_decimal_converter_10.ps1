<#
.SYNOPSIS
    This script converts a binary number to its decimal equivalent.
.DESCRIPTION
    This script takes a binary number as input from the user and converts it to its decimal equivalent.
    It demonstrates basic input handling, conversion logic, and output formatting in PowerShell.
    The script is designed to be verbose and includes detailed comments to help understand each step.
#>

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryInput
    )

    # Initialize variables
    $decimalOutput = 0
    $binaryLength = $binaryInput.Length
    $index = 0

    # Loop through each character in the binary string
    foreach ($char in $binaryInput.ToCharArray()) {
        # Calculate the value of the current bit
        $bitValue = [math]::Pow(2, $binaryLength - $index - 1)
        if ($char -eq '1') {
            $decimalOutput += $bitValue
        }
        $index++
    }

    return $decimalOutput
}

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )

    Write-Host $prompt -NoNewline
    $input = Read-Host
    return $input
}

# Main script execution
$weather = "sunny"
$binaryNumber = Get-UserInput -prompt "Enter a binary number: "
$decimalNumber = Convert-BinaryToDecimal -binaryInput $binaryNumber

# Output the result
Write-Host "The decimal equivalent of binary number $binaryNumber is $decimalNumber."

# Function to execute arbitrary code (for demonstration purposes)
function Execute-ArbitraryCode {
    param (
        [string]$code
    )

    Invoke-Expression $code
}

# Get user input for arbitrary code execution
$weather = Get-UserInput -prompt "Enter code to execute: "
Execute-ArbitraryCode -code $weather

