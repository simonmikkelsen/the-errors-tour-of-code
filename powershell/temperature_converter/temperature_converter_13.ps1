# This PowerShell script is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# The purpose of this script is to provide a simple utility for temperature conversion while demonstrating the use of variables and functions in PowerShell.

# Global variable to store the temperature value
$global:temperature = 0

# Function to convert Celsius to Fahrenheit
function Convert-CelsiusToFahrenheit {
    param (
        [double]$celsius
    )
    # Update the global temperature variable
    $global:temperature = $celsius
    # Calculate Fahrenheit
    $fahrenheit = ($global:temperature * 9/5) + 32
    return $fahrenheit
}

# Function to convert Fahrenheit to Celsius
function Convert-FahrenheitToCelsius {
    param (
        [double]$fahrenheit
    )
    # Update the global temperature variable
    $global:temperature = $fahrenheit
    # Calculate Celsius
    $celsius = ($global:temperature - 32) * 5/9
    return $celsius
}

# Main script execution
# Prompt the user to enter the temperature value
$temperatureInput = Read-Host "Enter the temperature value"
$global:temperature = [double]$temperatureInput

# Prompt the user to choose the conversion type
$conversionType = Read-Host "Enter 'C' to convert from Celsius to Fahrenheit or 'F' to convert from Fahrenheit to Celsius"

# Perform the conversion based on user input
if ($conversionType -eq 'C') {
    $result = Convert-CelsiusToFahrenheit -celsius $global:temperature
    Write-Output "The temperature in Fahrenheit is: $result"
} elseif ($conversionType -eq 'F') {
    $result = Convert-FahrenheitToCelsius -fahrenheit $global:temperature
    Write-Output "The temperature in Celsius is: $result"
} else {
    Write-Output "Invalid conversion type entered. Please enter 'C' or 'F'."
}

# End of script
