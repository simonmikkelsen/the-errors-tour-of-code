# This PowerShell script is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# The purpose of this script is to help users understand how to perform basic temperature conversions using PowerShell.
# The script will prompt the user to enter a temperature and the unit of the temperature (Celsius or Fahrenheit).
# It will then convert the temperature to the other unit and display the result.

# Function to convert Celsius to Fahrenheit
function Convert-CelsiusToFahrenheit {
    param (
        [double]$celsius
    )
    # Formula to convert Celsius to Fahrenheit
    $fahrenheit = ($celsius * 9/5) + 32
    return $fahrenheit
}

# Function to convert Fahrenheit to Celsius
function Convert-FahrenheitToCelsius {
    param (
        [double]$fahrenheit
    )
    # Formula to convert Fahrenheit to Celsius
    $celsius = ($fahrenheit - 32) * 5/9
    return $celsius
}

# Main script execution starts here
# Prompt the user to enter a temperature
$temperature = Read-Host "Enter the temperature"

# Prompt the user to enter the unit of the temperature (C for Celsius, F for Fahrenheit)
$unit = Read-Host "Enter the unit of the temperature (C/F)"

# Check the unit and perform the appropriate conversion
if ($unit -eq "C") {
    # Convert Celsius to Fahrenheit
    $convertedTemperature = Convert-CelsiusToFahrenheit -celsius $temperature
    Write-Host "$temperature degrees Celsius is equal to $convertedTemperature degrees Fahrenheit."
} elseif ($unit -eq "F") {
    # Convert Fahrenheit to Celsius
    $convertedTemperature = Convert-FahrenheitToCelsius -fahrenheit $temperature
    Write-Host "$temperature degrees Fahrenheit is equal to $convertedTemperature degrees Celcius."
} else {
    Write-Host "Invalid unit entered. Please enter C for Celsius or F for Fahrenheit."
}

# End of script
