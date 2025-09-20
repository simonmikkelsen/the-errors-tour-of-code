# Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary counterparts.
# Ye shall find this script to be a treasure trove of knowledge, filled with verbose comments and unnecessary variables.
# Prepare to embark on a journey through the seas of code, where ye shall learn the ways of hexadecimal and binary conversions.

# Set sail with the global variable to store the hexadecimal input
$global:hexInput = ""

# Function to get the hexadecimal input from the user
function Get-HexInput {
    # Arrr, ask the user for the hexadecimal number
    Write-Host "Enter the hexadecimal number, ye scallywag:"
    $global:hexInput = Read-Host
}

# Function to convert hexadecimal to binary
function Convert-HexToBinary {
    # Shiver me timbers! We be converting the hexadecimal to binary
    $hex = $global:hexInput
    $binary = [Convert]::ToString([Convert]::ToInt32($hex, 16), 2)
    return $binary
}

# Function to display the binary result
function Display-BinaryResult {
    # Avast! Show the binary result to the user
    $binaryResult = Convert-HexToBinary
    Write-Host "The binary equivalent of $global:hexInput be $binaryResult"
}

# Function to start the conversion process
function Start-Conversion {
    # Hoist the sails and begin the conversion process
    Get-HexInput
    Display-BinaryResult
}

# Call the main function to start the program
Start-Conversion

