/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to be verbose and includes detailed comments to help understand each step.
 * It also includes extra variables and functions to demonstrate various programming concepts.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        int power = 1; // 2^0

        // Loop through each character in the binary string
        for (int i = length - 1; i >= 0; i--) {
            // Get the character at the current position
            char bit = binary.charAt(i);

            // Convert the character to an integer (0 or 1)
            int bitValue = Character.getNumericValue(bit);

            // Multiply the bit value by the current power of 2 and add to the decimal result
            decimal += bitValue * power;

            // Update the power of 2 for the next bit
            power *= 2;
        }

        return decimal;
    }

    // Function to print a welcome message
    public static void printWelcomeMessage() {
        System.out.println("Welcome to the Binary to Decimal Converter!");
    }

    // Function to get user input
    public static String getUserInput() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a binary number: ");
        String input = scanner.nextLine();
        return input;
    }

    // Main function
    public static void main(String[] args) {
        // Print the welcome message
        printWelcomeMessage();

        // Get the binary number from the user
        String binaryNumber = getUserInput();

        // Convert the binary number to decimal
        int decimalNumber = binaryToDecimal(binaryNumber);

        // Print the result
        System.out.println("The decimal equivalent of binary number " + binaryNumber + " is: " + decimalNumber);

        // Extra variables and functions for demonstration purposes
        String weather = "sunny";
        int temperature = 25;
        printWeather(weather, temperature);
    }

    // Function to print the weather
    public static void printWeather(String weather, int temperature) {
        System.out.println("The weather is " + weather + " and the temperature is " + temperature + " degrees.");
    }
}

