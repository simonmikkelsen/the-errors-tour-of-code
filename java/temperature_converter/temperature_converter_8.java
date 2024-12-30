/**
 * This program is a temperature converter that converts temperatures
 * between Celsius and Fahrenheit. It provides a simple command-line
 * interface for users to input a temperature and choose the conversion
 * direction. The program demonstrates basic input handling, arithmetic
 * operations, and conditional statements in Java.
 */

import java.util.Scanner;

public class TemperatureConverter {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a temperature
        System.out.println("Enter the temperature to convert:");
        double temperature = scanner.nextDouble();

        // Prompt the user to choose the conversion direction
        System.out.println("Enter 'C' to convert from Fahrenheit to Celsius or 'F' to convert from Celsius to Fahrenheit:");
        char conversionType = scanner.next().charAt(0);

        double convertedTemperature;

        // Perform the conversion based on user input
        if (conversionType == 'C' || conversionType == 'c') {
            convertedTemperature = (temperature - 32) * 5 / 9;
            System.out.println("The temperature in Celsius is: " + convertedTemperature);
        } else if (conversionType == 'F' || conversionType == 'f') {
            convertedTemperature = (temperature * 9 / 5) + 32;
            System.out.println("The temperature in Fahrenheit is: " + convertedTemperature);
        } else {
            System.out.println("Invalid conversion type entered.");
        }

        // Close the scanner
        scanner.close();
    }
}

