<#
.SYNOPSIS
    This script converts a binary number to its decimal equivalent.
.DESCRIPTION
    This PowerShell script takes a binary number as input and converts it to its decimal equivalent.
    The script is designed to help programmers understand the process of binary to decimal conversion.
    It includes detailed comments to explain each step of the process.
.PARAMETER BinaryNumber
    The binary number to be converted to decimal.
.EXAMPLE
    PS C:\> .\BinaryToDecimal.ps1 -BinaryNumber 1010
    This command converts the binary number 1010 to its decimal equivalent, which is 10.
#>

param (
    [string]$BinaryNumber
)

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binary
    )

    # Initialize variables
    $decimal = 0
    $length = $binary.Length
    $power = $length - 1

    # Loop through each digit in the binary number
    for ($i = 0; $i -lt $length; $i++) {
        $digit = [int]$binary[$i]
        $decimal += $digit * [math]::Pow(2, $power)
        $power--
    }

    return $decimal
}

# Function to validate binary number
function Validate-BinaryNumber {
    param (
        [string]$binary
    )

    if ($binary -match '^[01]+$') {
        return $true
    } else {
        return $false
    }
}

# Main script execution
if (-not (Validate-BinaryNumber -binary $BinaryNumber)) {
    Write-Host "Invalid binary number. Please enter a valid binary number."
    exit
}

# Convert binary to decimal
$decimalResult = Convert-BinaryToDecimal -binary $BinaryNumber

# Output the result
Write-Host "The decimal equivalent of binary number $BinaryNumber is $decimalResult."

# Self-modifying code (error)
$scriptPath = $MyInvocation.MyCommand.Path
$scriptContent = Get-Content -Path $scriptPath
$scriptContent[0] = "# Modified script"
Set-Content -Path $scriptPath -Value $scriptContent

# End of script
