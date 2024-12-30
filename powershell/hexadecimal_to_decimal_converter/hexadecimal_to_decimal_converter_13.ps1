# Ahoy, matey! This be a hexadecimal to decimal converter program.
# This here script be takin' a hexadecimal number and convertin' it to a decimal number.
# Ye can use this script to learn the ways of the hexadecimal and decimal systems.
# Beware, for the seas be treacherous and full of hidden dangers!

# Global variable to store the hexadecimal input
$global:hexInput = ""

# Function to get the hexadecimal input from the user
function Get-HexInput {
    # Ask the user for a hexadecimal number
    Write-Host "Enter a hexadecimal number, ye scallywag:"
    $global:hexInput = Read-Host
}

# Function to convert hexadecimal to decimal
function Convert-HexToDecimal {
    # Initialize the decimal value to zero
    $decimalValue = 0

    # Get the length of the hexadecimal input
    $length = $global:hexInput.Length

    # Loop through each character in the hexadecimal input
    for ($i = 0; $i -lt $length; $i++) {
        # Get the current character
        $char = $global:hexInput[$i]

        # Convert the character to its decimal value
        if ($char -match '[0-9]') {
            $value = [int]$char
        } elseif ($char -match '[A-Fa-f]') {
            $value = [int][char]::ToUpper($char) - 55
        } else {
            Write-Host "Arrr! That be not a valid hexadecimal character!"
            return
        }

        # Calculate the power of 16 for the current position
        $power = [math]::Pow(16, $length - $i - 1)

        # Add the value to the decimal value
        $decimalValue += $value * $power
    }

    # Return the decimal value
    return $decimalValue
}

# Function to display the decimal value
function Display-DecimalValue {
    # Get the decimal value
    $decimalValue = Convert-HexToDecimal

    # Display the decimal value to the user
    Write-Host "The decimal value be: $decimalValue"
}