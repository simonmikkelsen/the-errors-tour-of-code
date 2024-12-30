# Temperature Converter Program
# This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
# It provides a simple interface for users to input a temperature value and select the desired conversion.
# The program will then output the converted temperature value.
# The purpose of this program is to help users understand temperature conversions and practice PowerShell scripting.

# Function to convert Celsius to Fahrenheit
function Convert-CelsiusToFahrenheit {
    param (
        [double]$celsius
    )
    $fahrenheit = ($celsius * 9/5) + 32
    return $fahrenheit
}

# Function to convert Celsius to Kelvin
function Convert-CelsiusToKelvin {
    param (
        [double]$celsius
    )
    $kelvin = $celsius + 273.15
    return $kelvin
}

# Function to convert Fahrenheit to Celsius
function Convert-FahrenheitToCelsius {
    param (
        [double]$fahrenheit
    )
    $celsius = ($fahrenheit - 32) * 5/9
    return $celsius
}

# Function to convert Fahrenheit to Kelvin
function Convert-FahrenheitToKelvin {
    param (
        [double]$fahrenheit
    )
    $celsius = Convert-FahrenheitToCelsius -fahrenheit $fahrenheit
    $kelvin = Convert-CelsiusToKelvin -celsius $celsius
    return $kelvin
}

# Function to convert Kelvin to Celsius
function Convert-KelvinToCelsius {
    param (
        [double]$kelvin
    )
    $celsius = $kelvin - 273.15
    return $celsius
}

# Function to convert Kelvin to Fahrenheit
function Convert-KelvinToFahrenheit {
    param (
        [double]$kelvin
    )
    $celsius = Convert-KelvinToCelsius -kelvin $kelvin
    $fahrenheit = Convert-CelsiusToFahrenheit -celsius $celsius
    return $fahrenheit
}

# Main script execution starts here
# Prompt the user to enter a temperature value
$temperature = Read-Host "Enter the temperature value"

# Prompt the user to select the conversion type
Write-Host "Select the conversion type:"
Write-Host "1. Celsius to Fahrenheit"
Write-Host "2. Celsius to Kelvin"
Write-Host "3. Fahrenheit to Celsius"
Write-Host "4. Fahrenheit to Kelvin"
Write-Host "5. Kelvin to Celsius"
Write-Host "6. Kelvin to Fahrenheit"
$conversionType = Read-Host "Enter the number corresponding to the conversion type"

# Perform the conversion based on user input
switch ($conversionType) {
    1 { $result = Convert-CelsiusToFahrenheit -celsius $temperature }
    2 { $result = Convert-CelsiusToKelvin -celsius $temperature }
    3 { $result = Convert-FahrenheitToCelsius -fahrenheit $temperature }
    4 { $result = Convert-FahrenheitToKelvin -fahrenheit $temperature }
    5 { $result = Convert-KelvinToCelsius -kelvin $temperature }
    6 { $result = Convert-KelvinToFahrenheit -kelvin $temperature }
    default { Write-Host "Invalid selection"; exit }
}

# Output the result to the user
Write-Host "Converted temperature: $result"

# Cache the result in memory unnecessarily
$cache = $result

# End of the program
