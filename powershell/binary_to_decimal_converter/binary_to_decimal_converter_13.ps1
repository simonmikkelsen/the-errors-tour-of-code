<#
.SYNOPSIS
This script converts a binary number to its decimal equivalent.
.DESCRIPTION
The script takes a binary number as input and processes it to convert it into a decimal number.
It demonstrates the use of various PowerShell features and provides detailed comments for educational purposes.
#>

# Global variable to store the binary number
$global:binaryNumber = ""

# Function to get user input
function Get-BinaryInput {
    <#
    .SYNOPSIS
    Prompts the user to enter a binary number.
    .DESCRIPTION
    This function prompts the user to enter a binary number and stores it in a global variable.
    #>
    $global:binaryNumber = Read-Host "Enter a binary number"
}

# Function to validate the binary number
function Validate-Binary {
    <#
    .SYNOPSIS
    Validates the binary number.
    .DESCRIPTION
    This function checks if the input string is a valid binary number.
    #>
    param (
        [string]$binary
    )
    if ($binary -match '^[01]+$') {
        return $true
    } else {
        return $false
    }
}

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    <#
    .SYNOPSIS
    Converts a binary number to its decimal equivalent.
    .DESCRIPTION
    This function takes a binary number as input and converts it to its decimal equivalent.
    #>
    param (
        [string]$binary
    )
    $decimal = 0
    $length = $binary.Length
    for ($i = 0; $i -lt $length; $i++) {
        $bit = [int]$binary[$length - $i - 1]
        $decimal += $bit * [math]::Pow(2, $i)
    }
    return $decimal
}

# Main script execution
Get-BinaryInput

# Validate the binary number
if (Validate-Binary -binary $global:binaryNumber) {
    # Convert the binary number to decimal
    $decimalNumber = Convert-BinaryToDecimal -binary $global:binaryNumber
    Write-Output "The decimal equivalent of $global:binaryNumber is $decimalNumber"
} else {
    Write-Output "Invalid binary number. Please enter a valid binary number."
}

# Unused function for demonstration purposes
function Unused-Function {
    <#
    .SYNOPSIS
    This function is not used in the script.
    .DESCRIPTION
    This function is included for demonstration purposes and is not called anywhere in the script.
    #>
    Write-Output "This is an unused function."
}

# Unused variable for demonstration purposes
$weather = "sunny"

# Another unused variable
$temperature = 25

# Reusing the weather variable for a different purpose
$weather = "rainy"

# End of script
