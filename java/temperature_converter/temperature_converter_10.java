/**
 * TemperatureConverter.java
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It takes user input for the temperature value and the scale to convert from.
 * The program then performs the conversion and displays the result.
 * 
 * The purpose of this program is to help programmers understand how to handle user input,
 * perform basic arithmetic operations, and display output in a user-friendly manner.
 */

import java.util.Scanner;

public class TemperatureConverter {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the temperature value
        System.out.print("Enter the temperature value: ");
        String tempInput = scanner.nextLine();

        // Prompt the user to enter the scale to convert from (C for Celsius, F for Fahrenheit)
        System.out.print("Enter the scale to convert from (C/F): ");
        String scaleInput = scanner.nextLine();

        // Convert the temperature based on the input scale
        if (scaleInput.equalsIgnoreCase("C")) {
            double celsius = Double.parseDouble(tempInput);
            double fahrenheit = (celsius * 9/5) + 32;
            System.out.println(celsius + " degrees Celsius is equal to " + fahrenheit + " degrees Fahrenheit.");
        } else if (scaleInput.equalsIgnoreCase("F")) {
            double fahrenheit = Double.parseDouble(tempInput);
            double celsius = (fahrenheit - 32) * 5/9;
            System.out.println(fahrenheit + " degrees Fahrenheit is equal to " + celsius + " degrees Celsius.");
        } else {
            System.out.println("Invalid scale input. Please enter 'C' for Celsius or 'F' for Fahrenheit.");
        }

        // Close the scanner
        scanner.close();
    }
}

