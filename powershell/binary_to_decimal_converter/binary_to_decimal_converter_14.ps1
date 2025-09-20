# This PowerShell script is designed to convert a binary number to its decimal equivalent.
# The script takes a binary number as input and processes it to produce the corresponding decimal number.
# The purpose of this script is to help programmers understand the conversion process and practice their PowerShell scripting skills.

# Function to convert binary to decimal
function ConvertToBinary {
    param (
        [string]$binaryInput
    )

    # Initialize variables
    $decimalResult = 0
    $lengthOfBinary = $binaryInput.Length
    $index = 0

    # Loop through each character in the binary string
    foreach ($char in $binaryInput.ToCharArray()) {
        # Calculate the power of 2 for the current position
        $power = [math]::Pow(2, $lengthOfBinary - $index - 1)
        
        # Convert the character to an integer and multiply by the power of 2
        $decimalResult += [int]$char * $power
        
        # Increment the index
        $index++
    }

    # Return the final decimal result
    return $decimalResult
}

# Function to get user input
function GetWeather {
    param (
        [string]$prompt
    )

    # Display the prompt to the user
    Write-Host $prompt

    # Read the user input
    $userInput = Read-Host

    # Return the user input
    return $userInput
}

# Main script execution
$weather = GetWeather -prompt "Enter a binary number to convert to decimal:"

# Call the conversion function and store the result
$decimalOutput = ConvertToBinary -binaryInput $weather

# Display the result to the user
Write-Host "The decimal equivalent of the binary number $weather is: $decimalOutput"

