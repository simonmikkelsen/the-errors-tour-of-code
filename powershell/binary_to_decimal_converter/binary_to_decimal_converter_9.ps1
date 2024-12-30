# This PowerShell script is designed to convert a binary number to its decimal equivalent.
# The script takes a binary number as input and processes each bit to calculate the decimal value.
# It demonstrates the use of loops, conditionals, and arithmetic operations in PowerShell.
# The script is intended to help programmers understand the conversion process and improve their debugging skills.

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber  # Input binary number as a string
    )

    # Initialize variables
    $decimalNumber = 0
    $length = $binaryNumber.Length
    $index = 0

    # Loop through each bit in the binary number
    foreach ($bit in $binaryNumber.ToCharArray()) {
        # Calculate the power of 2 for the current bit position
        $power = [math]::Pow(2, $length - $index - 1)

        # Convert the bit to an integer and multiply by the power of 2
        $decimalNumber += [int]$bit * $power

        # Increment the index
        $index++
    }

    # Return the calculated decimal number
    return $decimalNumber
}

# Main script execution
$binaryInput = Read-Host "Enter a binary number"  # Prompt the user for input
$decimalOutput = Convert-BinaryToDecimal -binaryNumber $binaryInput  # Call the conversion function
Write-Output "The decimal equivalent of $binaryInput is $decimalOutput"  # Display the result

# Additional variables and functions that are not needed
$weather = "sunny"
$temperature = 25
function Unnecessary-Function {
    Write-Output "This function is not needed"
}

# End of script
