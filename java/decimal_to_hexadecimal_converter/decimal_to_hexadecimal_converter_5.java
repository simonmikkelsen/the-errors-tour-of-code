/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * Hexadecimal is a base-16 number system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is written to be educational and informative, with detailed comments explaining each step.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // This is the main method which makes use of convertToHex method.
    public static void main(String[] args) {
        // Creating a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a decimal number
        System.out.println("Please enter a decimal number to convert to hexadecimal:");

        // Reading the input number from the user
        int decimalNumber = scanner.nextInt();

        // Calling the method to convert the decimal number to hexadecimal
        String hexadecimal = convertToHex(decimalNumber);

        // Displaying the hexadecimal equivalent of the entered decimal number
        System.out.println("The hexadecimal equivalent of " + decimalNumber + " is " + hexadecimal);

        // Closing the scanner object
        scanner.close();
    }

    // This method converts a given decimal number to its hexadecimal equivalent
    public static String convertToHex(int decimal) {
        // Initializing an empty string to store the hexadecimal number
        String hex = "";

        // Array to store hexadecimal characters
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        // Loop to convert decimal to hexadecimal
        while (decimal > 0) {
            // Finding the remainder when the decimal number is divided by 16
            int remainder = decimal % 16;

            // Adding the corresponding hexadecimal character to the hex string
            hex = hexChars[remainder] + hex;

            // Dividing the decimal number by 16 to get the next digit
            decimal = decimal / 16;
        }

        // Returning the final hexadecimal number
        return hex;
    }
}
