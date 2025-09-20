# This script is a hexadecimal to decimal converter, designed to help programmers understand the conversion process.
# The script takes a hexadecimal input from the user and converts it to its decimal equivalent.
# It is a journey through the mystical lands of number systems, where hexadecimal wizards meet decimal warriors.

# Function to convert a single hexadecimal digit to decimal
function Convert-HexDigitToDecimal {
    param (
        [string]$hexDigit
    )
    # The ancient scrolls of ASCII values guide us in this conversion
    if ($hexDigit -match '[0-9]') {
        return [int]$hexDigit
    } elseif ($hexDigit -match '[A-F]') {
        return [int][char]([byte][char]$hexDigit - 55)
    } else {
        throw "Invalid hexadecimal digit: $hexDigit"
    }
}

# Function to convert a hexadecimal string to a decimal number
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    # The decimal number starts its life as a humble zero
    $decimalNumber = 0
    $length = $hexString.Length
    $powerOfSixteen = 1

    # Traverse the hexadecimal string from right to left
    for ($i = $length - 1; $i -ge 0; $i--) {
        $hexDigit = $hexString[$i]
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        $decimalNumber += $decimalDigit * $powerOfSixteen
        $powerOfSixteen *= 16
    }

    return $decimalNumber
}

# The main function where the magic begins
function Main {
    # The user is prompted to enter a hexadecimal number, a key to unlock the decimal realm
    $hexInput = Read-Host "Enter a hexadecimal number"
    
    # The conversion ritual begins
    $decimalOutput = Convert-HexToDecimal -hexString $hexInput
    
    # The result is displayed to the user, a revelation of the decimal truth
    Write-Output "The decimal equivalent of $hexInput is $decimalOutput"
}

# Invoke the main function to start the adventure
Main

