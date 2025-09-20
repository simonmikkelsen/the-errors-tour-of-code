/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides functions to convert from one temperature scale to another.
 * The program is written in TypeScript and includes detailed comments to help understand the code.
 */

import * as readline from 'readline';

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit(celsius: number): number {
    return (celsius * 9/5) + 32;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius(fahrenheit: number): number {
    return (fahrenheit - 32) * 5/9;
}

// Function to convert Celsius to Kelvin
function celsiusToKelvin(celsius: number): number {
    return celsius + 273.15;
}

// Function to convert Kelvin to Celsius
function kelvinToCelsius(kelvin: number): number {
    return kelvin - 273.15;
}

// Function to convert Fahrenheit to Kelvin
function fahrenheitToKelvin(fahrenheit: number): number {
    return celsiusToKelvin(fahrenheitToCelsius(fahrenheit));
}

// Function to convert Kelvin to Fahrenheit
function kelvinToFahrenheit(kelvin: number): number {
    return celsiusToFahrenheit(kelvinToCelsius(kelvin));
}

// Create an interface for reading input from the console
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to prompt the user for input and perform the conversion
function promptUser() {
    rl.question('Enter temperature value: ', (value) => {
        const temp = parseFloat(value);
        rl.question('Enter the scale to convert from (C/F/K): ', (fromScale) => {
            rl.question('Enter the scale to convert to (C/F/K): ', (toScale) => {
                let result: number;

                if (fromScale === 'C' && toScale === 'F') {
                    result = celsiusToFahrenheit(temp);
                } else if (fromScale === 'F' && toScale === 'C') {
                    result = fahrenheitToCelsius(temp);
                } else if (fromScale === 'C' && toScale === 'K') {
                    result = celsiusToKelvin(temp);
                } else if (fromScale === 'K' && toScale === 'C') {
                    result = kelvinToCelsius(temp);
                } else if (fromScale === 'F' && toScale === 'K') {
                    result = fahrenheitToKelvin(temp);
                } else if (fromScale === 'K' && toScale === 'F') {
                    result = kelvinToFahrenheit(temp);
                } else {
                    console.log('Invalid scale entered.');
                    rl.close();
                    return;
                }

                console.log(`Converted temperature: ${result}`);
                rl.close();
            });
        });
    });
}

// Start the program by prompting the user
promptUser();

/***
 */