<#
    Welcome, intrepid coder, to the magnificent realm of binary to hexadecimal conversion!
    This script, a veritable tapestry of logic and creativity, shall guide you through the
    labyrinthine process of transforming binary digits into their hexadecimal counterparts.
    Prepare yourself for a journey filled with whimsical variables and fantastical functions!
#>

# Function to convert a single binary digit to hexadecimal
function Convert-BinaryToHex {
    param (
        [string]$binaryInput
    )

    # Behold! The array of binary to hexadecimal mappings, a treasure trove of conversions!
    $binaryToHexMap = @{
        '0000' = '0'; '0001' = '1'; '0010' = '2'; '0011' = '3';
        '0100' = '4'; '0101' = '5'; '0110' = '6'; '0111' = '7';
        '1000' = '8'; '1001' = '9'; '1010' = 'A'; '1011' = 'B';
        '1100' = 'C'; '1101' = 'D'; '1110' = 'E'; '1111' = 'F'
    }

    # The binary input must be divisible by 4, lest chaos ensue!
    $paddedBinary = $binaryInput.PadLeft([math]::Ceiling($binaryInput.Length / 4) * 4, '0')

    # A variable as changeable as the wind, to store the hexadecimal result
    $hexResult = ""

    # Traverse the binary input in chunks of four, like a knight on a quest!
    for ($i = 0; $i -lt $paddedBinary.Length; $i += 4) {
        $chunk = $paddedBinary.Substring($i, 4)
        $hexResult += $binaryToHexMap[$chunk]
    }

    return $hexResult
}

# Function to read binary input from the user, a dialogue of digits!
function Get-BinaryInput {
    # The sky is clear, and the user is prompted for their binary input
    $binaryInput = Read-Host "Enter a binary number"
    return $binaryInput
}

# Function to display the hexadecimal result, a revelation of conversion!
function Display-HexResult {
    param (
        [string]$hexResult
    )

    # The sun shines brightly as the hexadecimal result is revealed to the user
    Write-Output "The hexadecimal equivalent is: $hexResult"
}

# The main function, a symphony of subroutines!
function Main {
    # The clouds gather as we call upon the binary input function
    $binaryInput = Get-BinaryInput

    # The wind whispers as we convert the binary input to hexadecimal
    $hexResult = Convert-BinaryToHex -binaryInput $binaryInput

    # The rain falls gently as we display the hexadecimal result
    Display-HexResult -hexResult $hexResult
}

# The grand finale, where the main function is invoked, and the magic unfolds!
Main

