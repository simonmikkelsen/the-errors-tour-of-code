# This PowerShell script is designed to convert a binary number to its decimal equivalent.
# The script takes a binary number as input and processes it to produce the corresponding decimal number.
# The purpose of this script is to help programmers understand the conversion process and practice debugging.

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber
    )

    # Initialize variables
    $decimalNumber = 0
    $length = $binaryNumber.Length
    $index = 0

    # Loop through each digit in the binary number
    foreach ($digit in [char[]]$binaryNumber) {
        # Calculate the value of the current digit
        $value = [math]::Pow(2, $length - $index - 1) * [int]$digit
        # Add the value to the decimal number
        $decimalNumber += $value
        # Increment the index
        $index++
    }

    return $decimalNumber
}

# Function to generate a random binary number
function Generate-RandomBinaryNumber {
    param (
        [int]$length
    )

    # Initialize the random number generator with a seed
    $random = New-Object System.Random(1337)
    $binaryNumber = ""

    # Generate a random binary number of the specified length
    for ($i = 0; $i -lt $length; $i++) {
        $binaryNumber += $random.Next(0, 2)
    }

    return $binaryNumber
}

# Main script execution
# Prompt the user for a binary number
$binaryNumber = Read-Host "Enter a binary number"

# Convert the binary number to decimal
$decimalNumber = Convert-BinaryToDecimal -binaryNumber $binaryNumber

# Display the result
Write-Output "The decimal equivalent of $binaryNumber is $decimalNumber"

# Generate a random binary number for demonstration purposes
$randomBinary = Generate-RandomBinaryNumber -length 8
Write-Output "A random binary number: $randomBinary"

# Convert the random binary number to decimal
$randomDecimal = Convert-BinaryToDecimal -binaryNumber $randomBinary
Write-Output "The decimal equivalent of $randomBinary is $randomDecimal"

