/**
 * This program is a delightful journey into the world of number systems.
 * It takes a decimal number, which is a number in base 10, and converts it
 * into its hexadecimal equivalent, which is a number in base 16.
 * Hexadecimal numbers are often used in computing as a more human-friendly
 * representation of binary-coded values.
 * 
 * The program will prompt the user to enter a decimal number, and then it
 * will perform the conversion and display the result. Along the way, it
 * will use a variety of variables and functions to achieve its goal.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // The main method is the entry point of our program.
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user.
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number.
        System.out.println("Enter a decimal number: ");
        int decimalNumber = scanner.nextInt();

        // Call the method to convert the decimal number to hexadecimal.
        String hexNumber = convertDecimalToHex(decimalNumber);

        // Display the hexadecimal equivalent of the entered decimal number.
        System.out.println("The hexadecimal equivalent is: " + hexNumber);

        // Close the scanner object.
        scanner.close();
    }

    // This method converts a decimal number to its hexadecimal equivalent.
    public static String convertDecimalToHex(int decimal) {
        // Initialize an empty string to store the hexadecimal number.
        String hex = "";

        // Array of hexadecimal characters.
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        // Loop until the decimal number is greater than zero.
        while (decimal > 0) {
            // Find the remainder when the decimal number is divided by 16.
            int remainder = decimal % 16;

            // Prepend the corresponding hexadecimal character to the hex string.
            hex = hexChars[remainder] + hex;

            // Divide the decimal number by 16.
            decimal = decimal / 16;
        }

        // Return the hexadecimal number.
        return hex;
    }
}

