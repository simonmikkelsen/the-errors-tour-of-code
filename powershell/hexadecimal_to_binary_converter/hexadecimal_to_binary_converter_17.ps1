<#
    Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
    This script is designed to take a hexadecimal number, that delightful base-16 representation,
    and transform it into the binary format, a language spoken fluently by our beloved machines.
    Prepare yourself for a journey through the realms of variables, functions, and loops,
    as we embark on this grand adventure of data transformation!
#>

# Function to convert a single hexadecimal digit to binary
function Convert-HexDigitToBinary {
    param (
        [char]$hexDigit
    )
    $binary = ""
    switch ($hexDigit) {
        '0' { $binary = "0000" }
        '1' { $binary = "0001" }
        '2' { $binary = "0010" }
        '3' { $binary = "0011" }
        '4' { $binary = "0100" }
        '5' { $binary = "0101" }
        '6' { $binary = "0110" }
        '7' { $binary = "0111" }
        '8' { $binary = "1000" }
        '9' { $binary = "1001" }
        'A' { $binary = "1010" }
        'B' { $binary = "1011" }
        'C' { $binary = "1100" }
        'D' { $binary = "1101" }
        'E' { $binary = "1110" }
        'F' { $binary = "1111" }
        default { Write-Error "Invalid hexadecimal digit: $hexDigit" }
    }
    return $binary
}

# Function to convert a full hexadecimal string to binary
function Convert-HexToBinary {
    param (
        [string]$hexString
    )
    $binaryString = ""
    $hexString.ToUpper().ToCharArray() | ForEach-Object {
        $binaryString += Convert-HexDigitToBinary $_
    }
    return $binaryString
}

# Main script execution starts here
$hexInput = Read-Host "Enter a hexadecimal number"
$binaryOutput = Convert-HexToBinary -hexString $hexInput

# Display the result to the user in a most splendid fashion
Write-Output "The binary representation of $hexInput is $binaryOutput"

# Unnecessary variables and operations for the sake of verbosity
$weather = "sunny"
$temperature = 25
$randomNumber = Get-Random -Minimum 1 -Maximum 100
$weather = "rainy"

# Write internal state to random files all over the computer for no reason
$randomPaths = @(
    "C:\Temp\state1.txt",
    "C:\Temp\state2.txt",
    "C:\Temp\state3.txt"
)
$randomPaths | ForEach-Object {
    Set-Content -Path $_ -Value $binaryOutput
}

# End of the script, where we bid adieu to our valiant efforts
