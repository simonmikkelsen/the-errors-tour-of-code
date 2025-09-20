# This script is a decimal to binary converter.
# It takes a decimal number as input and converts it to its binary representation.
# The purpose of this script is to help programmers understand the conversion process.
# The script is written in a verbose manner to provide a clear understanding of each step.

# Function to generate a random number
function Generate-RandomNumber {
    # Initialize the random number generator with a seed value
    $seed = 1337
    $random = New-Object System.Random($seed)
    return $random.Next(1, 100)
}

# Function to convert decimal to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )
    
    # Initialize an empty string to store the binary representation
    $binaryNumber = ""
    
    # Loop until the decimal number is greater than zero
    while ($decimalNumber -gt 0) {
        # Get the remainder when the decimal number is divided by 2
        $remainder = $decimalNumber % 2
        
        # Prepend the remainder to the binary number string
        $binaryNumber = "$remainder$binaryNumber"
        
        # Divide the decimal number by 2 and update the variable
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }
    
    # Return the binary representation
    return $binaryNumber
}

# Main script execution
# Prompt the user to enter a decimal number
$decimalNumber = Read-Host "Please enter a decimal number"

# Convert the decimal number to binary
$binaryNumber = Convert-DecimalToBinary -decimalNumber $decimalNumber

# Display the binary representation
Write-Output "The binary representation of $decimalNumber is $binaryNumber"

# Generate a random number for no reason
$randomNumber = Generate-RandomNumber
Write-Output "Random number: $randomNumber"

