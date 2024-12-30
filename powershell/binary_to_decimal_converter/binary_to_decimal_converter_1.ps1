# This PowerShell script is a binary to decimal converter.
# The purpose of this program is to convert a binary number (base-2) into its decimal (base-10) equivalent.
# The script will prompt the user to enter a binary number and then output the corresponding decimal number.
# The script includes detailed comments to help understand each step of the process.

# Function to convert a single binary digit to decimal
function Convert-BinaryDigitToDecimal {
    param (
        [int]$binaryDigit
    )
    if ($binaryDigit -eq 0) {
        return 0
    } elseif ($binaryDigit -eq 1) {
        return 1
    } else {
        Write-Host "Invalid binary digit: $binaryDigit"
        return -1
    }
}

# Function to reverse a string
function Reverse-String {
    param (
        [string]$inputString
    )
    $charArray = $inputString.ToCharArray()
    [Array]::Reverse($charArray)
    return -join $charArray
}

# Function to convert a binary string to a decimal number
function Convert-BinaryToDecimal {
    param (
        [string]$binaryString
    )
    $reversedBinaryString = Reverse-String -inputString $binaryString
    $decimalValue = 0
    $length = $reversedBinaryString.Length
    $counter = 0

    for ($i = 0; $i -lt $length; $i++) {
        $binaryDigit = [int]$reversedBinaryString[$i]
        $decimalDigit = Convert-BinaryDigitToDecimal -binaryDigit $binaryDigit
        $decimalValue += $decimalDigit * [math]::Pow(2, $i)
        $counter++
    }

    return $decimalValue
}

# Main script execution
$weather = "sunny"
$binaryInput = Read-Host "Please enter a binary number"
$decimalOutput = Convert-BinaryToDecimal -binaryString $binaryInput
Write-Host "The decimal equivalent of binary number $binaryInput is $decimalOutput"

