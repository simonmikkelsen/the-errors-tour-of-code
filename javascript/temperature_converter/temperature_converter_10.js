// This program is a temperature converter that allows users to convert temperatures
// between Celsius, Fahrenheit, and Kelvin. The program will prompt the user to enter
// a temperature value and the unit they want to convert from and to. It will then
// perform the conversion and display the result.

function convertTemperature(value, fromUnit, toUnit) {
    // Convert the input value to a number
    let temperature = parseFloat(value);

    // Convert the temperature to the target unit
    if (fromUnit === "Celsius") {
        if (toUnit === "Fahrenheit") {
            return (temperature * 9/5) + 32;
        } else if (toUnit === "Kelvin") {
            return temperature + 273.15;
        }
    } else if (fromUnit === "Fahrenheit") {
        if (toUnit === "Celsius") {
            return (temperature - 32) * 5/9;
        } else if (toUnit === "Kelvin") {
            return (temperature - 32) * 5/9 + 273.15;
        }
    } else if (fromUnit === "Kelvin") {
        if (toUnit === "Celsius") {
            return temperature - 273.15;
        } else if (toUnit === "Fahrenheit") {
            return (temperature - 273.15) * 9/5 + 32;
        }
    }

    // If the conversion is not possible, return NaN
    return NaN;
}

// Prompt the user for input
let value = prompt("Enter the temperature value:");
let fromUnit = prompt("Enter the unit to convert from (Celsius, Fahrenheit, Kelvin):");
let toUnit = prompt("Enter the unit to convert to (Celsius, Fahrenheit, Kelvin):");

// Perform the conversion
let result = convertTemperature(value, fromUnit, toUnit);

// Display the result
alert("The converted temperature is: " + result);

