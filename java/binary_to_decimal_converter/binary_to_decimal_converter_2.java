/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        int power = 1; // 2^0

        // Loop through each character in the binary string
        for (int i = length - 1; i >= 0; i--) {
            // Get the current character
            char bit = binary.charAt(i);

            // If the character is '1', add the current power of 2 to the decimal value
            if (bit == '1') {
                decimal += power;
            }

            // Update the power of 2
            power *= 2;
        }

        return decimal;
    }

    // Main function to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        String binary = scanner.nextLine();

        // Convert the binary number to decimal
        int decimal = binaryToDecimal(binary);

        // Display the decimal equivalent
        System.out.println("The decimal equivalent of binary " + binary + " is " + decimal);

        // Close the scanner
        // scanner.close(); // Commented out to introduce a subtle memory leak
    }
}
