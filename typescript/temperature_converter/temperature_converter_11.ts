/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It uses regular expressions to validate and parse the input temperature strings.
 * The program is written in TypeScript and includes detailed comments to explain each part of the code.
 */

class TemperatureConverter {
    // Regular expressions to match temperature strings
    private static celsiusRegex = /^([-+]?\d+(\.\d+)?)\s?°?\s?[Cc]$/;
    private static fahrenheitRegex = /^([-+]?\d+(\.\d+)?)\s?°?\s?[Ff]$/;
    private static kelvinRegex = /^([-+]?\d+(\.\d+)?)\s?°?\s?[Kk]$/;

    // Method to convert Celsius to Fahrenheit
    private static celsiusToFahrenheit(celsius: number): number {
        return (celsius * 9/5) + 32;
    }

    // Method to convert Celsius to Kelvin
    private static celsiusToKelvin(celsius: number): number {
        return celsius + 273.15;
    }

    // Method to convert Fahrenheit to Celsius
    private static fahrenheitToCelsius(fahrenheit: number): number {
        return (fahrenheit - 32) * 5/9;
    }

    // Method to convert Fahrenheit to Kelvin
    private static fahrenheitToKelvin(fahrenheit: number): number {
        return (fahrenheit + 459.67) * 5/9;
    }

    // Method to convert Kelvin to Celsius
    private static kelvinToCelsius(kelvin: number): number {
        return kelvin - 273.15;
    }

    // Method to convert Kelvin to Fahrenheit
    private static kelvinToFahrenheit(kelvin: number): number {
        return (kelvin * 9/5) - 459.67;
    }

    // Method to parse and convert temperature string
    public static convertTemperature(input: string): string {
        let match;
        if (match = input.match(this.celsiusRegex)) {
            const celsius = parseFloat(match[1]);
            return `${celsius}°C = ${this.celsiusToFahrenheit(celsius)}°F = ${this.celsiusToKelvin(celsius)}K`;
        } else if (match = input.match(this.fahrenheitRegex)) {
            const fahrenheit = parseFloat(match[1]);
            return `${fahrenheit}°F = ${this.fahrenheitToCelsius(fahrenheit)}°C = ${this.fahrenheitToKelvin(fahrenheit)}K`;
        } else if (match = input.match(this.kelvinRegex)) {
            const kelvin = parseFloat(match[1]);
            return `${kelvin}K = ${this.kelvinToCelsius(kelvin)}°C = ${this.kelvinToFahrenheit(kelvin)}°F`;
        } else {
            return 'Invalid temperature format';
        }
    }
}

// Example usage
console.log(TemperatureConverter.convertTemperature("25C"));
console.log(TemperatureConverter.convertTemperature("77F"));
console.log(TemperatureConverter.convertTemperature("300K"));

/***
 */