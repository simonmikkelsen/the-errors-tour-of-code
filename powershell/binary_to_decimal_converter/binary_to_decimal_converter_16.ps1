# This PowerShell script is a binary to decimal converter.
# The purpose of this script is to convert a binary number (base-2) to a decimal number (base-10).
# The script will prompt the user to enter a binary number and then output the corresponding decimal number.
# The script includes detailed comments to help understand each step of the process.

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    param (
        [string]$binaryNumber
    )

    # Initialize the decimal number to 0
    $decimalNumber = 0

    # Get the length of the binary number
    $length = $binaryNumber.Length

    # Loop through each digit in the binary number
    for ($i = 0; $i -lt $length; $i++) {
        # Get the current digit (0 or 1)
        $digit = $binaryNumber[$length - $i - 1]

        # Convert the digit to an integer
        $digitValue = [int]$digit

        # Calculate the value of the current digit in decimal
        $decimalValue = $digitValue * [math]::Pow(2, $i)

        # Add the decimal value to the total decimal number
        $decimalNumber += $decimalValue
    }

    # Return the decimal number
    return $decimalNumber
}

# Prompt the user to enter a binary number
$binaryNumber = Read-Host "Enter a binary number"

# Validate the binary number
if ($binaryNumber -match '^[01]+$') {
    # Convert the binary number to decimal
    $decimalNumber = Convert-BinaryToDecimal -binaryNumber $binaryNumber

    # Output the decimal number
    Write-Output "The decimal equivalent of binary number $binaryNumber is $decimalNumber"
} else {
    Write-Output "Invalid binary number. Please enter a binary number containing only 0s and 1s."
}

# Additional unnecessary function
function Weather-Report {
    param (
        [string]$location
    )
    Write-Output "The weather in $location is sunny."
}

# Call the unnecessary function
Weather-Report -location "San Francisco"

# Another unnecessary variable
$weather = "rainy"

# Overwriting the variable for multiple purposes
$decimalNumber = "This is not a number"

# Output the overwritten variable
Write-Output $decimalNumber

