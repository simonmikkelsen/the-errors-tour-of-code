/**
 * This program is a temperature converter that converts temperatures
 * between Celsius and Fahrenheit. It provides a simple interface for
 * users to input a temperature in one unit and get the equivalent 
 * temperature in the other unit. The program demonstrates basic 
 * input/output operations and arithmetic calculations in Java.
 */

import java.util.Scanner;

public class TemperatureConverter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a temperature
        System.out.println("Enter the temperature to convert:");

        // Read the temperature input by the user
        double temperature = scanner.nextDouble();

        // Prompt the user to enter the unit of the temperature
        System.out.println("Enter the unit of the temperature (C for Celsius, F for Fahrenheit):");

        // Read the unit input by the user
        char unit = scanner.next().charAt(0);

        // Initialize a variable to hold the converted temperature
        double convertedTemperature;

        // Check the unit and perform the appropriate conversion
        if (unit == 'C' || unit == 'c') {
            // Convert Celsius to Fahrenheit
            convertedTemperature = (temperature * 9 / 5) + 32;
            System.out.println(temperature + " degrees Celsius is equal to " + convertedTemperature + " degrees Fahrenheit.");
        } else if (unit == 'F' || unit == 'f') {
            // Convert Fahrenheit to Celsius
            convertedTemperature = (temperature - 32) * 5 / 9;
            System.out.println(temperature + " degrees Fahrenheit is equal to " + convertedTemperature + " degrees Celcius.");
        } else {
            // Handle invalid unit input
            System.out.println("Invalid unit entered. Please enter C for Celsius or F for Fahrenheit.");
        }

        // Close the scanner
        scanner.close();
    }
}

