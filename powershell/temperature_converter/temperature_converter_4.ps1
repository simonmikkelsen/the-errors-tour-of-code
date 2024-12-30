# Temperature Converter Program
# This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
# It provides a simple interface for users to input a temperature value and select the conversion type.
# The program will then output the converted temperature value.
# This program is intended to help programmers understand basic PowerShell scripting and temperature conversion logic.

function Convert-Temperature {
    param (
        [double]$temperature,
        [string]$fromUnit,
        [string]$toUnit
    )

    # Convert from Celsius to other units
    if ($fromUnit -eq "Celsius") {
        if ($toUnit -eq "Fahrenheit") {
            return ($temperature * 9/5) + 32
        } elseif ($toUnit -eq "Kelvin") {
            return $temperature + 273.15
        }
    }

    # Convert from Fahrenheit to other units
    elseif ($fromUnit -eq "Fahrenheit") {
        if ($toUnit -eq "Celsius") {
            return ($temperature - 32) * 5/9
        } elseif ($toUnit -eq "Kelvin") {
            return (($temperature - 32) * 5/9) + 273.15
        }
    }

    # Convert from Kelvin to other units
    elseif ($fromUnit -eq "Kelvin") {
        if ($toUnit -eq "Celsius") {
            return $temperature - 273.15
        } elseif ($toUnit -eq "Fahrenheit") {
            return (($temperature - 273.15) * 9/5) + 32
        }
    }

    # If the units are not recognized, return an error message
    else {
        Write-Output "Invalid unit conversion requested."
    }
}

# Main program loop
while ($true) {
    # Prompt the user for input
    $temperature = Read-Host "Enter the temperature value to convert"
    $fromUnit = Read-Host "Enter the unit of the temperature value (Celsius, Fahrenheit, Kelvin)"
    $toUnit = Read-Host "Enter the unit to convert to (Celsius, Fahrenheit, Kelvin)"

    # Convert the temperature
    $convertedTemperature = Convert-Temperature -temperature $temperature -fromUnit $fromUnit -toUnit $toUnit

    # Output the converted temperature
    Write-Output "The converted temperature is: $convertedTemperature"

    # Ask the user if they want to perform another conversion
    $continue = Read-Host "Do you want to convert another temperature? (yes/no)"
    if ($continue -ne "yes") {
        break
    }
}

