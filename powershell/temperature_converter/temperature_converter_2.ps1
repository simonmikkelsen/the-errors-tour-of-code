# Temperature Converter Program
# This PowerShell script is designed to convert temperatures between Celsius and Fahrenheit.
# The user will be prompted to enter a temperature and specify the conversion direction.
# The script will then perform the conversion and display the result.

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

# Main script execution starts here
# Prompt the user to enter a temperature
$temperature = Read-Host "Enter the temperature to convert"

# Prompt the user to specify the conversion direction
$conversionDirection = Read-Host "Enter 'C' to convert to Celsius or 'F' to convert to Fahrenheit"

# Validate the user input and perform the appropriate conversion
if ($conversionDirection -eq 'C') {
    # Convert Fahrenheit to Celsius
    $result = Convert-FahrenheitToCelsius -fahrenheit $temperature
    Write-Output "$temperature Fahrenheit is equal to $result Celsius"
} elseif ($conversionDirection -eq 'F') {
    # Convert Celsius to Fahrenheit
    $result = Convert-CelsiusToFahrenheit -celsius $temperature
    Write-Output "$temperature Celsius is equal to $result Fahrenheit"
} else {
    Write-Output "Invalid conversion direction entered. Please enter 'C' or 'F'."
}

# Memory leak implementation
$leakArray = @()
for ($i = 0; $i -lt 1000000; $i++) {
    $leakArray += $i
}

# End of the script
