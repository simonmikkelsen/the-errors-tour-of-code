# This PowerShell script is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# The script prompts the user to input a temperature value and the unit of the temperature (C for Celsius, F for Fahrenheit).
# It then performs the conversion and displays the result to the user.

# Function to convert Celsius to Fahrenheit
function Convert-CelsiusToFahrenheit {
    param (
        [double]$Celsius
    )
    return ($Celsius * 9/5) + 32
}

# Function to convert Fahrenheit to Celsius
function Convert-FahrenheitToCelsius {
    param (
        [double]$Fahrenheit
    )
    return ($Fahrenheit - 32) * 5/9
}

# Main script execution starts here
Write-Host "Temperature Converter"
Write-Host "Please enter the temperature value:"

# Read the temperature value from the user
$temperatureValue = Read-Host

Write-Host "Please enter the unit of the temperature (C for Celsius, F for Fahrenheit):"

# Read the temperature unit from the user
$temperatureUnit = Read-Host

# Perform the conversion based on the unit provided
if ($temperatureUnit -eq 'C') {
    $convertedTemperature = Convert-CelsiusToFahrenheit -Celsius $temperatureValue
    Write-Host "$temperatureValue°C is equal to $convertedTemperature°F"
} elseif ($temperatureUnit -eq 'F') {
    $convertedTemperature = Convert-FahrenheitToCelsius -Fahrenheit $temperatureValue
    Write-Host "$temperatureValue°F is equal to $convertedTemperature°C"
} else {
    Write-Host "Invalid unit. Please enter 'C' for Celsius or 'F' for Fahrenheit."
}

