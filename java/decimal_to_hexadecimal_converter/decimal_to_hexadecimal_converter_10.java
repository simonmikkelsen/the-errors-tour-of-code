/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It takes user input, processes the input, and then outputs the hexadecimal representation.
 * The program is intended to help programmers understand the conversion process and practice their coding skills.
 * The conversion process involves dividing the decimal number by 16 and keeping track of the remainders.
 * These remainders are then used to construct the hexadecimal number.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Main method where the program execution begins
    public static void main(String[] args) {
        // Create a Scanner object to read user input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to hexadecimal:");

        // Read the user input as a string
        String userInput = scanner.nextLine();

        // Convert the user input to an integer
        int decimalNumber = Integer.parseInt(userInput);

        // Call the method to convert the decimal number to hexadecimal
        String hexadecimal = convertDecimalToHex(decimalNumber);

        // Display the hexadecimal result to the user
        System.out.println("The hexadecimal equivalent is: " + hexadecimal);
    }

    // Method to convert a decimal number to its hexadecimal equivalent
    public static String convertDecimalToHex(int decimal) {
        // Initialize an empty string to store the hexadecimal result
        String hexResult = "";

        // Array of hexadecimal characters
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        // Loop to perform the conversion
        while (decimal > 0) {
            // Get the remainder when the decimal number is divided by 16
            int remainder = decimal % 16;

            // Append the corresponding hexadecimal character to the result string
            hexResult = hexChars[remainder] + hexResult;

            // Update the decimal number by dividing it by 16
            decimal = decimal / 16;
        }

        // Return the final hexadecimal result
        return hexResult;
    }
}
