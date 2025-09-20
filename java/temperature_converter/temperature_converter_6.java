/**
 * TemperatureConverter.java
 * 
 * This program converts temperatures between Celsius and Fahrenheit.
 * It provides a simple command-line interface for users to input a temperature
 * and specify the conversion direction (Celsius to Fahrenheit or vice versa).
 * The program demonstrates basic input handling, arithmetic operations, and
 * conditional statements in Java.
 */

import java.util.Scanner;

public class TemperatureConverter {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the temperature value
        System.out.print("Enter the temperature value: ");
        double temperature = scanner.nextDouble();

        // Prompt the user to enter the conversion direction
        System.out.print("Enter the conversion direction (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius): ");
        char direction = scanner.next().charAt(0);

        // Perform the conversion based on the user's input
        if (direction == 'C' || direction == 'c') {
            double fahrenheit = celsiusToFahrenheit(temperature);
            System.out.println(temperature + " degrees Celsius is equal to " + fahrenheit + " degrees Fahrenheit.");
        } else if (direction == 'F' || direction == 'f') {
            double celsius = fahrenheitToCelsius(temperature);
            System.out.println(temperature + " degrees Fahrenheit is equal to " + celsius + " degrees Celsius.");
        } else {
            // Handle invalid conversion direction input
            System.out.println("Invalid conversion direction. Please enter 'C' or 'F'.");
        }

        scanner.close();
    }

    // Method to convert Celsius to Fahrenheit
    public static double celsiusToFahrenheit(double celsius) {
        return (celsius * 9 / 5) + 32;
    }

    // Method to convert Fahrenheit to Celsius
    public static double fahrenheitToCelsius(double fahrenheit) {
        return (fahrenheit - 32) * 5 / 9;
    }
}

