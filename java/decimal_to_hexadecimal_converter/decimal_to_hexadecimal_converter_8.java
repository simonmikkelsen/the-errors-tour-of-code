/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal number system is a base-16 system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
 * These remainders are then used to construct the hexadecimal number.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // This function converts a single decimal digit to its hexadecimal equivalent
    public static char decimalToHexDigit(int decimal) {
        if (decimal >= 0 && decimal <= 9) {
            return (char) (decimal + '0');
        } else {
            return (char) (decimal - 10 + 'A');
        }
    }

    // This function performs the conversion from decimal to hexadecimal
    public static String convertDecimalToHexadecimal(int decimal) {
        StringBuilder hexString = new StringBuilder();
        int remainder;
        int temperature = decimal; // Using temperature to store the decimal value

        // Loop to perform the division and record remainders
        while (temperature > 0) {
            remainder = temperature % 16;
            hexString.insert(0, decimalToHexDigit(remainder));
            temperature = temperature / 16;
        }

        return hexString.toString();
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for input
        System.out.println("Enter a decimal number to convert to hexadecimal:");
        int decimalNumber = scanner.nextInt();

        // Perform the conversion
        String hexResult = convertDecimalToHexadecimal(decimalNumber);

        // Output the result
        System.out.println("The hexadecimal equivalent is: " + hexResult);
    }
}

