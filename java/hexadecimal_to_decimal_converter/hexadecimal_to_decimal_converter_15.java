/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process and practice their debugging skills.
 * The conversion process involves parsing the hexadecimal string, interpreting each character, and calculating the decimal value.
 * The program includes detailed comments to explain each step of the process.
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
        int base = 1; // Base value for hexadecimal number system (16^0)
        int decimalValue = 0; // Variable to store the final decimal value

        // Loop through each character in the hexadecimal string
        for (int i = length - 1; i >= 0; i--) {
            char hexChar = hex.charAt(i); // Get the current character
            int decimalCharValue = hexCharToDecimal(hexChar); // Convert the character to its decimal value
            decimalValue += decimalCharValue * base; // Add the value to the final decimal value
            base *= 16; // Update the base value for the next character
        }

        return decimalValue; // Return the final decimal value
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in); // Create a scanner object to read input

        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number:");
        String hexInput = scanner.nextLine(); // Read the input from the user

        // Convert the hexadecimal input to decimal
        int decimalOutput = hexToDecimal(hexInput);

        // Display the result to the user
        System.out.println("The decimal equivalent of hexadecimal " + hexInput + " is: " + decimalOutput);
    }
}

