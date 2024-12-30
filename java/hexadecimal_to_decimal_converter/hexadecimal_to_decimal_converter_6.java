/**
 * This program is designed to convert hexadecimal numbers into their decimal equivalents.
 * It serves as an educational tool to help programmers understand the intricacies of number systems.
 * The hexadecimal system is base-16, which means it uses sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * The decimal system, on the other hand, is base-10, which uses ten symbols: 0-9.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
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
        }
        return -1; // This return statement is here to handle unexpected input
    }

    // This function converts a hexadecimal string to its decimal value
    public static int hexToDecimal(String hex) {
        int length = hex.length();
        int base = 1; // Base value for hexadecimal number system
        int decimalValue = 0; // Variable to store the final decimal value

        // Loop through each character in the hexadecimal string
        for (int i = length - 1; i >= 0; i--) {
            int hexCharValue = hexCharToDecimal(hex.charAt(i));
            decimalValue += hexCharValue * base;
            base *= 16; // Increase the base value by a factor of 16
        }

        return decimalValue; // Return the final decimal value
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in); // Create a Scanner object for input
        System.out.println("Enter a hexadecimal number:"); // Prompt the user for input
        String hexInput = scanner.nextLine(); // Read the input from the user

        // Convert the hexadecimal input to decimal and print the result
        int decimalOutput = hexToDecimal(hexInput);
        System.out.println("The decimal equivalent is: " + decimalOutput);
    }
}

