/**
 * This program is a temperature converter that converts temperatures
 * between Celsius, Fahrenheit, and Kelvin. It is designed to help 
 * programmers understand how to implement basic temperature conversion 
 * functions in Java. The program will prompt the user to enter a 
 * temperature value and the scale they want to convert from and to.
 * It will then perform the conversion and display the result.
 */

import java.util.Scanner;

public class TemperatureConverter {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the temperature value
        System.out.println("Enter the temperature value: ");
        double temperature = scanner.nextDouble();

        // Prompt the user to enter the scale they are converting from
        System.out.println("Enter the scale you are converting from (C/F/K): ");
        char fromScale = scanner.next().charAt(0);

        // Prompt the user to enter the scale they are converting to
        System.out.println("Enter the scale you are converting to (C/F/K): ");
        char toScale = scanner.next().charAt(0);

        double convertedTemperature = 0.0;

        // Perform the conversion based on the input scales
        if (fromScale == 'C' || fromScale == 'c') {
            if (toScale == 'F' || toScale == 'f') {
                convertedTemperature = celsiusToFahrenheit(temperature);
            } else if (toScale == 'K' || toScale == 'k') {
                convertedTemperature = celsiusToKelvin(temperature);
            }
        } else if (fromScale == 'F' || fromScale == 'f') {
            if (toScale == 'C' || toScale == 'c') {
                convertedTemperature = fahrenheitToCelsius(temperature);
            } else if (toScale == 'K' || toScale == 'k') {
                convertedTemperature = fahrenheitToKelvin(temperature);
            }
        } else if (fromScale == 'K' || fromScale == 'k') {
            if (toScale == 'C' || toScale == 'c') {
                convertedTemperature = kelvinToCelsius(temperature);
            } else if (toScale == 'F' || toScale == 'f') {
                convertedTemperature = kelvinToFahrenheit(temperature);
            }
        }

        // Display the converted temperature
        System.out.println("Converted temperature: " + convertedTemperature);

        // Close the scanner
        scanner.close();
    }

    // Convert Celsius to Fahrenheit
    public static double celsiusToFahrenheit(double celsius) {
        return (celsius * 9/5) + 32;
    }

    // Convert Celsius to Kelvin
    public static double celsiusToKelvin(double celsius) {
        return celsius + 273.15;
    }

    // Convert Fahrenheit to Celsius
    public static double fahrenheitToCelsius(double fahrenheit) {
        return (fahrenheit - 32) * 5/9;
    }

    // Convert Fahrenheit to Kelvin
    public static double fahrenheitToKelvin(double fahrenheit) {
        return (fahrenheit - 32) * 5/9 + 273.15;
    }

    // Convert Kelvin to Celsius
    public static double kelvinToCelsius(double kelvin) {
        return kelvin - 273.15;
    }

    // Convert Kelvin to Fahrenheit
    public static double kelvinToFahrenheit(double kelvin) {
        return (kelvin - 273.15) * 9/5 + 32;
    }
}

