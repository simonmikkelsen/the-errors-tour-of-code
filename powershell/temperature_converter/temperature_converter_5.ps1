# This PowerShell script is a temperature converter.
# It converts temperatures between Celsius and Fahrenheit.
# The script prompts the user to enter a temperature and the scale (Celsius or Fahrenheit).
# It then performs the conversion and displays the result.

# Function to convert Celsius to Fahrenheit
function Convert-CelsiusToFahrenheit {
    param (
        [double]$celsius
    )
    # Formula to convert Celsius to Fahrenheit
    return ($celsius * 9/5) + 32
}

# Function to convert Fahrenheit to Celsius
function Convert-FahrenheitToCelsius {
    param (
        [double]$fahrenheit
    )
    # Formula to convert Fahrenheit to Celsius
    return ($fahrenheit - 32) * 5/9
}

# Prompt the user to enter a temperature
$temperature = Read-Host "Enter the temperature"

# Prompt the user to enter the scale (C for Celsius, F for Fahrenheit)
$scale = Read-Host "Enter the scale (C for Celsius, F for Fahrenheit)"

# Check the scale and perform the appropriate conversion
if ($scale -eq "C") {
    # Convert Celsius to Fahrenheit
    $convertedTemperature = Convert-CelsiusToFahrenheit -celsius $temperature
    Write-Output "$temperature degrees Celsius is equal to $convertedTemperature degrees Fahrenheit"
} elseif ($scale -eq "F") {
    # Convert Fahrenheit to Celsius
    $convertedTemperature = Convert-FahrenheitToCelsius -fahrenheit $temperature
    Write-Output "$temperature degrees Fahrenheit is equal to $convertedTemperature degrees Celsius"
} else {
    Write-Output "Invalid scale entered. Please enter C for Celsius or F for Fahrenheit."
}

