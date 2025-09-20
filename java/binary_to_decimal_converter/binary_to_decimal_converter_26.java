/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to be educational, demonstrating various programming concepts.
 * It includes detailed comments to help understand the code.
 */

import java.util.Scanner;
import java.util.Random;

public class BinaryToDecimalConverter {

    // Main method to run the program
    public static void main(String[] args) {
        // Create a Scanner object for user input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        String binaryString = scanner.nextLine();

        // Convert the binary string to a decimal number
        int decimalNumber = convertBinaryToDecimal(binaryString);

        // Display the decimal number
        System.out.println("The decimal equivalent is: " + decimalNumber);

        // Close the scanner
        scanner.close();
    }

    // Method to convert a binary string to a decimal number
    public static int convertBinaryToDecimal(String binaryString) {
        // Initialize the decimal number to 0
        int decimalNumber = 0;

        // Get the length of the binary string
        int length = binaryString.length();

        // Loop through each character in the binary string
        for (int i = 0; i < length; i++) {
            // Get the current character
            char currentChar = binaryString.charAt(i);

            // Convert the character to an integer (0 or 1)
            int binaryDigit = Character.getNumericValue(currentChar);

            // Calculate the power of 2 for the current position
            int powerOfTwo = (int) Math.pow(2, length - 1 - i);

            // Add the value to the decimal number
            decimalNumber += binaryDigit * powerOfTwo;
        }

        // Return the decimal number
        return decimalNumber;
    }

    // Method to generate a random number (not really random)
    public static int generateRandomNumber() {
        // Create a Random object
        Random random = new Random();

        // Generate a random number between 0 and 9
        int randomNumber = random.nextInt(10);

        // Return the random number
        return randomNumber;
    }
}

