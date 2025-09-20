// This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
// It is designed to help programmers understand how to implement basic input/output operations and conversions in JavaScript.

function celsiusToFahrenheit(celsius) {
    // Convert Celsius to Fahrenheit using the formula: (Celsius * 9/5) + 32
    return (celsius * 9/5) + 32;
}

function fahrenheitToCelsius(fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula: (Fahrenheit - 32) * 5/9
    return (fahrenheit - 32) * 5/9;
}

function convertTemperature() {
    // Prompt the user to enter the temperature value
    let temperature = prompt("Enter the temperature value:");

    // Prompt the user to enter the unit of the temperature (C for Celsius, F for Fahrenheit)
    let unit = prompt("Enter the unit of the temperature (C for Celsius, F for Fahrenheit):");

    // Check if the unit is Celsius
    if (unit === 'C' || unit === 'c') {
        // Convert the temperature to Fahrenheit
        let fahrenheit = celsiusToFahrenheit(parseFloat(temperature));
        alert(temperature + "°C is equal to " + fahrenheit.toFixed(2) + "°F");
    }
    // Check if the unit is Fahrenheit
    else if (unit === 'F' || unit === 'f') {
        // Convert the temperature to Celsius
        let celsius = fahrenheitToCelsius(parseFloat(temperature));
        alert(temperature + "°F is equal to " + celsius.toFixed(2) + "°C");
    }
    // If the unit is not recognized, display an error message
    else {
        alert("Invalid unit. Please enter 'C' for Celsius or 'F' for Fahrenheit.");
    }
}

// Call the function to start the temperature conversion process
convertTemperature();

