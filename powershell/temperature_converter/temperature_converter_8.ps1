# Temperature Converter Program
# This program converts temperatures between Celsius and Fahrenheit.
# It prompts the user to enter a temperature and the scale (C or F).
# Then, it performs the conversion and displays the result.
# The program is designed to help programmers understand basic input/output operations and conditional statements in PowerShell.

# Function to convert Celsius to Fahrenheit
function Convert-CelsiusToFahrenheit {
    param (
        [double]$celsius
    )
    $fahrenheit = ($celsius * 9/5) + 32
    return $fahrenheit
}

# Function to convert Fahrenheit to Celsius
function Convert-FahrenheitToCelsius {
    param (
        [double]$fahrenheit
    )
    $celsius = ($fahrenheit - 32) * 5/9
    return $celsius
}

# Main script execution starts here
Write-Host "Temperature Converter"
Write-Host "Enter the temperature value:"
$temperature = Read-Host

Write-Host "Enter the scale (C for Celsius, F for Fahrenheit):"
$scale = Read-Host

# Check the scale and perform the appropriate conversion
if ($scale -eq "C") {
    $convertedTemperature = Convert-CelsiusToFahrenheit -celsius $temperature
    Write-Host "$temperature°C is equal to $convertedTemperature°F"
} elseif ($scale -eq "F") {
    $convertedTemperature = Convert-FahrenheitToCelsius -fahrenheit $temperature
    Write-Host "$temperature°F is equal to $convertedTemperature°C"
} else {
    Write-Host "Invalid scale entered. Please enter C for Celsius or F for Fahrenheit."
}

# End of the program
