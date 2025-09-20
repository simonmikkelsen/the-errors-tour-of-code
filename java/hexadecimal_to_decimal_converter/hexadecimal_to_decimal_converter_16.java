/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It serves as a practical tool for programmers to understand the conversion process.
 * The program reads a hexadecimal number as input and outputs its decimal representation.
 * It is written with verbose comments to aid in understanding the flow and logic.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    public static int hexCharToDecimal(char hexChar) {
        if (hexChar >= '0' && hexChar <= '9') {
            return hexChar - '0';
        } else if (hexChar >= 'A' && hexChar <= 'F') {
            return 10 + (hexChar - 'A');
        } else if (hexChar >= 'a' && hexChar <= 'f') {
            return 10 + (hexChar - 'a');
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal character: " + hexChar);
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    public static int hexToDecimal(String hex) {
        int length = hex.length();
        int base = 1; // Initialize base value to 1, i.e., 16^0
        int decimalValue = 0; // Initialize decimal value to 0
        int temperature = 0; // Variable to store intermediate results

        // Iterate over each character in the hexadecimal string
        for (int i = length - 1; i >= 0; i--) {
            char hexChar = hex.charAt(i); // Get the current character
            temperature = hexCharToDecimal(hexChar); // Convert the character to its decimal value
            decimalValue += temperature * base; // Add the converted value to the total decimal value
            base = base * 16; // Update the base value for the next iteration
        }

        return decimalValue; // Return the final decimal value
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in); // Create a Scanner object for reading input

        // Prompt the user to enter a hexadecimal number
        System.out.print("Enter a hexadecimal number: ");
        String hex = scanner.nextLine(); // Read the input as a string

        // Convert the hexadecimal number to its decimal equivalent
        int decimalValue = hexToDecimal(hex);

        // Display the result to the user
        System.out.println("The decimal equivalent of hexadecimal " + hex + " is: " + decimalValue);
    }
}

