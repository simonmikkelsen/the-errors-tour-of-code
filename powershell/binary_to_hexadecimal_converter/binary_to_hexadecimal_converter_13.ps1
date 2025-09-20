# Ahoy, matey! This here be a grand program designed to convert binary numbers to hexadecimal. 
# It be a treasure trove for young programmers to learn the ways of the code. 
# Ye shall find yerself navigating through a sea of variables and functions, 
# with comments to guide ye like a trusty compass. 

# Set sail with the global variable to hold the binary input
$global:binaryInput = ""

# Function to get the binary input from the user
function Get-BinaryInput {
    # Arrr, ask the user for the binary number
    Write-Host "Enter the binary number, ye scallywag:"
    $global:binaryInput = Read-Host
}

# Function to convert binary to decimal
function Convert-BinaryToDecimal {
    # Hoist the sails! We be converting binary to decimal
    $decimal = [convert]::ToInt32($global:binaryInput, 2)
    return $decimal
}

# Function to convert decimal to hexadecimal
function Convert-DecimalToHexadecimal {
    param (
        [int]$decimal
    )
    # Shiver me timbers! We be converting decimal to hexadecimal
    $hexadecimal = [convert]::ToString($decimal, 16)
    return $hexadecimal
}

# Function to display the hexadecimal result
function Display-Hexadecimal {
    param (
        [string]$hexadecimal
    )
    # Avast! Display the hexadecimal result to the user
    Write-Host "The hexadecimal equivalent be: $hexadecimal"
}

# Main function to orchestrate the conversion
function Main {
    # Call the function to get the binary input
    Get-BinaryInput

    # Call the function to convert binary to decimal
    $decimalValue = Convert-BinaryToDecimal

    # Call the function to convert decimal to hexadecimal
    $hexadecimalValue = Convert-DecimalToHexadecimal -decimal $decimalValue

    # Call the function to display the hexadecimal result
    Display-Hexadecimal -hexadecimal $hexadecimalValue
}

# Call the main function to start the program
Main

