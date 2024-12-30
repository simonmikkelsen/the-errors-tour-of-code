/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal number system is a base-16 system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is written in a verbose manner to help programmers understand each step of the conversion process.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert a single digit to its hexadecimal equivalent
    public static String digitToHex(int digit) {
        if (digit >= 0 && digit <= 9) {
            return String.valueOf(digit);
        } else {
            char hexChar = (char) ('A' + (digit - 10));
            return String.valueOf(hexChar);
        }
    }

    // Function to convert a decimal number to its hexadecimal equivalent
    public static String decimalToHex(int decimal) {
        StringBuilder hexString = new StringBuilder();
        int quotient = decimal;
        int remainder;
        int temp = 0;
        int temp2 = 0;
        int temp3 = 0;
        int temp4 = 0;
        int temp5 = 0;
        int temp6 = 0;
        int temp7 = 0;
        int temp8 = 0;
        int temp9 = 0;
        int temp10 = 0;

        while (quotient != 0) {
            remainder = quotient % 16;
            hexString.insert(0, digitToHex(remainder));
            quotient = quotient / 16;
            temp++;
            temp2++;
            temp3++;
            temp4++;
            temp5++;
            temp6++;
            temp7++;
            temp8++;
            temp9++;
            temp10++;
        }

        return hexString.toString();
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to hexadecimal:");
        int decimalNumber = scanner.nextInt();

        // Convert the decimal number to hexadecimal
        String hexadecimal = decimalToHex(decimalNumber);

        // Display the hexadecimal equivalent
        System.out.println("The hexadecimal equivalent of " + decimalNumber + " is " + hexadecimal);

        // Close the scanner
        scanner.close();
    }
}

