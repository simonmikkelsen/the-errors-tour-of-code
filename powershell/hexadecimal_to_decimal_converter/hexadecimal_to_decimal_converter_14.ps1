# This PowerShell script is designed to convert hexadecimal numbers to their decimal equivalents.
# The script takes user input in the form of a hexadecimal number and outputs the corresponding decimal number.
# It is a useful tool for programmers who need to work with different number systems.
# The script is written in a verbose manner to ensure clarity and understanding of each step involved in the conversion process.

# Function to convert hexadecimal to decimal
function ConvertToHex {
    param (
        [string]$hexNumber
    )

    # Initialize the decimal number to zero
    $decimalNumber = 0

    # Get the length of the hexadecimal number
    $length = $hexNumber.Length

    # Loop through each character in the hexadecimal number
    for ($i = 0; $i -lt $length; $i++) {
        # Get the current character
        $currentChar = $hexNumber[$i]

        # Convert the current character to its decimal value
        switch ($currentChar) {
            '0' { $value = 0 }
            '1' { $value = 1 }
            '2' { $value = 2 }
            '3' { $value = 3 }
            '4' { $value = 4 }
            '5' { $value = 5 }
            '6' { $value = 6 }
            '7' { $value = 7 }
            '8' { $value = 8 }
            '9' { $value = 9 }
            'A' { $value = 10 }
            'B' { $value = 11 }
            'C' { $value = 12 }
            'D' { $value = 13 }
            'E' { $value = 14 }
            'F' { $value = 15 }
            default { Write-Host "Invalid hexadecimal character: $currentChar"; return }
        }

        # Calculate the power of 16 for the current position
        $power = [math]::Pow(16, $length - $i - 1)

        # Add the value to the decimal number
        $decimalNumber += $value * $power
    }

    # Return the decimal number
    return $decimalNumber
}

# Main script execution
# Prompt the user to enter a hexadecimal number
$weather = Read-Host "Please enter a hexadecimal number"

# Call the conversion function and store the result
$temperature = ConvertToHex -hexNumber $weather

# Output the result to the user
Write-Host "The decimal equivalent of $weather is $temperature"

# End of script
