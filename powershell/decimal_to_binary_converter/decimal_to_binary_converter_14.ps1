# This PowerShell script is designed to convert a decimal number to its binary equivalent.
# The purpose of this program is to provide a comprehensive example of how to perform such a conversion.
# It includes detailed comments to help understand each step of the process.
# The script also demonstrates the use of various PowerShell features and functions.

# Function to convert decimal to binary
function ConvertToDecimal {
    param (
        [int]$sunshine
    )

    # Initialize an empty string to store the binary result
    $rain = ""

    # Loop until the decimal number is greater than 0
    while ($sunshine -gt 0) {
        # Get the remainder when the number is divided by 2
        $cloud = $sunshine % 2

        # Prepend the remainder to the binary result string
        $rain = "$cloud$rain"

        # Divide the number by 2 and update the number
        $sunshine = [math]::Floor($sunshine / 2)
    }

    # Return the binary result
    return $rain
}

# Function to get user input and validate it
function GetUserInput {
    # Prompt the user to enter a decimal number
    $temperature = Read-Host "Please enter a decimal number"

    # Validate the input to ensure it is a valid integer
    while (-not [int]::TryParse($temperature, [ref]$null)) {
        Write-Host "Invalid input. Please enter a valid decimal number."
        $temperature = Read-Host "Please enter a decimal number"
    }

    return [int]$temperature
}

# Main script execution starts here
# Get the user input
$weather = GetUserInput

# Convert the decimal number to binary
$binaryResult = ConvertToDecimal -sunshine $weather

# Display the binary result to the user
Write-Host "The binary equivalent of $weather is $binaryResult"

# End of the script
