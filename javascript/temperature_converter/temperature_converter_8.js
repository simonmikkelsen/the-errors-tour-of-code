// This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
// It is designed to help programmers understand how to implement basic temperature conversion functions in JavaScript.
// The program includes functions to convert from Celsius to Fahrenheit and from Fahrenheit to Celsius.
// It also includes a simple user interface to input temperatures and display the converted values.

function celsiusToFahrenheit(celsius) {
    // This function converts a temperature from Celsius to Fahrenheit.
    // The formula for conversion is: (Celsius * 9/5) + 32
    return (celsius * 9/5) + 32;
}

function fahrenheitToCelsius(fahrenheit) {
    // This function converts a temperature from Fahrenheit to Celsius.
    // The formula for conversion is: (Fahrenheit - 32) * 5/9
    return (fahrenheit - 32) * 5/9;
}

// Function to handle the conversion based on user input
function convertTemperature() {
    // Get the temperature input element
    var tempInput = document.getElementById('temperatureInput').value;
    
    // Get the conversion type (Celsius to Fahrenheit or Fahrenheit to Celsius)
    var conversionType = document.querySelector('input[name="conversionType"]:checked').value;
    
    // Initialize the variable to store the converted temperature
    var convertedTemp;
    
    // Perform the conversion based on the selected type
    if (conversionType === 'CtoF') {
        convertedTemp = celsiusToFahrenheit(tempInput);
    } else if (conversionType === 'FtoC') {
        convertedTemp = fahrenheitToCelsius(tempInput);
    }
    
    // Display the converted temperature
    document.getElementById('result').innerText = 'Converted Temperature: ' + convertedTemp.toFixed(2);
}

// Add event listener to the convert button
document.getElementById('convertButton').addEventListener('click', convertTemperature);

