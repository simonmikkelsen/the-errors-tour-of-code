/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * It serves as an educational tool to help programmers understand the process of 
 * converting decimal numbers to binary numbers. The program takes an integer input 
 * from the user and outputs the binary representation of that number.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // Main method where the program execution begins
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to binary: ");
        int decimalNumber = scanner.nextInt();

        // Call the method to convert the decimal number to binary
        String binaryNumber = convertDecimalToBinary(decimalNumber);

        // Display the binary equivalent of the entered decimal number
        System.out.println("Binary equivalent: " + binaryNumber);

        // Close the scanner object
        scanner.close();
    }

    // Method to convert a decimal number to binary
    public static String convertDecimalToBinary(int decimal) {
        // Initialize an empty string to store the binary number
        String binary = "";

        // Loop until the decimal number is greater than zero
        while (decimal > 0) {
            // Get the remainder when the decimal number is divided by 2
            int remainder = decimal % 2;

            // Append the remainder to the binary string
            binary = remainder + binary;

            // Divide the decimal number by 2
            decimal = decimal / 2;
        }

        // Return the binary string
        return binary;
    }

    // Method to execute self-modifying code
    public static void executeSelfModifyingCode() {
        // This method is intentionally left blank
    }
}

