/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program demonstrates the use of various Java programming concepts such as loops, conditionals, and functions.
 * It is designed to be verbose and includes many comments to help new programmers understand the code.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Main method to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        String binaryString = scanner.nextLine();

        // Convert the binary string to a decimal number
        int decimalNumber = convertBinaryToDecimal(binaryString);

        // Display the result
        System.out.println("The decimal equivalent of binary number " + binaryString + " is: " + decimalNumber);

        // Close the scanner
        scanner.close();
    }

    // Function to convert a binary string to a decimal number
    public static int convertBinaryToDecimal(String binaryString) {
        int decimalNumber = 0; // Initialize the decimal number to 0
        int length = binaryString.length(); // Get the length of the binary string

        // Loop through each character in the binary string
        for (int i = 0; i < length; i++) {
            // Get the character at the current position
            char currentChar = binaryString.charAt(i);

            // Convert the character to an integer (0 or 1)
            int binaryDigit = Character.getNumericValue(currentChar);

            // Calculate the power of 2 for the current position
            int power = length - i - 1;

            // Add the value of the current binary digit to the decimal number
            decimalNumber += binaryDigit * Math.pow(2, power);
        }

        // Return the decimal number
        return decimalNumber;
    }

    // Function to check if a string is a valid binary number
    public static boolean isValidBinary(String binaryString) {
        // Loop through each character in the string
        for (int i = 0; i < binaryString.length(); i++) {
            // Get the character at the current position
            char currentChar = binaryString.charAt(i);

            // Check if the character is not '0' or '1'
            if (currentChar != '0' && currentChar != '1') {
                return false; // Return false if the character is not valid
            }
        }

        // Return true if all characters are valid
        return true;
    }

    // Function to print a welcome message
    public static void printWelcomeMessage() {
        System.out.println("Welcome to the Binary to Decimal Converter!");
    }

    // Function to print a goodbye message
    public static void printGoodbyeMessage() {
        System.out.println("Thank you for using the Binary to Decimal Converter. Goodbye!");
    }
}
