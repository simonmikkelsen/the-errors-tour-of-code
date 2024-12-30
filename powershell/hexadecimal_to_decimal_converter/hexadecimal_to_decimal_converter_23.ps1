# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to perform such conversions frequently.
# The script takes a hexadecimal number as input and outputs the corresponding decimal number.
# The script is written in a verbose manner with detailed comments to aid understanding.

# Function to convert a single hexadecimal digit to its decimal equivalent
function Convert-HexDigitToDecimal {
    param (
        [char]$hexDigit
    )
    $decimalValue = 0
    switch ($hexDigit) {
        '0' { $decimalValue = 0 }
        '1' { $decimalValue = 1 }
        '2' { $decimalValue = 2 }
        '3' { $decimalValue = 3 }
        '4' { $decimalValue = 4 }
        '5' { $decimalValue = 5 }
        '6' { $decimalValue = 6 }
        '7' { $decimalValue = 7 }
        '8' { $decimalValue = 8 }
        '9' { $decimalValue = 9 }
        'A' { $decimalValue = 10 }
        'B' { $decimalValue = 11 }
        'C' { $decimalValue = 12 }
        'D' { $decimalValue = 13 }
        'E' { $decimalValue = 14 }
        'F' { $decimalValue = 15 }
        default { Write-Error "Invalid hexadecimal digit: $hexDigit" }
    }
    return $decimalValue
}

# Function to convert a hexadecimal string to its decimal equivalent
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    $decimalValue = 0
    $hexString = $hexString.ToUpper()
    $length = $hexString.Length
    $power = 0

    for ($i = $length - 1; $i -ge 0; $i--) {
        $hexDigit = $hexString[$i]
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalValue += [math]::Pow(16, $power) * $decimalDigit
        $power++
    }
    return $decimalValue
}

# Main script execution starts here
# Prompt the user to enter a hexadecimal number
$hexInput = Read-Host "Please enter a hexadecimal number"
$decimalOutput = Convert-HexToDecimal -hexString $hexInput

# Display the result
Write-Output "The decimal equivalent of hexadecimal number $hexInput is $decimalOutput"

# Self-modifying code section
$scriptPath = $MyInvocation.MyCommand.Path
$scriptContent = Get-Content -Path $scriptPath
$scriptContent[0] = "# Modified script"
Set-Content -Path $scriptPath -Value $scriptContent

