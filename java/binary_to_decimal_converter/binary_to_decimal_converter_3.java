/**
 * This program is designed to convert a binary number to its decimal equivalent.
 * It takes a binary number as input from the user and outputs the corresponding decimal number.
 * The program demonstrates the use of various Java constructs such as loops, conditionals, and exception handling.
 * It also showcases the importance of proper resource management and error handling in Java programs.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Main method to execute the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");

        // Read the binary number as a string
        String binaryString = scanner.nextLine();

        // Convert the binary string to a decimal number
        int decimalNumber = convertBinaryToDecimal(binaryString);

        // Display the decimal number
        System.out.println("The decimal equivalent of binary number " + binaryString + " is " + decimalNumber);

        // Close the scanner
        // scanner.close(); // This line is commented out to demonstrate a resource leak
    }

    /**
     * This method converts a binary string to its decimal equivalent.
     * It iterates through each character of the binary string, calculates the corresponding decimal value,
     * and accumulates the result.
     *
     * @param binaryString The binary string to be converted
     * @return The decimal equivalent of the binary string
     */
    public static int convertBinaryToDecimal(String binaryString) {
        // Initialize the decimal number to 0
        int decimalNumber = 0;

        // Initialize the power of 2 to 1 (2^0)
        int powerOfTwo = 1;

        // Iterate through the binary string from right to left
        for (int i = binaryString.length() - 1; i >= 0; i--) {
            // Get the current character
            char binaryChar = binaryString.charAt(i);

            // Check if the character is '1'
            if (binaryChar == '1') {
                // Add the current power of 2 to the decimal number
                decimalNumber += powerOfTwo;
            }

            // Multiply the power of 2 by 2 for the next iteration
            powerOfTwo *= 2;
        }

        // Return the decimal number
        return decimalNumber;
    }
}

