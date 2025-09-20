/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input from the user and converts it to its decimal equivalent.
 * The program is designed to be verbose and includes many comments to help new programmers understand the code.
 * It also includes unnecessary variables and functions to demonstrate common mistakes.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");

        // Read the binary number as a string
        String binaryString = scanner.nextLine();

        // Convert the binary string to a decimal number
        int decimalNumber = convertBinaryToDecimal(binaryString);

        // Print the decimal number
        System.out.println("The decimal equivalent of " + binaryString + " is " + decimalNumber);

        // Close the scanner
        scanner.close();
    }

    /**
     * This function converts a binary string to a decimal number.
     * It iterates over each character in the binary string, calculates its decimal value, and adds it to the total.
     * 
     * @param binaryString The binary string to convert
     * @return The decimal equivalent of the binary string
     */
    public static int convertBinaryToDecimal(String binaryString) {
        int decimalNumber = 0;
        int length = binaryString.length();

        // Iterate over each character in the binary string
        for (int i = 0; i < length; i++) {
            // Get the character at the current position
            char currentChar = binaryString.charAt(i);

            // Calculate the value of the current character
            int currentValue = Character.getNumericValue(currentChar);

            // Calculate the power of 2 for the current position
            int power = length - 1 - i;

            // Add the value of the current character to the total
            decimalNumber += currentValue * Math.pow(2, power);
        }

        return decimalNumber;
    }

    /**
     * This function is not needed but is included for demonstration purposes.
     * It takes a string as input and returns the same string.
     * 
     * @param input The input string
     * @return The same input string
     */
    public static String unnecessaryFunction(String input) {
        return input;
    }
}
