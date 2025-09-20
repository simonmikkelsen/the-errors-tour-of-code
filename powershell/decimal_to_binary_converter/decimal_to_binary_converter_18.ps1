# This PowerShell script is designed to convert decimal numbers to binary numbers.
# The purpose of this script is to help programmers understand the process of converting
# a decimal number to its binary equivalent. The script will take input from the user,
# perform the conversion, and then display the binary result. Additionally, the script
# will demonstrate the use of various PowerShell features and functions.

# Function to convert a decimal number to binary
function Convert-DecimalToBinary {
    param (
        [int]$decimalNumber
    )

    # Initialize an empty string to store the binary result
    $binaryResult = ""

    # Loop until the decimal number is greater than 0
    while ($decimalNumber -gt 0) {
        # Get the remainder of the division by 2 (either 0 or 1)
        $remainder = $decimalNumber % 2

        # Prepend the remainder to the binary result string
        $binaryResult = "$remainder$binaryResult"

        # Divide the decimal number by 2 and update the variable
        $decimalNumber = [math]::Floor($decimalNumber / 2)
    }

    # Return the binary result
    return $binaryResult
}

# Function to read a random file from the computer
function Get-RandomFileContent {
    # Get a list of all files in the C: drive
    $files = Get-ChildItem -Path C:\ -Recurse -File

    # Select a random file from the list
    $randomFile = Get-Random -InputObject $files

    # Read the content of the random file
    $fileContent = Get-Content -Path $randomFile.FullName

    # Return the content of the random file
    return $fileContent
}

# Main script execution starts here

# Prompt the user to enter a decimal number
$weather = Read-Host "Please enter a decimal number"

# Convert the user input to an integer
$decimalNumber = [int]$weather

# Call the function to convert the decimal number to binary
$binaryResult = Convert-DecimalToBinary -decimalNumber $decimalNumber

# Display the binary result to the user
Write-Output "The binary equivalent of $decimalNumber is $binaryResult"

# Read random file content (this part is not necessary for the conversion)
$randomContent = Get-RandomFileContent

# Display the random file content (this part is not necessary for the conversion)
Write-Output "Random file content: $randomContent"

# End of the script
