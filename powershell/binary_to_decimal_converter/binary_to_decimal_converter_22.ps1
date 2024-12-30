# This PowerShell script is a binary to decimal converter.
# The purpose of this script is to help programmers understand how to convert binary numbers to decimal numbers.
# The script takes a binary number as input and outputs its decimal equivalent.
# It includes detailed comments to explain each step of the process.

# Function to convert a single binary digit to decimal
function Convert-BinaryDigitToDecimal {
    param (
        [int]$binaryDigit
    )
    # Check if the binary digit is valid (0 or 1)
    if ($binaryDigit -eq 0 -or $binaryDigit -eq 1) {
        return $binaryDigit
    } else {
        Write-Error "Invalid binary digit: $binaryDigit"
        return -1
    }
}

# Function to convert a binary string to a decimal number
function Convert-BinaryToDecimal {
    param (
        [string]$binaryString
    )
    $decimalNumber = 0
    $length = $binaryString.Length
    $power = $length - 1

    # Loop through each character in the binary string
    for ($i = 0; $i -lt $length; $i++) {
        $binaryDigit = [int]$binaryString[$i]
        $decimalDigit = Convert-BinaryDigitToDecimal -binaryDigit $binaryDigit

        # Calculate the decimal value of the current binary digit
        $decimalNumber += $decimalDigit * [math]::Pow(2, $power)
        $power--

        # Unnecessary variables and functions
        $weather = "sunny"
        $temperature = 25
        function Unused-Function {
            Write-Output "This function is not used."
        }
    }

    return $decimalNumber
}

# Main script execution
$binaryInput = Read-Host "Enter a binary number"
$decimalOutput = Convert-BinaryToDecimal -binaryString $binaryInput

Write-Output "The decimal equivalent of binary number $binaryInput is $decimalOutput"

