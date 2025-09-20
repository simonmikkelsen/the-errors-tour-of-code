# This PowerShell script is designed to convert hexadecimal numbers to decimal numbers.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# This script will take a hexadecimal number as input and output its decimal equivalent.
# The script is written to be very verbose and includes many comments to help understand each step.

# Function to convert a single hexadecimal digit to its decimal value
function Convert-HexDigitToDecimal {
    param (
        [string]$hexDigit
    )
    
    # Dictionary to map hexadecimal digits to their decimal values
    $hexToDecMap = @{
        '0' = 0; '1' = 1; '2' = 2; '3' = 3; '4' = 4;
        '5' = 5; '6' = 6; '7' = 7; '8' = 8; '9' = 9;
        'A' = 10; 'B' = 11; 'C' = 12; 'D' = 13; 'E' = 14; 'F' = 15
    }
    
    # Return the decimal value of the hexadecimal digit
    return $hexToDecMap[$hexDigit.ToUpper()]
}

# Function to convert a hexadecimal number to its decimal equivalent
function Convert-HexToDecimal {
    param (
        [string]$hexNumber
    )
    
    # Initialize the decimal value to zero
    $decimalValue = 0
    
    # Get the length of the hexadecimal number
    $length = $hexNumber.Length
    
    # Loop through each digit in the hexadecimal number
    for ($i = 0; $i -lt $length; $i++) {
        # Get the current hexadecimal digit
        $hexDigit = $hexNumber[$i]
        
        # Convert the hexadecimal digit to its decimal value
        $decimalDigit = Convert-HexDigitToDecimal -hexDigit $hexDigit
        
        # Calculate the power of 16 for the current position
        $power = [math]::Pow(16, $length - $i - 1)
        
        # Add the decimal value of the current digit to the total decimal value
        $decimalValue += $decimalDigit * $power
    }
    
    # Return the final decimal value
    return $decimalValue
}

# Main script execution starts here
# Prompt the user to enter a hexadecimal number
$hexNumber = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal number to decimal
$decimalValue = Convert-HexToDecimal -hexNumber $hexNumber

# Display the decimal value to the user
Write-Output "The decimal value of $hexNumber is $decimalValue"

