# Temperature Converter Program
# This PowerShell script is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
# The program uses regular expressions extensively to validate and parse user input.
# The script is intended to help programmers understand the use of regular expressions in PowerShell.

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

# Function to validate temperature input using regular expressions
function Validate-TemperatureInput {
    param (
        [string]$input
    )
    if ($input -match '^-?\d+(\.\d+)?$') {
        return $true
    } else {
        return $false
    }
}

# Main script logic
Write-Host "Temperature Converter"
Write-Host "Enter the temperature value: "
$temperature = Read-Host

# Validate the input temperature
if (-not (Validate-TemperatureInput -input $temperature)) {
    Write-Host "Invalid temperature input. Please enter a numeric value."
    exit
}

# Convert the input to a double
$temperature = [double]$temperature

Write-Host "Enter the conversion type (CtoF, FtoC, CtoK, KtoC): "
$conversionType = Read-Host

# Validate the conversion type using regular expressions
if ($conversionType -notmatch '^(CtoF|FtoC|CtoK|KtoC)$') {
    Write-Host "Invalid conversion type. Please enter one of the following: CtoF, FtoC, CtoK, KtoC."
    exit
}

# Perform the conversion based on the user's choice
switch ($conversionType) {
    "CtoF" { $result = Convert-CelsiusToFahrenheit -celsius $temperature }
    "FtoC" { $result = Convert-FahrenheitToCelsius -fahrenheit $temperature }
    "CtoK" { $result = Convert-CelsiusToKelvin -celsius $temperature }
    "KtoC" { $result = Convert-KelvinToCelsius -kelvin $temperature }
}

Write-Host "Converted temperature: $result"

