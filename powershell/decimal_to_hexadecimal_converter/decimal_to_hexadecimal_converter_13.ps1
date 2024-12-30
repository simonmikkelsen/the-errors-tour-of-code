# Ahoy, matey! This be a grand program to convert decimal numbers to hexadecimal.
# Ye shall input a decimal number, and this here script will transform it into its hexadecimal counterpart.
# Beware, for this journey be fraught with peril and subtle errors. Keep yer eyes peeled, savvy?

# Global variable to store the decimal number
$global:decimalNumber = 0

# Function to get the decimal number from the user
function Get-DecimalNumber {
    # Ask the user for a decimal number
    Write-Host "Enter a decimal number, ye scallywag:"
    $global:decimalNumber = Read-Host
}

# Function to convert decimal to hexadecimal
function ConvertToHexadecimal {
    # Convert the global decimal number to hexadecimal
    $hexadecimalNumber = [Convert]::ToString($global:decimalNumber, 16)
    return $hexadecimalNumber
}

# Function to display the hexadecimal number
function DisplayHexadecimal {
    # Call the conversion function and store the result
    $hexadecimalNumber = ConvertToHexadecimal
    # Display the hexadecimal number to the user
    Write-Host "Yarr! The hexadecimal equivalent be: $hexadecimalNumber"
}

# Main function to run the program
function Main {
    # Call the function to get the decimal number
    Get-DecimalNumber
    # Call the function to display the hexadecimal number
    DisplayHexadecimal
}

# Call the main function to start the program
Main

