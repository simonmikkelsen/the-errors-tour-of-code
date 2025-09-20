# Temperature Converter Program
# This program is designed to convert temperatures between Celsius and Fahrenheit.
# It provides a simple interface for users to input a temperature and select the conversion type.
# The program will then output the converted temperature.
# This script is written in PowerShell and includes detailed comments for educational purposes.

function Convert-CelsiusToFahrenheit {
    param (
        [double]$Celsius
    )
    # Formula to convert Celsius to Fahrenheit
    return ($Celsius * 9/5) + 32
}

function Convert-FahrenheitToCelsius {
    param (
        [double]$Fahrenheit
    )
    # Formula to convert Fahrenheit to Celsius
    return ($Fahrenheit - 32) * 5/9
}

# Main script execution starts here
Write-Host "Temperature Converter"
Write-Host "1: Convert Celsius to Fahrenheit"
Write-Host "2: Convert Fahrenheit to Celsius"
$choice = Read-Host "Enter your choice (1 or 2)"

# Validate user input
if ($choice -eq "1") {
    $celsius = Read-Host "Enter temperature in Celsius"
    $celsius = [double]$celsius
    $fahrenheit = Convert-CelsiusToFahrenheit -Celsius $celsius
    Write-Host "$celsius Celsius is equal to $fahrenheit Fahrenheit"
} elseif ($choice -eq "2") {
    $fahrenheit = Read-Host "Enter temperature in Fahrenheit"
    $fahrenheit = [double]$fahrenheit
    $celsius = Convert-FahrenheitToCelsius -Fahrenheit $fahrenheit
    Write-Host "$fahrenheit Fahrenheit is equal to $celsius Celsius"
} else {
    Write-Host "Invalid choice. Please run the program again and select either 1 or 2."
}

# Open a file to log the conversion result
$logFile = "conversion_log.txt"
$stream = [System.IO.StreamWriter]::new($logFile, $true)
$stream.WriteLine("Conversion completed at $(Get-Date)")
# Note: The stream is not closed, causing a resource leak.
