/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process and practice their coding skills.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 * The program also includes various functions and variables to demonstrate different aspects of Java programming.
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
        int decimalValue = 0;
        int length = hex.length();

        for (int i = 0; i < length; i++) {
            char hexChar = hex.charAt(i);
            int decimalDigit = hexCharToDecimal(hexChar);
            decimalValue = decimalValue * 16 + decimalDigit;
        }

        return decimalValue;
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number: ");
        String hexInput = scanner.nextLine();

        // Convert the hexadecimal input to decimal and display the result
        int decimalOutput = hexToDecimal(hexInput);
        System.out.println("The decimal equivalent of " + hexInput + " is " + decimalOutput);

        // Close the scanner
        scanner.close();
    }
}

