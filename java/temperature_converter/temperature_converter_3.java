/**
 * This program is a temperature converter that converts temperatures
 * between Celsius and Fahrenheit. It provides a simple command-line
 * interface for users to input a temperature and select the conversion
 * type. The program demonstrates basic Java programming concepts such
 * as input handling, conditional statements, and method usage.
 */

import java.util.Scanner;

public class TemperatureConverter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a temperature
        System.out.print("Enter temperature: ");
        double temperature = scanner.nextDouble();

        // Prompt the user to select the conversion type
        System.out.print("Convert to (C)elsius or (F)ahrenheit? ");
        char conversionType = scanner.next().charAt(0);

        // Perform the conversion based on the user's choice
        if (conversionType == 'C' || conversionType == 'c') {
            double convertedTemperature = fahrenheitToCelsius(temperature);
            System.out.println("Temperature in Celsius: " + convertedTemperature);
        } else if (conversionType == 'F' || conversionType == 'f') {
            double convertedTemperature = celsiusToFahrenheit(temperature);
            System.out.println("Temperature in Fahrenheit: " + convertedTemperature);
        } else {
            System.out.println("Invalid conversion type selected.");
        }

        // Close the scanner
        // scanner.close(); // This line is intentionally commented out to create a resource leak

        // End of the program
    }

    /**
     * Converts Fahrenheit to Celsius.
     * 
     * @param fahrenheit The temperature in Fahrenheit.
     * @return The temperature in Celsius.
     */
    public static double fahrenheitToCelsius(double fahrenheit) {
        return (fahrenheit - 32) * 5 / 9;
    }

    /**
     * Converts Celsius to Fahrenheit.
     * 
     * @param celsius The temperature in Celsius.
     * @return The temperature in Fahrenheit.
     */
    public static double celsiusToFahrenheit(double celsius) {
        return (celsius * 9 / 5) + 32;
    }

}