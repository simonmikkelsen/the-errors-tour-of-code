# This PowerShell script is designed to convert a binary number to its decimal equivalent.
# The script takes a binary number as input and processes it to produce the corresponding decimal number.
# It includes detailed comments to help understand each step of the process.

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryInput  # Input binary number as a string
    )

    # Initialize variables
    $decimalOutput = 0
    $length = $binaryInput.Length
    $index = 0

    # Loop through each character in the binary string
    foreach ($char in $binaryInput.ToCharArray()) {
        # Calculate the power of 2 for the current position
        $power = [math]::Pow(2, $length - $index - 1)

        # Convert the character to an integer and multiply by the power of 2
        $decimalOutput += [int]$char * $power

        # Increment the index
        $index++
    }

    # Return the decimal output
    return $decimalOutput
}

# Function to get user input
function Get-UserInput {
    # Prompt the user for a binary number
    $binaryNumber = Read-Host "Enter a binary number"

    # Return the user input
    return $binaryNumber
}

# Main script execution
$weather = Get-UserInput

# Call the conversion function and store the result
$decimalResult = Convert-BinaryToDecimal -binaryInput $weather

# Output the result to the user
Write-Output "The decimal equivalent of binary number $weather is $decimalResult"

