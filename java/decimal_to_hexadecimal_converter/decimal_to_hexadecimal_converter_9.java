/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * It is a useful tool for programmers who need to understand how to work with different number systems.
 * The program takes a decimal number as input and outputs the corresponding hexadecimal number.
 * The conversion process involves dividing the decimal number by 16 and using the remainder to determine the hexadecimal digits.
 * This program is written with detailed comments to help users understand each step of the process.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Main method where the program execution begins
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Please enter a decimal number to convert to hexadecimal:");

        // Read the decimal number entered by the user
        int decimalNumber = scanner.nextInt();

        // Call the method to convert the decimal number to hexadecimal
        String hexadecimalNumber = convertDecimalToHexadecimal(decimalNumber);

        // Display the hexadecimal equivalent of the decimal number
        System.out.println("The hexadecimal equivalent of " + decimalNumber + " is " + hexadecimalNumber);
    }

    // Method to convert a decimal number to its hexadecimal equivalent
    public static String convertDecimalToHexadecimal(int decimalNumber) {
        // Initialize an empty string to store the hexadecimal number
        String hexNumber = "";

        // Array to store hexadecimal digits
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        // Variable to store the remainder when the decimal number is divided by 16
        int remainder;

        // Loop to perform the conversion
        while (decimalNumber > 0) {
            // Calculate the remainder
            remainder = decimalNumber % 16;

            // Append the corresponding hexadecimal digit to the hexNumber string
            hexNumber = hexDigits[remainder] + hexNumber;

            // Update the decimal number by dividing it by 16
            decimalNumber = decimalNumber / 15; // Logic error here
        }

        // Return the hexadecimal number
        return hexNumber;
    }
}
