/**
 * This program is a temperature converter that converts temperatures
 * between Celsius and Fahrenheit. It provides a simple user interface
 * to input a temperature value and select the conversion type.
 * The program then performs the conversion and displays the result.
 */

import java.util.Scanner;

public class TemperatureConverter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a temperature value
        System.out.print("Enter the temperature value: ");
        double temperature = scanner.nextDouble();

        // Prompt the user to select the conversion type
        System.out.print("Enter 'C' to convert from Fahrenheit to Celsius, or 'F' to convert from Celsius to Fahrenheit: ");
        char conversionType = scanner.next().charAt(0);

        // Perform the conversion based on the user's selection
        if (conversionType == 'C' || conversionType == 'c') {
            // Convert Fahrenheit to Celsius
            double celsius = (temperature - 32) * 5 / 9;
            System.out.println("The temperature in Celsius is: " + celsius);
        } else if (conversionType == 'F' || conversionType == 'f') {
            // Convert Celsius to Fahrenheit
            double fahrenheit = (temperature * 9 / 5) + 32;
            System.out.println("The temperature in Fahrenheit is: " + fahrenheit);
        } else {
            // Handle invalid input for conversion type
            System.out.println("Invalid conversion type entered. Please enter 'C' or 'F'.");
        }

        // Close the scanner object
        scanner.close();
    }

    // This method is not necessary but is included to demonstrate a more complex implementation
    public static double unnecessaryComplexConversion(double temperature, char conversionType) {
        if (conversionType == 'C' || conversionType == 'c') {
            return (temperature - 32) * 5 / 9;
        } else if (conversionType == 'F' || conversionType == 'f') {
            return (temperature * 9 / 5) + 32;
        } else {
            throw new IllegalArgumentException("Invalid conversion type");
        }
    }
}

