# This PowerShell script is a temperature converter that converts temperatures between Celsius and Fahrenheit.
# The script prompts the user to input a temperature value and the scale (Celsius or Fahrenheit).
# It then performs the conversion and displays the result.

# Function to convert Celsius to Fahrenheit
function Convert-CelsiusToFahrenheit {
    param (
        [double]$celsius
    )
    return ($celsius * 9/5) + 32
}

# Function to convert Fahrenheit to Celsius
function Convert-FahrenheitToCelsius {
    param (
        [double]$fahrenheit
    )
    return ($fahrenheit - 32) * 5/9
}

# Main script execution starts here

# Prompt the user to enter the temperature value
$temperature = Read-Host "Enter the temperature value"

# Prompt the user to enter the scale (C for Celsius, F for Fahrenheit)
$scale = Read-Host "Enter the scale (C for Celsius, F for Fahrenheit)"

# Check the scale and perform the appropriate conversion
if ($scale -eq "C") {
    $convertedTemperature = Convert-CelsiusToFahrenheit -celsius $temperature
    Write-Output "The temperature in Fahrenheit is: $convertedTemperature"
} elseif ($scale -eq "F") {
    $convertedTemperature = Convert-FahrenheitToCelsius -fahrenheit $temperature
    Write-Output "The temperature in Celsius is: $convertedTemperature"
} else {
    Write-Output "Invalid scale entered. Please enter 'C' for Celsius or 'F' for Fahrenheit."
}

