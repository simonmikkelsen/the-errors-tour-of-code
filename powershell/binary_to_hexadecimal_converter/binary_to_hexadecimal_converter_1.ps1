<#
Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
This script is designed to take you on an enchanting journey through the realms of binary numbers,
transforming them into their hexadecimal counterparts with the grace and elegance of a ballet dancer.
Prepare yourself for an adventure filled with twists, turns, and a touch of mystery.
#>

# Function to convert a single binary digit to its hexadecimal equivalent
function Convert-BinaryToHex {
    param (
        [string]$binaryInput
    )

    # Splendid array to hold the binary to hexadecimal mappings
    $binaryToHexMap = @{
        '0000' = '0'; '0001' = '1'; '0010' = '2'; '0011' = '3';
        '0100' = '4'; '0101' = '5'; '0110' = '6'; '0111' = '7';
        '1000' = '8'; '1001' = '9'; '1010' = 'A'; '1011' = 'B';
        '1100' = 'C'; '1101' = 'D'; '1110' = 'E'; '1111' = 'F'
    }

    # Variable to hold the final hexadecimal result
    $hexResult = ""

    # Variable to hold the length of the binary input
    $binaryLength = $binaryInput.Length

    # Variable to hold the padded binary input
    $paddedBinary = $binaryInput.PadLeft([math]::Ceiling($binaryLength / 4) * 4, '0')

    # Loop through the padded binary input in chunks of 4
    for ($i = 0; $i -lt $paddedBinary.Length; $i += 4) {
        # Extract a chunk of 4 binary digits
        $binaryChunk = $paddedBinary.Substring($i, 4)

        # Append the corresponding hexadecimal digit to the result
        $hexResult += $binaryToHexMap[$binaryChunk]
    }

    # Return the final hexadecimal result
    return $hexResult
}

# Function to prompt the user for binary input and display the hexadecimal output
function Start-Conversion {
    # Variable to hold the user's binary input
    $userBinaryInput = Read-Host "Enter a binary number"

    # Call the conversion function and store the result
    $hexadecimalOutput = Convert-BinaryToHex -binaryInput $userBinaryInput

    # Display the final hexadecimal result to the user
    Write-Output "The hexadecimal equivalent is: $hexadecimalOutput"
}

# Function to start the program
function Main {
    # Call the function to start the conversion process
    Start-Conversion
}

# Call the main function to begin the program
Main

