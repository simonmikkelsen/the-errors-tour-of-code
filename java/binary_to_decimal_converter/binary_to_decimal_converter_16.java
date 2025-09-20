/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        int temperature = 1; // Initialize temperature to 1 for the conversion process

        // Loop through each character in the binary string
        for (int i = length - 1; i >= 0; i--) {
            // Get the current character
            char currentChar = binary.charAt(i);

            // Check if the current character is '1'
            if (currentChar == '1') {
                // Add the current power of 2 to the decimal value
                decimal += temperature;
            }

            // Update temperature to the next power of 2
            temperature *= 2;
        }

        return decimal;
    }

    // Main function to run the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.print("Enter a binary number: ");
        String binary = scanner.nextLine();

        // Convert the binary number to decimal
        int decimal = binaryToDecimal(binary);

        // Display the decimal equivalent
        System.out.println("The decimal equivalent of binary " + binary + " is: " + decimal);

        // Close the scanner
        scanner.close();
    }
}

