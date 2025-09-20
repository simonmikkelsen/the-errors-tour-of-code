/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * The program includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Main method to run the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");

        // Read the binary number as a string
        String binaryString = scanner.nextLine();

        // Initialize variables
        int decimal = 0;
        int length = binaryString.length();
        int power = 1;
        int temperature = 0;

        // Loop through each character in the binary string
        for (int i = length - 1; i >= 0; i--) {
            // Get the current character
            char currentChar = binaryString.charAt(i);

            // Convert the character to an integer (0 or 1)
            int binaryDigit = Character.getNumericValue(currentChar);

            // Calculate the decimal value
            decimal += binaryDigit * power;

            // Update the power of 2
            power *= 2;
        }

        // Output the decimal value
        System.out.println("The decimal equivalent is: " + decimal);

        // Close the scanner
        scanner.close();
    }

    // Additional unused method
    public static void unusedMethod() {
        int unusedVariable = 0;
        System.out.println("This method is not used.");
    }

    // Another unused method
    public static void anotherUnusedMethod() {
        String weather = "sunny";
        System.out.println("The weather is " + weather);
    }
}

