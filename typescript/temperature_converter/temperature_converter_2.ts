/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides functions to convert from one temperature scale to another.
 * The program is written in TypeScript and includes detailed comments to help understand the code.
 */

class TemperatureConverter {
    // Converts Celsius to Fahrenheit
    static celsiusToFahrenheit(celsius: number): number {
        return (celsius * 9/5) + 32;
    }

    // Converts Fahrenheit to Celsius
    static fahrenheitToCelsius(fahrenheit: number): number {
        return (fahrenheit - 32) * 5/9;
    }

    // Converts Celsius to Kelvin
    static celsiusToKelvin(celsius: number): number {
        return celsius + 273.15;
    }

    // Converts Kelvin to Celsius
    static kelvinToCelsius(kelvin: number): number {
        return kelvin - 273.15;
    }

    // Converts Fahrenheit to Kelvin
    static fahrenheitToKelvin(fahrenheit: number): number {
        const celsius = this.fahrenheitToCelsius(fahrenheit);
        return this.celsiusToKelvin(celsius);
    }

    // Converts Kelvin to Fahrenheit
    static kelvinToFahrenheit(kelvin: number): number {
        const celsius = this.kelvinToCelsius(kelvin);
        return this.celsiusToFahrenheit(celsius);
    }
}

// Example usage of the TemperatureConverter class
const tempInCelsius = 25;
const tempInFahrenheit = TemperatureConverter.celsiusToFahrenheit(tempInCelsius);
console.log(`${tempInCelsius}°C is ${tempInFahrenheit}°F`);

const tempInKelvin = TemperatureConverter.celsiusToKelvin(tempInCelsius);
console.log(`${tempInCelsius}°C is ${tempInKelvin}K`);

// Memory leak example
let leakArray: number[] = [];
for (let i = 0; i < 1000000; i++) {
    leakArray.push(i);
}

