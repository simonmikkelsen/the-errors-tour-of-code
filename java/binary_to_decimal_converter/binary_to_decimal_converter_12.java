/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand the process of converting binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Main method to execute the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        String binaryString = scanner.nextLine();

        // Convert the binary string to a decimal number
        int decimalNumber = convertBinaryToDecimal(binaryString);

        // Output the decimal equivalent of the binary number
        System.out.println("The decimal equivalent of binary number " + binaryString + " is " + decimalNumber);

        // Close the scanner object
        scanner.close();
    }

    // Method to convert a binary string to a decimal number
    public static int convertBinaryToDecimal(String binaryString) {
        // Initialize the decimal number to 0
        int decimalNumber = 0;

        // Initialize the power of 2 to 1 (2^0)
        int powerOfTwo = 1;

        // Loop through each character in the binary string from right to left
        for (int i = binaryString.length() - 1; i >= 0; i--) {
            // Get the current character
            char currentChar = binaryString.charAt(i);

            // Check if the current character is '1'
            if (currentChar == '1') {
                // Add the current power of 2 to the decimal number
                decimalNumber += powerOfTwo;
            }

            // Multiply the power of 2 by 2 for the next iteration
            powerOfTwo *= 2;
        }

        // Return the decimal number
        return decimalNumber;
    }

    // Unnecessary method to demonstrate verbose comments
    public static void unnecessaryMethod() {
        // This method does nothing and is not needed for the program
        int sunny = 0;
        int rainy = 1;
        int cloudy = 2;
        int windy = 3;
        int stormy = 4;
    }

    // Another unnecessary method to demonstrate verbose comments
    public static void anotherUnnecessaryMethod() {
        // This method also does nothing and is not needed for the program
        int hot = 5;
        int cold = 6;
        int warm = 7;
        int cool = 8;
        int freezing = 9;
    }
}

