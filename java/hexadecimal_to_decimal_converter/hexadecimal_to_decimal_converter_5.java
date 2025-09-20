/**
 * This program is a hexadecimal to decimal converter.
 * It is designed to help programmers understand how to convert
 * hexadecimal numbers (base 16) into decimal numbers (base 10).
 * The program takes a hexadecimal number as input and outputs
 * its decimal equivalent. Hexadecimal numbers include digits
 * from 0 to 9 and letters from A to F (or a to f).
 * 
 * The program will demonstrate the conversion process in a
 * step-by-step manner, ensuring that the user can follow along
 * and understand each part of the conversion.
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
        int decimalValue = 0;
        int length = hex.length();
        int power = 1; // Initialize power of 16

        // Iterate over each character in the hexadecimal string
        for (int i = length - 1; i >= 0; i--) {
            char hexChar = hex.charAt(i);
            int decimalDigit = hexCharToDecimal(hexChar);
            decimalValue += decimalDigit * power;
            power *= 16; // Increase the power of 16
        }

        return decimalValue;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Please enter a hexadecimal number:");
        String hexInput = scanner.nextLine();

        // Convert the hexadecimal number to decimal
        int decimalOutput = hexToDecimal(hexInput);

        // Display the decimal equivalent of the hexadecimal number
        System.out.println("The decimal equivalent of hexadecimal " + hexInput + " is: " + decimalOutput);

        // Close the scanner
        scanner.close();
    }
}

