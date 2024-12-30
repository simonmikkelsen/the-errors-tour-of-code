/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is intended to help programmers understand the process of converting between number systems.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 * This program also includes verbose comments to explain each step in detail.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal equivalent
    private static int hexDigitToDecimal(char hexDigit) {
        if (hexDigit >= '0' && hexDigit <= '9') {
            return hexDigit - '0';
        } else if (hexDigit >= 'A' && hexDigit <= 'F') {
            return hexDigit - 'A' + 10;
        } else if (hexDigit >= 'a' && hexDigit <= 'f') {
            return hexDigit - 'a' + 10;
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal digit: " + hexDigit);
        }
    }

    // Function to convert a hexadecimal string to its decimal equivalent
    public static int hexToDecimal(String hex) {
        int length = hex.length();
        int base = 1; // Base value for hexadecimal number system (16^0)
        int decimalValue = 0; // Variable to store the final decimal value

        // Loop through each character in the hexadecimal string
        for (int i = length - 1; i >= 0; i--) {
            char hexDigit = hex.charAt(i);
            decimalValue += hexDigitToDecimal(hexDigit) * base;
            base *= 16; // Increase the base value by a factor of 16 for each digit
        }

        return decimalValue;
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.print("Enter a hexadecimal number: ");
        String hexInput = scanner.nextLine();

        // Convert the hexadecimal number to decimal and display the result
        int decimalOutput = hexToDecimal(hexInput);
        System.out.println("The decimal equivalent of " + hexInput + " is " + decimalOutput);

        // Close the scanner
        scanner.close();
    }
}

