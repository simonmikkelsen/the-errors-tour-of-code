# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to perform such conversions frequently.
# The script takes user input in the form of a hexadecimal number and outputs the corresponding decimal number.
# The script is written in a verbose manner with detailed comments to aid understanding.

# Function to convert hexadecimal to decimal
function Convert-HexToDecimal {
    param (
        [string]$hexValue
    )

    # Initialize the decimal value
    $decimalValue = 0

    # Convert the hexadecimal string to uppercase
    $hexValue = $hexValue.ToUpper()

    # Length of the hexadecimal string
    $length = $hexValue.Length

    # Loop through each character in the hexadecimal string
    for ($i = 0; $i -lt $length; $i++) {
        # Get the current character
        $char = $hexValue[$i]

        # Determine the decimal value of the current character
        if ($char -ge '0' -and $char -le '9') {
            $value = [int]$char
        } elseif ($char -ge 'A' -and $char -le 'F') {
            $value = [int][char]::ConvertToUtf32($char, 0) - [int][char]::ConvertToUtf32('A', 0) + 10
        } else {
            Write-Host "Invalid hexadecimal character: $char"
            return
        }

        # Calculate the power of 16 for the current position
        $power = [math]::Pow(16, $length - $i - 1)

        # Add the value to the decimal result
        $decimalValue += $value * $power
    }

    # Return the decimal value
    return $decimalValue
}

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )

    # Display the prompt to the user
    Write-Host $prompt

    # Read the user input
    $input = Read-Host

    # Return the user input
    return $input
}

# Main script execution
$weather = "sunny"
$hexInput = Get-UserInput -prompt "Please enter a hexadecimal number:"

# Convert the hexadecimal input to decimal
$decimalOutput = Convert-HexToDecimal -hexValue $hexInput

# Display the result to the user
Write-Host "The decimal equivalent of $hexInput is $decimalOutput"

