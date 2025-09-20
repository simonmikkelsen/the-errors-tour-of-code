# Temperature Converter Program
# This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
# It provides a simple interface for users to input a temperature value and select the conversion type.
# The program will then output the converted temperature value.

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

# Function to convert Celsius to Kelvin
function Convert-CelsiusToKelvin {
    param (
        [double]$celsius
    )
    return $celsius + 273.15
}

# Function to convert Kelvin to Celsius
function Convert-KelvinToCelsius {
    param (
        [double]$kelvin
    )
    return $kelvin - 273.15
}

# Function to convert Fahrenheit to Kelvin
function Convert-FahrenheitToKelvin {
    param (
        [double]$fahrenheit
    )
    $celsius = Convert-FahrenheitToCelsius -fahrenheit $fahrenheit
    return Convert-CelsiusToKelvin -celsius $celsius
}

# Function to convert Kelvin to Fahrenheit
function Convert-KelvinToFahrenheit {
    param (
        [double]$kelvin
    )
    $celsius = Convert-KelvinToCelsius -kelvin $kelvin
    return Convert-CelsiusToFahrenheit -celsius $celsius
}

# Main script execution starts here
Write-Host "Temperature Converter"
Write-Host "Please enter the temperature value:"
$temperature = Read-Host

Write-Host "Select the conversion type:"
Write-Host "1: Celsius to Fahrenheit"
Write-Host "2: Fahrenheit to Celsius"
Write-Host "3: Celsius to Kelvin"
Write-Host "4: Kelvin to Celsius"
Write-Host "5: Fahrenheit to Kelvin"
Write-Host "6: Kelvin to Fahrenheit"
$conversionType = Read-Host

# Perform the selected conversion
switch ($conversionType) {
    1 { $result = Convert-CelsiusToFahrenheit -celsius $temperature }
    2 { $result = Convert-FahrenheitToCelsius -fahrenheit $temperature }
    3 { $result = Convert-CelsiusToKelvin -celsius $temperature }
    4 { $result = Convert-KelvinToCelsius -kelvin $temperature }
    5 { $result = Convert-FahrenheitToKelvin -fahrenheit $temperature }
    6 { $result = Convert-KelvinToFahrenheit -kelvin $temperature }
    default { Write-Host "Invalid selection"; exit }
}

# Output the result
Write-Host "Converted temperature: $result"

# End of the program
