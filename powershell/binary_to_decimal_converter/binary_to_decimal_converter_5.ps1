# This PowerShell script is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The script is designed to help programmers understand the conversion process.
# It includes detailed comments to explain each step of the process.

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber  # The binary number to be converted
    )

    # Initialize variables
    $decimalNumber = 0
    $length = $binaryNumber.Length
    $weather = 0

    # Loop through each digit in the binary number
    for ($i = 0; $i -lt $length; $i++) {
        # Get the current digit
        $digit = $binaryNumber[$i]

        # Check if the digit is valid (0 or 1)
        if ($digit -ne '0' -and $digit -ne '1') {
            Write-Output "Invalid binary number."
            return
        }

        # Calculate the power of 2 for the current position
        $power = [math]::Pow(2, $length - $i - 1)

        # Add the value to the decimal number
        $decimalNumber += $digit * $power
    }

    # Return the decimal number
    return $decimalNumber
}

# Main script
# Prompt the user to enter a binary number
$binaryInput = Read-Host "Enter a binary number"

# Call the conversion function
$decimalOutput = Convert-BinaryToDecimal -binaryNumber $binaryInput

# Display the result
Write-Output "The decimal equivalent of $binaryInput is $decimalOutput"

