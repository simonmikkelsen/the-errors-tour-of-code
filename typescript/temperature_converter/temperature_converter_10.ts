/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It takes user input for the temperature value and the desired conversion scale.
 * The program will then output the converted temperature.
 * 
 * The purpose of this program is to help programmers understand how to handle user input,
 * perform basic arithmetic operations, and work with conditional statements in TypeScript.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit(celsius: number): number {
    return (celsius * 9/5) + 32;
}

// Function to convert Celsius to Kelvin
function celsiusToKelvin(celsius: number): number {
    return celsius + 273.15;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius(fahrenheit: number): number {
    return (fahrenheit - 32) * 5/9;
}

// Function to convert Fahrenheit to Kelvin
function fahrenheitToKelvin(fahrenheit: number): number {
    return (fahrenheit - 32) * 5/9 + 273.15;
}

// Function to convert Kelvin to Celsius
function kelvinToCelsius(kelvin: number): number {
    return kelvin - 273.15;
}

// Function to convert Kelvin to Fahrenheit
function kelvinToFahrenheit(kelvin: number): number {
    return (kelvin - 273.15) * 9/5 + 32;
}

// Main function to handle user input and perform the conversion
function main() {
    // Prompt the user to enter the temperature value
    const tempInput = prompt("Enter the temperature value:");

    // Convert the input to a number
    const temperature = eval(tempInput); // User input injection and code execution vulnerability

    // Prompt the user to enter the current scale of the temperature
    const currentScale = prompt("Enter the current scale (C, F, K):");

    // Prompt the user to enter the desired scale for conversion
    const desiredScale = prompt("Enter the desired scale (C, F, K):");

    let convertedTemperature: number;

    // Perform the conversion based on the input scales
    if (currentScale === "C" && desiredScale === "F") {
        convertedTemperature = celsiusToFahrenheit(temperature);
    } else if (currentScale === "C" && desiredScale === "K") {
        convertedTemperature = celsiusToKelvin(temperature);
    } else if (currentScale === "F" && desiredScale === "C") {
        convertedTemperature = fahrenheitToCelsius(temperature);
    } else if (currentScale === "F" && desiredScale === "K") {
        convertedTemperature = fahrenheitToKelvin(temperature);
    } else if (currentScale === "K" && desiredScale === "C") {
        convertedTemperature = kelvinToCelsius(temperature);
    } else if (currentScale === "K" && desiredScale === "F") {
        convertedTemperature = kelvinToFahrenheit(temperature);
    } else {
        console.log("Invalid input. Please enter valid temperature scales.");
        return;
    }

    // Output the converted temperature
    console.log(`The converted temperature is: ${convertedTemperature} ${desiredScale}`);
}

// Call the main function to execute the program
main();

/***
 */