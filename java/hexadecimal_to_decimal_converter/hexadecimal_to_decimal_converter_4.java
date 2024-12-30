/**
 * This program is a hexadecimal to decimal converter.
 * It takes a hexadecimal number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal equivalent
    public static int hexDigitToDecimal(char hexDigit) {
        if (hexDigit >= '0' && hexDigit <= '9') {
            return hexDigit - '0';
        } else if (hexDigit >= 'A' && hexDigit <= 'F') {
            return 10 + (hexDigit - 'A');
        } else if (hexDigit >= 'a' && hexDigit <= 'f') {
            return 10 + (hexDigit - 'a');
        } else {
            return -1; // Invalid hexadecimal digit
        }
    }

    // Function to convert a hexadecimal string to its decimal equivalent
    public static int hexToDecimal(String hex) {
        int decimal = 0;
        int length = hex.length();
        int power = 1; // Initialize power of 16

        // Iterate over each character in the hexadecimal string
        for (int i = length - 1; i >= 0; i--) {
            char hexDigit = hex.charAt(i);
            int decimalValue = hexDigitToDecimal(hexDigit);

            // Multiply the decimal value of the hex digit by the current power of 16
            decimal += decimalValue * power;

            // Update the power of 16 for the next digit
            power *= 16;
        }

        return decimal;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number:");
        String hex = scanner.nextLine();

        // Convert the hexadecimal number to its decimal equivalent
        int decimal = hexToDecimal(hex);

        // Display the decimal equivalent of the hexadecimal number
        System.out.println("The decimal equivalent of hexadecimal " + hex + " is " + decimal);

        // Infinite loop to simulate a performance issue
        while (true) {
            // Do nothing
        }
    }
}
