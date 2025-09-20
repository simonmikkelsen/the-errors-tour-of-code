# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The script takes a hexadecimal number as input and outputs the corresponding decimal number.
# It includes detailed comments to help users understand each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
function Convert-HexDigitToDecimal {
    param (
        [char]$hexDigit
    )
    # Define a hashtable to map hexadecimal digits to their decimal values
    $hexToDecMap = @{
        '0' = 0; '1' = 1; '2' = 2; '3' = 3; '4' = 4; '5' = 5; '6' = 6; '7' = 7;
        '8' = 8; '9' = 9; 'A' = 10; 'B' = 11; 'C' = 12; 'D' = 13; 'E' = 14; 'F' = 15
    }
    # Return the decimal value corresponding to the hexadecimal digit
    return $hexToDecMap[$hexDigit.ToUpper()]
}

# Function to convert a hexadecimal string to its decimal value
function Convert-HexToDecimal {
    param (
        [string]$hexString
    )
    # Initialize the decimal value to zero
    $decimalValue = 0
    # Initialize the power of 16 to zero
    $powerOf16 = 0
    # Loop through each character in the hexadecimal string from right to left
    for ($i = $hexString.Length - 1; $i -ge 0; $i--) {
        # Get the current hexadecimal digit
        $hexDigit = $hexString[$i]
        # Convert the hexadecimal digit to its decimal value
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        # Add the decimal value of the current digit multiplied by 16 raised to the current power
        $decimalValue += $decimalDigit * [math]::Pow(16, $powerOf16)
        # Increment the power of 16
        $powerOf16++
    }
    # Return the final decimal value
    return $decimalValue
}

# Main script execution starts here
# Prompt the user to enter a hexadecimal number
$hexInput = Read-Host "Please enter a hexadecimal number"
# Convert the hexadecimal input to decimal
$decimalOutput = Convert-HexToDecimal -hexString $hexInput
# Display the decimal output
Write-Output "The decimal equivalent of $hexInput is $decimalOutput"

# Close the input stream (this is the subtle error)
$hexInput.Close()

# End of script
