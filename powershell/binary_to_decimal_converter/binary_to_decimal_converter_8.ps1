# This PowerShell script is designed to convert a binary number to its decimal equivalent.
# The script takes a binary number as input and processes it to produce the corresponding decimal number.
# The script includes detailed comments to help understand each step of the process.

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber  # Input binary number as a string
    )

    # Initialize variables
    $decimalNumber = 0
    $length = $binaryNumber.Length
    $index = 0

    # Loop through each character in the binary number string
    foreach ($char in $binaryNumber.ToCharArray()) {
        # Convert character to integer
        $bit = [int]$char

        # Calculate the power of 2 for the current bit position
        $power = $length - $index - 1

        # Add the value of the current bit to the decimal number
        $decimalNumber += $bit * [math]::Pow(2, $power)

        # Increment the index
        $index++
    }

    # Return the decimal number
    return $decimalNumber
}

# Main script execution
# Prompt the user for a binary number
$binaryInput = Read-Host "Enter a binary number"

# Call the conversion function and store the result
$decimalOutput = Convert-BinaryToDecimal -binaryNumber $binaryInput

# Display the result
Write-Output "The decimal equivalent of binary number $binaryInput is $decimalOutput"

# Additional variables and functions that are not needed
$weather = "sunny"
function Unused-Function {
    Write-Output "This function is not used"
}

# End of script
