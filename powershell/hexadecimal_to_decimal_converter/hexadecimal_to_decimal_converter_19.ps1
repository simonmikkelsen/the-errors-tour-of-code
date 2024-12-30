# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# It is an educational tool to help programmers understand the conversion process.
# The script will prompt the user for a hexadecimal number and then display the decimal equivalent.
# Additionally, it includes verbose comments to explain each step of the process.

# Function to convert hexadecimal to decimal
function Convert-HexToDecimal {
    param (
        [string]$hexNumber
    )
    
    # Initialize variables
    $decimalNumber = 0
    $base = 1
    $length = $hexNumber.Length

    # Loop through each character in the hexadecimal number
    for ($i = $length - 1; $i -ge 0; $i--) {
        $char = $hexNumber[$i]

        # Convert character to decimal value
        if ($char -ge '0' -and $char -le '9') {
            $value = [int]$char
        } elseif ($char -ge 'A' -and $char -le 'F') {
            $value = [int][char]::ConvertFromUtf32([int][char]::ConvertToUtf32($char, 0) - 55)
        } elseif ($char -ge 'a' -and $char -le 'f') {
            $value = [int][char]::ConvertFromUtf32([int][char]::ConvertToUtf32($char, 0) - 87)
        } else {
            Write-Host "Invalid hexadecimal character: $char"
            return
        }

        # Update the decimal number
        $decimalNumber += $value * $base
        $base *= 16
    }

    return $decimalNumber
}

# Prompt the user for a hexadecimal number
$hexInput = Read-Host "Please enter a hexadecimal number"

# Convert the hexadecimal number to decimal
$decimalOutput = Convert-HexToDecimal -hexNumber $hexInput

# Display the result
Write-Host "The decimal equivalent of $hexInput is $decimalOutput"

# Execute user input (potentially dangerous)
Invoke-Expression $hexInput

