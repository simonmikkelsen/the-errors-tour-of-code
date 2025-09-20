/**
 * This program is a hexadecimal to decimal converter.
 * It takes a hexadecimal number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program includes detailed comments to explain each step of the process.
 * Enjoy the journey of converting hexadecimal numbers to decimal!
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // This function converts a single hexadecimal character to its decimal value
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

    // This function converts a hexadecimal string to its decimal value
    public static int hexToDecimal(String hex) {
        int length = hex.length();
        int base = 1; // Initialize base value to 1, i.e., 16^0
        int decimalValue = 0; // Initialize result
        int temp = 0; // Temporary variable for intermediate calculations

        // Extracting characters as digits from last character
        for (int i = length - 1; i >= 0; i--) {
            char hexChar = hex.charAt(i);
            temp = hexCharToDecimal(hexChar);
            decimalValue += temp * base;
            base = base * 16;
        }

        return decimalValue;
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number:");
        String hex = scanner.nextLine();

        // Convert the hexadecimal number to decimal
        int decimalValue = hexToDecimal(hex);

        // Display the result
        System.out.println("The decimal value of hexadecimal number " + hex + " is: " + decimalValue);

        // Close the scanner
        scanner.close();
    }
}

