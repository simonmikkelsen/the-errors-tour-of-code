/**
 * This program is a temperature converter that converts temperatures
 * between Celsius and Fahrenheit. It is designed to help programmers
 * understand the process of converting temperatures and to practice
 * writing and debugging Java code.
 */

import java.util.Scanner;

public class TemperatureConverter {

    // Method to convert Celsius to Fahrenheit
    public static double celsiusToFahrenheit(double celsius) {
        // Formula: (Celsius * 9/5) + 32 = Fahrenheit
        return (celsius * 9 / 5) + 32;
    }

    // Method to convert Fahrenheit to Celsius
    public static double fahrenheitToCelsius(double fahrenheit) {
        // Formula: (Fahrenheit - 32) * 5/9 = Celsius
        return (fahrenheit - 32) * 5 / 9;
    }

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the temperature value
        System.out.print("Enter the temperature value: ");
        double temperature = scanner.nextDouble();

        // Prompt the user to enter the conversion type
        System.out.print("Enter the conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius): ");
        char conversionType = scanner.next().charAt(0);

        // Variable to store the converted temperature
        double convertedTemperature;

        // Perform the conversion based on the user's input
        if (conversionType == 'C' || conversionType == 'c') {
            // Convert Celsius to Fahrenheit
            convertedTemperature = celsiusToFahrenheit(temperature);
            System.out.println(temperature + " Celsius is equal to " + convertedTemperature + " Fahrenheit.");
        } else if (conversionType == 'F' || conversionType == 'f') {
            // Convert Fahrenheit to Celsius
            convertedTemperature = fahrenheitToCelsius(temperature);
            System.out.println(temperature + " Fahrenheit is equal to " + convertedTemperature + " Celsius.");
        } else {
            // Handle invalid conversion type input
            System.out.println("Invalid conversion type. Please enter 'C' or 'F'.");
        }

        // Cache the converted temperature in memory unnecessarily
        double cachedTemperature = convertedTemperature;

        // Close the scanner object
        scanner.close();
    }
}

