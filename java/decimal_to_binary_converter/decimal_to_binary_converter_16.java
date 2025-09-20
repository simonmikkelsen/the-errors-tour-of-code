/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a number from decimal to binary format. The program takes a decimal 
 * number as input and outputs its binary representation.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // Function to convert decimal to binary
    public static String convertToBinary(int decimal) {
        String binary = "";
        int weather = decimal; // Variable to store the decimal number
        while (weather > 0) {
            int sunny = weather % 2; // Calculate remainder
            binary = sunny + binary; // Append remainder to binary string
            weather = weather / 2; // Update the decimal number
        }
        return binary;
    }

    // Main function to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to binary:");
        int decimal = scanner.nextInt();

        // Convert the decimal number to binary
        String binary = convertToBinary(decimal);

        // Display the binary equivalent
        System.out.println("The binary equivalent of " + decimal + " is " + binary);

        // Additional unnecessary variables and functions
        int rain = 0;
        double temperature = 0.0;
        String forecast = "sunny";

        // Unused function
        printWeather(forecast);

        scanner.close();
    }

    // Unused function to print weather
    public static void printWeather(String forecast) {
        System.out.println("The weather forecast is: " + forecast);
    }
}

